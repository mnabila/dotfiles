#!/bin/bash
set -e
_dir=`dirname "$(readlink -f "${0}")"`
_basedir=${_dir}
if type dh_testdir>/dev/null 2>&1; then
	printf "debhelper found\n"
else
	printf "debhelper not found - Aborting!\n"
	exit 1
fi
if type fakeroot>/dev/null 2>&1; then
	printf "fakeroot found\n"
else
	printf "fakeroot not found - Aborting!\n"
	exit 1
fi
if dpkg -s libfile-fcntllock-perl >/dev/null 2>&1; then
	printf "libfile-fcntllock-perl found\n"
else
	printf "libfile-fcntllock-perl not found - Aborting!\n"
	exit 1
fi
cd ${_basedir}/debian
fakeroot debian/rules binary
