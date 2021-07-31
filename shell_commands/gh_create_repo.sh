#!/bin/bash

set -eu

REPO_NAME=$1

LICENSE=mit
YEAR=$(date '+%Y')
USER=$(gh api /user --jq '.login')

cd $HOME/repos/github.com/$USER

gh repo create $REPO_NAME --public --confirm >/dev/null
cd $REPO_NAME

gh api /licenses/$LICENSE --jq '.body' | \
  sed "s/\[year\]/$YEAR/" | \
  sed "s/\[fullname\]/$USER/" > LICENSE

git add LICENSE
git commit -q -m "add LICENSE"
git branch -q -m main
git push -q origin main -u

pwd

