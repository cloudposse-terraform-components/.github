#!/bin/bash
gh repo list cloudposse-terraform-components --limit 500 --json name,owner \
    --jq '.[] | select(.name | test("^aws")) | .owner.login + "/" + .name' > repos.txt

split -d -l 16 repos.txt repos-
