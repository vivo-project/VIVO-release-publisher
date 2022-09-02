#!/bin/bash
# VIVO languages RC preparation Script

ECHO -----------------------------${VIVO_languages_REPO}---------------------------------
ECHO ">>>" git clone --branch ${BRANCH} --single-branch git@github.com:${ORG}/${VIVO_languages_REPO}.git
git clone --branch ${BRANCH} --single-branch git@github.com:${ORG}/${VIVO_languages_REPO}.git
ECHO ">>>" cd ${VIVO_languages_REPO}
cd ${VIVO_languages_REPO}
ECHO ">>>" git push --delete origin "${VIVO_languages_TAG}-${RC_VERSION}"
git push --delete origin "${VIVO_languages_TAG}-${RC_VERSION}"
ECHO ">>>" git push --delete origin "rel-${RC_VERSION}-RC-${VIVO_languages_RC_NUM}"
git push --delete origin "rel-${RC_VERSION}-RC-${VIVO_languages_RC_NUM}"
ECHO ">>>" git push --delete origin "rel-${RC_VERSION}-RC"
git push --delete origin "rel-${RC_VERSION}-RC"
ECHO ">>>" git checkout ${BRANCH}
git checkout ${BRANCH}
ECHO ">>>" git checkout -b rel-${RC_VERSION}-RC
git checkout -b rel-${RC_VERSION}-RC
ECHO ">>>" mvn release:clean
mvn release:clean
ECHO ">>>" mvn release:prepare -DreleaseVersion=${RC_VERSION} -Dtag=${VIVO_languages_TAG}-${RC_VERSION} -DdevelopmentVersion=${RC_NEXT_SNAPSHOT}-SNAPSHOT -DautoVersionSubmodules=true -DpushChanges=false
mvn release:prepare -DreleaseVersion=${RC_VERSION} -Dtag=${VIVO_languages_TAG}-${RC_VERSION} -DdevelopmentVersion=${RC_NEXT_SNAPSHOT}-SNAPSHOT -DautoVersionSubmodules=true -DpushChanges=false
ECHO ">>>" git push --set-upstream origin rel-${RC_VERSION}-RC
git push --set-upstream origin rel-${RC_VERSION}-RC
ECHO ">>>" git tag -f "rel-${RC_VERSION}-RC-${VIVO_languages_RC_NUM}" "${VIVO_languages_TAG}-${RC_VERSION}"^{}
git tag -f "rel-${RC_VERSION}-RC-${VIVO_languages_RC_NUM}" "${VIVO_languages_TAG}-${RC_VERSION}"^{}
ECHO ">>>" git push origin --tags
git push origin --tags
ECHO ">>>" cd ..
cd ..
