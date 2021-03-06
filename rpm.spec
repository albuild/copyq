Summary: Yet another unofficial CopyQ package for Amazon Linux 2
Name: albuild-copyq
Version: {{VERSION}}
Release: 0%{?dist}
Group: User Interface/Desktops
License: BSD-3-Clause
Source0: {{SOURCE0}}
URL: https://github.com/albuild/copyq
BuildArch: x86_64
AutoReqProv: yes
Requires: qt5-qtbase qt5-qtscript qt5-qtsvg qt5-qttools qt5-qtx11extras

%description
Yet another unofficial CopyQ package for Amazon Linux 2.

%install
cp -r /dest/* %{buildroot}/

%clean
rm -rf %{buildroot}

%post
gtk-update-icon-cache /usr/share/icons/hicolor

%files
