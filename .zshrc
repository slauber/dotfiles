export ZSH=~/.zsh

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

# Load and run compinit
autoload -U compinit
compinit -i

autoload -U colors && colors
PS1="[%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~%{$reset_color%}] "

autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search

# Gets the download url for the latest release of a package provided via GitHub Releases
# Usage: ghrelease USER REPO [PATTERN]
ghrelease() {
	curl -s "https://api.github.com/repos/$1/$2/releases/latest" | grep -o "http.*${3:-deb}"
}

# Installs a local or remote(http/https) deb package and removes it after installation
installdeb() {
	set -e
	loc="/tmp/install.deb"
	case $1 in 
	http*) sudo wget -O "$loc" $1;;
	*) loc="$1"
	esac
	sudo dpkg -i "$loc"
	sudo apt -f install
	sudo rm -f "$loc"
}



export HISTSIZE=10000
export HISTFILESIZE=""

. "/root/.acme.sh/acme.sh.env"
