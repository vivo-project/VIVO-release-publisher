#!/bin/bash
# VIVO RC preparation Script

ECHO -----------------------------${VIVO_REPO}---------------------------------
ECHO ">>>" git clone --branch ${BRANCH} --single-branch git@github.com:${ORG}/${VIVO_REPO}.git
git clone --branch ${BRANCH} --single-branch git@github.com:${ORG}/${VIVO_REPO}.git
ECHO ">>>" cd ${VIVO_REPO}
cd ${VIVO_REPO}
ECHO ">>>" git push --delete origin "${VIVO_TAG}-${RC_VERSION}"
git push --delete origin "${VIVO_TAG}-${RC_VERSION}"
ECHO ">>>" git push --delete origin "rel-${RC_VERSION}-RC-${VIVO_RC_NUM}"
git push --delete origin "rel-${RC_VERSION}-RC-${VIVO_RC_NUM}"
ECHO ">>>" git push --delete origin "rel-${RC_VERSION}-RC"
git push --delete origin "rel-${RC_VERSION}-RC"
ECHO ">>>" git checkout ${BRANCH}
git checkout ${BRANCH}
ECHO ">>>" git checkout -b rel-${RC_VERSION}-RC
git checkout -b rel-${RC_VERSION}-RC
ECHO ">>>" mvn release:clean
mvn release:clean
ECHO ">>>" mvn versions:set -DgenerateBackupPoms=false -DnewVersion=${RC_VERSION}
mvn versions:set -DgenerateBackupPoms=false -DnewVersion=${RC_VERSION}
ECHO ">>>" cd installer
cd installer
ECHO ">>>" mvn versions:set -DgenerateBackupPoms=false -DnewVersion=${RC_VERSION}
mvn versions:set -DgenerateBackupPoms=false -DnewVersion=${RC_VERSION}
ECHO ">>>" cd ..
cd ..
ECHO ">>>" mvn -Dmessage="[maven-scm-plugin] prepare release ${VIVO_TAG}-${RC_VERSION}" scm:checkin -DpushChanges=false
mvn -Dmessage="[maven-scm-plugin] prepare release ${VIVO_TAG}-${RC_VERSION}" scm:checkin -DpushChanges=false
ECHO ">>>" mvn -Dtag="${VIVO_TAG}-${RC_VERSION}" scm:tag -DpushChanges=false
mvn -Dtag="${VIVO_TAG}-${RC_VERSION}" scm:tag -DpushChanges=false
ECHO ">>>" mvn versions:set -DgenerateBackupPoms=false -DnewVersion=${RC_NEXT_SNAPSHOT}-SNAPSHOT
mvn versions:set -DgenerateBackupPoms=false -DnewVersion=${RC_NEXT_SNAPSHOT}-SNAPSHOT
ECHO ">>>" cd installer
cd installer
ECHO ">>>" mvn versions:set -DgenerateBackupPoms=false -DnewVersion=${RC_NEXT_SNAPSHOT}-SNAPSHOT
mvn versions:set -DgenerateBackupPoms=false -DnewVersion=${RC_NEXT_SNAPSHOT}-SNAPSHOT
ECHO ">>>" cd ..
cd ..
ECHO ">>>" mvn -Dmessage="[maven-scm-plugin] prepare release ${VIVO_TAG}-${RC_NEXT_SNAPSHOT}-SNAPSHOT" scm:checkin -DpushChanges=false
mvn -Dmessage="[maven-scm-plugin] prepare release ${VIVO_TAG}-${RC_NEXT_SNAPSHOT}-SNAPSHOT" scm:checkin -DpushChanges=false
ECHO ">>>" mvn -Dmessage="[maven-scm-plugin] prepare development ${VIVO_TAG}-${RC_NEXT_SNAPSHOT}-SNAPSHOT" scm:checkin -DpushChanges=false
mvn -Dmessage="[maven-scm-plugin] prepare development ${VIVO_TAG}-${RC_NEXT_SNAPSHOT}-SNAPSHOT" scm:checkin -DpushChanges=false
ECHO ">>>" git push --set-upstream origin rel-${RC_VERSION}-RC
git push --set-upstream origin rel-${RC_VERSION}-RC
ECHO ">>>" git tag -f "rel-${RC_VERSION}-RC-${VIVO_RC_NUM}" "${VIVO_TAG}-${RC_VERSION}"^{}
git tag -f "rel-${RC_VERSION}-RC-${VIVO_RC_NUM}" "${VIVO_TAG}-${RC_VERSION}"^{}
ECHO ">>>" git push origin --tags
git push origin --tags
ECHO ">>>" cd ..
cd ..
