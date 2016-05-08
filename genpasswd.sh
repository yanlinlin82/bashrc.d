genpasswd() {
	local LENGTH=$1
	local CHARSET=$2
	[ "$LENGTH" == "" ] && LENGTH=20
	[ "$CHARSET" == "" ] && CHARSET=A-Za-z0-9_
	tr -dc $CHARSET < /dev/urandom | head -c $LENGTH | xargs
}
