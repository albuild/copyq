FROM amazonlinux:2.0.20191016.0

ARG version

RUN yum -y update
RUN yum -y install \
  cmake \
  gcc-c++ \ 
  libXfixes-devel \
  libXtst-devel \
  make \
  qt5-qtbase-devel \
  qt5-qtscript-devel \
  qt5-qtsvg-devel \
  qt5-qttools-devel \
  qt5-qtx11extras-devel \
  rpm-build

RUN mkdir /app
WORKDIR /app

RUN curl -LO https://github.com/hluk/CopyQ/archive/v$version.tar.gz
RUN tar xzf v$version.tar.gz

WORKDIR /app/CopyQ-$version
RUN cmake -DCMAKE_INSTALL_PREFIX=/usr .
RUN make
RUN make DESTDIR=/dest install

RUN mkdir -p /root/rpmbuild/{SOURCES,SPECS}
WORKDIR /root/rpmbuild
ADD rpm.spec SPECS
RUN sed -i "s,{{VERSION}},$version," SPECS/rpm.spec >/dev/null
RUN sed -i "s,{{SOURCE0}},https://github.com/hluk/CopyQ/archive/v$version.tar.gz," SPECS/rpm.spec >/dev/null
RUN find /dest -type f | sed 's,^/dest,,' | sed 's,^\(/usr/share/man/man[1]/.\+\.[1]\)$,\1.gz,' >> SPECS/rpm.spec
RUN find /dest -type l | sed 's,^/dest,,' | sed 's,^\(/usr/share/man/man[1]/.\+\.[1]\)$,\1.gz,' >> SPECS/rpm.spec
RUN rpmbuild -bb SPECS/rpm.spec
