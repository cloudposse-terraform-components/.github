# TODO DELETE AFTER MERGING PR https://github.com/cloudposse-terraform-components/.github/pull/2
export README_TEMPLATE_REPO_REF ?= "DEV-1548/component-requirements"

-include $(shell curl -sSL -o .build-harness "https://cloudposse.tools/build-harness"; echo .build-harness)

all: init readme

readme: readme/build
