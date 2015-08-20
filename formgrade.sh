#!/bin/bash -e

cd $HOME

if [ ! -d "$ASSIGNMENTS_REPO_NAME" ]; then
    git clone $ASSIGNMENTS_REPO_CLONE_URL
    cd $ASSIGNMENTS_REPO_NAME
    git remote rm origin
    git remote add origin $ASSIGNMENTS_REPO_URL
    cd $HOME
fi

cd "$NOTEBOOK_URL_PREFIX"
nbgrader formgrade $@
