#!/bin/bash

BASE_SRC_FOLDER=(\
    "centos" "hello" "jmeter" \
    "node-bench" "supervisor" "ubuntu"\
)
CUR_PATH=$(dirname "$PWD")

for dir in "${BASE_SRC_FOLDER[@]}"; do
    export IMAGE_NAME=$dir
    DIST_YML=${CUR_PATH}/.github/workflows/publish-${dir}-image.yml
    eval "cat <<EOF
$(< publish-image-header.yml)
EOF
    "  > "$DIST_YML"
    cat publish-image-body.yml >> "$DIST_YML"
done