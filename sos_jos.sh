#!/bin/sh
USER=jobscheduler
UHOME=/home/$USER
export SCHEDULER_HOME=$UHOME/jos
export SCHEDULER_USER=$USER

sudo -u $USER ls $UHOME >$UHOME/test.txt

sudo -u $USER -i $SCHEDULER_HOME/bin/jobscheduler_agent.sh $1 \
  >$UHOME/list.txt
