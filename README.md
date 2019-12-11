# Home Assistant Gentoo Overlay

## Home Assistant without Docker & Virtual Environments

https://www.home-assistant.io/
https://github.com/home-assistant/home-assistant

"Open source home automation that puts local control and privacy first."

## Python 3.7
This is now definitely the last Version with Support for Python 3.6. Please upgrade **now**. Home Assistant will drop support for Python 3.6 with the first release after December 15, 2019, as announced several times:
- https://github.com/home-assistant/home-assistant/pull/27680
- https://github.com/home-assistant/architecture/blob/master/adr/0002-minimum-supported-python-version.md

Many of the modules/components/libraries do **not** have compatibility for Python 3.7 advertised, and many of the components have **not** been tested here, but all compile without errors on their own. Please report an issue [here](https://github.com/onkelbeh/HomeAssistantRepository/issues) or my [private git server](https://git.edevau.net/onkelbeh/HomeAssistantRepository/issues) if you encounter any problems.

## Source
Once this was a fork of `https://cgit.gentoo.org/user/lmiphay.git/tree/app-misc/homeassistant-bin`, which seemed unmaintained to me. First I just wanted to compile it for my personal use. This happed at 0.77 in September 2018. Some friends told me they wanted to use/see it, so I placed it on my public git server, and was caught by surprise of several hundred page views in the very first days. I'll do my best to keep it close to the official releases, might get slower during summers. After 3 months it had ~170 ebuilds, now (Nov 2019) > 1599 ebuilds in > 830 packages are on file. As long as I certainly do not count automatically consolidated collections, this Overlay has grown to one of the largest [Gentoo Repos](https://qa-reports.gentoo.org/output/repos/) during the last year.

## Nearly all Home Assistant Components are now included
Except some modules with uncorrectable errors (e.g. hard drive crashes, lost sources or some other unbelievable mess) nearly all possible integrations for Home Assistant and their stated dependencies are included as ebuilds, based on the *most accurate* integrations list from `/usr/lib/python3.7/site-packages/homeassistant/components/*/manifest.json`. Many fixed dependencies (necessary or not) to old releases forbid installation of packages requiring newer ones, but I filed all dependencies strict as they have been declared in `setup.py` or `requirements.txt` (sometimes other sources) anyway. The exception proves the rule. I will expand/continue my tests during winter holidays, and do some more cleanups. Perhaps Gentoo's Python guys either will bring some more code to 3.7.

## Authors welcome
If you are author of a integration / component or other stuff related to Home Assistant and you want your component added, please file a pull request, or just drop me a note. For adding a component, I need a release file in tar.gz or zip format. Tagged releases on Github are OK, but a Pypi `sdist` tar.gz source release would be preferred, because I can automatically merge it and it uses Gentoo's mirror system. Most of the integrations/components do both. I cannot add packages only available in wheels format. And make sure you have a proper license assigned.

## Missing older release tags
Some packages with missing or hidden older releases have been [cloned](https://github.com/onkelbeh?tab=repositories) after the originating author has been queried and notified. Some cases still require verification. No changes except adding the missing release tags have been made. As soon as another usable release will be available, I'll swap the `SRC_URI` back to Pypi, the original Github or wherever it came from.
`dg` in change log means that a package has been downgraded to an older required release although a newer version already has been available. In many cases the most recent version has been added, too. You should take a look after upgrading, if `/etc/homeassistant/deps/` is not empty, possibly the wrong (mostly too new) version of a component or a library is installed. `package.accept_keywords` and `--autounmask=y` is your friend. Please drop me a [note](https://github.com/onkelbeh/HomeAssistantRepository/issues) if you find something wrong.

## ESPHome
Aside from Home Assistant this repo contains ebuilds I use with my Home Assistant, some have to be mentioned::

 * `esphome` (soon I'll throw away Tasmota...), thanks to @OttoWinter for his fabulous idea and [great work](https://github.com/esphome/esphome), really cool stuff, a bit complicated to get it started (mostly with DNS, it uses a weird .local dns architecture for mDNS, too complex for me to run it across Vlans), but as soon you got it running, a lot of ESP devices are very easy to deploy. Its integration in Home Assistant is easy and reacts fast on state changes. I begin to love its Integration in Home Assistant, you have one single point where you define and name a switch or a sensor (instead of > three points using MQTT). Together with the possibility of OTA updates my sensors will have a unique name all over the system, and names can be changed very easily. In the meantime I migrated all my Magichome Controllers, very happy with it, and I have a couple of binary input arrays running with it without any problems. However, my Sonoff POW and POW R2 are still running with Tasmota.

Thanks to @evadim and @klowe0100 for improving the ebuild and helping to keep it updated.

 * `platformio` (needed for ESPHome)

Since `homeassistant-0.95.0_beta0` `esphome-1.13.6` can be run again in the same environment with home assistant, because home assistant does not insist on `dev-python/pyyaml-3.13` anymore and

`esphome>=1.14.1` with `platformio-4.0.3-r2` ESPHome can now be run without problems on Python 3.7.

If you have questions or suggestions don't hesitate to contact me, any help is **very** welcome.

## Git Server & Mirrors
You will find this Repository at

| Location | Web | Clone me here |
| ------ | ------ | ------ |
| Main | https://git.edevau.net/onkelbeh/HomeAssistantRepository | https://git.edevau.net/onkelbeh/HomeAssistantRepository.git |
| Mirror | https://github.com/onkelbeh/HomeAssistantRepository |  https://github.com/onkelbeh/HomeAssistantRepository.git |

Sure, you can submit **issues** and **pull requests** on both sites.

## Python 3.8
Python 3.8 appeared on Gentoo Linux on Nov 11th, 2019, I just have started to very first experiments on a box with Python 3.8 installed. Afaics this will take some time, no need to hurry.

## Installation on Python 3.7
First add the Overlay to `/etc/portage/repos.conf/homeassistant.conf`, make sure not to interfere with your Gentoo repo, which is at `/usr/portage/gentoo` in my boxes, because I _always_ have more than one repo active by default:
```
[HomeAssistantRepository]
location = /usr/portage/homeassistant
sync-type = git
sync-uri = https://git.edevau.net/onkelbeh/HomeAssistantRepository.git
auto-sync = yes
sync-rsync-verify-metamanifest = no
```
Sync it:
```sh
$ emerge --sync
```
Make sure you have a proper locale setting. I use
```sh
$ cat /etc/locale.gen
de_DE ISO-8859-1
de_DE@euro UTF-8
```
It will make things easier if you take the example files from `/etc/portage/package.accept_keywords/99_homeassistant` and `/etc/portage/package.use/60_homeassistant` and copy it to your `/etc/portage`, a lot of main repo's unstable ebuilds are needed, because some of the stable versions do *not* support Python 3.7.

Edit your `/etc/portage/make.conf` to set the new Python Targets:
```sh
USE_PYTHON="3.7 3.6 2.7"
# PYTHON_TARGETS="python3_7 python3_6 python2_7"
PYTHON_TARGETS="python3_7"
PYTHON_SINGLE_TARGET="python3_7"
```
Unmask Python 3.7 code in `/etc/portage/profile/use.stable.mask`:
```sh
-python_targets_python3_7
-python_single_target_python3_7
```
Run `eselect python` to put Python 3.7 on position 1

Install it (as root)
```sh
$ emerge -tav app-misc/homeassistant
$ rc-update add homeassistant
```
## Upgrading to Python 3.7
Take the example files from `/etc/portage/package.accept_keywords/99_homeassistant` and `/etc/portage/package.use/60_homeassistant` and copy it to your `/etc/portage`, a lot of unstable ebuilds are needed, because some of the stable versions do *not* support Python 3.7. These files reflect some modules I use, adjust them to your needs.

Make sure your system is up to date:
```sh
$ emerge -tauvDUN @world
```
Install Python 3.7:
```sh
$ emerge -tav dev-lang/python:3.7
```
Edit your `/etc/portage/make.conf` to set the new Python Targets:
```sh
USE_PYTHON="3.7 3.6 2.7"
PYTHON_TARGETS="python3_7 python3_6"
PYTHON_SINGLE_TARGET="python3_7"
```
Unmask Python 3.7 code in `/etc/portage/profile/use.stable.mask`:
```sh
-python_targets_python3_7
-python_single_target_python3_7
```
Run `eselect python` to put Python 3.7 on position 1

Run the Update:
```sh
$ emerge --depclean
$ emerge -1vUD @world
$ emerge --depclean
```

Edit your `/etc/portage/make.conf` to remove old Python Targets:
```sh
USE_PYTHON="3.7 3.6 2.7"
PYTHON_TARGETS="python3_7"
PYTHON_SINGLE_TARGET="python3_7"
```
Run the Update again:

```sh
$ emerge --depclean
$ emerge -1vUD @world
$ emerge --depclean
```
I had a lot of dependencies `portage` didn't respect, in some cases it seems not to know in which Python's site-packages modules are already installed. Install them manually (after compile errors). Once all packages are updated, you can remove the older python targets in `package.use` and run another upgrade to remove now obsolete support for Python 3.6. This will save hard disk space and compile time.

Tools that might help to clean up:
```sh
$ eix --installed-with-use python_targets_python3_6
$ diff <(equery h python_targets_python3_6) <(equery h python_targets_python3_7)
```

If you are clean, feel free to remove Python 3.6. My productive box runs without Python 3.6.
It was not possible to remove Python 2.7 yet:
```sh
dev-lang/python-2.7.16 pulled in by:
  app-crypt/gcr-3.28.1 requires >=dev-lang/python-2.7.5-r2:2.7
  dev-libs/libxml2-2.9.9-r1 requires >=dev-lang/python-2.7.5-r2:2.7[xml]
  dev-libs/libxslt-1.1.33-r1 requires >=dev-lang/python-2.7.5-r2:2.7[xml]
  dev-python/backports-1.0 requires >=dev-lang/python-2.7.5-r2:2.7
  dev-python/backports-functools-lru-cache-1.4-r1 requires >=dev-lang/python-2.7.5-r2:2.7
  dev-util/ninja-1.8.2 requires >=dev-lang/python-2.7.5-r2:2.7
  sys-devel/llvm-8.0.1 requires >=dev-lang/python-2.7.5-r2:2.7
```

## Installation on Python 3.6 (deprecated)

Installation is pretty easy, but it won't help. You have to run it on 3.7, I just keep this part until support for it finally dropped:

First add the Overlay to `/etc/portage/repos.conf/homeassistant.conf`, make sure not to interfere with your gentoo repo, which is at `/usr/portage/gentoo` in my boxes, because I _always_ have more than one repo active by default:
```
[HomeAssistantRepository]
location = /usr/portage/homeassistant
sync-type = git
sync-uri = https://git.edevau.net/onkelbeh/HomeAssistantRepository.git
auto-sync = yes
sync-rsync-verify-metamanifest = no
```
Sync it and install it (as root)
```sh
$ emerge --sync
$ emerge -tav app-misc/homeassistant
```
Make sure you have a proper locale setting. I use
```sh
$ cat /etc/locale.gen
de_DE ISO-8859-1
de_DE@euro UTF-8
```

Additional information can be found at https://wiki.gentoo.org/wiki//etc/portage/repos.conf.
Please let me know if any initial dependencies are missing, since I use only some of the components myself. From time to time a fresh compile test on an empty box is run to catch general faults, last good (full) compile test was December 2019 with `v0.102.3`.

## Todos
- If it moves, compile it :-)
- Map more, perhaps all important components to use flags
- Publish my Home Assistant Configuration
- Publish my ESPHome Configurations
- Remove support for Python 3.6 in the mid of December
- Add support for Python 3.8 in a new dev branch
- Add libraries if I need it or someone asks for
- Create a better mechanism to check [requirements_all.txt](https://raw.githubusercontent.com/home-assistant/home-assistant/dev/requirements_all.txt) against this repo. A very early version of it was used to create the `v9999` dev ebuild with nearly all components framed into USE flags. Someone blame me for 800 use flags ;-)
- Write an real good installation page for the home-assistant.io Documentation an get it added there.
- Convince more people to not run Home Assistant with Docker (see https://xkcd.com/1988/)

## experiments are in progress:
* grafana with influxdb, have to use it at work in 2020, so I have to get used to it anyway, fits much better for irregular measurements than Cacti and eats up less space as RRD.
* remote IOS authentication with [haproxy](https://www.haproxy.org) and client certificates.

## some Background...
I have Home Assistant running on a virtual X64 box, 4GB RAM, 3 Cores of an older Xeon E5-2630 v2 @ 2.60GHz and 20GB Disk from a small FC SAN (HP MSA). Recorder writes to a separate mariadb machine, currently 10.3.20 without problems.

Some of my devices are still connected via Eclipse Mosquitto (https://mosquitto.org/), I use the stable version coming with the original distribution (1.6.7), no SSL inside my isolated IOT Vlan, so no need to upgrade. Along MQTT I am actively using (and therefore testing) the following platforms/components:
* some (~9) Z-Wave devices, mostly Fibaro Roller Shutter 3 with a ZMEEUZB1 Stick connected to my VM with ser2net, socat & OpenZWave. I would not buy the Fibaro stuff again, because of their weird firmware policy. You need to have their expensive gateway to make an update. The cheap chinese stuff would do it better.
  - in the vm run `socat pty,link=/dev/ttyUSB0,raw,user=homeassistant,group=dialout,mode=777 tcp:[ip of usbhost]:3333`
  - at the usb host run `ser2net` with `3333:raw:0:/dev/ttyACM0:115200 8DATABITS NONE 1STOPBIT`
* a friend recently bought some Zigbee devices from Xioami, will do some tests with them soon.
* a bunch of OneWire and I2C Sensors (mostly via MQTT) and
* ESPHome - see description above - (https://esphome.io/ & https://github.com/esphome/esphome/)
* ESPEasy (https://www.letscontrolit.com/wiki/index.php/ESPEasy/). I formerly used it to avoid some serious design problems in Tasmota, but since I use ESPHome, these devices live only until they have to be touched for some reason, their firmware will get replaced with ESPHome.
* Sonoff/Tasmota (mostly via MQTT) (https://github.com/arendst/Sonoff-Tasmota), same here: as soon a device has to be touched, it's firmware will be replaced with Otto Winter's ESPHome.
  * Sonoff S20
  * Sonoff Pow R2
  * Sonoff 4ch
  * Sonoff Dual
  * Sonoff RF Bridge with remote Swiches
  * Sonoff Touch
  * Sonoff Basic (not working well with Tasmota in newer versions)
  The Sonoff Pow will stay with Tasmota for a while, because I have no good implementation of an energy monitor in ESPHome.
* Experimenting with Shelly Devices
* Now all of my HC-SR501 PIR Sensors are connected to two big input arrays I built into old CAT6 patch panels with an ESP12 and 4 PCF8574 I2C I/O Expanders, this makes 24 I/O lines per panel. On these runs ESPHome.
* Yamaha RXV (4 devices)
* SamsungTV (partly _not_ working anymore due to Samsung's newest firmware 'improvements', at least I can read it's status for controlling lights & the shutters)
* Some Tradfri lights
* 4 IKEA Shutters, finally they can now be bought. A bit expensive, but nice and easy to install.
* Sonos (had many, sold most of them, because they destroyed a formerly very cool Gui, only two boxes left)
* Calendar (connected to a locally run ownCloud, OC not in this Repository) (https://owncloud.org/)
* Kodi on Raspberry (3, all with OSMC) (https://osmc.tv/download/)
* Enigma2 on Dreambox (2 left) (http://wiki.blue-panel.com/index.php/Enigma2)
* Hyperion with APA102 (very cool stuff) (https://hyperion-project.org/)
* EQ3-Max! (I accidently bought some, so I have to use them until they die, 8 devices and a cube). Currently the integration `maxcube-api` is broken, added a hack to keep them running, just add `maxcube_hack` use flag to home assistant, then the patch will be applied before installation. Recently I saw some other interesting soft for this hardware. Perhaps I'll try one of these, and forget about `maxcube-api`.
* Axis Camera (1, a few more to come)
* yr.no weather (best reliable forecast you can get for low money) (https://www.yr.no/)

## Privacy
I have **no** Google, Amazon or Apple involved in my privacy (at least in this case) and I am not planning to let them in.

## Some thoughts
* Tried to get all Python installed system wide under Gentoo's package management and keeping `/etc/homeassistant/deps` non-existant or at least as small as possible.
* Be aware that all dependent libraries could be marked as stable here as soon as they compile. Outside HA dependencies execpt portage are not tested.
* Since I use Gentoo mostly on servers, I do not use systemd, the most important reason to run Gentoo is that you are NOT forced to run this incredible crap.
* I prefer an own profile based on "amd64/17.1/no-multilib"
* python-3.7.5-r1 is set as default target, also 2.7.16 and 3.6.9 (not used anymore) are installed on my test server.
* Due to Home Assistant's architecture strategies we could not wait any longer for a stable Python 3.7, so don't blame me if it's a lot of work. Python 3.6 would have been supported until Jan 2022.
* I will do no tests anymore with Python 3.6

## Licenses
The repository itself is released under GPL-3, all work on the depending components under the licenses they came from, which could be (as my grep told me on Nov 20th):

| Count | License |
| ------ | ------ |
|2x |AGPL-3|
|250x |Apache-2.0|
|2x |Artistic-2|
|288x |BSD|
|4x |CC0-1.0|
|2x |CC-BY-NC-SA-4.0|
|2x |ECL-2.0|
|8x |EPL-1.0|
|2x |GPL-1|
|36x |GPL-2|
|162x |GPL-3|
|12x |GPL-3+|
|4x |LGPL-2+|
|8x |LGPL-2.1|
|10x |LGPL-3|
|4x |LGPL-3+|
|1001x |MIT|
|6x |MPL-2.0|
|1x |NEWLIB|
|9x |PSF-2|
|2x |PSF-2.4|
|3x |public-domain|
|12x |Unlicense|
|5x |ZPL|

I did my best to keep these clean, thanks to @matoro for help. If a valid license was published on Pypi, it has been automatically merged. Otherwise I took it from Github or alternatively from comments in the source. Sometimes these differed and have been not unique. All license strings have been adjusted to the list in `/usr/portage/gentoo/licenses/`. Some packages do not have any license published. Authors have been asked for clarification, some still did not respond. These were added with an `all-rights-reserved` license and `RESTRICT="mirror"` was set. Find the appropriate Licenses referenced in the ebuild files and in the corresponding homepages or sources.

Last update of this text: 12.12.2019
