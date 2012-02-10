#!/bin/bash
set -e
LOGFILE=/home/ekaputra/site/fantasteak/logs/gunicorn.log
LOGDIR=$(dirname $LOGFILE)
NUM_WORKERS=3
# user/group to run as
USER=ekaputra
GROUP=ekaputra
cd /home/ekaputra/site/fantasteak/fantasteak
source ../bin/activate
test -d $LOGDIR || mkdir -p $LOGDIR
exec ../bin/gunicorn_django -w $NUM_WORKERS --user=$USER --group=$GROUP --log-level=debug --log-file=$LOGFILE 2>>$LOGFILE

