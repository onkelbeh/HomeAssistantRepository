Home Assistant Gentoo Overlay
=============================

Home Assistant without Docker & Virtual Environments
----------------------------------------------------

https://www.home-assistant.io/
https://github.com/home-assistant/home-assistant

"Open source home automation that puts local control and privacy first."

This was fork of https://cgit.gentoo.org/user/lmiphay.git/tree/app-misc/homeassistant-bin which seemed unmaintained to me, at first I just wanted to compile it for my personal use. This happed at 0.77 in September 2018. Some friends told me they wanted to use/see it, so i putted it on my gitea, and was caught by surprise of several hundred pageviews in the very first days. Try to keep it close to the official releases, might get slower during summer. After 3 months it had ~170 ebuilds, now > 633 ebuilds in > 350 packages listed.

Aside from Home Assistant it contains some related ebuilds I use with my Home Assistant:

 * esphome (soon i'll throw away Tasmota...), thanks to Otto Winter for his fabulous idea and great work (https://github.com/esphome/esphome), really cool stuff, a bit complicated to get it started (mostly with DNS, it uses a weird *.local architecture, imho for mDNS, too complex for me to run it across Vlans), but as soon you got it running, a lot of ESP devices are very easy to deploy. It's integration in Home Assistant is easy and reacts fast on state changes. I begin to love it's Integration in Home Assistant, you have one single point where you define and name a switch or a sensor (instead of > three points using MQTT). Together with the possibility of OTA updates my sensors will have a unique name all over the system, and names can be changed very easily. In the meantime i migrated all my Magichome Controllers, very happy with it, and i have a couple of binary input arrays running with it without any problems. However, my Sonoff POW and POW R2 are still running with Tasmota.

 * platformio (needed for ESPHome)

Since homeassistant-0.95.0_beta0 `esphome-1.13.6` can be run again in the same environment with homeassistant, because homeassistant does not insist on `dev-python/pyyaml-3.13` anymore.

If you have questions or suggestions don't hesitate to contact me, anyhelp is very welcome.

Currently there's work to build a package for:
 - ~~homeassistant-pyozw-0.1.4~~ (now compiles with a short unpack hack)
 - ~~open-zwave-hass-0.1.4~~ (not needed anymore)
 - ~~python-openzwave~~ (not needed anymore)

They mix up python code with some c++, currently i have no idea how to handle that.

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
Make sure you have a proper locale setting. I use
```sh
$ cat /etc/locale.gen
de_DE ISO-8859-1
de_DE@euro UTF-8
```
Additional information can be found at https://wiki.gentoo.org/wiki//etc/portage/repos.conf.
Let me know if any initial depencies are missing, since i do not use all of the components myself, last good (full) compile test was August 3rd, 2019 with v0.97.0_beta1, while changing gentoo's profile to 17.1.

### Todos
- **If it moves, compile it** :-)
- try/test this all with Python 3.7
- Add libraries if i need it or someone asks for
- Create a mechanism to check [requirements_all.txt](https://raw.githubusercontent.com/home-assistant/home-assistant/dev/requirements_all.txt) against this repo.
- Write an installation page for the home-assistant.io Documentation an get it added.
- Convince more people to not run Home Assistant with Docker (see https://xkcd.com/1988/)

### some Background...

I have Home Assistant running on a virtual X64 box, 4GB RAM, 4 Cores of an older Xeon E5-2630 v2 @ 2.60GHz and 10GB Disk from a small FC SAN (HP MSA). Recorder writes to a separate mariadb machine, currently 10.3.16 without problems.

Most of my devices are still connected via Eclipse Mosquitto (https://mosquitto.org/), i use the stable version coming with the original distribution (1.5.6), no SSL inside my isolated IOT Vlan, so no need to upgrade. Along MQTT i am actively using (and therefore testing) the following platforms/components:
* some (~9) Z-Wave devices, mostly Fibaro Roller Shutter 3 with a ZMEEUZB1 Stick connected to my VM with ser2net, socat & OpenZWave.
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
* Tradfri (4 devices now, can't wait for their shutters, now these are delayed due to software problems, 'til April 2019, ha-ha, they still can't be bought, guess jalousiescout is very happy about it)
* Sonos (had many, sold most of them, because they destroyed a formerly very cool gui, only two boxes left)
* Calendar (connected to a locally run ownCloud, OC not in this Repository) (https://owncloud.org/)
* Kodi on Raspberry (3, all with OSMC) (https://osmc.tv/download/)
* Enigma2 on Dreambox (2 left) (http://wiki.blue-panel.com/index.php/Enigma2)
* Hyperion with APA102 (very cool stuff) (https://hyperion-project.org/)
* EQ3-Max! (i accendently bought some, so i have to use them until they die, 8 devices and a cube)
* Axis Camera (1, a few more to come sometimes)
* yr.no weather (best reliable forecast you can get for low money) (https://www.yr.no/)

I have **no** Google, Amazon or Apple involved in my privacy (at least in this case) and I am not planning to let them in.

* Tried to get all Python installed systemwide under Gentoo's package management and keeping `/etc/homeassistant/deps` as small as possible.
* Be aware that all dependent libraries could be marked as stable here as soon as they compile. Ouside HA dependencies execpt portage are not tested.
* Since i use Gentoo mostly on servers i do not use systemd, the most important reason to run gentoo is that you are NOT forced to run this incredible crap.
* I prefer an own profile based on "amd64/17.1/no-multilib", with python-3.6.5 set as default target (planning to upgrade to 3.6.8 ~~soon~~), also 2.7.15 is installed on my test server (used for platfomio and ESPHome), will try 3.7.x as soon it is marked as stable in portage.

### Licenses

The Repository itself is released under GNU General Public License v3.0, all work on the depending components under the Licenses they came from, which could be (as my grep told me):

 - "Apache-2.0 BSD"
 - "Apache License 2.0"
 - "BSD"
 - "BSD-2"
 - "BSD-2 Unlicense"
 - "CC0-1.0"
 - "EPL-1.0"
 - "GPL"
 - "GPL-2"
 - "GPLv3"
 - "GPLv3+"
 - "LGPL-2.1"
 - "PSF"
 - "PSF-2"
 - "The MIT License (MIT)"
 - "ZPL 2.1"

Find the appropriate Licenses referenced in the ebuild files and in the corresponding sources.
