Home Assistant Gentoo Overlay
=============================

https://www.home-assistant.io/

"Open source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts. Perfect to run on a Raspberry Pi or a local server."

This was fork of https://cgit.gentoo.org/user/lmiphay.git/tree/app-misc/homeassistant-bin which seemed unmaintained to me, at first I just wanted to compile it for my personal use. Some friends told me they wanted to use/see it, so i putted it on my gitea, and was caught by surprise of several hundred pageviews in the very first days. Try to keep it close to the official releases, might get slower during summer. But it's not perfect, some libs are still installed in "site-packages", because i couldn't get them to work, include or compile in Portage so far, _any_ help is appreciated.

If you have questions or suggestions don't hesitate to contact me...

#### You will find this Repository at
| Location | Web | Clone me here |
| ------ | ------ | ------ |
| Main | https://git.edevau.net/onkelbeh/HomeAssistantRepository | https://git.edevau.net/onkelbeh/HomeAssistantRepository.git |
| Mirror | https://github.com/onkelbeh/HomeAssistantRepository |  https://github.com/onkelbeh/HomeAssistantRepository.git |


#### Installation is pretty easy:

First add the Overlay to `/etc/portage/repos.conf/homeassistant.conf`:
```
[HomeAssistantRepository]
location = /usr/portage/homeassistant
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
Let me know if any initial depencies are missing. I test fresh installs once in a blue moon. Additional information can be found at https://wiki.gentoo.org/wiki//etc/portage/repos.conf.

### Todos
- **If it moves, compile it** :-)
- Add more libraries:
  - warrant-0.6.1 (still does not compile)
  - caldav-0.5.0 (also refuses to compile at my box)
  - and other frequently used modules i currently do not use
- Find out why `SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"` is not working in some cases and fix it in:
  - rxv
  - user-agents
  - ifaddr
  - libusb1
  - adb-homeassistant
  - firetv
  - envs
- Create a mechanism to check [requirements_all.txt](https://raw.githubusercontent.com/home-assistant/home-assistant/dev/requirements_all.txt) against this repo.
- Write an installation page for the home-assistant.io Documentation an get it added.
- Convince more people to not run Home Assistant with Docker (see https://xkcd.com/1988/)

### some Background...

I decided to run Home Assistant on a dedicated box, now Home Assistant is running in a virtual X64 here. I assigned 4GB RAM, 4 Cores of an older Xeon E5-2630 v2 @ 2.60GHz and 10GB Disk from a small FC SAN (HP MSA) to it. Recorder writes to a separate mariadb machine (530 MB today).

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
* Tradfri (4 devices now, can't wait for their shutters to arrive in early 2019)
* Sonos (had many, sold most of them, because they destroyed a formerly very cool gui, only two boxes left)
* Calendar (connected to a locally run ownCloud, OC not in this Repository) (https://owncloud.org/)
* Kodi on Raspberry (3, all with OSMC) (https://osmc.tv/download/)
* Enigma2 on Dreambox (2 left) (http://wiki.blue-panel.com/index.php/Enigma2)
* Hyperion with APA102 (very cool stuff) (https://hyperion-project.org/)
* EQ3-Max! (i accendently bought some, so i have to use them until they die, 8 devices and a cube)
* Axis Camera (1, more to come)
* yr.no weather (best reliable forecast you can get for low money) (https://www.yr.no/)

I have **no** Google, Amazon or Apple involved in my privacy (at least in this case), neither am I planning to do so.

* Tried to get all Python installed systemwide under Gentoo's package management and keeping `/etc/homeassistant/deps` as small as possible.
* Be aware that all dependent libraries (could be) as marked as stable here as soon as they compile and run some minutes within my local box. Further (ouside HA) dependencies execpt portage are not tested!
* Since i use Gentoo mostly on servers i do **not** use systemd.
* I prefer an own profile based on "amd64/17.0/no-multilib", with python-3.6.5 set as default target, will try 3.7 as soon it is marked as stable in portage.

### Licenses
All work on these components is released under the Licenses they came from, which could be (as my grep told me), you can find the appropriate License in the ebuild files:
- Apache-2.0
- Apache-2.0 BSD
- BSD
- BSD-2 Unlicense
- EPL-1.0
- GPL-2
- LGPL-2.1
- MIT
- MPL-2.0
- PSF-2
