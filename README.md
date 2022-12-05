# VIVO-release-publisher #

Before using scripts available in this project please check whether:

1. You have an account with commit access for the [vivo-project](https://github.com/vivo-project) on github. As a committer, you should already have this level of access. 
1. You have an account with edit privileges on the lyrasis.org [Confluence wiki](https://wiki.lyrasis.org/). 
1. You have an oss.sonatype.org account and have requested to be given permission to publish to the org.vivoweb groupId by adding a comment to the [VIVO Sonatype Hosting Ticket](https://issues.sonatype.org/browse/OSSRH-23214)
1. You have configured maven settings file in accordance with instructions available at - https://wiki.lyrasis.org/display/VIVO/VIVO+Release+Process

## Configuration ##
Please, configure variables in [defineVariables.sh](./defineVariables.sh).
You can test publishing process over forked version of vivo-project repositories, in that case variable ORG is set up to your github account, while ORG_ACCESS_TOKEN is set up to token configured for your github repositories.

## Preparing release candidate ##
1. Open a bash (Git bash or Linux terminal)
1. Run [./prepareReleaseCandidate.sh](./prepareReleaseCandidate.sh)
1. Check whether a new branch and new tag are created in both repositories (VIVO and Vitro)
1. Create a wiki page with release candidate testing instructions (you can copy [this one](https://wiki.lyrasis.org/vivo/interest-groups/development-interest-group/vivo-release-process/release-testing-1-13-0))
1. Announce in the VIVO dissemination channels (mailing lists, Slack channels) that new release candidate is published, define deadline in the announcement for testing and providing feedback

## Publishing a release ##
1. If some requests or important issues have been noticed since the moment of making announcement in the point 5 in the section above, consider with VIVO tech group fixing that and publishing the new release candidate (2, 3, 4, ...). If there is no, go to the next point.
1. Run [./publishRelease.sh](./publishRelease.sh)
1. Check new release in the GitHub repositories
   1. https://github.com/vivo-project/Vitro/releases/
   1. https://github.com/vivo-project/VIVO/releases/
1. Complete publishing process via sonatype
    1. Go to https://oss.sonatype.org/index.html (Nexus Repository Manager)
    1. Click on Log In (Top Right Corner) and use your ossrh id from your settings.xml file
    1. Click Staging Repositories in left navigation under Build Promotion which will open a new tab
    1. Search for "vivoweb" in upper right search box (project will not have $REPO in title)
    1. Select repository and verify that $REPO is present in the Content tab
        1. Look for the correct types as well - war, pom, jar, md5, asc, etc.
            1. Note there is sometimes a delay on larger files showing in the Repo.
    1. Click Close, then Refresh, then Release
    1. After a few moments click into the search under Artifact Search in the left navigation and type "vivoweb"
    1. A new Search tab will appear with all of the org.vivoweb Release artifacts
    1. Verify that the new release versions are now listed
        1. Note there is sometimes a delay on larger files showing in the Repo.
    1. This will publish the artifacts to the Sonatype releases repository and start the process of syncing them with Maven Central, which may take several hours. When finished, they'll be available at http://repo1.maven.org/maven2/org/vivoweb.
1. Make release announcement and update technical documentation at [wiki](https://wiki.lyrasis.org/vivo/community-pages/releases)
1. Distribute the message that new release has been published

## Push Release Branch to develop and Maintenance ##
1. Run [./pushToMaintenance.sh](./pushToMaintenance.sh)
1. Manually check the GitHub repositories branches and tags, as well as the main branch (pom.xml files should be updated to include new version number)
