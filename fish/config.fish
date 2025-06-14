alias ls='ls --color'
alias less='less -r'
#alias brave='brave --ignore-gpu-blocklist --enable-gpu-rasterization --enable-zero-copy --disable-gpu-driver-bug-workarounds --use-gl=egl --enable-accelerated-video-decode'
alias timefix='git@github.com:motelnine/dotfiles.git'
alias weather='curl wttr.in/Chandler'
alias grep='grep -s --exclude-dir=node_modules --exclude-dir=.git --exclude=bundle.js --exclude=package-lock.json --exclude=__pycache__ --color=always'
alias ll='ls -al'
alias youtube='firefox --new-window https://www.youtube.com'
alias cb='xclip -sel clip'
alias cam='mpv av://v4l2:/dev/video0'
alias kubectl='sudo microk8s kubectl'
function fish_greeting
	echo -e "\n\033[0;30m—————————————————————————————————————————"
	echo -e "\033[0;36m `>\033[0;30m‡\033[0;31m<`\033[0;36m  msarch"
	echo -e "\033[0;36m  ` \033[0;31m`\033[0;31m   ¯¯¯¯¯¯¯\033[0m\n"
end

if status is-interactive
	fastfetch
end
