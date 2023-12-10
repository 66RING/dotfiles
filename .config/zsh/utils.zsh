# git swtich to next commit
function gitforward {
    branch=${1:-main}
    git log --reverse --pretty=%H $branch | grep -A 1 $(git rev-parse HEAD) | tail -n1 | xargs git checkout
}

# git swtich to prev commit
function gitbackward() {
	git checkout HEAD^1
}

alias gf=gitforward
alias gb=gitbackward
