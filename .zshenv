export EDITOR='emacs'
export SHELL=/user/local/bin/zsh
for zshrc in ~/.zshrc ; do
    source $zshrc
done



[[ -r $HOME/.zshenv.local ]] && source $HOME/.zshenv.local

if [[ "$PROFILE_STARTUP" == true && ! -o interactive ]]; then
    #echo "ending profile in noninteractive mode"
    zprof
    unsetopt xtrace
    exec 2>&3 3>&-
fi
