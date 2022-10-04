#!/bin/bash
# Vitro languages RC preparation Script

ECHO -----------------------------${Vitro_languages_REPO}---------------------------------
ECHO ">>>" git clone --branch ${BRANCH} --single-branch git@github.com:${ORG}/${Vitro_languages_REPO}.git
git clone --branch ${BRANCH} --single-branch git@github.com:${ORG}/${Vitro_languages_REPO}.git
ECHO ">>>" cd ${Vitro_languages_REPO}
cd ${Vitro_languages_REPO}
ECHO ">>>" git push --delete origin "${Vitro_languages_TAG}-${RC_VERSION}"
git push --delete origin "${Vitro_languages_TAG}-${RC_VERSION}"
ECHO ">>>" git push --delete origin "rel-${RC_VERSION}-RC-${Vitro_languages_RC_NUM}"
git push --delete origin "rel-${RC_VERSION}-RC-${Vitro_languages_RC_NUM}"
ECHO ">>>" git push --delete origin "rel-${RC_VERSION}-RC"
git push --delete origin "rel-${RC_VERSION}-RC"
ECHO ">>>" git checkout -b rel-${RC_VERSION}-RC
git checkout -b rel-${RC_VERSION}-RC
ECHO ">>>" mvn release:clean
mvn release:clean
ECHO ">>>" mvn release:prepare -DreleaseVersion=${RC_VERSION} -Dtag=${Vitro_languages_TAG}-${RC_VERSION} -DdevelopmentVersion=${RC_NEXT_SNAPSHOT}-SNAPSHOT -DautoVersionSubmodules=true -DpushChanges=false
mvn release:prepare -DreleaseVersion=${RC_VERSION} -Dtag=${Vitro_languages_TAG}-${RC_VERSION} -DdevelopmentVersion=${RC_NEXT_SNAPSHOT}-SNAPSHOT -DautoVersionSubmodules=true -DpushChanges=false
ECHO ">>>" git push --set-upstream origin rel-${RC_VERSION}-RC
git push --set-upstream origin rel-${RC_VERSION}-RC
ECHO ">>>" git tag -f "rel-${RC_VERSION}-RC-${Vitro_languages_RC_NUM}" "${Vitro_languages_TAG}-${RC_VERSION}"^{}
git tag -f "rel-${RC_VERSION}-RC-${Vitro_languages_RC_NUM}" "${Vitro_languages_TAG}-${RC_VERSION}"^{}
ECHO ">>>" git push origin --tags
git push origin --tags
ECHO ">>>" cd ..
cd ..
