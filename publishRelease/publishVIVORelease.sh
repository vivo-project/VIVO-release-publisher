#!/bin/bash
# VIVO publishing release Script

ECHO -----------------------------${VIVO_REPO}---------------------------------
ECHO ">>>" mkdir ${VIVO_REPO}
mkdir ${VIVO_REPO}
ECHO ">>>" cd ${VIVO_REPO}
cd ${VIVO_REPO}

ECHO ">>>" generate github release

ECHO ">>>" curl -H "Authorization: Bearer ${PERSONAL_ACCESS_TOKEN}"\
	--data '{"tag_name": "'${VIVO_TAG}'-'${RC_VERSION}'",
                "target_commitish": "'${BRANCH}'",
                "name": "Release '${VIVO_TAG}'-'${RC_VERSION}'",
                "body": "**Release '${VIVO_TAG}' '${RC_VERSION}'**<br/>It is recommended that you review the '${RC_VERSION_MINOR}' Documentation and the VIVO/Vitro READMEs on github before you start.<br/>If you are new to VIVO/Vitro it is suggested that you take advantage of Docker/Docker-Compose.  The instructions are shown in the VIVO README.md on github.<br/><br/>**VIVO '${RC_VERSION_MINOR}'.x Documentation**<br/>https://wiki.lyrasis.org/display/VIVODOC'${RC_VERSION_MINOR//.}'x/<br/>https://github.com/vivo-project/VIVO/releases/tag/vivo-'${RC_VERSION}'<br/>https://github.com/vivo-project/Vitro/releases/tag/vitro-'${RC_VERSION}'<br/>https://github.com/vivo-project/VIVO-languages/releases/tag/vivo-languages-'${RC_VERSION}'<br/>https://github.com/vivo-project/Vitro-languages/releases/tag/vitro-languages-'${RC_VERSION}'<br/><br/>**Release Notes**<br/>https://wiki.lyrasis.org/display/VIVODOC'${RC_VERSION_MINOR//.}'x/Release+Notes<br/><br/>**Release Testing**<br/>https://wiki.lyrasis.org/display/VIVO/Release+Testing+-+'${RC_VERSION}'<br/><br/>**Previous Release Announcements**<br/>https://wiki.lyrasis.org/display/VIVO/Releases",
                "draft": false,
                "prerelease": false,
                "generate_release_notes":true}' \
    https://api.github.com/repos/${ORG}/${VIVO_REPO}/releases
curl -H "Authorization: Bearer ${PERSONAL_ACCESS_TOKEN}"\
	--data '{"tag_name": "'${VIVO_TAG}'-'${RC_VERSION}'",
                "target_commitish": "'${BRANCH}'",
                "name": "Release '${VIVO_TAG}'-'${RC_VERSION}'",
                "body": "**Release '${VIVO_TAG}' '${RC_VERSION}'**<br/>It is recommended that you review the '${RC_VERSION_MINOR}' Documentation and the VIVO/Vitro READMEs on github before you start.<br/>If you are new to VIVO/Vitro it is suggested that you take advantage of Docker/Docker-Compose.  The instructions are shown in the VIVO README.md on github.<br/><br/>**VIVO '${RC_VERSION_MINOR}'.x Documentation**<br/>https://wiki.lyrasis.org/display/VIVODOC'${RC_VERSION_MINOR//.}'x/<br/>https://github.com/vivo-project/VIVO/releases/tag/vivo-'${RC_VERSION}'<br/>https://github.com/vivo-project/Vitro/releases/tag/vitro-'${RC_VERSION}'<br/>https://github.com/vivo-project/VIVO-languages/releases/tag/vivo-languages-'${RC_VERSION}'<br/>https://github.com/vivo-project/Vitro-languages/releases/tag/vitro-languages-'${RC_VERSION}'<br/><br/>**Release Notes**<br/>https://wiki.lyrasis.org/display/VIVODOC'${RC_VERSION_MINOR//.}'x/Release+Notes<br/><br/>**Release Testing**<br/>https://wiki.lyrasis.org/display/VIVO/Release+Testing+-+'${RC_VERSION}'<br/><br/>**Previous Release Announcements**<br/>https://wiki.lyrasis.org/display/VIVO/Releases",
                "draft": false,
                "prerelease": false,
                "generate_release_notes":true}' \
    https://api.github.com/repos/${ORG}/${VIVO_REPO}/releases


ECHO ">>>" generate sonatype release

ECHO ">>>" git clone --branch ${VIVO_TAG}-${RC_VERSION} --single-branch git@github.com:${ORG}/${VIVO_REPO}.git
git clone --branch ${VIVO_TAG}-${RC_VERSION} --single-branch git@github.com:${ORG}/${VIVO_REPO}.git
ECHO ">>>" cd ${VIVO_REPO}
cd ${VIVO_REPO}

ECHO ">>>" sed "s/1.12.1/${RC_VERSION}/g;s/1.12.2/${RC_NEXT_SNAPSHOT}/g;s/vivo-project/${ORG}/g;s/VIVO.git/${VIVO_REPO}.git/g" ../../../publishRelease/VIVOTemplateRelease.properties > ./release.properties
sed "s/1.12.1/${RC_VERSION}/g;s/1.12.2/${RC_NEXT_SNAPSHOT}/g;s/vivo-project/${ORG}/g;s/VIVO.git/${VIVO_REPO}.git/g" ../../../publishRelease/VIVOTemplateRelease.properties > ./release.properties

ECHO ">>>" mvn release:perform -DperformRelease -Dgoals=deploy -e -Darguments="-Dcheckstyle.skip=true"
mvn release:perform -DperformRelease -Dgoals=deploy -e -Darguments="-Dcheckstyle.skip=true"	

ECHO ">>>" cd ../..
cd ../..
