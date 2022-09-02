#!/bin/bash
# RC preparation Script

source defineVariables.sh

if [ -d "${RC_TARGET_DIR}" ]; then rm -Rf ${RC_TARGET_DIR}; fi	
mkdir ${RC_TARGET_DIR}
cd ${RC_TARGET_DIR}

../prepareRelease/prepareVitroLanguagesReleaseCandidate.sh
../prepareRelease/prepareVIVOLanguagesReleaseCandidate.sh
../prepareRelease/prepareVitroReleaseCandidate.sh
../prepareRelease/prepareVIVOReleaseCandidate.sh
