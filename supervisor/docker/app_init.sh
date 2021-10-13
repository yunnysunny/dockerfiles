#!/bin/bash

APP_INIT_DIR="/app.init.d"

if [ -d ${APP_INIT_DIR} ]; then
    for i in ${APP_INIT_DIR}/*.sh; do
        if [ -r $i ]; then
            . $i
        fi
    done
    unset i
fi