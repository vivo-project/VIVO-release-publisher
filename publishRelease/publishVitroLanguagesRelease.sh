#!/bin/bash
# Vitro languages publishing release Script




ECHO -----------------------------${Vitro_languages_REPO}---------------------------------
ECHO ">>>" cd ${Vitro_languages_REPO}
cd ${Vitro_languages_REPO}

ECHO ">>>" generate github release
ECHO ">>>" curl -H "Authorization: Bearer ${ORG_ACCESS_TOKEN}"\
	--data '{"tag_name": "'${Vitro_languages_TAG}'-'${RC_VERSION}'",
                "target_commitish": "'${BRANCH}'",
                "name": "Release '${Vitro_languages_TAG}'-'${RC_VERSION}'",
                "body": "text",
                "draft": false,
                "prerelease": false,
                "generate_release_notes":true}' \
    https://api.github.com/repos/${ORG}/${Vitro_languages_REPO}/releases
curl -H "Authorization: Bearer ${ORG_ACCESS_TOKEN}"\
	--data '{"tag_name": "'${Vitro_languages_TAG}'-'${RC_VERSION}'",
                "target_commitish": "'${BRANCH}'",
                "name": "Release '${Vitro_languages_TAG}'-'${RC_VERSION}'",
                "body": "text",
                "draft": false,
                "prerelease": false,
                "generate_release_notes":true}' \
    https://api.github.com/repos/${ORG}/${Vitro_languages_REPO}/releases

ECHO ">>>" generate sonatype release
ECHO ">>>" mvn release:perform -DperformRelease -Dgoals=deploy -e -Darguments="-Dcheckstyle.skip=true"
mvn release:perform -DperformRelease -Dgoals=deploy -e -Darguments="-Dcheckstyle.skip=true"

ECHO ">>>" cd ..
cd ..
