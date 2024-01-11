#!/bin/bash

build_and_push() {
    local directory=$1;
    cd "$directory" || exit 1
    echo "----"
    echo "INSIDE DIRECTORY $directory"
    currentTime=$(date +%s)
    git stash save -m "$currentTime"
    git switch master
    git pull origin master
    git checkout -b "_build/$currentTime"
    yarn build
    git add .
    git commit -m "Create build"
    git push origin "_build/$currentTime"
}

# build_and_push "DIRECTORY_NAME"
