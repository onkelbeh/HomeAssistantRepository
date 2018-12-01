Home Assistant Gentoo Overlay
=============================

https://www.home-assistant.io/

This is a fork of "https://cgit.gentoo.org/user/lmiphay.git/tree/app-misc/homeassistant-bin" which seems currently unmaintained to me.

"Open source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts. Perfect to run on a Raspberry Pi or a local server."

After some Raspberries now Home Assistant is running in a virtual machine (X64) here. I have _no_ Google, Amazon or Apple involved in my privacy here, neither am I planning to do so.

* This is my attempt to make installation on gentoo as easy as possible.
* Trying to get all Python installed systemwide under Gentoo's package management and keeping "/etc/homeassistant/deps" as small as possible.
* Be aware that all dependent libraries as marked as stable as soon as they compile and run some minutes within my local box. Other dependencies are not even tested.

The following libs are still installed in "site-packages", because i didn't get them included in Portage:
* caldav-0.5.0
* maxcube
* warrant-0.6.1

Most of my devices are connected via Mosquitto. Along MQTT i am actively using (and therefor testing) the following platforms/components:
* Samsung (currently not working due to Sanungs firmware 'improvements')
* Sonoff/Tasmota (mostly via MQTT)
* Yamaha RXV
* Tradfri
* Sonos
* Calandar (connected to a locally run ownCloud, not in this Repository)
* Kodi
* Enigma
* Hyperion (very cool)
* EQ3-Max! (i accendently bought some, so i have to use them)

If you have questions or suggestions don't hesitate to contact me..

All work on these components is relased under the Licenses they came from.
