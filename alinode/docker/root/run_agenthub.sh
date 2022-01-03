#!/bin/sh
if [ -f $HOME/default.config.js ]; then
  ENABLE_NODE_LOG=NO node $HOME/default.config.js
fi

if [ -f $HOME/agenthub.running.json ]; then
  ENABLE_NODE_LOG=NO agenthub $HOME/agenthub.running.json >> /data/alinode/nohup.log 2>&1 &
fi
