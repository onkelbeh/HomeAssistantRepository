for f in $( find . -name "*.ebuild" | sort ) 
do
  category=$( echo $f | cut -d/ -f2 )
  path=$( echo $f | cut -d/ -f-3 )
  package=$( echo $f | cut -d/ -f4- | rev | cut -d. -f2- | rev )
  echo -n "$category/$package... "
  if [ -z "$( equery d -a "=$category/$package" )" ]
  then
    echo -e "\b\b\b\b is orphans!" 
    if [ "$category" = "dev-python" ]
    then
    	pushd "$path"
	rm Manifest $package.ebuild
	for ebuild in $( find . -name "*.ebuild" )
	do
	  ebuild ${ebuild} digest
	done
	popd
    fi
  else
    echo -en "\r                                              \r"
  fi
  #equery d "$category/$package" && echo "$category/$package"
done

for f in $( find . -name "metadata.xml" | sort )
do
  path=$( echo $f | cut -d/ -f-3 )
  ls $path/*.ebuild > /dev/null 2> /dev/null || rm -rf "$path"
done

