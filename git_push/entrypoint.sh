#!/bin/bash
set -e
BRANCH=$(sed 's/refs\/heads\///g' <<<"$GITHUB_REF")
git config user.name "$(git --no-pager log --format=format:'%an' -n 1)"
git config user.email "$(git --no-pager log --format=format:'%ae' -n 1)"
git checkout ${BRANCH}
git add *
git commit -m "GitHub Action Push $*"
git push origin ${BRANCH}
echo 'SUCCESS!'