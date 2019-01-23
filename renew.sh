#!/bin/bash
# Program:
#       This program helps media server to renew the ssl cetificate
# History:
#       2019/1/23 GaryHsu First release

echo "Start..."

sudo su

certbot renew --dry-run

cp /etc/letsencrypt/live/video.iottalk.tw/privkey.pem /etc/kurento/

cp /etc/letsencrypt/live/video.iottalk.tw/fullchain.pem /etc/kurento/

cd /etc/kurento

cat privkey.pem fullchain.pem > privkey-fullchain.pem

chown kurento privkey-fullchain.pem

docker container restart kms

exit 0