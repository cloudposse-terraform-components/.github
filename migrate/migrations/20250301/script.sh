title "Fix tf format and add Editor config"

install .editorconfig

terraform fmt -recursive .

eclint fix .

refresh_github_settings

git add -A .

# Merge the PR
auto_merge
