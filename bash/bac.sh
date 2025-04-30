bacdir=~/Downloads/StarcraftII/.local/share/Steam/steamapps/compatdata
steamdata=~/.local/share/Steam/steamapps/compatdata

mkdir -p $bacdir
mv $steamdata/* $bacdir/
cd $bacdir

# move z: out, /dev/core interferes with checksum!
mkdir -p pfx.devices.z

for p in $prefix{
	mv mv $p/pfx/dosdevices/z\: pfx.devices.z/$p/
}

# checksum
for p in $prefix{
	cfv -Crrt md5
}
