#!/bin/sh
#dpkg-scanpackages --multiversion rootful > Packages
dpkg-scanpackages --multiversion rootless >> Packages
dpkg-scanpackages --multiversion roothide >> Packages

cat Packages | xz > Packages.xz
cat Packages | bzip2 > Packages.bz2
cat Packages | gzip > Packages.gz

git add .
git commit -m "update repo"
git push