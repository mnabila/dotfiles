#!/bin/sh
set -e
(command -v sed &>/dev/null||(printf '\nSED is not installed!\n' && exit 1))
(command -v find &>/dev/null||(printf '\nFIND is not installed!\n' && exit 1))
if [ ! -t 0 ]; then
	x-terminal-emulator -e "$0"
	exit 0
fi
basedir=`dirname "$(readlink -f "${0}")"`
cd ${basedir}

#this is always off since symbolic icons are not a standard and 
#unsupported on all non-GTK desktops. 
#They are also pointless on a monotone icon theme and a waste of resources.

for _cmd in "$@"; do
	case $_cmd in
		--symbolic)
			_CREATESYSYMBOLICICONS=1
			printf "\nThe script will create symbolic icons\n"
			sleep 5;;
		*)
			_CREATESYSYMBOLICICONS=0
			printf "\nskipping symbolic icons. use --symbolic to create them\n"
			sleep 5;;
	esac
done

###create svg icon theme dir
_finaldirname=DarK-svg
if [ -d ${basedir}/$_finaldirname ]; then
	rm -rf ${basedir}/$_finaldirname
fi
mkdir ${basedir}/$_finaldirname

_create_symbolic_links()
{
if [ "$_CREATESYSYMBOLICICONS" = "1" ] ; then
###for that symbolic bullshit
###since there is no limitation what a symbolic icon is or where it 
###appears it relinks the whole icon theme!
	printf "\nCreating symbolic icons in $(basename $PWD)\n" && sleep 2
	if [ -d ${basedir}/DarK-svg/16x16/symbolic ]; then
		cp -R ${basedir}/DarK-svg/16x16/symbolic symbolic
	else
		mkdir symbolic
		for _file in $(find -not -path "*/symbolic/*" -not -path "*/animations/*" -not -path "*/emblems/*" -name '*.svg'); do
			if [ ! -f symbolic/"$(echo $_file|sed 's#^.*/##'|sed 's#.svg$#-symbolic.svg#')" ]; then
				ln -sv ".$(echo $_file)" symbolic/"$(echo $_file|sed 's#^.*/##'|sed 's#.svg$#-symbolic.svg#')"
			fi
		done
###some more weird naming breakage on rtl icons(rtl comes after the symbolic suffix)
		for _filertl in $(find -path "*/symbolic/*" -name "*-rtl.symbolic*"); do
			ln -sv $(echo $_filertl|sed 's#^.*/##') symbolic/"$(echo $_filertl|sed 's#^.*/##'|sed 's#-rtl.symbolic#.symbolic-rtl#')"
		done
		for _filertl in $(find -path "*/symbolic/*" -name "*-rtl-symbolic*"); do
			ln -sv $(echo $_filertl|sed 's#^.*/##') symbolic/"$(echo $_filertl|sed 's#^.*/##'|sed 's#-rtl-symbolic#-symbolic-rtl#')"
		done
	fi
else
	printf "\nskipping symbolic icons. use --symbolic to create them\n"
fi
}
###DIRS/SIZES
_cpdirs="16x16 22x22 24x24 32x32 44x44 48x48 256x256"
cp -R DarK-SRC/8x8 ${basedir}/$_finaldirname/8x8
for _cpdir in $(echo $_cpdirs); do
	cp -R DarK-SRC/scalable ${basedir}/$_finaldirname/$_cpdir
done
###cleaning things we don't want to scale
for _cpdir in $(echo $_cpdirs); do
	rm -f ${basedir}/$_finaldirname/$_cpdir/intl/*.html ${basedir}/$_finaldirname/$_cpdir/intl/0-temp*.svg
done
for _cpdir in $(echo $_cpdirs|sed 's/16x16 //'); do
	rm -rf ${basedir}/$_finaldirname/$_cpdir/animations
done

###################BEGIN################################################
###8
#this is the default viewbox 8 so no change
###16
cd ${basedir}/$_finaldirname/16x16
printf "\nCreating $(basename $PWD) icons\n" && sleep 2
_create_symbolic_links
#this is the default viewbox 16 so no change
###22 - maily uses by GTK toolbar icons
cd ${basedir}/$_finaldirname/22x22
printf "\nCreating $(basename $PWD) icons\n" && sleep 2
for _file in $(find -type f -name '*.svg'); do
	sed -i 's/viewBox="0 0 16 16"/viewBox="-3 -3 22 22"/' $_file
done
_create_symbolic_links
###24 - used by many toolbar icons
cd ${basedir}/DarK-svg/24x24
printf "\nCreating $(basename $PWD) icons\n"  && sleep 2
for _file in $(find -type f -name '*.svg'); do
	sed -i 's/viewBox="0 0 16 16"/viewBox="-4 -4 24 24"/' $_file
done
_create_symbolic_links
###32 - big size icons thats the default icon size in all DEs except the GTK ones
cd ${basedir}/DarK-svg/32x32
printf "\nCreating $(basename $PWD) icons\n"  && sleep 2
for _file in $(find -type f -name '*.svg'); do
	sed -i 's/viewBox="0 0 16 16"/viewBox="0 0 16 16" width="32" height="32"/' $_file
done
_create_symbolic_links
###44 - hidpi toolbar icons!
cd ${basedir}/DarK-svg/44x44
printf "\nCreating $(basename $PWD) icons\n"  && sleep 2
for _file in $(find -type f -name '*.svg'); do
	sed -i 's/viewBox="0 0 16 16"/viewBox="-3 -3 22 22" width="44" height="44"/' $_file
done
_create_symbolic_links
###48 - dialog icons!
cd ${basedir}/DarK-svg/48x48
printf "\nCreating $(basename $PWD) icons\n"  && sleep 2
for _file in $(find -type f -name '*.svg'); do
	sed -i 's/viewBox="0 0 16 16"/viewBox="-4 -4 24 24" width="48" height="48"/' $_file
done
_create_symbolic_links
###256 - big icons!
cd ${basedir}/DarK-svg/256x256
printf "\nCreating $(basename $PWD) icons\n"  && sleep 2
for _file in $(find -type f -name '*.svg'); do
	sed -i 's/viewBox="0 0 16 16"/viewBox="0 0 16 16" width="256" height="256"/' $_file
done
_create_symbolic_links


####index.theme
	printf "\nCreating theme index...\n" && sleep 2
	cat <<\EOF > ${basedir}/$_finaldirname/index.theme
[Icon Theme]
Name=DarK(SVG)
Comment=Small in size but with a heavy performance impact
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
KDE-Extensions=.svg
DisplayDepth=32
FollowsColorScheme=false

##Dirs
Directories=8x8/emblems,16x16/animations,16x16/filesystems,16x16/mimetypes,16x16/emblems,16x16/emotes,16x16/emblems-gnome,16x16/intl,16x16/pool,16x16/symbolic,22x22/filesystems,22x22/mimetypes,22x22/emblems,22x22/emotes,22x22/emblems-gnome,22x22/intl,22x22/pool,22x22/symbolic,24x24/filesystems,24x24/mimetypes,24x24/emblems,24x24/emotes,24x24/emblems-gnome,24x24/intl,24x24/pool,24x24/symbolic,32x32/filesystems,32x32/mimetypes,32x32/emblems,32x32/emotes,32x32/emblems-gnome,32x32/intl,32x32/pool,32x32/symbolic,44x44/filesystems,44x44/mimetypes,44x44/emblems,44x44/emotes,44x44/emblems-gnome,44x44/intl,44x44/pool,44x44/symbolic,48x48/filesystems,48x48/mimetypes,48x48/emblems,48x48/emotes,48x48/emblems-gnome,48x48/intl,48x48/pool,48x48/symbolic,256x256/filesystems,256x256/mimetypes,256x256/emblems,256x256/emotes,256x256/emblems-gnome,256x256/intl,256x256/pool,256x256/symbolic

[8x8/emblems]
Size=8
Context=Emblems
Type=Threshold

[16x16/animations]
Size=16
Context=Animations
Type=Scalable
MinSize=16
MaxSize=256

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
cp "$basedir"/DarK-SRC/svg_changecolor.sh ${basedir}/$_finaldirname/changecolor.sh
if type gtk-update-icon-cache &>/dev/null; then
	gtk-update-icon-cache -f "${basedir}/$_finaldirname"
elif type gtk-update-icon-cache-3.0 &>/dev/null; then
	gtk-update-icon-cache-3.0 -f "${basedir}/$_finaldirname"
fi
