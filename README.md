Home Assistant Gentoo Overlay
=============================

https://www.home-assistant.io/

This is a fork of "https://cgit.gentoo.org/user/lmiphay.git/tree/app-misc/homeassistant-bin" which seems currently unmaintained to me.

"Open source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts. Perfect to run on a Raspberry Pi or a local server."

After some Raspberries now Home Assistant is running in a virtual machine (X64) here. I have _no_ Google, Amazon or Apple involved in my privacy (at least in this case), neither am I planning to do so.

* This is my attempt to make installation on gentoo as fast and easy as possible.
* Tried to get all Python installed systemwide under Gentoo's package management and keeping "/etc/homeassistant/deps" as small as possible.
* Be aware that all dependent libraries as marked as stable as soon as they compile and run some minutes within my local box. Further (ouside HA)  dependencies are and will not even be tested!

The following libs are still installed in "site-packages", because i couldn't get them to work, include or compile in Portage:
* caldav-0.5.0
* maxcube
* warrant-0.6.1

Most of my devices are connected via Mosquitto. Along MQTT i am actively using (and therefore testing) the following platforms/components:
* Samsung (currently _not_ working due to Samungs newest firmware 'improvements')
* Sonoff/Tasmota (mostly via MQTT)
* Yamaha RXV
* Tradfri (can't wait for their shutters)
* Sonos (had many, sold most of them, only two boxes left)
* Calandar (connected to a locally run ownCloud, not in this Repository)
* Kodi on Raspberry (OSMC)
* Enigma on Dreambox
* Hyperion (very cool)
* EQ3-Max! (i accendently bought some, so i have to use them)

If you have questions or suggestions don't hesitate to contact me..

All work on these components is released under the Licenses they came from, which could be (as my grep told me): Apache-2.0, Apache-2.0 BSD, BSD, BSD-2 Unlicense, EPL-1.0 GPL-2, LGPL-2.1, MIT, MPL-2.0 or PSF-2.
