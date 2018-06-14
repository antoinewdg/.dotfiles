alias reload!='pushd ~/.dotfiles && git pull && ./script/bootstrap && popd && source ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

alias rmzdns='sudo cp ~/repos/teenager-setup/resolv.conf /etc'
alias rmzvpn='cd ~/.reminiz_vpn && sudo openvpn config.ovpn'
alias l='exa -la --group-directories-first'

alias snoop='sudo strace -s9999 -e write -p'

alias mm='make -j20'
