#!/bin/bash
CONF_DIR="/root/.pyload"
TMP_DIR="/tmp/pyload-config"

if [ ! -f "${CONF_DIR}/pyload.conf" ]; then
	echo "NO PYLOAD CONFIG FOUND AT ${CONF_DIR}, COPYING FROM ${TMP_DIR}"
	cp -rp $TMP_DIR/* $CONF_DIR/
fi

/opt/pyload/pyLoadCore.py
