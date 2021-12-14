#!/bin/bash
set -e

sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
apt-get update \
 && apt-get install  --no-install-recommends  wget  gnupg ca-certificates -y \
 && rm -rf /var/lib/apt/lists/*