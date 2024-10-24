#/bin/bash
if [ "$1" != "" ]; then
	pkg="$( pwd | rev | cut -d/ -f1-2 | rev )-$1"
else
	for v in `ls -vr *.ebuild`; do
		pkg=$( pwd | rev | cut -d/ -f2 | rev )/$( echo $v | rev | cut -c8- | rev )
		break
	done
fi
rm /etc/portage/package.use/zzzzz_tmp.use
touch /etc/portage/package.use/zzzzz_tmp.use
#all but "github test systemd"
MYUSE=""
for u in `cat $( echo $pkg | cut -d/ -f2 ).ebuild | grep IUSE= | cut -d\" -f2`; do
	u=${u/+/}
	if [ \( "$u" != "systemd" \) -a \( "$u" != "test" \) -a \( "$u" != "bme680" \) -a \( "%u" != "russound_rnet" \) -a \( "%u" != "russound" \) -a \( "%u" != "zeversolar" \) ]; then
		MYUSE="$MYUSE$u "
	fi
done
USE="$MYUSE" emerge --keep-going --oneshot --autounmask --autounmask-write=y --autounmask-use=y --autounmask-backtrack=y --verbose-conflicts --backtrack=30 -va =$pkg
dispatch-conf
USE="$MYUSE" emerge --keep-going --oneshot --verbose-conflicts --backtrack=30 -va =$pkg
rm /etc/portage/package.use/zzzzz_tmp.use
