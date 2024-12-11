title "Fix readme"

if [ -f CHANGELOG.md ]; then
	mv CHANGELOG.md ./src
	git add ./src/CHANGELOG.md
fi


# Merge the PR
# auto_merge
