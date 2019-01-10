2019-01-10 final 0.85.0-r2 release and some more opts
	added home-assistant-frontend-20190109.0
	did a new compile test on a fresh empty box from scratch, now works good, compiling in a ramdisk adds ~4GB to the snapshot.
	add sample files for /etc/portage:
	- use mariadb client without db
	- fix dependency block with mysql
	- add repos.conf sample
	fix adb python targets
	fix pywemo targets
	fix pyHS100 targets
	fix fix pyHS100 dependency case
	homeassistant-0.85.0 logdir will now be created
	async_timeout-3.0.1 fix
	ua-parser-0.8.0 fix
	v0.85.0 release 10.1.2019 (sorry, did not compile on empty box if python 2.7 is still installed, deleted this release, think I'll have to set up a test branch)
	add new pytest, pyhomematic, keyring (experimental), aioesphomeapi ebuilds
	warrant-0.6.1 update PYTHON_TARGETS
	aiocoap-0.4_alpha3 add missing encoding (Umlaut breaks setup.py)

2019-01-09 0.85.0_beta1
	homeassistant-0.85.0_beta1 added
	bump beautifulsoup-4.7.1
	update rxv-0.6.0 (not needed for beta1 yet)
	update jsonrpc-base-1.0.2, jsonrpc-websocket-1.0.1 (not needed for beta1 yet)
	cleanup some deps to requirements_all.txt
	update ifaddr-0.1.6
	update netdisco-2.3.0

2019-01-09 0.85.0_beta0
	homeassistant-0.85.0_beta0 added
	cleanup some deps to requirements_all.txt
	typing_extensions>=3.6.5' is required by aiohttp, fix uncommon underscore MY_P=-
	Unidecode>=0.04.16' is required by python-slugify
	requests needs python2_7 caused by ssl-fetch
	remove unneeded 3.0.5 patch from aiohttp-3.5.1
	botocore needs python2_7 caused by s3transfer-0.1.13-r1
	reduce PYTHON_COMPAT=( python3_{6,7} ) for ome edited packages
	add (old) aioftp-0.10.1
	add aiohttp-3.5.1
	add aiohttp-cors-0.7.0
	add bcrypt-3.1.5 (not needed yet)
	add beautifulsoup-4.7.1
	Python 3.7 -> requirements-parser-0.2.0, requests-2.21.0, construct-2.9.45, cdu-0.1.3
	Python 3.7 -> caldav-0.5.0, botocore-1.12.57, boto3-1.9.57, async_timeout-3.0.1
	Python 3.7 -> astral-1.7.1, aiohttp-cors-0.7.0, colorlog-4.0.2, aiohttp & aioftp
	Python 3.7 compat aiocoap-0.4_alpha3, adb-homeassistant-1.3.1

2019-01-06 some Preps
	patch for caldav-0.5.0 added, works now
	RestrictedPython-4.0_beta_pre7 added
	maxcube-api-0.1.0 added, got a use flag
	pywemo-0.4.38 added
	pyHS100-0.3.3 added
	85.0 should arrive shortly, added homeassistant-0.85.0.ebuild
	  - sorted/cleaned dependecies
	  - bumped version to aiohttp-3.4.4, beautifulsoup-4.6.3, colorlog-4.0.2, pytradfri-6.0.1
	    and websocket-client-0.48.0, pip-9.0.1-r1, jsonrpc-websocket-1.0.1, jsonrpc-base-1.0.2, gTTS-token-1.1.3, pywemo-0.4.38
	  - added setuptools-40.6.3, warrant-0.6.1, zeroconf-0.21.3
	  - new use flag for rxv, maxcube-api

2018-12-31 some preps
	warrant-0.6.1 added, compiles now with a patch
	jsonrpc-base fixes
	add requirements-parser (for local cleanup)
	add some version bumps to prepare for the upcoming HA release as seen in their git code
	some repoman required cleanup:
	- add missing metadata.xml
	- fix LICENSE for some ebuilds
	- fix 3 ebuild.badheader

2018-12-27 follow requirements for upcoming release
	aiohttp-3.5.1 upgrade

2018-12-23 some deps
	colorlog-4.0.2 upgrade
	adb-homeassistant-1.3.1 update
	requests-2.21.0 update
	libusb1-1.7 (new)
	rsa-4.0 (new)
	beautifulsoup-4.6.3 update
	firetv-1.0.7 (new)
	pytradfri-6.0.1 update
	ruamel-yaml-0.15.81 update
	pyatv-0.3.12 update
	Added a Changelog
