Home Assistant Gentoo Overlay
=============================

Home Assistant without Docker & Virtual Environments
----------------------------------------------------

https://www.home-assistant.io/
https://github.com/home-assistant/home-assistant

"Open source home automation that puts local control and privacy first."

This was fork of https://cgit.gentoo.org/user/lmiphay.git/tree/app-misc/homeassistant-bin which seemed unmaintained to me, at first I just wanted to compile it for my personal use. Some friends told me they wanted to use/see it, so i putted it on my gitea, and was caught by surprise of several hundred pageviews in the very first days. Try to keep it close to the official releases, might get slower during summer. After 3 months it had ~170 ebuilds, now > 200 ebuilds listed.

Aside from Home Assistant there are some related ebuilds I use with my Home Assistant:
 * esphome
 * platformio

If you have questions or suggestions don't hesitate to contact me...

#### You will find this Repository at
| Location | Web | Clone me here |
| ------ | ------ | ------ |
| Main | https://git.edevau.net/onkelbeh/HomeAssistantRepository | https://git.edevau.net/onkelbeh/HomeAssistantRepository.git |
| Mirror | https://github.com/onkelbeh/HomeAssistantRepository |  https://github.com/onkelbeh/HomeAssistantRepository.git |

#### Installation is pretty easy:

First add the Overlay to `/etc/portage/repos.conf/homeassistant.conf`, make sure not to interfere with your gentoo repo, which is at `/usr/portage/gentoo` in my boxes, because i _always_ have more than one repo active by default:
```
[HomeAssistantRepository]
location = /usr/[local/]portage/homeassistant
sync-type = git
sync-uri = https://git.in.edevau.net/onkelbeh/HomeAssistantRepository.git
auto-sync = yes
sync-rsync-verify-metamanifest = no
```
Sync it and install it (as root)
```sh
$ emerge --sync
$ emerge -tav app-misc/homeassistant
```
Additional information can be found at https://wiki.gentoo.org/wiki//etc/portage/repos.conf.
Let me know if any initial depencies are missing, last good (full) compile test was Jan 27th, 2019 with v0.86.3

### Todos
- **If it moves, compile it** :-)
- try/test this all with Python 3.7
- Add libraries if i need it or someone asks for
- Create a mechanism to check [requirements_all.txt](https://raw.githubusercontent.com/home-assistant/home-assistant/dev/requirements_all.txt) against this repo.
- Write an installation page for the home-assistant.io Documentation an get it added.
- Convince more people to not run Home Assistant with Docker (see https://xkcd.com/1988/)

### some Background...

I have Home Assistant running on a virtual X64 box, 4GB RAM, 4 Cores of an older Xeon E5-2630 v2 @ 2.60GHz and 10GB Disk from a small FC SAN (HP MSA). Recorder writes to a separate mariadb machine.

Most of my devices are connected via Eclipse Mosquitto (https://mosquitto.org/), i use the stable version coming with the original distribution (1.5.3), no SSL inside my isolated IOT Vlan, so no need to upgrade. Along MQTT i am actively using (and therefore testing) the following platforms/components:
* Sonoff/Tasmota (mostly via MQTT) (https://github.com/arendst/Sonoff-Tasmota)
  * Sonoff S20
  * Sonoff Pow R2
  * Sonoff 4ch
  * Sonoff Dual
  * Sonoff RF Bridge with remote Swiches 
  * Sonoff Touch
  * Sonoff Basic (not working well with Tasmota)
* a bunch of OneWire and I2C Sensors (mostly all via MQTT) and
* ESPEasy (https://www.letscontrolit.com/wiki/index.php/ESPEasy)
* some more HC-SR501 PIR Sensors (via ESPEasy, Tasmota & MQTT)
* Yamaha RXV (4 devices)
* SamsungTV (partly _not_ working anymore due to Samsungs newest firmware 'improvements')
* Tradfri (4 devices now, can't wait for their shutters, now these are delayed due to software problems, 'til April 2019)
* Sonos (had many, sold most of them, because they destroyed a formerly very cool gui, only two boxes left)
* Calendar (connected to a locally run ownCloud, OC not in this Repository) (https://owncloud.org/)
* Kodi on Raspberry (3, all with OSMC) (https://osmc.tv/download/)
* Enigma2 on Dreambox (2 left) (http://wiki.blue-panel.com/index.php/Enigma2)
* Hyperion with APA102 (very cool stuff) (https://hyperion-project.org/)
* EQ3-Max! (i accendently bought some, so i have to use them until they die, 8 devices and a cube)
* Axis Camera (1, more to come)
* yr.no weather (best reliable forecast you can get for low money) (https://www.yr.no/)

I have **no** Google, Amazon or Apple involved in my privacy (at least in this case) and I am not planning to let them in.

* Tried to get all Python installed systemwide under Gentoo's package management and keeping `/etc/homeassistant/deps` as small as possible.
* Be aware that all dependent libraries could be marked as stable here as soon as they compile. Ouside HA dependencies execpt portage are not tested.
* Since i use Gentoo mostly on servers i do not use systemd.
* I prefer an own profile based on "amd64/17.0/no-multilib", with python-3.6.5 set as default target, also 2.7 is installed on my test server, will try 3.7 as soon it is marked as stable in portage.

### Licenses

The Repository itself is released under GNU General Public License v3.0, all work on the depending components under the Licenses they came from, which could be (as my grep told me):

 - "Apache-2.0"
 - "( Apache-2.0 BSD )"
 - "Apache License 2.0"
 - "Apache license version 2.0"
 - "BSD"
 - "BSD-2"
 - "BSD-2 Unlicense"
 - "CC0-1.0"
 - "EPL-1.0"
 - "GPL"
 - "GPL-2"
 - "GPL3"
 - "GPLv3"
 - "GPLv3+"
 - "LGPL-2.1"
 - "MIT"
 - "MIT License"
 - "PSF"
 - "PSF-2"
 - "The MIT License (MIT)"
 - "ZPL 2.1"

Find the appropriate Licenses referenced in the ebuild files and in the corresponding sources.