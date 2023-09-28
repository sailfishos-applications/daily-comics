Name:       harbour-dailycomics

%{!?qtc_qmake:%define qtc_qmake %qmake}
%{!?qtc_qmake5:%define qtc_qmake5 %qmake5}
%{!?qtc_make:%define qtc_make make}
%{!?qmake5_install:%define qmake5_install make install INSTALL_ROOT=%{buildroot}}
%{?qtc_builddir:%define _builddir %qtc_builddir}

Summary:    Daily comic strips reader
Version:    1.9.2
Release:    1
Group:      Utilities
License:    MIT
URL:        https://github.com/sailfishos-applications/daily-comics
Source0:    %{url}/archive/%{version}-%{release}/%{name}-%{version}.tar.gz
Source99:   %{name}.rpmlintrc
Requires:   sailfishsilica-qt5 >= 0.10.9
Requires:   qt5-plugin-imageformat-gif
BuildRequires:  pkgconfig(Qt5Quick)
BuildRequires:  pkgconfig(Qt5Qml)
BuildRequires:  pkgconfig(Qt5Core)
BuildRequires:  pkgconfig(sailfishapp) >= 0.0.10
BuildRequires:  desktop-file-utils

%description
Read your favourite comic strips every day

%prep
%setup -q

%build
%qtc_qmake5 VERSION=%{version}
%qtc_make %{?_smp_mflags}

%install
%qmake5_install
# I wonder what removing all `.directory` files is good for:
find %{buildroot} -name .directory -type f -delete
# Obviously the many `cover_big.jpg` files are not used at all, hence deleted here:
find %{buildroot}%{_datadir}/%{name}/plugins/ -name cover_big.jpg -type f -delete

desktop-file-install --delete-original --dir %{buildroot}%{_datadir}/applications \
   %{buildroot}%{_datadir}/applications/*.desktop

%files
%defattr(-,root,root,-)
%{_bindir}/%{name}
%{_datadir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}.png
