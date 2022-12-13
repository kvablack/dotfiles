#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

KEY=$("$SCRIPT_DIR/google_auth.py")


if [ -z "$1" ]; then
    CMD="sshpass -p ${KEY} ssh -o StrictHostKeyChecking=no -t kvablack@hpc.brc.berkeley.edu"
    $CMD
else
    set -f
    CMD="sshpass -p ${KEY} ssh -o StrictHostKeyChecking=no -t kvablack@dtn.brc.berkeley.edu"
    CMD="rsync --rsh='$CMD' $@"
    eval "$CMD"
fi
