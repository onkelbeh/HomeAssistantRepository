# Home Assistant Gentoo Overlay

## 2020/09/25: Publishing new Main Ebuilds

Since homeassistant-0.115.3 the **Main Ebuild** is released in 3 different stages of expansion, only *one* of them can be installed. These three only differ in the amount of USE Flags they hold.

### `app-misc/homeassistant`

This is the Ebuild we have since `0.97.0`, it currently holds **255** USE Flags. As soon as I know that at least one user is actively using a component, it will be added. These all compile fine, but some version conflicts could occure.

### `app-misc/homeassistant-min`

New Ebuild, generated for `0.115.3` and later, currently holds **37** USE Flags. These are the USE Flags I use in production myself. These all will compile fine and are extensively tested in every release.

### `app-misc/homeassistant-full`

This Ebuild contains USE Flags for all components available. Most components compile, but these are too many (for me) to run tests for all of them on a regular schedule. This will be tested from time to time. Someone blame me for 800 use flags ;-)

### Commons for all three Main Ebuilds

Some core dependecies are pulled in from suggested USE Flags `(+)`. You should have a *good reason* to deselect suggested USE Flags. Other components are known to have issues, these are deselected `(-)` in the Ebuilds. Perhaps they compile, perhaps they run. For normal, they have dependencies which interfere with very common libraries. The suggest/deselect prefixes are the same in all three expansion stages.

Best you will start using the `app-misc/homeassistant-min` Ebuild. If you have it running and your stuff is added, you should take a look in `/etc/homeassistant/deps`. This directory holds Home Assistants virtual environment. If you find anything there, you can:

 1. do nothing and let it live in the virtual environment (not suggested)
 2. install the missing dependency with `emerge -tav {dependency}`, emtpy `/etc/homeassistant/deps` and restart Home Assistant. If something still is missing, it will be downloaded and installed again in the virtual enviroment. Things you install this way will be recorded in `/var/lib/portage/world`. These modules will be maintained and updated by portage.
 3. If you get a big `/var/lib/portage/world`, you can choose to use a bigger Ebuild anytime. Remove the old one first.

## Breaking Change: many USE flags changed in 0.115.0

Beginning with `0.115.0_beta10` many USE Flags have changed.
All USE flags have now *exactly* the same name as the components `domain` in Home Assistant. OK, this is a hard cut, but overdue. Mostly caused by the creation of an automated import routine, first I planned to keep the old names, the replacement class was already written, but during data collection I discovered that the original domain names aren't so bad anyway.

Some outdated components disappeared forever.

You will find the detailed changes in commit: https://git.edevau.net/onkelbeh/HomeAssistantRepository/commit/3fec35c803e6061e0186df2af4e914e5791b53cc, scroll down to `metadata.xml`. But `emerge` will also tell.

## Home Assistant without Docker & Virtual Environments

https://www.home-assistant.io/
https://github.com/home-assistant/home-assistant

"Open source home automation that puts local control and privacy first."

## Origin: Ireland, Home: Bavaria
Once this was a fork of Paul Healy's `https://cgit.gentoo.org/user/lmiphay.git/tree/app-misc/homeassistant-bin`, which seemed unmaintained to me. First I just wanted to compile it for my personal use. This happed at Home Assistant 0.77 in September 2018. Some friends told me they wanted to use/see it, so I placed it on my public git server, and was caught by surprise of several hundred page views in the very first days. I'll do my best to keep it close to the official releases, might get slower during summers. After 3 months it had ~170 ebuilds, now (Nov 2019) > 1599 ebuilds in > 830 packages are on file, 970 Packes in 2380 Ebuilds in September 2020. As long as I certainly do not count automatically consolidated collections, this Overlay has grown to one of the largest [Gentoo Repos](https://qa-reports.gentoo.org/output/repos/) during the last year.

If you have questions or suggestions: contact me, **any** help is very welcome. If you want to help or contribute, please [join me](https://git.edevau.net/user/sign_up).

## Reporting Issues
First, please also check if your issue is already reported at [git.edevau.net](https://git.edevau.net/onkelbeh/HomeAssistantRepository/issues).

If not, please report it [here](https://git.edevau.net/onkelbeh/HomeAssistantRepository/issues) or at [GitHub](https://github.com/onkelbeh/HomeAssistantRepository/issues).

Please let me know if anything is wrong or dependencies are missing, since I use only some of the components myself.

From time to time a fresh compile test on empty boxes (one with Python 3.8 and one with Python 3.7) is run to catch general faults, last good (full) compile test was September 2020 with `v0.115.0`. It was not possible to fix everything, work is in progress, some [open problems](https://git.edevau.net/onkelbeh/HomeAssistantRepository/issues) remain.

## Authors welcome
If you are author of an integration / component or other stuff related to Home Assistant and if I have your stuff not already added, please file a pull request, or just drop me a note. For adding a component, I need a release file in tar.gz or zip format. Tagged releases on Github are OK, but a Pypi `SDIST` tar.gz source release would be preferred, because I can automatically merge it and it will use Gentoo's mirror system. Most of the integrations/components do both. I cannot add packages only available in wheels format. Please make sure you have a proper license assigned, selected license should be unique on all platforms (Pypi/Github/Sourceforge).

## Python 3.9 Support
Just cloned a box for first tests. but it is too early to try bigger things, most of the dependencies from Main Repo are ready, but some are still missing. Forking them only for adding compatibility would get out of hand. So we just wait a bit.... things are moving fast.

## Python 3.8 Support
Since 0.114.4 (09/2020) everything compiles fine on Python 3.8. Still some smaller things to clean up. I upgraded my production box to Python 3.8 ONLY on 2020/09/12. Everything looks good. I am doing most of the tests/work on such a box with Python 3.8 only. During compile tests, I have all available tests turned on. ESPHome runs on the same box (and in the same environment) with some small patches (included in my Ebuild), the current `esphome-9999` doesn't even need a `src_prepare()`.

## ... Python 3.7
You will need at least Python 3.7.7 for running Home assistant on Gentoo Linux. If you are new here, forget about 3.7, set it up straight on Python 3.8. Before a new release of the app-misc/homeassistant Ebuild is made, I make sure all important components also compile on 3.7. During compile tests, I have all available tests turned on. I won't do any production tests anymore with Python 3.7

## Python 2.7 on Gentoo

In August 2020 I discovered that it is now possible to remove Python 2.7 completely. I have done this on all my test servers and my Home Assistant Box. All still work like a charm.

## ARM64
By user request, I have populated an ~arm64 KEYWORD on all ebuilds, which is (currently) completely untested. I know about at least 2 guys using it, but I had no feedback yet. I will some day prepare a cross compile environment to build a public binary repo for Home Assistant on [Sakakis-'s Image](https://github.com/sakaki-/gentoo-on-rpi-64bit).

## Nearly all Home Assistant Components are now included
Except some modules with uncorrectable errors (e.g. hard drive crashes, lost sources) I believe all possible integrations for Home Assistant and their stated dependencies are included as ebuilds, based on the integrations list from `/usr/lib/python3.8/site-packages/homeassistant/components/*/manifest.json`. Many fixed dependencies (necessary or not) to old releases forbid installation of packages requiring newer ones, but I filed all dependencies strict as they have been declared in `setup.py` or `requirements.txt` (sometimes other sources) anyway. The exception proves the rule.

Currrently missing (0.115.3):
* azure-eventhub-5.1.0
* azure-servicebus-0.50.1
* google-cloud-texttospeech-0.4.0 (no potential need, good alternatives are on the market)
* google-cloud-pubsub-0.39.1
* pylacrosse-0.4.0 (version numbering mismatch, too lazy to patch)
* opencv-python-headless-4.3.0.36
* tensorflow-2.3.0 & tf-models-official-2.3.0 (I just wait for the Ebuild on main repo)
* pyuptimerobot-0.0.5 (seems unmaintained, could not find a valid source)

In some cases I added small patches to the ebuilds, some packages have versions pinned without any reason. For me it's OK, if the packages compile and complete *all* their own tests in the sandbox. Please let me know if you encounter problems. I will continuously expand my tests and do more cleanups.

## Why I don't (want to) use a virtual environment for Home Assistant
On Gentoo, we have a very powerful package manager. So I (now) try to put everything Home Assistant uses into Ebuilds.

Some years ago I started with only those packages Home Assitant needed absolutely to start. Home Assistant then downloads and installs modules it requires and cannot find. After some time, `/etc/homeassitant/deps` grew larger and larger, things messed up, I had a well maintained system, except the directory where a lot of packages (also outdated ones) live without our knowledge.

So I started to add more important components as Ebuilds, I did not touch the internal requirement check. If a package is installed via `portage` and Home Assistants constraints match, Home Assitant does not download it's own copy.

You can find the current constraints in:
* https://github.com/home-assistant/core/blob/dev/requirements_all.txt and
* https://github.com/home-assistant/core/blob/dev/homeassistant/package_constraints.txt

You should take a look in `/etc/homeassistant/deps/` from time to time, I do this after every upgrade, if it's not empty, install the missing package, emtpy this directory, restart Home Assistant, if it's still downloaded, possibly the wrong (mostly too new) version of a component or a library is installed. `eix`, `/etc/portage/package.accept_keywords` and `--autounmask=y` are your friends. You should not unmask too much, and think about the next releases when you unmask packages.

## Sources Missing, older release tags
Some packages with missing or hidden older releases have been [forked](https://github.com/onkelbeh?tab=repositories) after the originating author has been queried and notified. I did not touch any source, no changes except adding the missing release tags have been made. I used these forks ONLY for generating consitent sources. If patches are needed, these will be applied during the compile process. As soon as another usable release will be available, I'll swap the `SRC_URI` back to Pypi, the original Github or wherever it should come from. For every fork in use I have an open ticket at [git.edevau.net](https://git.edevau.net/onkelbeh/HomeAssistantRepository/issues).  Please drop me a [note](https://github.com/onkelbeh/HomeAssistantRepository/issues) if you find a valid origin or something wrong.

## Other things
Aside from Home Assistant's stuff this repo contains some ebuilds I use with my Home Assistant, some have to be explicitly mentioned:

### ESPHome
Thanks to @OttoWinter for his fabulous idea and [great work](https://github.com/esphome/esphome), really cool stuff, as soon as your name server accepts dynamic names from DHCP, a lot of ESP devices are very easy to deploy and maintain. Its integration in Home Assistant is easy and reacts fast on state changes. I love its Integration in Home Assistant, you have one single point where you define and name a switch or a sensor (instead of > three points using MQTT). Together with the possibility of OTA updates my sensors now have a unique name everywhere in the system, and names can be changed very easily. I have the dashboard installed in HA's Gui, so updates and changes are made with a few clicks. In the meantime I migrated all my Magichome Controllers, very happy with it, and I have a couple of binary input arrays running with it without any problems. However, my Sonoff POW and POW R2 are still running with various versions of Tasmota. Some [required libraries](https://github.com/esphome/feature-requests/issues/586) are too old for Home Assistants environment, and I do NOT use virtual environments, so I simply patched it, it runs on my productive system without any problems. Please report any problems. You can also use the dev ebuild (`dev-embedded/esphome-9999.ebuild`), this uses newer libraries, but will be compiled every time you run a world update, it is also very stable most of the time.

### Platformio
Platformio is needed for ESPHome and other stuff.

## Git Server & Mirrors
You will find this Repository at

| Location | Web | Clone me here |
| ------ | ------ | ------ |
| Main | https://git.edevau.net/onkelbeh/HomeAssistantRepository | https://git.edevau.net/onkelbeh/HomeAssistantRepository.git |
| Mirror | https://github.com/onkelbeh/HomeAssistantRepository |  https://github.com/onkelbeh/HomeAssistantRepository.git |

Sorry, due to technical reasons, I currently cannot offer public ssh access to my git server.

Sure, you can submit **issues** and **pull requests** on both sites, but I prefer them on my own server (requires registration).

## Installation on Python 3.7 or Python 3.8
Since Python 3.7 is default target since 05/2020, installation is very easy now.

But, **before** installing on 3.7, please think about using 3.8, this will save you the migration from 3.7 -> 3.8. And, as my first test show, you will notice an appreciable improvement in frontend performance. For using 3.8, simply increase all version numbers in the manual below by 1 :-)

First add the Overlay to `/etc/portage/repos.conf/homeassistant.conf`, make sure **not to interfere** with your main Gentoo repo, which is at `/usr/portage/gentoo` in my boxes, because I _always_ have more than one repo active by default. Others use `/usr/local/portage/homeassistant`
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
USE_PYTHON="3.7"
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

## Upgrading to Python 3.8 from a pre 3.8 system

Same as it was from Python 3.6 to 3.7:

### The fastest way:

* Throw away app-misc/homeassistant
* run `emerge --depclean -a`, this will remove all dependent packages
* update your naked core system as described below
* reinstall app-misc/homeassistant with only the new Python Version

This avoids a lot of recompiling all Home Assistant deps, and a lot of dependency trouble. Very recommended. I did not, but I just wanted to see if it works ;-)

### The upgrade steps:

Make sure your system is up to date:
```sh
$ emerge -tauvDUN @world
```
Install Python 3.8:
```sh
$ emerge -tav dev-lang/python:3.8
```
Edit your `/etc/portage/make.conf` to set the new Python Targets, make sure you have now **both** versions active:
```sh
USE_PYTHON="3.8 3.7"
PYTHON_TARGETS="python3_8 python3_7"
PYTHON_SINGLE_TARGET="python3_8"
```

Run `eselect python` to put Python 3.8 on position 1, perhaps you have to edit `/etc/python-exec/python-exec.conf`.

Run the Update:
```sh
$ emerge --depclean
$ emerge -1vUD @world
$ emerge --depclean
```
If everthing is clean, double check with:

* `eix --installed-with-use python_targets_python3_7` (<- old version)
* `eix --installed-without-use python_targets_python3_8` (<- new version)

or

* `diff <(equery h python_targets_python3_7) <(equery h python_targets_python3_8)`
* `diff <(equery h python_single_target_python3_7) <(equery h python_single_target_python3_8)`


Help it with:
```sh
eix -I# --installed-without-use python_targets_python3_8 | xargs emerge -1tv
```

### Now you have all Python packages for both versions installed

Time to get rid of the packages compiled for the old Python:

Edit your `/etc/portage/make.conf` to remove old Python Targets:
```sh
USE_PYTHON="3.8"
PYTHON_TARGETS="python3_8"
PYTHON_SINGLE_TARGET="python3_8"
```
Run the Update again:

```sh
# emerge --depclean
# emerge -1vUD @world
# emerge --depclean
```

Sometimes I had dependencies `portage` didn't respect, in some cases it seems not to know in which Python's site-packages modules are already installed. Install them manually (after compile errors). Once all packages are updated, you can remove the older python targets in `package.use` and run another upgrade to remove now obsolete support for old Python Versions. This will save hard disk space and compile time.

It does not make sense to compile all this stuff **for more than one** Python version.

Check if all is gone:

```sh
# eix --installed-with-use python_targets_python3_7
```

Recompile all packages which are still present in the old Python.

### Remove the old Python

```sh
# emerge -cav /dev-lang/python:3.7
```

### Tools that might help to clean up:

```sh
$ eix --installed-with-use python_targets_python3_7
$ diff <(equery h python_targets_python3_7) <(equery h python_targets_python3_8)
```

## Todos
- If it moves, compile it :-)
- update the missing component descriptions for `metadata.xml`
- Publish my ESPHome Configurations
- Add test support for Python 3.9 in new dev branches
- Add libraries if I need it or someone asks for
- Write an real good installation page for the home-assistant.io Documentation an get it added there.
- Convince the world to not run Home Assistant with Docker (see https://xkcd.com/1988/)

## Experiments in progress:
* grafana with influxdb, will have to use it at work soon and have to get used to it anyway, fits much better for irregular measurements than Cacti/RRD.
* remote IOS authentication with [haproxy](https://www.haproxy.org) and client certificates.
* play with [Node-RED](https://nodered.org/), there are users requests for it, but my skills are to low for this Ebuild :-)
* first tests with Python 3.9 are in progress

## some Background...
I have Home Assistant running on a virtual X64 box, 4GB RAM, 3 Cores of an older Xeon E5-2630 v2 @ 2.60GHz and 30GB Disk from a small FC SAN (HP MSA). Recorder writes to a local mariadb socket, moved this from my 'big' mariadb machine because of some performance issues. currently 10.2.29 without problems. Influxdb and Graphana are also on the same box. Find a list of the integrations I use myself on my production box [here](https://github.com/onkelbeh/HomeAssistantRepository/blob/master/etc/portage/package.use/60_homeassistant).

Some of my devices are connected via Eclipse Mosquitto (https://mosquitto.org/), I use the stable version coming with the original distribution (1.6.8), no SSL inside my isolated IOT Vlan, so no need to upgrade. Along MQTT I am actively using (and therefore testing) the following platforms/components:
* some (~9) Z-Wave devices, mostly Fibaro Roller Shutter 3 with a ZMEEUZB1 Stick connected to my VM with ser2net, socat & OpenZWave. I would not buy the Fibaro stuff again, because of their weird firmware policy. You need to have their expensive (and otherwise useless) gateway to make an update. The cheap chinese stuff will do it better. And they are very badly shielded.
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
* Be aware that all dependent libraries could be marked as stable here as soon as they compile. Outside HA dependencies execpt portage are not tested.
* Since I use Gentoo mostly on servers, I do not use systemd, one reason to run Gentoo is that you are NOT forced to run this crap.
* I use an own profile based on "amd64/17.1/no-multilib"
* python-3.8.6 is set as default target.
* I do no tests anymore on Python 3.6, and only sandbox tests on Python 3.7.

## Licenses
The repository itself is released under GPL-3, all work on the depending components under the licenses they came from, which could be (as my grep told me in 3/2020):

```sh
grep -r "LICENSE=" | cut -d ":" -f2 | sort | uniq -c | sed 's;LICENSE=";|;' | sed 's;";|;' | sed 's/ //g' | xargs -L1 printf '|%s\n'
```

| Count | License |
| ------ | ------ |
|2|AGPL-3|
|1|AGPL-3+|
|19|all-rights-reserved|
|384|Apache-2.0|
|3|Apache-2.0 || BSD-2|
|1|Apache-2.0 MIT|
|2|Artistic-2|
|1|Boost-1.0|
|156|BSD|
|6|BSD-2|
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
|180|GPL-3|
|22|GPL-3+|
|2|ISC|
|1|LGPL-2|
|10|LGPL-2+|
|14|LGPL-2.1|
|2|LGPL-2.1+|
|28|LGPL-3|
|15|LGPL-3+|
|1346|MIT|
|5|MPL-2.0|
|1|NEWLIB|
|12|PSF-2|
|3|PSF-2.4|
|4|public-domain|
|14|Unlicense|
|5|ZPL|

I did my best to keep these clean. If a valid license was published on Pypi, it has been automatically merged. Otherwise I took it from Github or alternatively from comments in the source. Sometimes these differed and have been not unique. All license strings have been adjusted to the list in `/usr/portage/gentoo/licenses/`. Some packages do not have any license published. Authors have been asked for clarification, some still did not respond. These were added with an `all-rights-reserved` license and `RESTRICT="mirror"` was set. Find the appropriate Licenses referenced in the ebuild files and in the corresponding homepages or sources.

Last update of this text: 25.9.2020
