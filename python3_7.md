# Python 3.7 Support

## Why?
Home assistant will drop support for Python 3.6 with the first release after December 15, 2019:
- https://github.com/home-assistant/home-assistant/pull/27680
- https://github.com/home-assistant/architecture/blob/master/adr/0002-minimum-supported-python-version.md.

This code is already merged in the [dev branch](https://github.com/home-assistant/home-assistant/pull/27680/commits/a5eca20845e6825682d1b01c1be3c9c245b311e1):

    if sys.version_info[:3] < (3, 7, 0):
      msg = (
        "Python 3.6 support is deprecated and will "
        "be removed in the first release after December 15, 2019. Please "
        "upgrade Python to 3.7.0 or higher."
        )
      _LOGGER.warning(msg)
        hass.components.persistent_notification.async_create(
        msg, "Python version", "python_version"
        )

- It's a bit extensive, but possible to run Python 3.7 on Gentoo Linux.
- Starting with 0.101.2-r2, i got it running on my testbox.
- A lot of dependencies are fulfilled with ebuilds from the main repository, and a couple of Gentoo's stable ebuilds do not yet have support for Python 3.7.
- The unstable ebuild will grow your `package.accept_keywords` a bit.

## Testbox
The current setup of my testbox: [python37dev](https://git.edevau.net/onkelbeh/HomeAssistantRepository/src/branch/python37dev). Take a closer look in the [/etc/portage/](https://git.edevau.net/onkelbeh/HomeAssistantRepository/src/branch/python37dev/etc/portage) folder. It compiles without errors, and Home Assistant starts on `python-3.7.5-r1`, made no others test up to now.

## package.accept_keywords
Except a very few packages, unstable ebuilds are supporting Python 3.7, i have my current package.accept_keywords here: [package.accept_keywords](https://git.edevau.net/onkelbeh/HomeAssistantRepository/raw/branch/python37dev/etc/portage/package.accept_keywords/99_homeassistant). Main repo's packages *without* Python 3.7 support have been copied to my repo & patched.

## package.use
After some experiments, i decided to compile the required modules **only for Python 3.7**. You will find my *current* package.use from the dev branch here: [package.use](https://git.edevau.net/onkelbeh/HomeAssistantRepository/src/branch/python37dev/etc/portage/package.use). I have a dedicated box for Home Assistant, so this list looks clean, no bigger hacks. It will get more complicated if you have to compile some of the modules for other Python versions.

## Migration
My production box is still running Python 3.6. Will try to **Uprade** these days.
