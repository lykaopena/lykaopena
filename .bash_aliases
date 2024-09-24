alias gac='git status && git add . && git commit -m "Auto Commit"'

gri() {
    if [[ $1 =~ ^[1-9][0-9]*$ ]]; then
        git rebase -i HEAD~$1
    else
        echo "This input is invalid for this command. Please ensure it is a positive integer."
    fi
}
alias gri=gri