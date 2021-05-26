[ -f ~/.zinit/bin/zinit.zsh ] && . ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Binary release in archive, from GitHub-releases page.
# After automatic unpacking it provides program "fzf".
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

# oh-my-zsh https://github.com/zdharma/zinit#using-oh-my-zsh-themes
zinit snippet OMZL::git.zsh

zinit snippet OMZP::git
zinit snippet OMZP::flutter
zinit snippet OMZP::tig
zinit snippet OMZP::zsh-interactive-cd
zinit cdclear -q

zinit light zsh-users/zsh-syntax-highlighting