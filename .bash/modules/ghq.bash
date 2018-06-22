#!/bin/bash
# [fix] 元のghqは全部エイリアスにしたいが、なぜか途中でエイリアスが消える

# root,look: パスをWindowsパスで扱うため、正常にcdできない問題への対応
# look,list: case insenstive対応
# export   : コマンド追加
# import   : 入力がない場合のエラーチェックがないので追加

ghq () { # ghqラッパー
  # alias orig=$GOPATH/bin/ghq
  orig=$GOPATH/bin/ghq
  ghqroot="$(cygpath $($orig root))"
  repos+=()

  # if [ $1 = look ]; then
  case "$1" in
    look )
      # 第2引数（検索後）存在チェック&\
      # 該当なしだとターミナルごと落ちるためリポジトリ名エラーチェック
      if [ -n "$2" ] && $orig list | grep -iqE "$2"; then
        while read repo; do
            repos+=("$repo")
        done < <($orig list | grep -i "$2")
        case  "${#repos[@]}" in # reposの要素数による分岐
          # 0 )
          #   $orig look "$2"
          #   exit 1
          #   ;;
          1)
            cd $ghqroot/${repos[0]}
            ;;
          *)
            IFS_BACKUP=$IFS # バックアップしておく。
            IFS=$'\n'  # 区切り文字を変更
            dest="$(echo "${repos[*]}" | cho)"
            if [ -n "$dest" ]; then
              cd $ghqroot/$dest
            fi
            IFS=$IFS_BACKUP # 元に戻す。
            dest=""
            ;;
        esac
      else
        $orig look "$2" # エラー出力をさせる
      fi
      ;;
    root )
      echo $ghqroot
      ;;
    list )
      # 該当なしでエラーが出ないため、look該当なしの出力を借りる
      $orig list | grep -i "$2" || $orig look "$2"
      ;;
    export )
      if [ -n "$2" -a -d "$(dirname "$2")" ]; then
        exfile="$2"
      else
        exfile=ghq_list.txt
      fi
      echo $exfile
      $orig list | tee "$exfile"
      echo ""
      echo List exported to $exfile 1>&2
      ;;
    import )
      if [ -p /dev/stdin ];then
        $orig $*
      else
        $orig import --help
      fi
      ;;
    create )
      IFS_BACKUP=$IFS # バックアップしておく。
      IFS=$'\n'  # 区切り文字を変更
      hosts=(bitbucket.org github.com)
      if echo "${hosts[*]}" | grep -q "$2"; then
        host="$(echo "${hosts[*]}" | grep "$2")"
        shift 1
      else
        host="$(echo "${hosts[*]}" | cho)"
      fi
      IFS=$IFS_BACKUP # 元に戻す。
      if [ -n "$2" ]; then
        name="$2"
      else
        echo -n "Input name of repo: "
        read name
      fi
      if [ -n "$host" -a -n "$name" ]; then
        # [add] 正規表現でnameチェック
        dest="$ghqroot/$host/catfist/$name"
        mkdir -p $dest && cd $dest
        pwd
        git init
        host=""
        name=""
        dest=""
      fi
      ;;
    h|help|-h|--help )
      $orig help
      echo ""
      echo "FUNCTION:"
      echo "   ghq ()"
      echo "   ghq wrapper function"
      echo "     export   Output list to file"
      echo "     create   Create new repository (args: <host> <name>)"
      ;;
    * )
      $orig $*
      ;;
  # fi
  esac

  repos=()
  # unalias orig
  ghqroot=""
}
