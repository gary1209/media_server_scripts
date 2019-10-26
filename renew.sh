#!/bin/sh
# Program:
#       This program helps media server to renew the ssl certificate
# History:
#       2019/1/23 GaryHsu First release

# print commands
set -x
# print error message
set -e

echo "Start..."

sudo certbot renew --dry-run

sudo cp /etc/letsencrypt/live/video.iottalk.tw/privkey.pem /etc/kurento/

sudo cp /etc/letsencrypt/live/video.iottalk.tw/fullchain.pem /etc/kurento/

cd /etc/kurento

sudo sh -c 'cat privkey.pem fullchain.pem > privkey-fullchain.pem'

# if you are not root user, run this command
# sudo chown kurento privkey-fullchain.pem

sudo docker container restart kms
