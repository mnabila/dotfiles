DarK is a monotone icon theme for X11-themes it can also be used as a fallback icon theme.

![alt text](https://gitlab.com/sixsixfive/dark-icons/raw/master/.preview.png)

### Features:

* Designed to stay in the background, so no disturbing colors
* Recolorable, works even on light themes
* Supports more than 7000 icons from the last decade

### How to install the theme?

#### Devuan/Debian (exporting the path is a [new Frankenstein thing](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=918754) of Debian >=10)

```
su -c 'PATH=/usr/sbin:/sbin:/usr/local/sbin:$PATH apt install fakeroot git libfile-fcntllock-perl debhelper sed findutils --no-install-recommends'
cd /tmp && git clone --depth 1 https://gitlab.com/sixsixfive/DarK-icons.git;cd DarK-icons
sh build_svg.sh
cd packaging;sh build_deb.sh
su -c 'PATH=/usr/sbin:/sbin:/usr/local/sbin:$PATH dpkg -P dark-icon-theme;dpkg -i dark-icon-theme_*.deb;apt install -f --no-install-recommends'
```

##### with sudo installed(eg: LMDE or *buntu)

```
sudo apt install fakeroot git libfile-fcntllock-perl debhelper sed findutils --no-install-recommends
cd /tmp && git clone --depth 1 https://gitlab.com/sixsixfive/DarK-icons.git;cd DarK-icons
sh build_svg.sh
cd packaging;sh build_deb.sh
sudo sh -c 'dpkg -P dark-icon-theme;dpkg -i dark-icon-theme_*.deb;apt install -f --no-install-recommends'
```

#### SuSE or Gecko Linux

```
sudo zypper install fakeroot git rpmbuild sed findutils
cd /tmp && git clone depth -1 https://gitlab.com/sixsixfive/DarK-icons.git;cd DarK-icons
sh build_svg.sh
cd packaging;sh build_rpm.sh
sudo zypper install --no-recommends dark-icon-theme*.rpm

```

### Any other

Just run the build script, you also need to build the svg theme to create the png theme.

Copy the DarK-svg or DarK-png folder to your X11 icon theme dir(usually $SYSPREFIX/share/icons)

### Howto change the Icon-theme color?

Just run the changecolor.sh script!

