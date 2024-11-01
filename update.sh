#!/bin/sh
#dpkg-scanpackages --multiversion rootful > Packages
dpkg-scanpackages --multiversion rootless >> Packages
dpkg-scanpackages --multiversion roothide >> Packages

cat Packages | xz > Packages.xz
cat Packages | bzip2 > Packages.bz2
#cat Packages | gzip > Packages.gz
#cat Packages | lzma > Packages.lzma
#cat Packages | zstd > Packages.zst

apt-ftparchive\
 -o APT::FTPArchive::Release::Origin="- 季伯之家"\
 -o APT::FTPArchive::Release::Label="- 季伯之家"\
 -o APT::FTPArchive::Release::Suite="stable"\
 -o APT::FTPArchive::Release::Version="1.0"\
 -o APT::FTPArchive::Release::Codename="ios"\
 -o APT::FTPArchive::Release::Architectures="iphoneos-arm iphoneos-arm64 iphoneos-arm64e"\
 -o APT::FTPArchive::Release::Components="main"\
 -o APT::FTPArchive::Release::Description="源内插件仅为自用备份"\
 release . > Release

git add .
git commit -m "update repo"
git push