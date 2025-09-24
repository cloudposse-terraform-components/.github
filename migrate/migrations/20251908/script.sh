title "Migrate README generation to atmos"

install AGENTS.md
install atmos.yaml
install .gitignore
install .github/workflows/automerge.yml

remove Makefile

rm -f README.md

yq -i 'del(.include)' README.yaml


sed -i ''  '/<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->/,/<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->/d' README.yaml

codex exec  --full-auto "We need to update README.yaml. There is a description that just contains a markdown of the whole text. The description have to be decomposed into several sections. So, Description, Usage, References, Categories. And the important thing is that we shouldn't lose any piece of information defined in the description. Use this https://github.com/cloudposse/.github/blob/main/README.md.gotmpl to get README.yaml structure. If references link does not have description - set it empty.  Run 'atmos readme' after updating README.yaml to verify the changes. Fix errors if any."

yq -i '(.references[] | select(.name == "cloudposse/terraform-aws-components") | .url) = "https://github.com/orgs/cloudposse-terraform-components/repositories"' README.yaml
yq -i '(.references[] | select(.name == "cloudposse/terraform-aws-components") | .name) = "cloudposse-terraform-components"' README.yaml


atmos readme

# Merge the PR
# auto_merge


