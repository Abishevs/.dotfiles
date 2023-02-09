
DOTFILES="$HOME/.dotfiles"
dtf () {
  git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
}

dtfnew () {
  git clone --bare $1 $DOTFILES
  dtf config --local status.showUntrackedFiles no
  dtf switch -c main

  echo "Please add and commit additional files"
  echo "using 'dtf add' and 'dtf commit', then run"
  echo "dtf push -u origin main"
}

dtfrestore () {
  git clone -b base --bare $1 $DOTFILES
  dtf config --local status.showUntrackedFiles no
  dtf checkout || echo -e 'Deal with conflicting files, then run (possibly with -f flag if you are OK with overwriting)\ndtf checkout'
}

# CLI Pomodoro
declare -A pomo_options
pomo_options["work"]="15" # time in minutes
pomo_options["break"]="5"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val | lolcat
  timer ${pomo_options["$val"]}m
  spd-say "'$val' session done"
  fi
}
# Pomodoro aliases 
alias work="pomodoro 'work'"
alias break="pomodoro 'break'"
## Custom aliases
alias sourcetmux='tmux source ~/.tmux.conf'
alias noter='note.sh'
alias v='nvim'
alias nsync='git-sync.sh'
alias py='python3'
alias rm='rm -i'
alias remove-all='rm -r'
