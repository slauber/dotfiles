alias ll='ls -la'
alias lh='ls -lah'
alias ...='cd ../..'
alias ....='cd ../../..'
alias crontab='crontab -i'

function mcd() {
    mkdir $1 && cd $1
}
