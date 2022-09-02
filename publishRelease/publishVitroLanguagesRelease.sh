#!/bin/bash
# Vitro languages publishing release Script




ECHO -----------------------------${Vitro_languages_REPO}---------------------------------
ECHO ">>>" cd ${Vitro_languages_REPO}
cd ${Vitro_languages_REPO}
ECHO "${Vitro_languages_TAG}-${RC_VERSION}"

curl -H "Authorization: Bearer ${ORG_ACCESS_TOKEN}"\
	--data '{"tag_name": "${Vitro_languages_TAG}-${RC_VERSION}",
                "target_commitish": "main",
                "name": "Release ${Vitro_languages_TAG}-${RC_VERSION}",
                "body": "${Vitro_languages_TAG}-${RC_VERSION}",
                "draft": false,
                "prerelease": false}' \
    https://api.github.com/repos/${ORG}/${Vitro_languages_REPO}/releases

ECHO ">>>" cd ..
cd ..
