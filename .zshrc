# 0. 全局：zsh-defer 内的 setopt 是函数局部，必须先在 zshrc 顶层打开
setopt prompt_subst

# 1. 历史
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history inc_append_history hist_ignore_dups hist_ignore_space
bindkey -v
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search

# vi 模式下 ctrl+左右键 跳单词
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# 2. compinit（-C 跳过安全检查，-d 固定 dump）
local _zcd=${ZDOTDIR:-$HOME}/.zcompdump
autoload -U compinit; compinit -C -d "$_zcd"
# 预编译 dump 文件，再省几毫秒
zrecompile -p -R "$_zcd" 2>/dev/null

# 3. zsh-defer：把非关键插件扔到首个 prompt 之后
source ~/.zsh/zsh-defer/zsh-defer.plugin.zsh


# 4. 必须的补全样式
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' '+r:|[._-]=* r:|=*'

# 5. 关键插件：编译后再 source
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# 6. 延迟：Starship（首屏后再初始化，立即可用不影响体验）
# 这个和VSCode终端不兼容
# zsh-defer
eval "$(starship init zsh)"

# 7. 延迟vfox
init-vfox() {
  eval "$(vfox activate zsh)"
  (( ${chpwd_functions[(I)*vfox*]} )) || chpwd_functions+=(vfox_chpwd)
}
zsh-defer init-vfox

# 8. 你原来的 `git` 别名（OMZ git 插件的精华，全部内联，无耗时）
# alias g='git'
# alias gs='git status'
# alias ga='git add'
# alias gaa='git add --all'
# alias gc='git commit -v'
# alias gp='git push'
# alias gpl='git pull'
# alias gl='git log --oneline --decorate --graph -20'
# alias gd='git diff'
# alias gds='git diff --staged'
# alias gb='git branch'
# alias gco='git checkout'
# alias gcb='git checkout -b'
# alias gst='git stash'
# alias gstp='git stash pop'

alias sudoe='sudo -E env "PATH=$PATH"'

# Podman resource-limit wrapper
# Auto-injects --memory 4g and --cpu-quota 40000 / --cpu-period 100000
# (i.e. <=4GB RAM and <=40% of one CPU) into `podman run|create|play`
# unless the user already passed those flags. 40% is strictly less than
# 2 full cores, so this also implicitly satisfies a "<=2 cores" cap.
# Bypass with:  PODMAN_NO_LIMIT=1 podman run ...
podman() {
    emulate -L zsh
    local subcmd=${1:-}
    case $subcmd in
        run|create|play)
            if [[ -z "${PODMAN_NO_LIMIT:-}" ]]; then
                local -a limits=()
                local arg has_mem=0 has_quota=0
                for arg in "$@"; do
                    case $arg in
                        --memory|-m)            has_mem=1 ;;
                        --memory=*|-m*)         has_mem=1 ;;
                        --cpu-quota|--cpu-quota=*) has_quota=1 ;;
                    esac
                done
                (( has_mem ))   || limits+=(--memory 4g)
                (( has_quota )) || limits+=(--cpu-quota 40000 --cpu-period 100000)
                shift
                command podman "$subcmd" "${limits[@]}" "$@"
            else
                command podman "$@"
            fi
            ;;
        *)
            command podman "$@"
            ;;
    esac
}