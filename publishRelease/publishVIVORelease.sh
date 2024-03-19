#!/bin/bash
# VIVO publishing release Script




ECHO ">>>" generate sonatype release

ECHO ">>>" git clone --branch ${VIVO_TAG}-${RC_VERSION} --single-branch git@github.com:${ORG}/${VIVO_REPO}.git
git clone --branch ${VIVO_TAG}-${RC_VERSION} --single-branch git@github.com:${ORG}/${VIVO_REPO}.git
ECHO ">>>" cd ${VIVO_REPO}
cd ${VIVO_REPO}

ECHO ">>>" sed "s/1.12.1/${RC_VERSION}/g;s/1.12.2/${RC_NEXT_SNAPSHOT}/g;s/vivo-project/${ORG}/g;s/VIVO.git/${VIVO_REPO}.git/g" ../../publishRelease/VIVOTemplateRelease.properties > ./release.properties
sed "s/1.12.1/${RC_VERSION}/g;s/1.12.2/${RC_NEXT_SNAPSHOT}/g;s/vivo-project/${ORG}/g;s/VIVO.git/${VIVO_REPO}.git/g" ../../publishRelease/VIVOTemplateRelease.properties > ./release.properties

ECHO ">>>" mvn release:perform -DperformRelease -Dgoals=deploy -e -Darguments="-Dcheckstyle.skip=true"
mvn release:perform -DperformRelease -Dgoals=deploy -e -Darguments="-Dcheckstyle.skip=true"

ECHO ">>>" cd ..
cd ..
