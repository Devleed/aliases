alias run-gm="~/genymotion/player --vm-name '6.4 inch screen with android 11'"
alias cls="clear"
alias fhere="find . -name "
alias mkdir="mkdir -pv"
alias rmf="rm -rf "
alias histg="history | grep"
alias myip="curl http://ipecho.net/plain; echo"
alias dpkg="sudo dpkg -i "
alias gstat="git status"
alias launch-clinica-em="gnome-terminal -- bash -c 'run-gm'"
alias launch-clinica-structure="cd ~/Work/Clinica && code . && sleep 15 && npx react-native run-android"
alias launch-clinica-rn-server="gnome-terminal -- sh -c 'cd ~/Work/Clinica && npx react-native start'"

mcd () {
    mkdir $1
    cd $1
}

function clinica() {
	gnome-terminal -- bash -c '~/genymotion/player --vm-name "6.4 inch screen with android 11"'
	launch-clinica-rn-server
	launch-clinica-structure
}

function gcommit() {
    git add .
    git commit -m "$1"
}

function gpush() {
    gcommit $1
    git push origin $2
}

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
 else
    for n in $@
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}
