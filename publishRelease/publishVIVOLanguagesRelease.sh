#!/bin/bash
# VIVO languages publishing release Script




ECHO -----------------------------${VIVO_languages_REPO}---------------------------------

ECHO ">>>" generate github release

ECHO ">>>" curl -H "Authorization: Bearer ${ORG_ACCESS_TOKEN}"\
	--data '{"tag_name": "'${VIVO_languages_TAG}'-'${RC_VERSION}'",
                "target_commitish": "'${BRANCH}'",
                "name": "Release '${VIVO_languages_TAG}'-'${RC_VERSION}'",
                "body": "",
                "draft": false,
                "prerelease": false,
                "generate_release_notes":true}' \
    https://api.github.com/repos/${ORG}/${VIVO_languages_REPO}/releases
curl -H "Authorization: Bearer ${ORG_ACCESS_TOKEN}"\
	--data '{"tag_name": "'${VIVO_languages_TAG}'-'${RC_VERSION}'",
                "target_commitish": "'${BRANCH}'",
                "name": "Release '${VIVO_languages_TAG}'-'${RC_VERSION}'",
                "body": "",
                "draft": false,
                "prerelease": false,
                "generate_release_notes":true}' \
    https://api.github.com/repos/${ORG}/${VIVO_languages_REPO}/releases

ECHO ">>>" generate sonatype release

ECHO ">>>" git clone --branch ${VIVO_languages_TAG}-${RC_VERSION} --single-branch git@github.com:${ORG}/${VIVO_languages_REPO}.git
git clone --branch ${VIVO_languages_TAG}-${RC_VERSION} --single-branch git@github.com:${ORG}/${VIVO_languages_REPO}.git
ECHO ">>>" cd ${VIVO_languages_REPO}
cd ${VIVO_languages_REPO}

ECHO ">>>" sed "s/1.12.1/${RC_VERSION}/g;s/1.12.2/${RC_NEXT_SNAPSHOT}/g;s/vivo-project/${ORG}/g;s/VIVO-languages.git/${VIVO_languages_REPO}.git/g" ../../publishRelease/VIVOLanguagesTemplateRelease.properties > ./release.properties
sed "s/1.12.1/${RC_VERSION}/g;s/1.12.2/${RC_NEXT_SNAPSHOT}/g;s/vivo-project/${ORG}/g;s/VIVO-languages.git/${VIVO_languages_REPO}.git/g" ../../publishRelease/VIVOLanguagesTemplateRelease.properties > ./release.properties

ECHO ">>>" mvn release:perform -DperformRelease -Dgoals=deploy -e -Darguments="-Dcheckstyle.skip=true"
mvn release:perform -DperformRelease -Dgoals=deploy -e -Darguments="-Dcheckstyle.skip=true"

ECHO ">>>" cd ..
cd ..
