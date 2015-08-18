#!/bin/bash

if [ ! -f /srv/nbgrader/graderlist ]; then
    echo "Grader list does not exist, exiting."
    exit 1
fi

nbgrader formgrade $@