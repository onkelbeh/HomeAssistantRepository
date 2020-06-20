# Home Assistant Gentoo Overlay

## Home Assistant without Docker & Virtual Environments

https://www.home-assistant.io/
https://github.com/home-assistant/home-assistant

"Open source home automation that puts local control and privacy first."

Please report an issue [here](https://github.com/onkelbeh/HomeAssistantRepository/issues) or my [private git server](https://git.edevau.net/onkelbeh/HomeAssistantRepository/issues) if you encounter any problems.

## Python 3.7
You will need at least Python 3.7.7 for running Home assistant on Gentoo Linux.

Some modules/components/libraries still do not have compatibility for Python 3.7 advertised, and many of the components have not been tested here, but all compile without errors on their own.

By user request, I have populated an ~arm64 KEYWORD on all ebuilds, which is (currently) completely untested. I will some day prepare a cross compile environment to build a public binary repo for Home Assistant on [Sakakis-'s Image](https://github.com/sakaki-/gentoo-on-rpi-64bit).

I am running my productive box with Python 3.7. Anyway, it also has to have 2.7. Even ESPHome runs on the same box with some small patches (included in my Ebuild).

## Source
Once this was a fork of `https://cgit.gentoo.org/user/lmiphay.git/tree/app-misc/homeassistant-bin`, which seemed unmaintained to me. First I just wanted to compile it for my personal use. This happed at 0.77 in September 2018. Some friends told me they wanted to use/see it, so I placed it on my public git server, and was caught by surprise of several hundred page views in the very first days. I'll do my best to keep it close to the official releases, might get slower during summers. After 3 months it had ~170 ebuilds, now (Nov 2019) > 1599 ebuilds in > 830 packages are on file. As long as I certainly do not count automatically consolidated collections, this Overlay has grown to one of the largest [Gentoo Repos](https://qa-reports.gentoo.org/output/repos/) during the last year.

## Nearly all Home Assistant Components are now included
Except some modules with uncorrectable errors (e.g. hard drive crashes, lost sources or some other unbelievable mess) nearly all possible integrations for Home Assistant and their stated dependencies are included as ebuilds, based on the integrations list from `/usr/lib/python3.7/site-packages/homeassistant/components/*/manifest.json`. Many fixed dependencies (necessary or not) to old releases forbid installation of packages requiring newer ones, but I filed all dependencies strict as they have been declared in `setup.py` or `requirements.txt` (sometimes other sources) anyway. The exception proves the rule. I will expand/continue my tests and do some more cleanups. Gentoo's Python guys either will bring some more code to 3.7 soon.

## Authors welcome
If you are author of an integration / component or other stuff related to Home Assistant and you want your stuff added, please file a pull request, or just drop me a note. For adding a component, I need a release file in tar.gz or zip format. Tagged releases on Github are OK, but a Pypi `sdist` tar.gz source release would be preferred, because I can automatically merge it and it will use Gentoo's mirror system. Most of the integrations/components do both. I cannot add packages only available in wheels format. And make sure you have a proper license assigned, selected license should be unique on all platforms (Pypi/Github/Sourceforge).

## Missing older release tags
Some packages with missing or hidden older releases have been [cloned](https://github.com/onkelbeh?tab=repositories) after the originating author has been queried and notified. Some cases still require verification. No changes except adding the missing release tags have been made. As soon as another usable release will be available, I'll swap the `SRC_URI` back to Pypi, the original Github or wherever it came from.
`dg` in change log means that a package has been downgraded to an older required release although a newer version already has been available. In many cases the most recent version has been added, too. You should take a look after upgrading, if `/etc/homeassistant/deps/` is not empty, possibly the wrong (mostly too new) version of a component or a library is installed. `package.accept_keywords` and `--autounmask=y` is your friend. Please drop me a [note](https://github.com/onkelbeh/HomeAssistantRepository/issues) if you find something wrong.

## ESPHome
Aside from Home Assistant this repo contains ebuilds I use with my Home Assistant, some have to be mentioned::

 * `ESPHome` (soon I'll throw away Tasmota...), thanks to @OttoWinter for his fabulous idea and [great work](https://github.com/esphome/esphome), really cool stuff, a bit complicated to get it started (mostly with DNS, it uses a weird .local architecture for mDNS, but as soon as I got my name server accepting dynamic names from DHCP, a lot of ESP devices are very easy to deploy. Its integration in Home Assistant is easy and reacts fast on state changes. I begin to love its Integration in Home Assistant, you have one single point where you define and name a switch or a sensor (instead of > three points using MQTT). Together with the possibility of OTA updates my sensors now have a unique name everywhere in the system, and names can be changed very easily. In the meantime I migrated all my Magichome Controllers, very happy with it, and I have a couple of binary input arrays running with it without any problems. However, my Sonoff POW and POW R2 are still running with various versions of Tasmota.

Thanks to @evadim and @klowe0100 for improving the ebuild and helping to keep it updated.

 * `platformio` (needed for ESPHome and other stuff)

 ESPHome will run on Python 3.7. Some libraries from Otto's releases are too old for Home Assistants environment, I do NOT use virtual environments, so I simply patched it, it runs on my productive system without any problems. You can also use the dev ebuild (`dev-embedded/esphome-9999.ebuild`), this uses newer libraries, but will be compiled every time you run a world update, it is also very stable most of the time.

If you have questions or suggestions don't hesitate to contact me, any help is very welcome.

## Git Server & Mirrors
You will find this Repository at

| Location | Web | Clone me here |
| ------ | ------ | ------ |
| Main | https://git.edevau.net/onkelbeh/HomeAssistantRepository | https://git.edevau.net/onkelbeh/HomeAssistantRepository.git |
| Mirror | https://github.com/onkelbeh/HomeAssistantRepository |  https://github.com/onkelbeh/HomeAssistantRepository.git |

Sure, you can submit **issues** and **pull requests** on both sites.

## Python 3.8
Python 3.8 appeared on Gentoo Linux in Nov 2019, I have started very first experiments, all ebuilds have 3.8 support advertised, slightly tested, this will take time, feedback is welcome.

## Installation on Python 3.7
Python 3.7 is default target since 05/2020. Installation is very easy now.
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
It will make things easier if you take the example files from `/etc/portage/package.accept_keywords/99_homeassistant` and `/etc/portage/package.use/60_homeassistant` and copy it to your `/etc/portage`.

Check your `/etc/portage/make.conf` for the corret Python Targets:
```sh
USE_PYTHON="3.7 2.7"
# PYTHON_TARGETS="python3_7 python3_6 python2_7"
PYTHON_TARGETS="python3_7"
PYTHON_SINGLE_TARGET="python3_7"
```
Run `eselect python` to put Python 3.7 on position 1

Finally install Home Assistant:
```sh
$ emerge -tav app-misc/homeassistant
$ rc-update add homeassistant
```

I could be necessary to install some components by hand, there are too many components to mask all in use flags. If you use a component which you want to be added as a use flag, send a pull request, or just let me know.

## Upgrading to Python 3.7 from a pre 3.7 system
Easiest way is to take the example files from `/etc/portage/package.accept_keywords/99_homeassistant` and `/etc/portage/package.use/60_homeassistant` and copy it to your `/etc/portage`, a lot of unstable ebuilds are needed, because some of the stable versions do *not* support Python 3.7, but this is changing eyery day.
These files reflect some modules I use, adjust them to your needs. Find a list of the integrations I use myself on my production box [here](https://github.com/onkelbeh/HomeAssistantRepository/blob/master/etc/portage/package.use/60_homeassistant).

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
USE_PYTHON="3.7 2.7"
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

## Problems
Please let me know if any initial dependencies are missing, since I use only some of the components myself. From time to time a fresh compile test on an empty box is run to catch general faults, last good (full) compile test was May 23th 2020 with `v0.110.1`.

## Todos
- If it moves, compile it :-)
- Map more, perhaps all important components to use flags
- Publish my Home Assistant Configuration
- Publish my ESPHome Configurations
- Add test support for Python 3.8 and 3.9 in new dev branches
- Add libraries if I need it or someone asks for
- Create a better mechanism to check [requirements_all.txt](https://raw.githubusercontent.com/home-assistant/home-assistant/dev/requirements_all.txt) against this repo. A very early version of it was used to create the `v9999` dev ebuild with nearly all components framed into USE flags. Someone blame me for 800 use flags ;-)
- Write an real good installation page for the home-assistant.io Documentation an get it added there.
- Convince more people to not run Home Assistant with Docker (see https://xkcd.com/1988/)

## Experiments in progress:
* grafana with influxdb, will have to use it at work soon and have to get used to it anyway, fits much better for irregular measurements than Cacti/RRD.
* remote IOS authentication with [haproxy](https://www.haproxy.org) and client certificates.
* play with [Node-RED](https://nodered.org/)

## some Background...
I have Home Assistant running on a virtual X64 box, 4GB RAM, 3 Cores of an older Xeon E5-2630 v2 @ 2.60GHz and 30GB Disk from a small FC SAN (HP MSA). Recorder writes to a local mariadb socket, moved this from my 'big' mariadb machine because of some performance issues. currently 10.2.29 without problems. Influxdb and Graphana are also on the same box. Find a list of the integrations I use myself on my production box [here](https://github.com/onkelbeh/HomeAssistantRepository/blob/master/etc/portage/package.use/60_homeassistant).

Some of my devices are still connected via Eclipse Mosquitto (https://mosquitto.org/), I use the stable version coming with the original distribution (1.6.8), no SSL inside my isolated IOT Vlan, so no need to upgrade. Along MQTT I am actively using (and therefore testing) the following platforms/components:
* some (~9) Z-Wave devices, mostly Fibaro Roller Shutter 3 with a ZMEEUZB1 Stick connected to my VM with ser2net, socat & OpenZWave. I would not buy the Fibaro stuff again, because of their weird firmware policy. You need to have their expensive gateway to make an update. The cheap chinese stuff would do it better.
  - in the vm run `socat pty,link=/dev/ttyUSB0,raw,user=homeassistant,group=dialout,mode=777 tcp:[ip of usbhost]:3333`
  - at the usb host run `ser2net` with `3333:raw:0:/dev/ttyACM0:115200 8DATABITS NONE 1STOPBIT`
* some Zigbee devices from Xioami, via an CC2531 USB stick from Amazon -> `zigbee2mqtt`
* a bunch of OneWire and I2C Sensors (mostly via ESPHome and MQTT) and
* ESPHome - see description above - (https://esphome.io/ & https://github.com/esphome/esphome/)
* ESPEasy (https://www.letscontrolit.com/wiki/index.php/ESPEasy/). I formerly used it to avoid some serious design problems in Tasmota, but since I use ESPHome, these devices live only until they have to be touched for some reason, their firmware will get replaced with ESPHome.
* Sonoff/Tasmota (mostly via MQTT) (https://github.com/arendst/Sonoff-Tasmota), same here: as soon a device has to be touched, it's firmware will be replaced with Otto Winter's ESPHome.
  * Sonoff S20
  * Sonoff 4ch
  * Sonoff Dual
  * Sonoff RF Bridge with remote Switches
  * Sonoff Touch
  * Sonoff Basic (Wifi not working well with EPHome or Tasmota in newer versions)
  * Sonoff Pow R2
  The Sonoff Pow (and R2) will stay with Tasmota for a while, because I have no good implementation of Tasmota's energy summary in ESPHome.
* Experimenting with Shelly Devices, a friend has some Shelly 1/2, bought a Pro, but this one has a Chip form TI, no ESP, so we'll have to use the original Firmware.
* Now all of my HC-SR501 PIR Sensors and some of my traditional light switches are connected to two big input arrays I built into old CAT6 patch panels with an ESP12 and 4 PCF8574 I2C I/O Expanders, this makes 24 I/O lines per panel. All these panels run ESPHome.
* Yamaha RXV (4 devices)
* SamsungTV (partly _not_ working anymore due to Samsung's newest firmware 'improvements', at least I can read it's status for controlling lights & the shutters)
* Some Tradfri lights
* 4 IKEA Shutters, finally they can now be bought. A bit expensive, but nice and easy to install.
* Sonos (had many, sold most of them, because they destroyed a formerly very cool Gui, only two boxes left)
* Calendar (connected to a locally run ownCloud, OC not in this Repository) (https://owncloud.org/)
* Kodi on Raspberry (3, all with OSMC) (https://osmc.tv/download/)
* Enigma2 on Dreambox (2 left) (https://wiki.blue-panel.com/index.php/Enigma2)
* Hyperion with APA102 (very cool stuff) (https://hyperion-project.org/)
* EQ3-Max! (I accidently bought some, so I have to use them until they die, 8 devices and a cube). Currently the integration `maxcube-api` is broken, added a hack to keep them running, just add `maxcube_hack` use flag to home assistant, then the patch will be applied before installation. Recently I saw some other interesting soft for this hardware. Perhaps I'll try one of these, and forget about `maxcube-api`.
* Axis Camera (1, a few more to come)
* yr.no weather (best reliable forecast you can get for low money) (https://www.yr.no/)

## Privacy
I have **no** Google, Amazon or Apple involved in my privacy (at least in this case) and I am not planning to let them in.

## Some thoughts
* Tried to get all Python installed system wide under Gentoo's package management and keeping `/etc/homeassistant/deps` empty or at least as small as possible.
* Be aware that all dependent libraries could be marked as stable here as soon as they compile. Outside HA dependencies execpt portage are not tested.
* Since I use Gentoo mostly on servers, I do not use systemd, the most important reason to run Gentoo is that you are NOT forced to run this incredible crap.
* I use an own profile based on "amd64/17.1/no-multilib"
* python-3.7.7-r2 is set as default target, also 2.7.18 and 3.8.2-r2 are installed on my test server.
* I do no tests anymore on Python 3.6 or lower

## Licenses
The repository itself is released under GPL-3, all work on the depending components under the licenses they came from, which could be (as my grep told me on 12.3.2020):

```sh
grep -r "LICENSE=" | cut -d ":" -f2 | sort | uniq -c | sed 's;LICENSE=";|;' | sed 's;";|;' | sed 's/ //g' | xargs -L1 printf '|%s\n'
```

| Count | License |
| ------ | ------ |
|2|AGPL-3|
|1|AGPL-3+|
|16|all-rights-reserved|
|363|Apache-2.0|
|3|Apache-2.0 || BSD-2|
|1|Apache-2.0 MIT|
|2|Artistic-2|
|1|Boost-1.0|
|145|BSD|
|5|BSD-2|
|5|BSD-2 Unlicense|
|7|BSD-4|
|1|BSD || Apache-2.0|
|4|CC0-1.0|
|1|CC-BY-NC-SA-3.0|
|2|CC-BY-NC-SA-4.0|
|2|ECL-2.0|
|11|EPL-1.0|
|2|GPL-1|
|22|GPL-2|
|5|GPL-2+|
|152|GPL-3|
|22|GPL-3+|
|2|ISC|
|1|LGPL-2|
|8|LGPL-2+|
|14|LGPL-2.1|
|2|LGPL-2.1+|
|28|LGPL-3|
|15|LGPL-3+|
|1168|MIT|
|5|MPL-2.0|
|1|NEWLIB|
|14|PSF-2|
|3|PSF-2.4|
|3|public-domain|
|12|Unlicense|
|5|ZPL|

I did my best to keep these clean, thanks to @matoro for help. If a valid license was published on Pypi, it has been automatically merged. Otherwise I took it from Github or alternatively from comments in the source. Sometimes these differed and have been not unique. All license strings have been adjusted to the list in `/usr/portage/gentoo/licenses/`. Some packages do not have any license published. Authors have been asked for clarification, some still did not respond. These were added with an `all-rights-reserved` license and `RESTRICT="mirror"` was set. Find the appropriate Licenses referenced in the ebuild files and in the corresponding homepages or sources.

Last update of this text: 20.6.2020
