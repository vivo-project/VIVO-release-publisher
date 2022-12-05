#!/bin/bash
# release publishing Script

source defineVariables.sh

if [ -d "${RC_TARGET_DIR}" ]; then rm -Rf ${RC_TARGET_DIR}; fi
mkdir ${RC_TARGET_DIR}
cd ${RC_TARGET_DIR}

../pushToMaintenance/pushVitroToMaintenance.sh
../pushToMaintenance/pushVIVOToMaintenance.sh
