git-update() {
	if [ -z "$1" ]; then
		echo "Usage: git-update <dir> ..."
	else
		while [ -n "$1" ]; do
			if [ ! -d $1/.git ]; then
				echo "Skip directory '$1'"
			else
				pushd $1
				git remote -v
				git pull
				popd
			fi
			shift
		done
	fi
}
