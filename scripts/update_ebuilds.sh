#!/bin/bash

temp_file=$(mktemp /tmp/$(basename $0).XXXXXX)

#
# Trim and convert indents to tabs
#
find . -type f | grep -v ".svn\|CVS\|CVSROOT\|.git\|.idea" | while read file; do
	if [ "$(file ${file} | grep -v 'unified diff' | grep text)" ]; then
		sed -i -e 's/[ \t]*$//' ${file}
		unexpand --first-only "${file}" | awk '/^$/ {nlstack=nlstack "\n";next;} {printf "%s",nlstack; nlstack=""; print;}' >"${temp_file}"
		cat "${temp_file}" >"${file}"
	fi
done

rm -f "${temp_file}" 2>/dev/null

#
# Update Distributed and Copyright 
# Create metadata file if it doesn't exist
#
find . -name "*.ebuild" | while read -r ebuild; do
	sed -i '/^# Copyright/d' "${ebuild}"
	sed -i '/^# Distributed/d' "${ebuild}"

	sed -i "1s/^/# Distributed under the terms of the GNU General Public License v2\n/" "${ebuild}"
	sed -i "1s/^/# Copyright 1999-$(date +%Y) Gentoo Authors\n/" "${ebuild}"

	metadata=$(dirname "${ebuild}")/metadata.xml

	if [ ! -e "${metadata}" ]; then
		tee "${metadata}" <<EOF >/dev/null
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE pkgmetadata SYSTEM "https://www.gentoo.org/dtd/metadata.dtd">
<pkgmetadata>
  <maintainer type="project">
    <email>b@edevau.net</email>
    <name>Andreas Billmeier</name>
  </maintainer>
  <upstream>
    <remote-id type="pypi">home-assistant</remote-id>
    <remote-id type="github">home-assistant/core</remote-id>
    <doc>https://www.home-assistant.io/docs/</doc>
    <maintainer>
      <email>hello@home-assistant.io</email>
      <name>The Home Assistant Authors</name>
    </maintainer>
  </upstream>
</pkgmetadata>
EOF
	fi
	ebuild "${ebuild}" digest 2>/dev/null
done
