
if is_win ; then
	# wslはgitが遅いため、非同期に表示するプラグインを使用する
	zinit load agkozak/agkozak-zsh-prompt
	AGKOZAK_USER_HOST_DISPLAY=0
	AGKOZAK_MULTILINE=0
	AGKOZAK_CUSTOM_PROMPT='%F{green}%c%f$ '
else
	## git
	PROMPT='%F{green}%c%f$ '
	autoload -U add-zsh-hook
	autoload -Uz vcs_info
	setopt prompt_subst
	zstyle ':vcs_info:git:*' check-for-changes true
	zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
	zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
	zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
	zstyle ':vcs_info:*' actionformats '[%b|%a]'
	add-zsh-hook precmd vcs_info
	RPROMPT=$RPROMPT'${vcs_info_msg_0_}'
fi

## ls
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
alias ls="ls -GF"
alias gls="gls --color"
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'