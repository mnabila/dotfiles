#!/bin/sh
##this is on by default to save resources
_OPTIPNG=1
set -e
(command -v rsvg-convert &>/dev/null||(printf '\nRSVG-CONVERT is not installed!\n' && exit 1))
(command -v optipng &>/dev/null||(printf '\nOPTIPNG is not installed!\n' && exit 1))
(command -v find &>/dev/null||(printf '\nFIND is not installed!\n' && exit 1))
if [ ! -t 0 ]; then
	x-terminal-emulator -e "$0"
	exit 0
fi
basedir=`dirname "$(readlink -f "${0}")"`
cd ${basedir}

_finaldirname=DarK-png
if [ ! -d ${basedir}/DarK-svg ]; then
	printf "please create the svg theme first you can also recolor'the svg theme first"
	exit 1
else
	rm -rf ${basedir}/$_finaldirname
	cp -r ${basedir}/DarK-svg ${basedir}/$_finaldirname
fi

if [ -d ${basedir}/$_finaldirname/backup ]; then
	rm -rf ${basedir}/$_finaldirname/backup
fi

_optipng() {
if [ "$_OPTIPNG" = "1" ] ; then
	optipng -nb -strip all $(echo $_file|sed 's#\.svg#\.png#')
fi
}

_relinksymboliclinks() {
for _svgsymlink in $(find -type l -name '*.svg'); do
	ln -sf "$(readlink $_svgsymlink|sed 's#.svg$#.png#')" "$(ls $_svgsymlink|sed 's#.svg$#.png#')"
	rm -f $_svgsymlink
done
if [ -d symbolic ]; then
	for _filertl in $(find symbolic -name "*-rtl.symbolic*"); do
		ln -s $_filertl $(echo $_filertl|sed 's#-rtl.symbolic#.symbolic-rtl#')
	done
	for _filertl in $(find symbolic -name "*-rtl-symbolic*"); do
		ln -s $_filertl $(echo $_filertl|sed 's#-rtl-symbolic#-symbolic-rtl#')
	done
fi
}

#########Build!
cd ${basedir}/$_finaldirname
###on PNG we need animations for each size!
_cpdirs="22x22 24x24 32x32 44x44 48x48 256x256"
for _cpdir in $(echo $_cpdirs); do
	cp -R 16x16/animations $_cpdir/animations
done

###8x8
cd ${basedir}/$_finaldirname/8x8
printf "\nCreating $(basename $PWD) icons\n"
for _file in $(find -type f -name '*.svg'); do
	rsvg-convert -a -h 8 -f png -o ''$(echo $_file|sed 's#\.svg#\.png#')'' ''$_file''
	_optipng
	rm -f $_file
done
_relinksymboliclinks
###16x16
cd ${basedir}/$_finaldirname/16x16
printf "\nCreating $(basename $PWD) icons\n"
for _file in $(find -type f -name '*.svg'); do
	rsvg-convert -a -h 16 -f png -o ''$(echo $_file|sed 's#\.svg#\.png#')'' ''$_file''
	_optipng
	rm -f $_file
done
_relinksymboliclinks
###22x22
cd ${basedir}/$_finaldirname/22x22
printf "\nCreating $(basename $PWD) icons\n"
for _file in $(find -type f -name '*.svg'); do
	rsvg-convert -a -h 22 -f png -o ''$(echo $_file|sed 's#\.svg#\.png#')'' ''$_file''
	_optipng
	rm -f $_file
done
_relinksymboliclinks
###24x24
cd ${basedir}/$_finaldirname/24x24
printf "\nCreating $(basename $PWD) icons\n"
for _file in $(find -type f -name '*.svg'); do
	rsvg-convert -a -h 24 -f png -o ''$(echo $_file|sed 's#\.svg#\.png#')'' ''$_file''
	_optipng
	rm -f $_file
done
_relinksymboliclinks
###32x32
cd ${basedir}/$_finaldirname/32x32
printf "\nCreating $(basename $PWD) icons\n"
for _file in $(find -type f -name '*.svg'); do
	rsvg-convert -a -h 32 -f png -o ''$(echo $_file|sed 's#\.svg#\.png#')'' ''$_file''
	_optipng
	rm -f $_file
done
_relinksymboliclinks
###48x48
cd ${basedir}/$_finaldirname/48x48
printf "\nCreating $(basename $PWD) icons\n"
for _file in $(find -type f -name '*.svg'); do
	rsvg-convert -a -h 48 -f png -o ''$(echo $_file|sed 's#\.svg#\.png#')'' ''$_file''
	_optipng
	rm -f $_file
done
_relinksymboliclinks
###256x256
cd ${basedir}/$_finaldirname/256x256
printf "\nCreating $(basename $PWD) icons\n"
for _file in $(find -type f -name '*.svg'); do
	rsvg-convert -a -h 256 -f png -o ''$(echo $_file|sed 's#\.svg#\.png#')'' ''$_file''
	_optipng
	rm -f $_file
done
_relinksymboliclinks


####index.theme
	printf "\nCreating theme index...\n" && sleep 2
	cat <<\EOF > ${basedir}/$_finaldirname/index.theme
[Icon Theme]
Name=DarK
Comment=Fast png theme
Example=face-wink
#Inherits=hicolor
Hidden=false

#https://standards.freedesktop.org/icon-theme-spec/icon-theme-spec-latest.html

##KDE
DesktopDefault=64
DesktopSizes=16,22,24,32,64,128,256
ToolbarDefault=22
ToolbarSizes=16,22,24,32,44,48,64,128,256
MainToolbarDefault=22
MainToolbarSizes=16,22,24,32,44,48,64,128,256
SmallDefault=16
SmallSizes=16,22,24,32,44,48,64,128,256
PanelDefault=22
PanelSizes=16,22,24,32,44,48,64,128,256
DialogDefault=48
DialogSizes=16,22,24,32,44,48,64,128,256
KDE-Extensions=.png
DisplayDepth=32
FollowsColorScheme=false

##Dirs
Directories=8x8/emblems,16x16/animations,16x16/filesystems,16x16/mimetypes,16x16/emblems,16x16/emotes,16x16/emblems-gnome,16x16/intl,16x16/pool,16x16/symbolic,22x22/animations,22x22/filesystems,22x22/mimetypes,22x22/emblems,22x22/emotes,22x22/emblems-gnome,22x22/intl,22x22/pool,22x22/symbolic,24x24/animations,24x24/filesystems,24x24/mimetypes,24x24/emblems,24x24/emotes,24x24/emblems-gnome,24x24/intl,24x24/pool,24x24/symbolic,32x32/animations,32x32/filesystems,32x32/mimetypes,32x32/emblems,32x32/emotes,32x32/emblems-gnome,32x32/intl,32x32/pool,32x32/symbolic,44x44/animations,44x44/filesystems,44x44/mimetypes,44x44/emblems,44x44/emotes,44x44/emblems-gnome,44x44/intl,44x44/pool,44x44/symbolic,48x48/animations,48x48/filesystems,48x48/mimetypes,48x48/emblems,48x48/emotes,48x48/emblems-gnome,48x48/intl,48x48/pool,48x48/symbolic,256x256/animations,256x256/filesystems,256x256/mimetypes,256x256/emblems,256x256/emotes,256x256/emblems-gnome,256x256/intl,256x256/pool,256x256/symbolic

[8x8/emblems]
Size=8
Context=Emblems
Type=Threshold

[16x16/animations]
Size=16
Context=Animations
Type=Threshold

[16x16/filesystems]
Size=16
Context=FileSystems
Type=Threshold

[16x16/mimetypes]
Size=16
Context=MimeTypes
Type=Threshold

[16x16/emblems]
Size=16
Context=Emblems
Type=Threshold

[16x16/intl]
Size=16
Context=International
Type=Threshold

[16x16/emotes]
Size=16
Context=Emotes
Type=Threshold

[16x16/emblems-gnome]
Size=16
Type=Threshold

[16x16/pool]
Size=16
Type=Threshold

[16x16/symbolic]
Size=16
Type=Threshold

[22x22/animations]
Size=22
Context=Animations
Type=Threshold
Threshold=1

[22x22/filesystems]
Size=22
Context=FileSystems
Type=Threshold
Threshold=1

[22x22/mimetypes]
Size=22
Context=MimeTypes
Type=Threshold
Threshold=1

[22x22/emblems]
Size=22
Context=Emblems
Type=Threshold
Threshold=1

[22x22/intl]
Size=22
Context=International
Type=Threshold
Threshold=1

[22x22/emotes]
Size=22
Context=Emotes
Type=Threshold
Threshold=1

[22x22/emblems-gnome]
Size=22
Type=Threshold
Threshold=1

[22x22/pool]
Size=22
Type=Threshold
Threshold=1

[22x22/symbolic]
Size=22
Type=Threshold
Threshold=1

[24x24/animations]
Size=24
Context=Animations
Type=Threshold
Threshold=1

[24x24/filesystems]
Size=24
Context=FileSystems
Type=Threshold
Threshold=1

[24x24/mimetypes]
Size=24
Context=MimeTypes
Type=Threshold
Threshold=1

[24x24/emblems]
Size=24
Context=Emblems
Type=Threshold
Threshold=1

[24x24/intl]
Size=24
Context=International
Type=Threshold
Threshold=1

[24x24/emotes]
Size=24
Context=Emotes
Type=Threshold
Threshold=1

[24x24/emblems-gnome]
Size=24
Type=Threshold
Threshold=1

[24x24/pool]
Size=24
Type=Threshold
Threshold=1

[24x24/symbolic]
Size=24
Type=Threshold
Threshold=1

[32x32/animations]
Size=32
Context=Animations
Type=Threshold

[32x32/filesystems]
Size=32
Context=FileSystems
Type=Threshold

[32x32/mimetypes]
Size=32
Context=MimeTypes
Type=Threshold

[32x32/emblems]
Size=32
Context=Emblems
Type=Threshold

[32x32/intl]
Size=32
Context=International
Type=Threshold

[32x32/emotes]
Size=32
Context=Emotes
Type=Threshold

[32x32/emblems-gnome]
Size=32
Type=Threshold

[32x32/pool]
Size=32
Type=Threshold

[32x32/symbolic]
Size=32
Type=Threshold

[44x44/animations]
Size=44
Context=Animations
Type=Threshold

[44x44/filesystems]
Size=44
Context=FileSystems
Type=Threshold

[44x44/mimetypes]
Size=44
Context=MimeTypes
Type=Threshold

[44x44/emblems]
Size=44
Context=Emblems
Type=Threshold

[44x44/intl]
Size=44
Context=International
Type=Threshold

[44x44/emotes]
Size=44
Context=Emotes
Type=Threshold

[44x44/emblems-gnome]
Size=44
Type=Threshold

[44x44/pool]
Size=44
Type=Threshold

[44x44/symbolic]
Size=44
Type=Threshold

[48x48/animations]
Size=48
Context=Animations
Type=Threshold

[48x48/filesystems]
Size=48
Context=FileSystems
Type=Threshold

[48x48/mimetypes]
Size=48
Context=MimeTypes
Type=Threshold

[48x48/emblems]
Size=48
Context=Emblems
Type=Threshold

[48x48/intl]
Size=48
Context=International
Type=Threshold

[48x48/emotes]
Size=48
Context=Emotes
Type=Threshold

[48x48/emblems-gnome]
Size=48
Type=Threshold

[48x48/pool]
Size=48
Type=Threshold

[48x48/symbolic]
Size=48
Type=Threshold

[256x256/animations]
Size=256
Context=Animations
Type=Scalable
MinSize=64
MaxSize=256

[256x256/filesystems]
Size=256
Context=FileSystems
Type=Scalable
MinSize=64
MaxSize=256

[256x256/mimetypes]
Size=256
Context=MimeTypes
Type=Scalable
MinSize=64
MaxSize=256

[256x256/emblems]
Size=256
Context=Emblems
Type=Scalable
MinSize=64
MaxSize=256

[256x256/intl]
Size=256
Context=International
Type=Scalable
MinSize=64
MaxSize=256

[256x256/emotes]
Size=256
Context=Emotes
Type=Scalable
MinSize=64
MaxSize=256

[256x256/emblems-gnome]
Size=256
Type=Scalable
MinSize=64
MaxSize=256

[256x256/pool]
Size=256
Type=Scalable
MinSize=64
MaxSize=256

[256x256/symbolic]
Size=256
Type=Scalable
MinSize=64
MaxSize=256

EOF

cp "$basedir"/DarK-SRC/COPYING ${basedir}/$_finaldirname/COPYING
cp "$basedir"/DarK-SRC/LICENSE ${basedir}/$_finaldirname/LICENSE
cp "$basedir"/DarK-SRC/png_changecolor.sh ${basedir}/$_finaldirname/changecolor.sh
if type gtk-update-icon-cache &>/dev/null; then
	gtk-update-icon-cache -f "${basedir}/$_finaldirname"
elif type gtk-update-icon-cache-3.0 &>/dev/null; then
	gtk-update-icon-cache-3.0 -f "${basedir}/$_finaldirname"
fi



