# file listing shortcut
alias ls='ls -lhaGF'

# refresh shell
alias reload='source ~/.zshrc'

# edit bash_profile
alias editprofile='atom ~/.zshrc'

# networking
alias flushdns='sudo discoveryutil udnsflushcaches'
alias resetnetworking='sudo ifconfig en0 down && sudo ifconfig en0 up'
alias ipv6disable='networksetup -setv6off Wi-Fi'

# processes
find_processes(){
  ps -ef | head -1; ps -ef | grep $1 | grep -v grep
}
kill_processes(){
  ps -ef | grep $1 | grep -v grep | awk '{print $2}' | xargs kill -9
}
alias fp=find_processes
alias kp=kill_processes
alias kps='kp spring'

find_webserver(){
  lsof -i $1
}
kill_webserver(){
  lsof -i $1 | grep -v PID | awk '{print $2}' | xargs kill -9
}
alias fw=find_webserver
alias kw=kill_webserver
alias kpassenger='kw tcp:3000 && kp passenger'

# current project directories
alias tc='cd ~/dev/true/trueandco-web'
alias tc2='cd ~/dev/true/trueandco-web2'
alias tcansible='cd ~/dev/true/trueandco-ansible'
alias jf='cd ~/dev/vlbeta/jobfusion'

# git commamands simplified
alias gs='git status'
alias gft='git fetch'
alias gpr='git pull --rebase'

# rails related aliases
alias rst='rails s thin'
alias rpp='rake parallel:prepare'
alias rps='rake parallel:spec'
alias spspec='spring rspec'
alias rspec='nocorrect rspec'
alias src='spring rails console'
alias dbm='rake db:migrate'
alias taildev='tail -f log/development.log'
alias tailtest='tail -f log/test.log'
alias pryr="pry -r ./config/environment -r rails/console/app -r rails/console/helpers"
alias cleanrails="rake log:clear && rake tmp:clear && rake assets:clean && rake cache:clear"
alias dbload="./lib/load_new_dump.sh +cp +p"
alias cov='open coverage/index.html'

# True&Co deploy aliases/functions
alias dprod='cap production deploy'
alias dadmin='cap admin deploy'
alias dstage='cap staging deploy'
alias revstage='cap staging rev'
alias dbstage='cap staging deploy:staging:import_db'
alias dbpterodactyl='cap dev_staging deploy:staging:import_db -s dev=jurawa'
alias enablepterodactyl='cap dev_staging deploy:web:enable -s dev=jurawa'
alias dpterodactyl='cap dev_staging deploy -s dev=jurawa'
alias revpterodactyl='cap dev_staging rev -s dev=jurawa'
alias logpterodactyl='cap dev_staging log -s dev=jurawa'
dsrev () { cap dev_staging rev -s dev=$1 }
dslog () { cap dev_staging log -s dev=$1 }
dsdeploy () { cap dev_staging deploy -s dev=$1 }
dsimportdb () { cap dev_staging deploy:staging:import_db -s dev=$1 }

# True&Co ansible/tcops aliases
alias tclist='/Users/Orange/dev/true/trueandco-ansible/bin/tcops list'
