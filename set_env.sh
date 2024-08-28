#!/bin/bash

CUR_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
BIN_DIR=${CUR_DIR}/prefix/bin

export PATH=${BIN_DIR}:$PATH

