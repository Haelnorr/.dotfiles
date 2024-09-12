# Lines configured by zsh-newuser-install
clear
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/haelnorr/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export EDITOR=nvim

alias cp='cp --reflink=auto'
alias grep='grep --color=auto'
alias ls='eza --color=always --long --git --icons=always --no-time --no-user --no-permissions'
alias cat=bat
export BAT_THEME="Catppuccin Mocha"
alias vim=nvim
alias vi=nvim
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias top=btop

eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git --exclude .npm --exclude .local/share --exclude .cache --exclude .mozilla"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type=d"

_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
}

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd)             fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
        export|unset)   fzf --preview "eval 'echo $'{}" "$@" ;;
        ssh)            fzf --preview 'dig {}' "$@" ;;
        *)              fzf --preview 'bat -n --color=always --line-range :500 {}' "$@" ;;
    esac
}

export STARSHIP_CONFIG="$HOME/.config/starship/config.toml"
# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select >/dev/null || {
    eval "$(starship init zsh)"
}
export PATH="$PATH:$HOME/.local/bin"
neofetch
alias movies="movie; exit"
