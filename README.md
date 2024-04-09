# Home Assistant for Gentoo
## without Docker & Virtual Environments


[![OS](https://img.shields.io/badge/OS-Gentoo%20Linux-blue)](https://www.gentoo.org/)
[![weekly commits](https://img.shields.io/github/commit-activity/w/onkelbeh/HomeAssistantRepository)](https://github.com/onkelbeh/HomeAssistantRepository/commits/)
[![monthly commits](https://img.shields.io/github/commit-activity/m/onkelbeh/HomeAssistantRepository)](https://github.com/onkelbeh/HomeAssistantRepository/commits/)
[![version](https://img.shields.io/github/v/release/onkelbeh/HomeAssistantRepository)](https://github.com/onkelbeh/HomeAssistantRepository/releases)


https://www.home-assistant.io/
https://github.com/home-assistant/home-assistant

"Open source home automation that puts local control and privacy first."

## Origin: Ireland, Home: Bavaria
Once this was a fork of Paul Healy's `https://cgit.gentoo.org/user/lmiphay.git/tree/app-misc/homeassistant-bin`, which seemed unmaintained to me. At first I just wanted to compile it for my personal use. This happened at Home Assistant 0.77 in September 2018. Some friends told me they wanted to use/see it, so I placed it on my public git server, and was caught by surprise by several hundred page views in the very first days. I'll do my best to keep it close to the official releases, though it might get slower during summers. After three months it had ~170 ebuilds, Nov 2019 > 1599 Ebuilds in > 830 packages are on file, 970 packages in 2380 Ebuilds in September 2020. As long as I certainly do not count automatically consolidated collections, this Overlay has grown to one of the largest [Gentoo Repos](https://qa-reports.gentoo.org/output/repos/) during the last year.

If you have questions or suggestions: contact me, **any** help is very welcome. If you want to help or contribute, please [join us](https://git.edevau.net/user/sign_up).

## Authors welcome
If you are an author of an integration / component or other stuff related to Home Assistant and I have your stuff not added already, please file a pull request, or just drop me a note. For adding a component, I need a release file in tar.gz or zip format. Tagged releases on GitHub are OK, but a
PyPI `SDIST` tar.gz source release would be preferred, because I can automatically merge it and it will use Gentoo's mirror system. Most of the integrations/components do both. I cannot add packages only available in wheels format. Please make sure you have a proper license assigned, selected license should be unique on all platforms (
PyPI/GitHub/Sourceforge).

## 2024-01 again some file collisions related to snmp
The HA team now uses pysnmp-lextudio (which is imho not a bad decision). Had to apply a slight patch to the core constraints.
Best practice for now is to keep `/etc/portage/profile/package.provided` as it is (the snmp libs are only referenced 2 times from the main repo), remove `pysnmplib` and let the Ebuild install the 2 lextudio modules.
For easier install I also patched core's version of `dev-python/regex`.

## note to the 2023-10 Update

Due to a sudden significant change in the [pypi.eclass](https://devmanual.gentoo.org/eclass-reference/pypi.eclass/index.html) and other fundamental aspects of the Gentoo packaging system, we faced a complex and time-consuming task of updating our Ebuilds. These changes required modifications to nearly 2000 Ebuilds, impacting our ability to release updates in a timely manner.

**Why the Delay?**

1. **Eclass Changes**: The core of this delay was the extensive overhaul of the `pypi.eclass`, which required substantial updates across our entire repository.

2. **Quality Assurance**: We were committed to ensuring that the updates are thoroughly tested and that Home Assistant on Gentoo continues to meet high-quality standards.

3. **Other Commitments**: I've been juggling multiple responsibilities, which added to the time it took to complete these updates. Your understanding and patience are greatly appreciated.

4. **Community Engagement**: We sought feedback from our users and engaged with the Gentoo community to address any issues and concerns that emerged during the update process.

We appreciate your support and understanding during this period of adjustment. We are now pleased to announce that a new release is getting ready, and we are excited to deliver an updated version of Home Assistant for Gentoo.

**How You Can Help:**

We welcome assistance in maintaining and improving this repository. If you have some time to contribute to Ebuild maintenance, your help would be greatly appreciated. Please feel free to reach out and get involved in the project.

Thank you for your continued support and understanding.

Happy automating!


## 2023.10.4 another workaround	for the	snmp libraries

pyasn1 0.5.0 has breaking changes which cause pysnmplib to fail until they are resolved, we need to pin pyasn1 to 0.4.8 and pysnmplib to 5.0.21 to avoid the issue.

* https://github.com/pyasn1/pyasn1/pull/30#issuecomment-151756433
* https://github.com/pysnmp/pysnmp/issues/51

To get this fixed, remove `dev-python/pyasn1-1.1.2` from /etc/portage/profile/package.provided, remove blocking packages and upgrade to `dev-python/pysnmplib-5.0.21-r2`, which then allows the installation of `dev-python/pyasn1-0.4.8-r2`. Finally, re-install all dependend packages.

## cython-3 build issues

some packages throw errors during build time, if `cython-3.0.2` is installed. Downgrade cython to `0.29.36`, and these will compile (cython is only in BDEPEND). Currently, there is no other fix. For Home Assistant 2023.10.4 I had to compile

* dev-python/grpcio-1.58.0
* dev-python/grpcio-reflection-1.58.0
* dev-python/grpcio-status-1.58.0

with the old version. Make sure you have gcc-13 active.


## 2023-03 changed main Ebuild SRC_URI to Pypi
As the current translation files have been removed from the core (https://developers.home-assistant.io/blog/2023/02/06/translations-files-removed-from-core/), I have switched SRC_URI to Pypi, the SDIST there contains all artifacts including the translations. Unfortunately tests are not part of the PyPi SDIST, so currently we have none. I'll try to pull in the tests from the Github Tarball in one of the next Releases. 

## 2022-10: reworked all Ebuilds, same KEYWORDS on all Ebuilds
Overdue for long, went through all Ebuilds, removed unused and old versions. All Ebuilds now have default tests turned on, and got Python 3.11 compatibility assigned. Some could not be tested yet on 3.11 (missing external dependencies). Ebuilds now are maintained with `pkgdev` instead of `repoman` and are checked against `pkgcheck` before release. For easier compilation tests and maintainance, all Ebuilds will now have
```
KEYWORDS="amd64 arm arm64 x86"
```
no matter of the platform they are designed to run on, e.g. on a Raspberry Pi. Please choose your modules wisely :-)

I will keep the best last two major versions of all three main Ebuilds and 2-3 versions of the current, when other Ebuilds are touched, their unreferenced versions will be removed.
As soon as 80% have been completed, `dev-python/nose` was deprecated (which was referenced in ALL Ebuilds) :-( 800 more packages to touch...

## 2022-07: file collisions with pysnmp
With 2022.7.0, Home Assistant and some components started again using `pysnmplib`, this causes file collisions with `pysnmp`, which is referred by many packages from Gentoo. `pysnmp` uses the same namespace as `pysnmplib`, and should be compatible. To avoid the collisions, add the following packages
```
# Workaround for replacing pysnmp with pysnmplib
dev-python/pysnmp-4.4.12-r2
dev-python/pyasn1-1.1.2
dev-python/pyasn1-modules-0.2.8-r1
dev-python/pysmi-0.3.4
```
to `/etc/portage/profile/package.provided`, so portage assumes you have them installed. Then, run `emerge --depclean -a` to remove them, and install `dev-python/pysnmplib`.

## 2022-03-21: new Testjobs
[![pkgcheck](https://github.com/onkelbeh/HomeAssistantRepository/actions/workflows/pkgcheck.yml/badge.svg)](https://github.com/onkelbeh/HomeAssistantRepository/actions/workflows/pkgcheck.yml) [![emerge ha-min](https://github.com/onkelbeh/HomeAssistantRepository/actions/workflows/emerge-min.yml/badge.svg)](https://github.com/onkelbeh/HomeAssistantRepository/actions/workflows/emerge-min.yml) [![emerge ha-med](https://github.com/onkelbeh/HomeAssistantRepository/actions/workflows/emerge-med.yml/badge.svg)](https://github.com/onkelbeh/HomeAssistantRepository/actions/workflows/emerge-med.yml)

Thanks to @antonfischl1980 for his [gentoo-ci Image](https://github.com/antonfischl1980/gentoo-ci) and lots of help.

## 2022/02/26: EAPI 8 / pyproject.toml

With homeassistant-2022.3.0, setup.py was removed from core. We had to switch to pyproject.toml. All three main Ebuilds are now using EAPI 8, starting with homeassistant-2022.3.0_beta3.

## 2022/02/12: new frontend builds

The frontend team discontinued offering an SDIST build via Pypi, caused by space limitations there. The source from github only contains the plain source without the build artifacts (from the yarn build), so starting with home-assistant-frontend-20220203.0, we have to build our own. I made some experiments running yarn on the source during install time, but this needs nodejs and yarn on the production boxes, and furthermore, this would eat up a lot of CPU (>25 minutes of build time on bigger hosts). This did not work very well on smaller hosts. I am not an nodejs expert, above all, it seems that yarn does not fit very well into Ebuilds, we would have to allow networking in the sandbox. The (new) Ebuild is changed now to fetch the pre-built yarn/nodejs stuff from my own buildhost. The pre-built frontend is very close to the former SDIST on Pypi, but it does not (yet) include the very newest translations, but we are working on that. Perhaps an 'official' SDIST is available again some day, I'll consider to switch back. Thanks to @cdce8p Marc Mueller for helping to get this done.
## 2020/09/25: Publishing new Main Ebuilds

Since homeassistant-0.115.3 the **Main Ebuild** is released in three different stages of expansion, only *one* of them can be installed. These three only differ in the amount of USE Flags they hold. If you are new here, start with app-misc/homeassistant-min.
### `app-misc/homeassistant-min`

[![emerge ha-min](https://github.com/onkelbeh/HomeAssistantRepository/actions/workflows/emerge-min.yml/badge.svg)](https://github.com/onkelbeh/HomeAssistantRepository/actions/workflows/emerge-min.yml)

These are the USE Flags I use in production myself. All will compile fine and are extensively tested in every release, a daily compilation test is run at Github, big thanks to @antonfischl1980, it currently holds **106** USE Flags.

### `app-misc/homeassistant`

[![emerge ha-med](https://github.com/onkelbeh/HomeAssistantRepository/actions/workflows/emerge-med.yml/badge.svg?branch=master)](https://github.com/onkelbeh/HomeAssistantRepository/actions/workflows/emerge-med.yml)

The Ebuild we have since `0.97.0`, as soon as I know that at least one user is actively using a component, it will be added. These all compile fine, but some version conflicts could occure, a daily compilation test is run at Github, big thanks to @antonfischl1980, It currently holds **299** USE Flags.

### `app-misc/homeassistant-full`

WARNING: This one currently breaks (caused by shell limitations) emerge with an 'Argument list too long' error. It compiles with a [kernel hack](https://git.edevau.net/onkelbeh/HomeAssistantRepository/issues/190#issuecomment-1002). Thanks to @gcampagnoli.
This Ebuild contains USE Flags for (nearly) all components of Home Assistant with external dependencies. Most components compile, but these are too many (for me) to run tests for all of them on a regular schedule. It holds **978** USE Flags.

A list of all components aka USEFlags is generated with every release [DOMAINTABLE.md](DOMAINTABLE.md)

### Commons for all three Main Ebuilds

Some core dependecies are pulled in from suggested USE Flags `(+)`. You should have a *good reason* to deselect suggested USE Flags. Other components are known to have issues, these are deselected `(-)` in the Ebuilds. Perhaps they compile, perhaps they run. Normally, they have dependencies which interfere with very common libraries. The suggest/deselect prefixes are the same in all three expansion stages.

Best you start using the `app-misc/homeassistant-min` Ebuild. If you have it running and your stuff is added, you should take a look in `/etc/homeassistant/deps`. This directory holds Home Assistants virtual environment. If you find anything there, you can:

 1. do nothing and let it live in the virtual environment (not suggested)
 2. install the missing dependency with `emerge -tav {dependency}`, remove the contents of `/etc/homeassistant/deps` and restart Home Assistant. If there is still something missing, it will be downloaded and installed again in the virtual enviroment. Things you install this way will be recorded in `/var/lib/portage/world`. These modules will then be maintained and updated by portage.
 3. If you get a big `/var/lib/portage/world`, you can choose to use a bigger Ebuild anytime. Remove the old one first.

## Some thoughts
* Be aware that all dependent libraries could be marked as stable here as soon as they compile. Outside HA dependencies except of portage are not tested.
* Since I use Gentoo mostly on servers, I do not use systemd, one reason to run Gentoo is that you are NOT forced to run this crap. Beginning homeassistant-2021.2.0, handling for systemd was added by request, thanks to @Tatsh for help.
* I use an own profile based on "amd64/17.1/no-multilib"
* Sunce 2022.07.06, I run detailed tests on Python 3.10 only, and am starting to try builds on Python 3.11.
* python-3.12.2 is set as default target.

# Bigger Changes

## arm64 builds
By user request, I have populated an ~arm64 KEYWORD on all Ebuilds, which is (currently) completely untested. I know of at least two guys using it, but I got no feedback yet. Some day I will prepare a cross compile environment to build a public binary repo for Home Assistant on [Sakakis-'s Image](https://github.com/sakaki-/gentoo-on-rpi-64bit). 

## ~arm
By another request, I merged arm KEYWORD from @ivecera on all Ebuilds at 0.117.6. This guy is running an Odroid XU4. I updated all my scripts to keep it running. arm & arm64 keywords are treated now like the ones for amd64, though absolutely untested.

## Breaking Change: many USE Flags changed in 0.115.0

Beginning with `0.115.0_beta10` many USE Flags have changed.
All USE Flags have *exactly* the same name as the components `domain` in Home Assistant now. OK, this is a hard cut, but overdue. Mostly caused by the creation of an automated import routine, at first I planned to keep the old names, the replacement class was already written, but during data collection I discovered that the original domain names aren't so bad anyway. You will find the detailed changes in commit: https://git.edevau.net/onkelbeh/HomeAssistantRepository/commit/3fec35c803e6061e0186df2af4e914e5791b53cc, scroll down to `metadata.xml`. But `emerge` will also tell.

## Nearly all Home Assistant Components are now included
Except of some modules with uncorrectable errors (e.g. hard drive crashes, lost sources) I believe all possible integrations for Home Assistant and their stated dependencies are included as Ebuilds, based on the integrations list from `/usr/lib/python3.8/site-packages/homeassistant/components/*/manifest.json`. Many fixed dependencies (necessary or not) to old releases forbid installation of packages requiring newer ones, but I filed all dependencies strict as they have been declared in `setup.py` or `requirements.txt` (sometimes other sources) anyway. The exception proves the rule.

Currrently missing (2022.4):
* aioazuredevops-1.3.5
* azure-eventhub-5.7.0
* azure-servicebus-0.50.3
* python-lirc-1.2.3
* opencv-python-headless-4.3.0.36

In some cases I had to add patches to the Ebuilds, some packages have versions pinned without any reason. Mostly, I copy hard pinnings without questioning, in very problematic cases I open a ticket at the problem's origin. For me its OK, if the packages compile and complete their own tests in the sandbox. Please let me know if you encounter problems. I will continuously expand my tests and do more cleanups. I am continuously filing pull requests to reduce the amount of needed patches. Most of them are caused by missing files in SDIST archives and/or having wrong package exclude masks in `setup.py`.

# Other things you find here

Aside from Home Assistant's stuff this repo contains some Ebuilds I use with my Home Assistant, some have to be explicitly mentioned:

## ESPHome
Thanks to @OttoWinter for his fabulous idea and [great work](https://github.com/esphome/esphome), really cool stuff, as soon as your name server accepts dynamic names from DHCP, a lot of ESP devices are very easy to deploy and maintain. Its integration in Home Assistant is easy and reacts fast on state changes. I love its integration in Home Assistant, since you have one single point where you define and name a switch or a sensor (instead of > three points using MQTT). Together with the possibility of OTA updates my sensors now have a unique name everywhere in the system, and names can be changed very easily. I installed the dashboard in HA's Gui, so updates and changes are made with a few clicks. In the meantime I migrated all my Magichome Controllers, very happy with it, and I have a couple of binary input arrays running with it without any problems. However, my Sonoff POW and POW R2 are still running with various versions of Tasmota. Some [required libraries](https://github.com/esphome/feature-requests/issues/586) are too old for Home Assistants environment, and I do NOT use virtual environments, so I simply patched it, it runs on my productive system without any problems, please report if you find any. You can also use the dev Ebuild (`dev-embedded/esphome-9999.ebuild`), which uses newer libraries, but will be compiled every time you run a world update, it is also very stable most of the time.

## Platformio
Platformio is needed for ESPHome and other stuff.

# Install & Upgrade

## Git Server & Mirrors
You will find this Repository at

| Location | Web | Clone me here |
| ------ | ------ | ------ |
| Main | https://git.edevau.net/onkelbeh/HomeAssistantRepository | https://git.edevau.net/onkelbeh/HomeAssistantRepository.git |
| Mirror | https://github.com/onkelbeh/HomeAssistantRepository |  https://github.com/onkelbeh/HomeAssistantRepository.git |

Sorry, due to technical reasons, I currently cannot offer public ssh access to my git server.

Sure, you can submit **issues** and **pull requests** on both sites, but I prefer them on my own server (requires registration).

## Python versions
### Python 3.10
My production box currently runs Python 3.10.8 (31.10.2022). All modules are OK with 3.10 support.

### Python 3.11
3.11 support will be added if possible whenever a module is touched, most already work, some external deps are still mising.

### Python <= 3.9 Support
Should still work, but since Python 3.8 support is dropped, I will do no further tests on it, you should upgrade now.
Python 3.9 support will also be dropped soon.

## Installation on Python 3.10

### Let's get started:
First add the Overlay:

#### manual

Create `/etc/portage/repos.conf/homeassistant.conf`, make sure not to interfere with your main Gentoo repo, which recently moved to `/var/db/repos/gentoo` in my boxes. See [Migrating to new repository data locations](https://wiki.gentoo.org/wiki/User:Sam/Portage_help/Migrating_to_new_repository_data_locations) for additional information.

Example:

```
[HomeAssistantRepository]
location = /var/db/repos/homeassistant
sync-type = git
sync-uri = https://git.edevau.net/onkelbeh/HomeAssistantRepository.git
auto-sync = yes
sync-rsync-verify-metamanifest = no
```

#### Layman

``` sh
layman -a HomeAssistantRepository
```

#### eselect-repository

``` sh
eselect repository enable HomeAssistantRepository
```

### Installation:

Sync the overlay:

```sh
$ emerge --sync
```

Make sure you have a proper locale setting. I use
```sh
$ cat /etc/locale.gen
de_DE ISO-8859-1
de_DE@euro UTF-8
```

If you change your locales, run `locale-gen`.
It will make things easier if you take the example files from `/etc/portage/package.accept_keywords/99_homeassistant` and `/etc/portage/package.use/60_homeassistant` and copy it to your `/etc/portage`. The clean way is to let `portage` build your own.

Check your `/etc/portage/make.conf` to freeze correct Python Targets:
```sh
USE_PYTHON="3.10"
PYTHON_TARGETS="python3_10"
PYTHON_SINGLE_TARGET="python3_10"
```
Edit `/etc/python-exec/python-exec.conf` to put Python 3.10 on top position.

Finally install Home Assistant:
```sh
$ emerge -tav app-misc/homeassistant
$ rc-update add homeassistant
```

Done.

## Upgrading to Python 3.10 from a 3.9 system (same as it was from Python 3.6 to 3.7, and 3.7 to 3.8, and 3.8 to 3.9).

### The fastest way:

* Remove app-misc/homeassistant (emerge -cav)
* if you are using esphome, remove it, too.
* run `emerge --depclean -a`, this will remove all dependent packages
* update your naked core system as described below, or just run a
```sh
$ emerge -tauvDUN @world --autounmask=y --changed-deps --changed-use --newuse --deep --with-bdeps=y
```

* reinstall app-misc/homeassistant for only the new Python Version

This avoids a lot of recompiling all Home Assistant deps, and a lot of dependency trouble. A naked box is significant easier to upgrade, Very recommended. I did not, but I just wanted to see if the hard way still works, too ;-)

### The upgrade steps:

Make sure your system is up to date:
```sh
$ emerge -tauvDUN @world
```
Install Python 3.10:
```sh
$ emerge -tav dev-lang/python:3.10
```
Edit your `/etc/portage/make.conf` to set the new Python Targets, make sure you have **both** versions active now:
```sh
USE_PYTHON="3.10 3.9"
PYTHON_TARGETS="python3_10 python3_9"
PYTHON_SINGLE_TARGET="python3_10"
```

Run `eselect python` to put Python 3.10 on position 1, perhaps you'll have to edit `/etc/python-exec/python-exec.conf`.

Run the Update:
```sh
$ emerge --depclean
$ emerge -1vUD @world
$ emerge --depclean
```
If everything is clean, double check with:

* `eix --installed-with-use python_targets_python3_9` (<- old version)
* `eix --installed-without-use python_targets_python3_10` (<- new version)

or

* `diff <(equery h python_targets_python3_9) <(equery h python_targets_python3_10)`
* `diff <(equery h python_single_target_python3_9) <(equery h python_single_target_python3_10)`


Help it with:
```sh
eix -I# --installed-without-use python_targets_python3_10 | xargs emerge -1tv
```

Now you have all Python packages for both versions installed, time to get rid of the packages compiled for the old Python:

Edit your `/etc/portage/make.conf` to remove old Python Targets:
```sh
USE_PYTHON="3.10"
PYTHON_TARGETS="python3_10"
PYTHON_SINGLE_TARGET="python3_10"
```
Run the Update again:

```sh
# emerge --depclean
# emerge -1vUD @world
# emerge --depclean
```

It does not make sense to compile all this stuff for more than **one** Python target.

Check if all is gone:

```sh
# eix --installed-with-use python_targets_python3_9
```

Recompile all packages which are still present in the old Python. Repeat until all have vanished.
On some boxes I had to recompile python-exec before a depclean removed the old Python:
```sh
# emerge -1tv dev-lang/python-exec --usepkg-exclude=*
```

### Remove the old Python

```sh
# emerge -cav /dev-lang/python:3.9
```

### Tools that might help to clean up:

```sh
$ eix --installed-with-use python_targets_python3_9
$ diff <(equery h python_targets_python3_9) <(equery h python_targets_python3_10)
```

# My VMs/boxes and Stuff I use

## My environment
I run Home Assistant on a virtual X64 box, 4GB RAM, 3 Cores of an older Xeon E5-2630 v2 @ 2.60GHz and 30GB Disk from a small FC SAN (HP MSA). Recorder writes to a local mariadb socket, moved this from my 'big' mariadb machine because of some performance issues. Influxdb and Graphana are also on the same box. I cannot imagine how someone can run this stuff an a Raspberry Pi.

## My machines
Currently I have three VM's running:
### Production
Python 3.10.10_p3 / 3.11.2_p2
4 GB RAM, 3 cores of a Intel(R) Xeon(R) Silver 4114 CPU @ 2.20GHz
### Dev / Test
Python 3.10.10_p3 / 3.11.2_p2
4 GB RAM, 3 cores of a Intel(R) Xeon(R) Silver 4114 CPU @ 2.20GHz
### Dev / Test2
Python 3.11.2_p2
4 GB RAM, 3 cores of a Intel(R) Xeon(R) Silver 4114 CPU @ 2.20GHz

## Hardware I use

Here's a rough overview about the stuff I use, sorted by USEFlags:

### androidtv
Get the Status from my Amazon Fire-TV and turn it on in a scene.

### axis
Axis Camera (1, a few more to come), i do not use this integration anymore, it had a problem with my old cam's, migrated it to qvr_pro.

### caldav
Calendar (connected to a locally run ownCloud, OC not in this Repository) (https://owncloud.org/), use it for a very intelligent Alarmclock and to control heating on home office days.

### cli

### compensation

### coronavirus

### darksky
since yr.no weather was removed by YR's request in early 2021, I use darksky.

### dwd_weather_warnings
currently not working....
### enigma2
Enigma2 on Dreambox (2 left) (https://wiki.blue-panel.com/index.php/Enigma2). Be careful about their standby power consumtion, these 800SE2 eat up 45W during standby.

### esphome
ESPHome - see description above - (https://esphome.io/ & https://github.com/esphome/esphome/)
* Now all of my HC-SR501 PIR Sensors and some of my traditional light switches are connected to two big input arrays I built into old CAT6 patch panels with an ESP12 and 4 PCF8574 I2C I/O Expanders, this makes 24 I/O lines per panel. All these panels run ESPHome.
* OneWire and I2C Sensors
* Sonoff S20
* Sonoff 4ch
* Sonoff Dual
* Sonoff RF Bridge with remote Switches
* Sonoff Touch
As soon as a device with an esp inside gets touched, it will be migrated to ESPHome.

### forecast_solar
a forecast of today's solar production, only have a free account, but it is very useful.

### fronius
query my Fronius solar inverters via their integrated wifi chip.


### github

### http

### hyperion
Hyperion (aka hyperion.ng) with APA102 (very cool stuff) (https://hyperion-project.org/)
I am now stuck at Kodi 18.9 but that's worth it.
### influxdb
storing the temperatures from the DS18B20 (heating system & room temps).

### kia_uvo

Retrieves Data from Hyundai Cloud Service.

### KNX

I used a couple of chinese relay cards controlled with PCF8574 I2C extenders attached to an ESP32 with ESPHome. Caused by capacitive load (mostly chinese LED stuff), some EMV trouble on the I2C bus led me to bury this efforts, took some money and ordered a bunch of KNX actors from MDT. I decided that it would be nice to have current measurement, so I took the "MDT AMI-1216.02 Schaltaktor 12fach 16/20A C-Last Industrie mit Strommessung", the MDT SCN-IP000.03 IP Interface and the matching MDT STV-0320.02 320 mA power supply for a first start. And I added an MDT BE-04230.02 binary input array with 4 220V inputs (which was too small after a few days). I am very happy with it. After finishing the big click in ETS, the replacement only took a few hours.
I am now running the following components, all from MDT:

* MDT SCN-IP000.03 IP Interface
* MDT STV-0320.02 bus power supply 320mA
* MDT BE-04230.02 binary input 4x REG 230VAC
* MDT BE-16230.02 binary input 16x REG 230VAC
* MDT AMI-1216.02 switch 12x 16/20A C-Last Industrie with current measurement (4x)
* MDT AKS-1210.03 switch 12x 10A C-Last (to turn off some unused stuff during the night)

Integration in Home Assistant was very easy, everything worked as expected from the first attempt. Everything up and perfectly running after ~1 week.

### kodi
Kodi on Raspberry (3, all with OSMC) (https://osmc.tv/download/), very happy with it.
Currently I am stuck at Kodi 18.9, because hyperion-ng does not work with Kodi 19 yet.

### kraken

### maxcube
EQ3-Max! (I accidently bought some, so I have to use them until they die, 8 devices and a cube). When a thermostat dies, it gets replaced with a devolo z-wave model.

### mikrotik
presence detection, query the connected mac addresses from the CAP AC.

### modbus

* Eastron SDM630 Powermeters
* Waveshare RS485 to ETH (B) Gateway

### mqtt (also Zigbee)
The Sonoff Pow (and R2) will stay with Tasmota for a while, because I have no good implementation of Tasmota's energy summary in ESPHome. I have connectd these via MQTT.
Some Zigbee devices via an CC2531 USB stick from Amazon and `zigbee2mqtt`. Since zigbee2mqtt, a lot of new devices are here now:
* some Xioami motion sensors (Aquara)
* an Aquara environment sensor
* lots of Sonoff's window Sensors
* all the IKEA stuff (4 shutters, some lighting and all the buttons that came with them)

### mysql
using a local mariadb for the recorder.

### openwbmqtt

Use the version from https://github.com/ChristophCaina/openwbmqtt, which has some enhancements and has renamed NumberEntities (https://community.home-assistant.io/t/depricated-numberentity-features/440282).

* OpenWB series2 (custom), no display, 11kW, Type-B FI, Addon, no phase switch (Kona)

### otp

### owntracks
have installed owntracks on ours Iphones, so HA knows when I leave work and if anybody is home.
### ping

### qnap

### qvr_pro

### recorder

### rest

### samsungtv
SamsungTV (partly _not_ working anymore due to Samsung's newest firmware 'improvements', at least I can read its status for controlling lights & the shutters)

### season

### shelly
Experimenting with Shelly Devices, a friend has some Shelly 1/2, bought a Pro, but this one has a Chip from TI, no ESP, so we'll have to use the original Firmware, connected to MQTT.
Due to the fact that Fibaro's shutter controllers do not work very well, I now have a couple of Shelly 2.5 to control the shutters. These work good, looks like a 'install & forget' thing.

### signal_messenger

### snmp

### sonos
Sonos (had many, sold most of them, because they destroyed a formerly very cool Gui, only two boxes left)

### sql
Recorder writes to a local mariadb socket, moved this from my 'big' mariadb machine because of some performance issues. The socket seems much faster then the network link, especially on big operations, e.g. opening the history tab. It takes approx. 10 seconds to pull a complete week with ~1200 entities (if it doesn't freeze the browser), a single day opens in ~2 seconds.
### ssl

### tasmota
except some Sonoff Pow R2 all former Tasmota stuff was migrated to ESPHome. I had not yet the time to transfer the power statistics.

### test

### tradfri
Some Tradfri lights, and 4 IKEA Shutters. A bit expensive, but nice and easy to install. I do not use the Gateway anymore, the integration caused problems from time to time. I have all IKEA devices connected via zigbee2mqtt.

### version

### whois

### workday

### yamaha

### yamaha_musiccast
Yamaha RXV (4 devices)

### zwave
had a ZMEEUZB1 Stick connected to my VM with ser2net, socat & OpenZWave. Migrated it to zwavejs2mqtt.

### zwave_js

Migration to `zwave_js` was easier than expected, after finding the right module. I now use zwavejs2mqtt. Had some issues with MEEUZB1, so I had to get the TI interface. I came along with another stick, so I now have a spare to do some experiments with. I'll try to put this in an ebuild. Though, installation it quite easy:

```bash
cd /opt
git clone https://github.com/zwave-js/zwavejs2mqtt
cd zwavejs2mqtt
yarn install
yarn run build
yarn start
```

Currently I have no autostart, I just let it run in a screen session.
It does not run in my HA VM, I have a HPE mircoserver, where the stick is directly attached. It communicates with HA through it's API, MQTT is disabled.

### Z-Wave in general

Have some Fibaro shutter controllers and (currently) 2 devolo thermostats. I would not buy the Fibaro stuff again, because of their weird firmware policy. You need to have their expensive (and otherwise useless) gateway to make an update. The cheap chinese stuff will do better. And the Fibraos are very badly shielded. The last two shutters I installed are now connected to Shelly-2.5, these are cheaper and work as they should.

# Some background

## Why I don't (want to) use a virtual environment for Home Assistant
On Gentoo, we have a very powerful package manager. So I (now) try to put everything Home Assistant uses into Ebuilds.

Some years ago I started with only those packages Home Assistant needed absolutely to start. Home Assistant then downloads and installs modules it requires and cannot find. After some time, `/etc/homeassitant/deps` grew larger and larger, things messed up, I had a well-maintained system, except the directory where a lot of packages (also outdated ones) live without our knowledge.

So I started to add more important components as Ebuilds, I did not touch the internal requirement check. If a package is installed via `portage` and Home Assistants constraints match, Home Assistant does not download its own copy.

You can find the current constraints in:
* https://github.com/home-assistant/core/blob/dev/requirements_all.txt and
* https://github.com/home-assistant/core/blob/dev/homeassistant/package_constraints.txt

You should take a look in `/etc/homeassistant/deps/` from time to time, I do this after every upgrade, if it is not empty, install the missing package, emtpy this directory, restart Home Assistant, if it is still downloaded, possibly the wrong (mostly too new) version of a component or a library is installed. `eix`, `/etc/portage/package.accept_keywords` and `--autounmask=y` are your friends. You should not unmask too much, and think about the next releases when you unmask packages.

## Privacy
I have **no** Google, Amazon or Apple involved in my privacy (at least in this case) and I am not planning to let them in.

## Sources Missing, older release tags
Some packages with missing or hidden older releases have been [forked](https://github.com/onkelbeh?tab=repositories) after the originating author has been queried and notified. I did not touch any source, no changes except of adding the missing release tags have been made. I used these forks ONLY for generating consitent sources. If patches are needed, they will be applied during the compile process. As soon as another usable release will be available, I'll swap the `SRC_URI` back to
PyPI, the original GitHub or wherever it should come from. For every fork in use I have an open ticket at [git.edevau.net](https://git.edevau.net/onkelbeh/HomeAssistantRepository/issues).  Please drop me a [note](https://github.com/onkelbeh/HomeAssistantRepository/issues) if you find a valid origin or something wrong.

## Reporting Issues
First, please also check if your issue is already reported at [git.edevau.net](https://git.edevau.net/onkelbeh/HomeAssistantRepository/issues).

If not, please report it [here](https://git.edevau.net/onkelbeh/HomeAssistantRepository/issues) or at [GitHub](https://github.com/onkelbeh/HomeAssistantRepository/issues).

Please let me know if anything is wrong or dependencies are missing, since I use only some of the components myself.

A daily compile test is run at Github with Python 3.9 to catch general faults. Every new Ebuild has to pass all its tests.

## To-dos
- Publish my ESPHome Configurations
- Do more tests with Python 3.10
- Convince the world to not run Home Assistant with Docker (see https://xkcd.com/1988/)

## Experiments in progress:
* grafana with influxdb, will have to use it at work soon and have to get used to it anyway, fits much better for irregular measurements than Cacti/RRD.
* remote IOS authentication with [haproxy](https://www.haproxy.org) and client certificates.
* play with [Node-RED](https://nodered.org/), there are user requests for it, but my skills are too low for this Ebuild :-)

## Licenses
This repository itself is released under GPL-3 (like most Gentoo repositories), all work on the depending components under the licenses they came from. Perhaps you came here because I filed an issue at your component about a bad or missing license. It is easy to [assign a license](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-a-license-to-a-repository). During cleanups and license investigations I have been asked often which license to choose. I am not a lawyer, but I can offer the following table, counted over this repository, perhaps this helps your decision. If a package has more than one license listed, all of them are counted.
There are 2000 Ebuilds in total, 1989 of them have in total 2008 (42 different) licenses assigned.

|License| Ebuilds using it|
|-------|-----|
|MIT|1131|
|Apache-2.0|456|
|GPL-3|130|
|BSD|113|
|LGPL-3|26|
|GPL-2|22|
|BSD-2|15|
|LGPL-3+|15|
|all-rights-reserved|13|
|GPL-3+|13|
|Unlicense|9|
|PSF-2|7|
|ISC|6|
|MPL-2.0|6|
|LGPL-2.1+|4|
|LGPL-2.1|4|
|EPL-1.0|4|
|ZPL|3|
|AGPL-3|3|
|AGPL-3+|2|
|LGPL-2+|2|
|public-domain|2|
|BSD-4|2|
|LGPL-2|2|
|0BSD|1|
|CC-BY-4.0|1|
|PYTHON|1|
|BitstreamVera|1|
|matplotlib|1|
|OFL-1.1|1|
|ECL-2.0|1|
|Boost-1.0|1|
|PSF-2.4|1|
|ElementTree|1|
|NEWLIB|1|
|HPND|1|
|CC-BY-NC-SA-3.0|1|
|CC-BY-NC-SA-4.0|1|
|CC0-1.0|1|
|EPL-2.0|1|
|GPL-2+|1|
|GPL-2-with-linking-exception|1|

(Last counted: 09/04/2024)

I did my best to keep these clean. If a valid license was published on PyPI, it has been automatically merged. Otherwise I took it from GitHub or alternatively from comments/files in the source. Sometimes these differed and have been not unique. All license strings are adjusted to the list in `/usr/portage/gentoo/licenses/`. Some packages do not have any license published. In this case, Authors have been asked for clarification, some did not respond. Following the [official Gentoo Guide](https://devmanual.gentoo.org/general-concepts/licenses/index.html), these then were added with an `all-rights-reserved` license and `RESTRICT="mirror"` was set. Find the appropriate licenses referenced in the Ebuild files and in the corresponding homepages or sources.

A big thanks goes to Iris for reviewing this README.
Last updated: 09/04/2024
