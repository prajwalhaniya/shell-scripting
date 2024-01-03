#!/bin/bash

stash_and_pull() {
    local directory=$1
    cd "$directory" || exit 1
    echo "----"
    echo "INSIDE DIRECTORY $directory"
    currentTime=$(date +"%B%d%Y")
    git stash save -m "$currentTime"
    git switch master
    git pull origin master
    cd - || exit 1
    echo "----"
}

# stash_and_pull "DIRECTORY_NAME"
