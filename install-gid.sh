mkdir /gid
cd /gid

VERSION=14.1.8d
TARFILENAME=gid${VERSION}-linux-x64.tar.xz
wget --quiet https://web.cimne.upc.edu/users/fjgarate/descargas/images/${TARFILENAME}
tar -Jxf ${TARFILENAME}
rm ${TARFILENAME}
# rename folder to a 'common' name known by surpervisord.conf
mv gid${VERSION}-x64 gid-x64
cd gid-x64
echo 147.83.143.50 >> scripts/TemporalVariables
PREFERENCESFOLDER=$HOME/.gid/${VERSION}/
mkdir -p ${PREFERENCESFOLDER}
PREFERENCESFILE=${PREFERENCESFOLDER}gid.ini

echo "GiD READY"