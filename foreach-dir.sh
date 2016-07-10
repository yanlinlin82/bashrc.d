foreach-dir() {
	if [ -z "$1" ]; then
		echo "Usage: foreach-dir <cmd> [args]..."
		return 1
	fi
	for d in $(ls -d */ 2>/dev/null); do
		pushd $d
		"$@"
		popd
	done
}
