#!/bin/sh
USER=jobscheduler
UHOME=/home/$USER
export SCHEDULER_HOME=$UHOME/jos
export SCHEDULER_USER=$USER

sudo -u $USER ls $UHOME >$UHOME/test.txt
#ls /home/jobscheduler/>/home/jobscheduler/test.txt
#export SCHEDULER_HOME=/home/jobscheduler/jos/
#export SCHEDULER_USER=jobscheduler

sudo -u $USER -i $SCHEDULER_HOME/bin/jobscheduler_agent.sh $1 \
  >$UHOME/list.txt

#sudo -u jobscheduler -i /home/jobscheduler/jos/bin/jobscheduler_jobscheduler.sh  start>/home/jobscheduler/list.txt
