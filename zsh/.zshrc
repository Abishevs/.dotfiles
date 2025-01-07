if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim
export TERMINAL=st
export BROWSER=brave

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting spot-cli)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

PATH="$HOME/.local/bin:$PATH"

for dir in $HOME/.local/bin/*; do
  if [ -d "$dir" ]; then
    PATH="$dir:$PATH"
  fi
done

export PATH
# ="/usr/share:$PATH"

vimf() {
    local selected_file
    local folder="." # current dir

    if [ $# -ge 1 ]; then
        # Check if the first argument is a directory
        if [ -d "$1" ]; then
            folder="$1"
        else
            echo "Error: '$1' is not a valid directory."
            return 1  # Exit the function with an error status
        fi
    fi
    # Use find to list files in the specified folder, pipe to fzf for selection
    selected_file=$(find "$folder" -type f | fzf)

    # Check if a file was selected
    if [ -n "$selected_file" ]; then
        nvim "$selected_file"
    else
        echo "No file selected."
    fi
}

buildrun() {
    if [ $# -lt 1 ]; then
        echo "Usage: buildrun <program_name> [source_files...]"
        return 1
    fi

    local prog_name="$1"
    shift
    local source_files=("$@")

    if [ ${#source_files[@]} -eq 0 ]; then
        source_files=("${prog_name}.c")
    fi

    for src in "${source_files[@]}"; do
        if [ ! -f "$src" ]; then
            echo "Error: Source file '$src' not found."
            return 1
        fi
    done

    gcc -o "$prog_name" "${source_files[@]}" && ./"$prog_name"
}

lfcd () {
    tmp="$(mktemp)"
    lfub -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            cd "$dir"
        fi
    fi
}



alias vim="nvim"
alias spot="spot-cli"
alias ta="tmux a"
alias py="python3"
alias fzf="fzf | xargs -r nvim"
alias lfd="lfcd"
alias lf="lfub" 
