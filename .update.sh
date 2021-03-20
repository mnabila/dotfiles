#!/bin/sh
set -e
_basedir="$(dirname "$(readlink -f "${0}")")"
cd "$_basedir"
#rm -rf .git
#git init
LANG=C
MESSAGE="$(date -u '+%Y%m%d%H%M%S')"
cp -f packaging/debian/debian/changelog_template packaging/debian/debian/changelog
sed -i s'/__COMMIT__/'$MESSAGE'/g' packaging/debian/debian/changelog
cp -f packaging/suse/.buildsuserpm.sh.template packaging/suse/buildsuserpm.sh
sed -i s'/__COMMIT__/'$MESSAGE'/g' packaging/suse/buildsuserpm.sh
git add .
git commit -m "$MESSAGE"
#git remote add origin http://gitlab.com/sixsixfive/dark.git
#git push -u --force origin master
git push origin master
printf "\n...done\n"
exit 0
