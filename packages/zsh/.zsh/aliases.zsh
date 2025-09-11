alias rm='rm -i'
alias intoclip='xclip -i -selection "clipboard"'
alias rrwaybar='pkill waybar && hyprctl dispatch -- exec waybar'
alias vim="nvim"
alias spot="spot-cli"
# alias pact="pact-cli"
alias ta="tmux a"
alias py="python3"
alias fzfvim="fzf | xargs -r nvim"
alias lfd="lfcd"
alias lf="lfub" 
alias get_idf='. $HOME/esp/esp-idf/export.sh'
alias pwgen='bw generate -c --passphrase --includeNumber  --words 3 --separator _ | xclip -i -selection "clipboard"'
alias webcam="mpv --no-cache --vf=hflip  /dev/video0"
alias get_emsdk='source $HOME/dev/toolchains/emsdk/emsdk_env.sh'
