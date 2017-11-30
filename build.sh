#!/bin/bash

set -euxo pipefail

yum -y install epel-release
yum -y install jq httpd php php-pdo unzip
yum clean all

RELEASE_ARCHIVE=$(curl -Ls https://api.github.com/repos/SSilence/selfoss/releases/latest | jq -r '.assets | map(.browser_download_url | select(test("zip$")))[0]')
LOCAL_ARCHIVE=/tmp/selfoss.tar.gz
SELFOSS_PATH=/var/www/selfoss

mkdir "$SELFOSS_PATH"
curl -Lo "$LOCAL_ARCHIVE" "$RELEASE_ARCHIVE"
unzip -d "$SELFOSS_PATH" "$LOCAL_ARCHIVE"
cp -a "$SELFOSS_PATH/data" "$SELFOSS_PATH/dist-data"
