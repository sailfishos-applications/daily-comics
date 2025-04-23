Name:       harbour-dailycomics

# These macros should already be defined in the RPMbuild environment, see: rpm --showrc
%{!?qtc_qmake:%define qtc_qmake %qmake}
%{!?qtc_qmake5:%define qtc_qmake5 %qmake5}
%{!?qtc_make:%define qtc_make make}
%{!?qmake5_install:%define qmake5_install make install INSTALL_ROOT=%{buildroot}}
%{?qtc_builddir:%define _builddir %qtc_builddir}

Summary:    Daily comic strips reader
# The <version> tag must adhere to semantic versioning: Among multiple other
# reasons due to its use for `qmake5` in line 90.  See https://semver.org/
Version:    1.9.96
# The <release> tag comprises one of {alpha,beta,rc,release} postfixed with a
# natural number greater or equal to 1 (e.g. "beta3") and may additionally be
# postfixed with a plus character ("+"), the name of the packager and a release
# number chosen by her (e.g. "rc2+jane4").  `{alpha|beta|rc|release}`
# indicates the expected status of the software.  No other identifiers shall be
# used for any published version, but for the purpose of testing infrastructure
# other nonsensual identifiers as `adud` may be used, which do *not* trigger a
# build at GitHub and OBS, when configured accordingly; mind the sorting
# (`adud` < `alpha`).  For details and reasons, see
# https://github.com/storeman-developers/harbour-storeman/wiki/Git-tag-format
Release:    beta2
# The Group tag should comprise one of the groups listed here:
# https://github.com/mer-tools/spectacle/blob/master/data/GROUPS
Group:      Amusements/Graphics
# Altering the `Vendor:` field breaks the update path on SailfishOS, see
# https://en.opensuse.org/SDB:Vendor_change_update#Disabling_Vendor_stickiness
#Vendor:     meego
License:    MIT
URL:        https://github.com/sailfishos-applications/daily-comics
# The "Source0:" line below requires that the value of %%{name} is also the
# project name at GitHub and the value of `%%{release}/%%{version}` is also
# the name of a correspondingly set Git tag.  For details and reasons, see
# https://github.com/storeman-developers/harbour-storeman/wiki/Git-tag-format
Source0:    %{url}/archive/%{release}/%{version}/%{name}-%{version}.tar.gz
# Note that the rpmlintrc file MUST be named exactly so according to
# https://en.opensuse.org/openSUSE:Packaging_checks#Building_Packages_in_spite_of_errors
Source99:   %{name}.rpmlintrc
Requires:   sailfishsilica-qt5 >= 0.10.9
Requires:   qt5-plugin-imageformat-gif
BuildRequires:  pkgconfig(Qt5Quick)
BuildRequires:  pkgconfig(Qt5Qml)
BuildRequires:  pkgconfig(Qt5Core)
BuildRequires:  pkgconfig(sailfishapp) >= 0.0.10
BuildRequires:  desktop-file-utils

%description
Daily Comics is a simple to use comic strips and cartoon reader for SailfishOS,
which allows for adding new comics / cartoons easily.

%if 0%{?_chum}
Title: Daily Comics
Type: desktop-application
Categories:
 - Graphics
 - Network
 - 2DGraphics
 - Amusement
 - FileTransfer
 - Qt
 - Viewer
DeveloperName: Damien Tardy-Panis (tardypad), Oleg Linkin (maledictus), olf (Olf0)
Custom:
  Repo: %{url}
PackageIcon: %{url}/raw/master/resources/logo.svg
Screenshots:
 - %{url}/raw/master/info/screenshots/favorites.png
 - %{url}/raw/master/info/screenshots/comic_bar.png
 - %{url}/raw/master/info/screenshots/comic_info.png
 - %{url}/raw/master/info/screenshots/image_zoom.png
 - %{url}/raw/master/info/screenshots/settings.png
 - %{url}/raw/master/info/screenshots/cover.png
Links:
  Homepage: https://openrepos.net/content/olf/daily-comics
  Help: %{url}/issues
  Bugtracker: %{url}/issues
  Donation: https://openrepos.net/donate
%endif

# Define (S)RPM compression sensibly, taking compatibility into account, see
# https://github.com/sailfishos-patches/patchmanager/pull/417#issuecomment-1429068156
%define _source_payload w6.gzdio
%define _binary_payload w2.xzdio

%prep
%setup -q

%build
%qtc_qmake5 VERSION=%{version}
%qtc_make %{?_smp_mflags}

%install
%qmake5_install
# I wonder what removing all `.directory` files is good for:
find %{buildroot} -name .directory -type f -delete
# Apparently the many `cover_big.jpg` files are not used, hence deleted here:
find %{buildroot}%{_datadir}/%{name}/plugins/ -name cover_big.jpg -type f -delete
desktop-file-install --delete-original --dir %{buildroot}%{_datadir}/applications \
   %{buildroot}%{_datadir}/applications/%{name}.desktop

%files
%defattr(-,root,root,-)
%{_bindir}/%{name}
%{_datadir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}.png
