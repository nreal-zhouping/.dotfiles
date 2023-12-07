source ~/.bashrc
current_ip=`ip addr show | awk '/inet / {print $2}' | cut -d '/' -f 1 |grep 10`
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]zhp@$current_ip@\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
alias vi='nvim -u ~/.config/nvim/init.lua'
alias ssh1804='ssh -t nreal@10.2.18.114 "bash --rcfile ~/.dotfiles/env/.bashrc"'

cd ~/zhp
