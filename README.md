# Home Assistant Gentoo Overlay

##Home Assistant without Docker & Virtual Environments

https://www.home-assistant.io/
https://github.com/home-assistant/home-assistant

"Open source home automation that puts local control and privacy first."

##Source
This was fork of https://cgit.gentoo.org/user/lmiphay.git/tree/app-misc/homeassistant-bin which seemed unmaintained to me, at first I just wanted to compile it for my personal use. This happed at 0.77 in September 2018. Some friends told me they wanted to use/see it, so i putted it on my gitea, and was caught by surprise of several hundred pageviews in the very first days. Try to keep it close to the official releases, might get slower during summer. After 3 months it had ~170 ebuilds, now (Nov 2019) > 1069 ebuilds in > 700 packages listed.

##ESPHome
Aside from Home Assistant it contains some related ebuilds I use with my Home Assistant:

 * esphome (soon i'll throw away Tasmota...), thanks to Otto Winter for his fabulous idea and great work (https://github.com/esphome/esphome), really cool stuff, a bit complicated to get it started (mostly with DNS, it uses a weird *.local architecture, imho for mDNS, too complex for me to run it across Vlans), but as soon you got it running, a lot of ESP devices are very easy to deploy. It's integration in Home Assistant is easy and reacts fast on state changes. I begin to love it's Integration in Home Assistant, you have one single point where you define and name a switch or a sensor (instead of > three points using MQTT). Together with the possibility of OTA updates my sensors will have a unique name all over the system, and names can be changed very easily. In the meantime i migrated all my Magichome Controllers, very happy with it, and i have a couple of binary input arrays running with it without any problems. However, my Sonoff POW and POW R2 are still running with Tasmota.

Thanks to @evadim and @klowe0100 for improving the ebuild and helping to keep it updated.

 * platformio (needed for ESPHome)

Since homeassistant-0.95.0_beta0 `esphome-1.13.6` can be run again in the same environment with homeassistant, because homeassistant does not insist on `dev-python/pyyaml-3.13` anymore.

**esphome-1.14.1 with platformio-4.0.3-r2 can now be run without problems on Python 3.7.**

If you have questions or suggestions don't hesitate to contact me, any help is very welcome.

## Git Server & Mirrors
You will find this Repository at

| Location | Web | Clone me here |
| ------ | ------ | ------ |
| Main | https://git.edevau.net/onkelbeh/HomeAssistantRepository | https://git.edevau.net/onkelbeh/HomeAssistantRepository.git |
| Mirror | https://github.com/onkelbeh/HomeAssistantRepository |  https://github.com/onkelbeh/HomeAssistantRepository.git |

Sure, you can file **issues** and **pull requests** on both sites.

## Installation on Python 3.7
Home assistant will drop support for Python 3.6 with the first release after December 15, 2019:
- https://github.com/home-assistant/home-assistant/pull/27680
- https://github.com/home-assistant/architecture/blob/master/adr/0002-minimum-supported-python-version.md

First add the Overlay to `/etc/portage/repos.conf/homeassistant.conf`, make sure not to interfere with your gentoo repo, which is at `/usr/portage/gentoo` in my boxes, because i _always_ have more than one repo active by default:
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
It will make things easier if you take the example files from `/etc/portage/package.accept_keywords/99_homeassistant` and `/etc/portage/package.use/60_homeassistant` and copy it to your `/etc/portage`, a lot of unstable ebuilds are needed, because some of the stable versions do *not* support Python 3.7.

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
Run `eselect python` to put Python 3.7 on postition 1

Install it (as root)
```sh
$ emerge -tav app-misc/homeassistant
$ rc-update add homeassistant
```
## Upgrading to Python 3.7
Take the example files from `/etc/portage/package.accept_keywords/99_homeassistant` and `/etc/portage/package.use/60_homeassistant` and copy it to your `/etc/portage`, a lot of unstable ebuilds are needed, because some of the stable versions do *not* support Python 3.7. These files reflect some modules i use, adjust them to your needs.

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
Run `eselect python` to put Python 3.7 on postition 1

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
I had a lot of dependencies portage didn't respect, in some cases it seems not to know in which Python's site-packages modules are already installed. Install them manually (after compile errors). Once all packages are updated, you can remove the older targets in `package.use` and run another upgrade to remove support for Python 3.6.

Tools that might help to clean up:
```sh
$ eix --installed-with-use python_targets_python3_6
$ diff <(equery h python_targets_python3_6) <(equery h python_targets_python3_7)
```

If you are clean, feel free to remove Python 3.6 (which i did not yet).


## Installation on Python 3.6 (deprecated)

Installation is pretty easy:

First add the Overlay to `/etc/portage/repos.conf/homeassistant.conf`, make sure not to interfere with your gentoo repo, which is at `/usr/portage/gentoo` in my boxes, because i _always_ have more than one repo active by default:
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
Let me know if any initial depencies are missing, since i do not use all of the components myself, last good (full) compile test was August 3rd, 2019 with v0.97.0_beta1, while changing gentoo's profile to 17.1.


## Todos
- If it moves, compile it :-)
- remove support for Python 3.6 in the mid of December
- Add libraries if i need it or someone asks for
- Create a mechanism to check [requirements_all.txt](https://raw.githubusercontent.com/home-assistant/home-assistant/dev/requirements_all.txt) against this repo.
- Write an installation page for the home-assistant.io Documentation an get it added.
- Convince more people to not run Home Assistant with Docker (see https://xkcd.com/1988/)

## some Background...

I have Home Assistant running on a virtual X64 box, 4GB RAM, 4 Cores of an older Xeon E5-2630 v2 @ 2.60GHz and 10GB Disk from a small FC SAN (HP MSA). Recorder writes to a separate mariadb machine, currently 10.3.16 without problems.

Some of my devices are still connected via Eclipse Mosquitto (https://mosquitto.org/), i use the stable version coming with the original distribution (1.6.7), no SSL inside my isolated IOT Vlan, so no need to upgrade. Along MQTT i am actively using (and therefore testing) the following platforms/components:
* some (~9) Z-Wave devices, mostly Fibaro Roller Shutter 3 with a ZMEEUZB1 Stick connected to my VM with ser2net, socat & OpenZWave. I would not by the Fibaro stuff anymore, because of their firmware policy. You need to have their expensive gateway to make an update. The cheap chinese stuff would do it better.
  - in the vm run `socat pty,link=/dev/ttyUSB0,raw,user=homeassistant,group=dialout,mode=777 tcp:[ip of usbhost]:3333`
  - at the usb host run `ser2net` with `3333:raw:0:/dev/ttyACM0:115200 8DATABITS NONE 1STOPBIT`
* a bunch of OneWire and I2C Sensors (mostly via MQTT) and
* ESPHome - see description above - (https://esphome.io/ & https://github.com/esphome/esphome/)
* ESPEasy (https://www.letscontrolit.com/wiki/index.php/ESPEasy/). I formerly used it to avoid some serious design problems in Tasmota, but since i use ESPHome, these devices live only until they will be touched next time, they will be replaced with ESPHome.
* Sonoff/Tasmota (mostly via MQTT) (https://github.com/arendst/Sonoff-Tasmota), same here: as soon a davice has to be touched, it's firmware will soon be replaced with Otto Winter's ESPHome.
  * Sonoff S20
  * Sonoff Pow R2
  * Sonoff 4ch
  * Sonoff Dual
  * Sonoff RF Bridge with remote Swiches
  * Sonoff Touch
  * Sonoff Basic (not working well with Tasmota in newer versions)
* some more HC-SR501 PIR Sensors (via ESPEasy, Tasmota & MQTT)
* Yamaha RXV (4 devices)
* SamsungTV (partly _not_ working anymore due to Samsungs newest firmware 'improvements', at least i can read it's status for controlling lights & the shutters)
* Some Tradfri lights
* 4 IKEA Shutters, finally they can now be bought. A bit expensive, but nice and easy to install.
* Sonos (had many, sold most of them, because they destroyed a formerly very cool gui, only two boxes left)
* Calendar (connected to a locally run ownCloud, OC not in this Repository) (https://owncloud.org/)
* Kodi on Raspberry (3, all with OSMC) (https://osmc.tv/download/)
* Enigma2 on Dreambox (2 left) (http://wiki.blue-panel.com/index.php/Enigma2)
* Hyperion with APA102 (very cool stuff) (https://hyperion-project.org/)
* EQ3-Max! (i accendently bought some, so i have to use them until they die, 8 devices and a cube)
* Axis Camera (1, a few more to come sometimes)
* yr.no weather (best reliable forecast you can get for low money) (https://www.yr.no/)

## Privacy
I have **no** Google, Amazon or Apple involved in my privacy (at least in this case) and I am not planning to let them in.

## Some thoughts
* Tried to get all Python installed systemwide under Gentoo's package management and keeping `/etc/homeassistant/deps` non-existant or at least as small as possible.
* Be aware that all dependent libraries could be marked as stable here as soon as they compile. Ouside HA dependencies execpt portage are not tested.
* Since i use Gentoo mostly on servers i do not use systemd, the most important reason to run gentoo is that you are NOT forced to run this icredible crap.
* I prefer an own profile based on "amd64/17.1/no-multilib"
* python-3.7.5-r1 is set as default target, also 2.7.16 and 3.6.9 (not used anymore) are installed on my test server.
* Due to Home Assitant's architecture strategies we could not wait any longer for a stable Python 3.7, so don't blame me if it's a lot of work. Python 3.6 would have been supported until Jan 2022.
* I will do no tests anymore with Python 3.6

## Licenses

The Repository itself is released under GPL-3, all work on the depending components under the Licenses they came from, which could be (as my grep told me):

- "Artistic-2"
- "BSD"
- "BSD-2"
- "BSD-2 Unlicense"
- "BSD-4"
- "CC0-1.0"
- "CC-BY-NC-SA-4.0"
- "ECL-2.0"
- "EPL-1.0"
- "GPL-1"
- "GPL-2"
- "GPL-2+"
- "GPL-3"
- "GPL-3+"
- "LGPL"
- "LGPL-2+"
- "LGPL-2.1"
- "LGPL-3"
- "LGPL-3+"
- "MIT"
- "MPL-2.0"
- "PSF-2"
- "PSF-2.4"
- "Unlicense"
- "ZPL"

I did my best to keep these clean, thanks to @matoro for help. Some packages have no license published. Find the appropriate Licenses referenced in the ebuild files and in the corresponding homepages or sources.
