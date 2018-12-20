genpasswd() {
	if [ "$1" == "-h" -o "$1" == "--help" ]; then
		echo "Usage: genpasswd [length [charset]]"
		echo " e.g.: genpasswd 25"
		echo "       genpasswd 12 'A-Za-z0-9_@#$%^&=+/'"
		return 1
	fi
	local LENGTH=$1
	local CHARSET=$2
	[ "$LENGTH" == "" ] && LENGTH=20
	[ "$CHARSET" == "" ] && CHARSET='A-Za-z0-9_'
	cat /dev/urandom | tr -dc "$CHARSET" | head -c $LENGTH | xargs
}
