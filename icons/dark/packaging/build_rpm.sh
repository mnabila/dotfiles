#!/bin/bash
set -e
_dir=`dirname "$(readlink -f "${0}")"`
_basedir=${_dir}
cd ${_basedir}/suse
chmod +x buildsuserpm.sh
if type rpmbuild>/dev/null 2>&1; then
	printf "rpmbuild found\n"
else
	printf "rpmbuild not found - Aborting!\n"
	exit 1
fi
if type fakeroot>/dev/null 2>&1; then
	printf "fakeroot found\n"
else
	printf "fakeroot not found - Aborting!\n"
	exit 1
fi
fakeroot sh -c "${_basedir}/suse/buildsuserpm.sh"
