2019-02-12 div Updates
	* Update sqlalchemy-1.2.17, remove sqlalchemy-1.2.11
	* add aioambient-0.1.1
	* add CO2Signal-0.4.2
	* add PyChromecast-2.5.0
	* add aioharmony-0.1.7
	* bump home-assistant-frontend==20190212.0, remove 20190120.0 - 20190130.0
	* fixed SRC_URI handling for RestrictedPython, and added 4.0_beta8
	* bump cryptography-2.5
	* add pyatmo-1.8
	* add pyarlo-0.2.3
	* and somebody renamed esphomeyaml to esphome, renamed and hacked a fix for archived SRC_URIs
	* add platformio-core 3.6.3 & 3.6.4
	* change License to GNU General Public License v3.0

2019-02-12 div Updates
	* Update pyHS100 to 0.3.4
	* bump aioesphomeapi-1.5.0
	* bump ruamel-yaml-0.15.87
	* add zm-py-0.3.3
	* add slixmpp-1.4.2
	* add ebusdpy-0.0.16
	* add PyGithub-1.43.5
	* add more useflags (denon & zoneminder)

2019-02-10 homeassistant-0.87.1
	* bump homeassistant-0.87.1

2019-02-07 homeassistant-0.87.0
	* bump homeassistant-0.87.0
	* astral-1.9.2 added
	* PySwitchmate-0.4.5 added
	* distro-1.4.0 added

2019-02-06 homeassistant-0.87.0_beta6
	* homeassistant-0.87.0_beta6
	* WazeRouteCalculator-0.6 added
	* tellduslive-0.10.10 added

2019-02-05 small changes
	* add speedtest-cli-2.0.2 to v0.87.0_beta5
	* add ha-ffmpeg-1.11

2019-02-05 v0.87.0_beta5
	* add async-upnp-client-0.14.4
	* add flake8-3.7.5

2019-02-04 v0.87.0_beta5
	* add homeassistant-0.87.0_beta5.ebuild
	* bump frontend to20190203.0
	* add ha-ffmpeg-1.11
	* add speedtest-cli-2.0.2

2019-02-03 v0.87.0_beta4
	* add homeassistant-0.87.0_beta4.ebuild
	* add rxv-0.6.0 (unsued)
	* bump frontend to20190202.0

2019-02-02 v0.87.0_beta2
	* add homeassistant-0.87.0_beta2.ebuild
	* No other changes

2019-02-02 v0.87.0_beta1
	* bump frontend to20190201.0

2019-02-01 v0.87.0_beta0
	* blinkpy-0.12.1 added

2019-01-30 v0.87.0_beta0
	* add homeassistant-0.87.0_beta0.ebuild
	* frontend-20190130.1
	* async-upnp-client-0.14.3 added
	* pymodbus added
	* experiments with docs:
		- sphinx-1.8.3 (dependecy problems)
		- sphinx-autodoc-typehints-1.6.0 added (dependecy problems)
		- sphinx-autodoc-annotation-1.0-r1 added (dependecy problems)

2019-01-30 Added some Ebuilds
	* pymodbus-2.1.0 and 1.5.0 added
	* async-upnp-client0.14.3 and required python-didl-lite added

2019-01-29 Release homeassistant-0.86.4
	* bump homeassistant-0.86.4, no other changes
	* added variable version for SRC_URI to aioasuswrt
	* Upgrade aioasuswrt-1.1.20

2019-01-27 Release homeassistant-0.86.3
	* removed useless dropbox use flag
	* tested compilation of homeassistant-0.86.3 with all use flags set on an empty box with python-3.6.5 without problems
	* CO2Signal added
	* adb-homeassistant PYTHON_COMPAT7
	* blinkpy added
	* Upgrade astral to 1.8 (#20459)
	* Upgrade sqlalchemy to 1.2.16 (#20474)
	* Upgrade psutil to 5.5.0 (#20462)
	* small dep changes in homeassistant-0.86.2.ebuild
	* adjust warrant-0.6.1 patch
	* adjust caldav-0.5.0-top_level.patch
	* qnapstats-0.3.0 added
	* Update pyhomematic to 0.1.55
	* ioasuswrt-1.1.18 (with dep) added
	* Upgrade numpy to 1.16.0

2019-01-26 Compile from Scratch Test
	* compile homeassistant-0.86.2 with all use flags set,
	* had to fix all paths in 2 patches (warrant-0.6.1 and caldav-0.5.0)
	* added haproxy dependecy
	* added asuswrt qnap and homematic dependency
	* removed default for mysql use flag

2019-01-25 Release v0.86.2
	* homeassistant-0.86.2

2019-01-23 Release v0.86.1
	* homeassistant-0.86.1

2019-01-23 v0.86.0_beta3
	* homeassistant-0.86.0_beta3
	* with frontend-20190121.1
	* change older Beta's to BETA

2019-01-21 v0.86.0_beta2
	* bump pysonos-0.0.6
	* bump aioesphomeapi-1.4.2
	* homeassistant-0.86.0_beta2
	* frontend-20190120.0 and
	* frontend-20190121.0

2019-01-18 0.86.0_beta0
	* changed/added some missing/wrong licenses
	* added much more python3_7 TARGETS
	* removed lots of old CVS tags
	* README.md updated
	* pyjwt Digest verification corrected
	* pyjwt license corrected
	* pyunifi license corrected
	* click > 6 for platformio did not work
	* esphomeyaml moved
	* pynuki added
	* move esphomeyaml to dev-embedded
	* allow click > 6 for platformio (experimental)
	* (tag: v0.86.0_beta0) homeassistant-0.86.0_beta0 added
	* aiohttp-3.5.4 added

2019-01-15 new lib
	* abodepy-0.15.0 added (requires very old lomond-0.1.14)
	* lomond-0.1.14 added

2019-01-13 some new ebuilds
	* pydocstyle-3.0.0 added
	* pytest-cov-2.6.1 added
	* mypy-0.650 added
	* pytest-4.1.0 update
	* last aioesphomeapi-1.3.0 added (1.4.1 too new)
	* pyunifi-2.16 added
	* pylast-3.0.0 added

2019-01-12 esphomeyaml (python2_7)
	* add tzlocal-1.4 for esphomeyaml
	* add python2_7 compatibility in colorlog-4.0.2.ebuild for esphomeyaml
	* add esphomeyaml-1.10.0

2019-01-11 Release 0.85.1
	* update ruamel-yaml-0.15.85
	* update mutagen-1.42.0
	* update keyring-17.1.1
	* update home-assistant-frontend-20190109.1

2019-01-10 final 0.85.0-r2 release and some more opts
	* added home-assistant-frontend-20190109.0
	* did a new compile test on a fresh empty box from scratch, now works good, compiling in a ramdisk adds ~4GB to the snapshot.
	* add sample files for /etc/portage:
		- use mariadb client without db
		- fix dependency block with mysql
		- add repos.conf sample
	* fix adb python targets
	* fix pywemo targets
	* fix pyHS100 targets
	* fix fix pyHS100 dependency case
	* homeassistant-0.85.0 logdir will now be created
	* async_timeout-3.0.1 fix
	* ua-parser-0.8.0 fix
	* v0.85.0 release 10.1.2019 (sorry, did not compile on empty box if python 2.7 is still installed, deleted this release, think I'll have to set up a test branch)
	* add new pytest, pyhomematic, keyring (experimental), aioesphomeapi ebuilds
	* warrant-0.6.1 update PYTHON_TARGETS
	* aiocoap-0.4_alpha3 add missing encoding (Umlaut breaks setup.py)

2019-01-09 0.85.0_beta1
	* homeassistant-0.85.0_beta1 added
	* bump beautifulsoup-4.7.1
	* update rxv-0.6.0 (not needed for beta1 yet)
	* update jsonrpc-base-1.0.2, jsonrpc-websocket-1.0.1 (not needed for beta1 yet)
	* cleanup some deps to requirements_all.txt
	* update ifaddr-0.1.6
	* update netdisco-2.3.0

2019-01-09 0.85.0_beta0
	* homeassistant-0.85.0_beta0 added
	* cleanup some deps to requirements_all.txt
	* typing_extensions>=3.6.5' is required by aiohttp, fix uncommon underscore MY_P=-
	* Unidecode>=0.04.16' is required by python-slugify
	* requests needs python2_7 caused by ssl-fetch
	* remove unneeded 3.0.5 patch from aiohttp-3.5.1
	* botocore needs python2_7 caused by s3transfer-0.1.13-r1
	* reduce PYTHON_COMPAT=( python3_{6,7} ) for ome edited packages
	* add (old) aioftp-0.10.1
	* add aiohttp-3.5.1
	* add aiohttp-cors-0.7.0
	* add bcrypt-3.1.5 (not needed yet)
	* add beautifulsoup-4.7.1
	* Python 3.7 -> requirements-parser-0.2.0, requests-2.21.0, construct-2.9.45, cdu-0.1.3
	* Python 3.7 -> caldav-0.5.0, botocore-1.12.57, boto3-1.9.57, async_timeout-3.0.1
	* Python 3.7 -> astral-1.7.1, aiohttp-cors-0.7.0, colorlog-4.0.2, aiohttp & aioftp
	* Python 3.7 compat aiocoap-0.4_alpha3, adb-homeassistant-1.3.1

2019-01-06 some Preps
	* patch for caldav-0.5.0 added, works now
	* RestrictedPython-4.0_beta_pre7 added
	* maxcube-api-0.1.0 added, got a use flag
	* pywemo-0.4.38 added
	* pyHS100-0.3.3 added
	* 85.0 should arrive shortly, added homeassistant-0.85.0.ebuild
		- sorted/cleaned dependecies
		- bumped version to aiohttp-3.4.4, beautifulsoup-4.6.3, colorlog-4.0.2, pytradfri-6.0.1
		and websocket-client-0.48.0, pip-9.0.1-r1, jsonrpc-websocket-1.0.1, jsonrpc-base-1.0.2, gTTS-token-1.1.3, pywemo-0.4.38
		- added setuptools-40.6.3, warrant-0.6.1, zeroconf-0.21.3
		- new use flag for rxv, maxcube-api

2018-12-31 some preps
	* warrant-0.6.1 added, compiles now with a patch
	* jsonrpc-base fixes
	* add requirements-parser (for local cleanup)
	* add some version bumps to prepare for the upcoming HA release as seen in their git code
	* some repoman required cleanup:
		- add missing metadata.xml
		- fix LICENSE for some ebuilds
		- fix 3 ebuild.badheader

2018-12-27 follow requirements for upcoming release
	* aiohttp-3.5.1 upgrade

2018-12-23 some deps
	* colorlog-4.0.2 upgrade
	* adb-homeassistant-1.3.1 update
	* requests-2.21.0 update
	* libusb1-1.7 (new)
	* rsa-4.0 (new)
	* beautifulsoup-4.6.3 update
	* firetv-1.0.7 (new)
	* pytradfri-6.0.1 update
	* ruamel-yaml-0.15.81 update
	* pyatv-0.3.12 update
	* Added a Changelog
