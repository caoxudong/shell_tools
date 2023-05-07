#!/bin/sh

set -x

sudo apt-get update && \
sudo apt-get install -y vim && \
sudo apt-get install -y git && \
sudo apt-get install -y python3-pip && \
sudo apt-get install -y gcc && \
sudo apt-get install -y gdb && \
sudo apt-get install -y cmake

# prepare python3
PYTHON_BIN=`which python`
PYTHON_BIN_DIR=`dirname ${PYTHON_BIN}`
sudo rm ${PYTHON_BIN}
sudo ln -s "${PYTHON_BIN_DIR}/python3" "${PYTHON_BIN_DIR}/python"
