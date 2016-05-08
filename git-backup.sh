git-backup() {
	local NAME=$1
	if [ "$NAME" == "-h" -o "$NAME" == "--help" ]; then
		echo "Usage: git-backup [output-name]"
		return 1
	elif [ -z "$NAME" ]; then
		NAME=$(basename $(pwd))
	fi

	if [ ! -d .git ]; then
		echo "Not in Git work directory in '$(pwd)'!"
		return 1
	fi

	DATE=$(git log -1 --pretty=format:%ci 2>/dev/null | cut -c1-16 | sed 's/[- :]//g')
	if [ -z "${DATE}" ]; then
		DATE=$(date +%Y%m%d%H%M)
	fi

	BUNDLE=~/Backup/${DATE}_${NAME}.git.bundle
	git bundle create ${BUNDLE} --all
	chmod 400 ${BUNDLE}

	echo "Backup as '${BUNDLE}'." >/dev/stderr
	return 0
}
