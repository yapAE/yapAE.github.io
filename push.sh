#!/bin/bash
set -ev

# get clone master
git clone https://${GH_REF} .deploy_git
cd .deploy_git
git checkout master

cd ../
mv .deploy_git/.git/ ./public/

cd ./public

git config user.name "38139223"
git config user.email "baidong_6265@qq.com"

# add commit timestamp
git add .
git commit -m "Travis CI Auto Builder at `date +"%Y-%m-%d %H:%M"`"

git push --force --quiet "https://${travisToken}@${GH_REF}" master:master
