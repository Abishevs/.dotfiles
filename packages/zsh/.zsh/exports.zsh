export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim
export TERMINAL=st
export BROWSER=brave
export GOPATH="$HOME/go"

PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/go/bin:$PATH"
PATH="/usr/lib/qt6/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
PATH="/home/frap/.config/herd-lite/bin:$PATH"

for dir in $HOME/.local/bin/*; do
  if [ -d "$dir" ]; then
    PATH="$dir:$PATH"
  fi
done


export PHP_INI_SCAN_DIR="/home/frap/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# pnpm
export PNPM_HOME="/home/frap/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH
