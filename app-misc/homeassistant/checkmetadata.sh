#/bin/bash
metadata_use=
oldifs=$IFS
        IFS="
"
for u in `cat metadata.xml |grep "flag name"`; do
	use=`echo $u | cut -d\" -f2`
	metadata_use="${metadata_use}${use} "
done
IFS=$oldifs

for use_met in $metadata_use; do
	found=
	for ebuild in `ls -vr *.ebuild | grep -v "9999"`; do
	        echo -ne " * Check if USE flag \033[0;32m$use_met\033[0m is missing in ebuild $ebuild...                                         \r"
		for use in `cat $ebuild | grep IUSE= | cut -d\" -f2`; do
			if [ "$use_met" = "${use/+/}" ]; then
				found=OK
				break
			fi
		done		
	done
        test "$found" != "OK" && echo -e "\033[31m$use_met\033[0m is not used in any ebuild                                                         "

done

for ebuild in `ls -vr *.ebuild | grep -v "9999"`; do
        echo -e " * Check \033[0;32m$ebuild\033[0m for orphan USE flag not declared in metadata.xml                         "
	for use in `cat $ebuild | grep IUSE= | cut -d\" -f2`; do
		found=
		for use_met in $metadata_use; do
			if [ "$use_met" = "${use/+/}" ]; then
                                found=OK
                                break
                        fi
			echo -en "$ebuild: ${use/+/} != $use_met                                                                              \r"
		done
                test "$found" != "OK" && echo -e "\033[31m$use\033[0m"

	done
done
