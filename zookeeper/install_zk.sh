#!/bin/bash
#title          :zookeeper-install.sh
#description    :The script to install zookeeper 0.8.x
#author         :Motty Cohen
#date           :05-Feb-2015
#usage          :/bin/bash install-zookeeper.sh

#https://mirrors.bfsu.edu.cn/apache/zookeeper/zookeeper-3.6.2/apache-zookeeper-3.6.2-bin.tar.gz

ZOOKEEPER_FILENAME=apache-zookeeper-$ZOOKEEPER_VERSION-bin
ZOOKEEPER_ARCHIVE_NAME=$ZOOKEEPER_FILENAME.tar.gz

ZOOKEEPER_DOWNLOAD_ADDRESS=https://mirrors.bfsu.edu.cn/apache/zookeeper/zookeeper-$ZOOKEEPER_VERSION/$ZOOKEEPER_ARCHIVE_NAME

INSTALL_DIR=/opt
ZOOKEEPER_FULL_DIR=$INSTALL_DIR/$ZOOKEEPER_FILENAME
ZOOKEEPER_DIR=$INSTALL_DIR/zookeeper
ZOOKEEPER_SERVICE=zookeeper

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root."
   exit 1
fi

echo "Downloading: $ZOOKEEPER_DOWNLOAD_ADDRESS..."
[ -e "$ZOOKEEPER_ARCHIVE_NAME" ] && echo 'zookeeper archive already exists.'
if [ ! -e "$ZOOKEEPER_ARCHIVE_NAME" ]; then
  wget -q $ZOOKEEPER_DOWNLOAD_ADDRESS
  if [ $? -ne 0 ]; then
    echo "Not possible to download zookeeper."
    exit 1
  fi
fi

echo "Cleaning up..."
rm -f "$ZOOKEEPER_DIR"
rm -rf "$ZOOKEEPER_FULL_DIR"
rm -rf "/var/run/$ZOOKEEPER_SERVICE/"
rm -f "/etc/init.d/$ZOOKEEPER_SERVICE"

echo "Installation to $ZOOKEEPER_FULL_DIR ..."
mkdir $ZOOKEEPER_FULL_DIR
tar -xzvf $ZOOKEEPER_ARCHIVE_NAME -C $INSTALL_DIR

echo "Creating symbolic link: to $ZOOKEEPER_DIR ..."
ln -s $ZOOKEEPER_FULL_DIR/ $ZOOKEEPER_DIR
cp $ZOOKEEPER_DIR/conf/zoo_sample.cfg $ZOOKEEPER_DIR/conf/zoo.cfg

echo "Cleaning archive..."
rm -f "$ZOOKEEPER_ARCHIVE_NAME"
