#!/bin/bash
# Vitro RC preparation Script

ECHO -----------------------------${Vitro_REPO}---------------------------------
ECHO ">>>" git clone --branch ${BRANCH} --single-branch git@github.com:${ORG}/${Vitro_REPO}.git
git clone --branch ${BRANCH} --single-branch git@github.com:${ORG}/${Vitro_REPO}.git
ECHO ">>>" cd ${Vitro_REPO}
cd ${Vitro_REPO}
ECHO ">>>" git push --delete origin "${Vitro_TAG}-${RC_VERSION}"
git push --delete origin "${Vitro_TAG}-${RC_VERSION}"
ECHO ">>>" git push --delete origin "rel-${RC_VERSION}-RC-${Vitro_RC_NUM}"
git push --delete origin "rel-${RC_VERSION}-RC-${Vitro_RC_NUM}"
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
ECHO ">>>" mvn -Dmessage="[maven-scm-plugin] prepare release ${Vitro_TAG}-${RC_VERSION}" scm:checkin -DpushChanges=false
mvn -Dmessage="[maven-scm-plugin] prepare release ${Vitro_TAG}-${RC_VERSION}" scm:checkin -DpushChanges=false
ECHO ">>>" mvn -Dtag="${Vitro_TAG}-${RC_VERSION}" scm:tag -DpushChanges=false
mvn -Dtag="${Vitro_TAG}-${RC_VERSION}" scm:tag -DpushChanges=false
ECHO ">>>" mvn versions:set -DgenerateBackupPoms=false -DnewVersion=${RC_NEXT_SNAPSHOT}-SNAPSHOT
mvn versions:set -DgenerateBackupPoms=false -DnewVersion=${RC_NEXT_SNAPSHOT}-SNAPSHOT
ECHO ">>>" cd installer
cd installer
ECHO ">>>" mvn versions:set -DgenerateBackupPoms=false -DnewVersion=${RC_NEXT_SNAPSHOT}-SNAPSHOT
mvn versions:set -DgenerateBackupPoms=false -DnewVersion=${RC_NEXT_SNAPSHOT}-SNAPSHOT
ECHO ">>>" cd ..
cd ..
ECHO ">>>" mvn -Dmessage="[maven-scm-plugin] prepare release ${Vitro_TAG}-${RC_NEXT_SNAPSHOT}-SNAPSHOT" scm:checkin -DpushChanges=false
mvn -Dmessage="[maven-scm-plugin] prepare release ${Vitro_TAG}-${RC_NEXT_SNAPSHOT}-SNAPSHOT" scm:checkin -DpushChanges=false
ECHO ">>>" mvn -Dmessage="[maven-scm-plugin] prepare development ${Vitro_TAG}-${RC_NEXT_SNAPSHOT}-SNAPSHOT" scm:checkin -DpushChanges=false
mvn -Dmessage="[maven-scm-plugin] prepare development ${Vitro_TAG}-${RC_NEXT_SNAPSHOT}-SNAPSHOT" scm:checkin -DpushChanges=false
ECHO ">>>" git push --set-upstream origin rel-${RC_VERSION}-RC
git push --set-upstream origin rel-${RC_VERSION}-RC
ECHO ">>>" git tag -f "rel-${RC_VERSION}-RC-${Vitro_RC_NUM}" "${Vitro_TAG}-${RC_VERSION}"^{}
git tag -f "rel-${RC_VERSION}-RC-${Vitro_RC_NUM}" "${Vitro_TAG}-${RC_VERSION}"^{}
ECHO ">>>" git push origin --tags
git push origin --tags
ECHO ">>>" cd ..
cd ..
