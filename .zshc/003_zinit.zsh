ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Binary release in archive, from GitHub-releases page.
# After automatic unpacking it provides program "fzf".
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

# oh-my-zsh https://github.com/zdharma/zinit#using-oh-my-zsh-themes
zinit snippet OMZL::git.zsh

zinit snippet OMZP::git
zinit snippet OMZP::tig
zinit snippet OMZP::github
zinit snippet OMZP::zsh-interactive-cd
zinit cdclear -q

zinit light zsh-users/zsh-syntax-highlighting
zinit light mollifier/cd-gitroot
zinit light zpm-zsh/ls.git