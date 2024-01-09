source ~/.bashrc
current_ip=`ip addr show | awk '/inet / {print $2}' | cut -d '/' -f 1 |grep 10`
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]zhp@$current_ip@\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
alias vi='nvim -u ~/.config/nvim/init.lua'
alias ssh1804='ssh -t nreal@10.2.18.114 "bash --rcfile ~/.dotfiles/env/.bashrc"'
alias mk="cd ~/zhp/stereo_board/Ubuntu18.04/x86_64/build && make; cd -"
alias conda_acitive="conda activate stereo_board"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/nreal/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/nreal/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/nreal/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/nreal/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

cd ~/zhp
