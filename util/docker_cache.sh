#!/bin/bash

########################
# Print to STDERR
# Arguments:
#   Message to print
# Returns:
#   None
#########################
stderr_print() {
    # 'is_boolean_yes' is defined in libvalidations.sh, but depends on this file so we cannot source it
    local bool="${BITNAMI_QUIET:-false}"
    # comparison is performed without regard to the case of alphabetic characters
    shopt -s nocasematch
    if ! [[ "$bool" = 1 || "$bool" =~ ^(yes|true)$ ]]; then
        printf "%b\\n" "${*}" >&2
    fi
}

info_print() {
    echo -e "\033[32;1m$*\033[0m"
}

load_cache() {
    local SAVE_NAME="$1"
    FROM_PATH="${CACHE_FROM_DIR}/${SAVE_NAME}.tar"
    if [ -f "$FROM_PATH" ] ; then
        echo load cache "$FROM_PATH"
        docker load "$FROM_PATH"
    else
        echo cache "$FROM_PATH" not found
    fi
}

save_cache() {
    local SAVE_NAME="$1"
    shift
    FROM_PATH="${CACHE_FROM_DIR}/${SAVE_NAME}.tar"
    if [ -d "$CACHE_FROM_DIR" ] ; then
        echo save "$@" to "$FROM_PATH"
        docker save "$@" > "$FROM_PATH"
    else
        echo cache directory "$CACHE_FROM_DIR" not exist
    fi
}
