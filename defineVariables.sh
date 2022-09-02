#!/bin/bash
# RC define common variables Script

export RC_TARGET_DIR=RC
export ORG=chenejac
export ORG_ACCESS_TOKEN=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
export BRANCH=main
export RC_VERSION=1.13.0
export RC_NEXT_SNAPSHOT=1.13.1
RC_NUM=1

export Vitro_languages_REPO=Vitro-languages
export Vitro_languages_TAG=vitro-languages
export Vitro_languages_RC_NUM=${RC_NUM}
export VIVO_languages_REPO=VIVO-languages
export VIVO_languages_TAG=vivo-languages
export VIVO_languages_RC_NUM=${RC_NUM}
export Vitro_REPO=Vitro
export Vitro_TAG=vitro
export Vitro_RC_NUM=${RC_NUM}
export VIVO_REPO=VIVO
export VIVO_TAG=vivo
export VIVO_RC_NUM=${RC_NUM}

echo ${RC_TARGET_DIR}
