#!/bin/bash
# release publishing Script

source defineVariables.sh

#if [ -d "${RC_TARGET_DIR}" ]; then prepareReleaseCandidate.sh; fi	
cd ${RC_TARGET_DIR}

../publishRelease/publishVitroLanguagesRelease.sh
#../publishRelease/publishVIVOLanguagesRelease.sh
#../publishRelease/publishVitroRelease.sh
#../publishRelease/publishVIVORelease.sh
