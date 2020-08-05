alias drupalcs="phpcs --standard=Drupal" 
alias drupalcsp="phpcs --standard=DrupalPractice" 
alias drupalcbf="phpcbf --standard=Drupal"
alias gs="git status"
alias ga="git add"
alias gci="git commit"
alias gco="git checkout"
alias gd="git diff"
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all" 
alias dc="drush cr"
alias drush9="~/drush9/vendor/bin/drush"

# Laravel
alias art="php artisan"
alias migrate="php artisan migrate"
alias fresh="php artisan migrate:fresh --seed"
alias tinker="php artisan tinker"

# Logs
alias error="tail -f /var/log/apache2/error.log"
alias access="tail -f /var/log/apache2/access.log"

# Docker
alias up="docker-compose up"
alias down="docker-compose down"

# Vim
alias vim="nvim"
alias v="vim"
