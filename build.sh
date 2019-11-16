#!/bin/bash

set -euxo pipefail

dnf -y install jq httpd pcre pcre2 php php-gd php-mbstring php-pdo php-xml zlib
dnf clean all

RELEASE_ARCHIVE='https://github.com/FreshRSS/FreshRSS/archive/master.tar.gz'
LOCAL_ARCHIVE=/tmp/freshrss.tar.gz
FRESHRSS_PATH=/var/www/freshrss

mkdir "$FRESHRSS_PATH"
curl -Lo "$LOCAL_ARCHIVE" "$RELEASE_ARCHIVE"
tar -C "$FRESHRSS_PATH" --strip-components 1 -xvzf "$LOCAL_ARCHIVE"
cp -a "$FRESHRSS_PATH/data" "$FRESHRSS_PATH/dist-data"
