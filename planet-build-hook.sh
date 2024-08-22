#!/bin/bash
set -e

REPO_DIR="/opt/app-root/src"
DATA_DIR="/tmp"

echo "[START] Planet build hook"
if [ ! -d ${DATA_DIR}/cache ]; then
    echo "Creating clean data/output directory"
    mkdir ${DATA_DIR}/cache
fi

echo "Preparing config.ini"

sed "s|OPENSHIFT_REPO_DIR|${REPO_DIR}/|g;s|OPENSHIFT_DATA_DIR|${DATA_DIR}/cache/|g" ${REPO_DIR}/config.ini.in > ${REPO_DIR}/config.ini

echo "Debug - config.ini"
cat ${REPO_DIR}/config.ini

echo "Running planet generator"
export PYTHONPATH=${REPO_DIR}/:$PYTHONPATH
python ${REPO_DIR}/planet/planet.py ${REPO_DIR}/config.ini

echo "[DONE] Planet build hook"
