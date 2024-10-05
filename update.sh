#!/bin/sh
#dpkg-scanpackages --multiversion rootful > Packages
dpkg-scanpackages --multiversion rootless >> Packages
dpkg-scanpackages --multiversion roothide >> Packages

rm Packages.bz2 Packages.xz

#cat Packages | xz > Packages.xz
#cat Packages | bzip2 > Packages.bz2
#cat Packages | gzip > Packages.gz
#cat Packages | lzma > Packages.lzma
#cat Packages | zstd > Packages.zst

#git add .
#git commit -m "update repo"
#git push