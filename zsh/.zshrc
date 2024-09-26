if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting spot-cli)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

for dir in $HOME/.local/bin/*; do
  if [ -d "$dir" ]; then
    PATH="$dir:$PATH"
  fi
done

export PATH="/usr/share:$PATH"

alias vim="nvim"
alias pact="pact-cli"
alias spot="spot-cli"
alias ta="tmux a"
alias bat="acpi"
alias py="python3"
