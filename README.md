Home Assistant Gentoo Overlay
=============================

https://www.home-assistant.io/

"Open source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts. Perfect to run on a Raspberry Pi or a local server."

This is a fork of "https://cgit.gentoo.org/user/lmiphay.git/tree/app-misc/homeassistant-bin" which seems unmaintained to me.

This is my attempt to make installation on gentoo as fast and easy as possible.

I decided to run Home Assistant on a dedicated box, now Home Assistant is running in a virtual X64 here. I assigned 4GB RAM, 4 Cores of an older Xeon E5-2630 v2 @ 2.60GHz and 10GB Disk from a small FC SAN (HP MSA) to it. Recorder writes to a separate mariadb machine (530 MB today). Main broker is mosquitto-1.5.3, no inside SSL.

I have _no_ Google, Amazon or Apple involved in my privacy (at least in this case), neither am I planning to do so.

* Tried to get all Python installed systemwide under Gentoo's package management and keeping "/etc/homeassistant/deps" as small as possible.
* Be aware that all dependent libraries as marked as stable here as soon as they compile and run some minutes within my local box. Further (ouside HA) dependencies execpt portage are not tested!
* Since i use Gentoo mostly on servers i do _not_ use systemd. I prefer an own profile based on "amd64/17.0/no-multilib", with python-3.6.5 set as default target.

The following libs are still installed in "site-packages", because i couldn't get them to work, include or compile in Portage so far, help is appreciated:
* caldav-0.5.0
* maxcube
* warrant-0.6.1

Most of my devices are connected via Mosquitto. Along MQTT i am actively using (and therefore testing) the following platforms/components:
* Samsung (currently _not_ working anymore due to Samsungs newest firmware 'improvements', had to switch to "ping" for status detection)
* Sonoff/Tasmota (mostly via MQTT)
* a bunch of OneWire and I2C Sensors (mostly all via MQTT)
* some more HC-SR501 PIR Sensors (via ESPEasy, Tasmota & MQTT)
* Yamaha RXV (4 devices)
* Tradfri (4 devices now, can't wait for their shutters)
* Sonos (had many, sold most of them, only two boxes left)
* Calandar (connected to a locally run ownCloud, OC not in this Repository)
* Kodi on Raspberry (3, all with OSMC)
* Enigma on Dreambox (2 left)
* Hyperion with APA102 (very cool)
* EQ3-Max! (i accendently bought some, so i have to use them until they die, 8 devices and a cube)
* Axis Camera (1, more to come)
* yr.no weather (best reliable forecast you can get for low money)

If you have questions or suggestions don't hesitate to contact me...

All work on these components is released under the Licenses they came from, which could be (as my grep told me): Apache-2.0, Apache-2.0 BSD, BSD, BSD-2 Unlicense, EPL-1.0 GPL-2, LGPL-2.1, MIT, MPL-2.0 or PSF-2.
