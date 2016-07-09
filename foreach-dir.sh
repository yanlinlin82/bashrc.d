foreach-dir() {
	[ -z "$1" ] || (echo "Usage: for-dir <cmd> [args]..."; return 1)
	for d in */; do pushd $d; "$@"; popd; done
}
