#!/bin/bash

git clone https://github.com/acklab-ae/jupyter.git /tmp/update &&
echo "Execute whatever script you want after launch" &&
# sh /tmp/update/update.sh &&
jupyter notebook --ip 0.0.0.0 --allow-root --no-browser &

