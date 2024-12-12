title "Fix readme"

if [ -f CHANGELOG.md ]; then
	mv CHANGELOG.md ./src
	git add src/CHANGELOG.md
fi

make init
make readme/build README_TEMPLATE_REPO_PATH=README.md.simple.gotmpl README_FILE=src/README.md
git add src/README.md

# Merge the PR
auto_merge
