#!/bin/bash -e

useradd -u $NBGRADER_USER_ID -s /bin/bash $NBGRADER_USER || true
export HOME=/home/$NBGRADER_USER
export USER=$NBGRADER_USER
sudo -E -u $NBGRADER_USER /srv/formgrade.sh $@