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
The current setup of my testbox: [python37dev](https://git.edevau.net/onkelbeh/HomeAssistantRepository/src/branch/python37dev). Take a closer look in the [/etc/portage/](https://git.edevau.net/onkelbeh/HomeAssistantRepository/src/branch/python37dev/etc/portage) folder. It compiles without errors, and Home Assistant starts on `python-3.7.5-r1`, made no other test up to now.

## package.accept_keywords
Except a very few packages, unstable ebuilds are supporting Python 3.7, i have my current package.accept_keywords here: [package.accept_keywords](https://git.edevau.net/onkelbeh/HomeAssistantRepository/raw/branch/python37dev/etc/portage/package.accept_keywords/99_homeassistant). Main repo's packages *without* Python 3.7 support have been copied to my repo & patched.

## package.use
After some experiments, i decided to compile the required modules **only for Python 3.7**. You will find my *current* package.use from the dev branch here: [package.use](https://git.edevau.net/onkelbeh/HomeAssistantRepository/src/branch/python37dev/etc/portage/package.use). I have a dedicated box for Home Assistant, so this list looks clean, no bigger hacks. It will get more complicated if you have to compile some of the modules for other Python versions.

## Migration
was easier as i thought.
- unlock Python 3.7 code in /etc/portage/profile/use.stable.mask (see example)
      -python_targets_python3_7
      -python_single_target_python3_7
- take [package.accept_keywords](https://git.edevau.net/onkel\
beh/HomeAssistantRepository/raw/branch/python37dev/etc/portage/package.accept_keywords/99_homeassistant) and [package.use](http\
s://git.edevau.net/onkelbeh/HomeAssistantRepository/src/branch/python37dev/etc/portage/package.use) from my dev box and copy it to `/etc/portage`
- install Python 3.7, run `eselect python` to put Python 3.7 on postition 2
- start `emerge --ask --changed-use --deep @world`
- already installed packages could require 2.7 and 3.6 targets, OK, i had to allow 18 of them, we'll clean this up later:

    >=dev-python/asn1crypto-0.24.0 python_targets_python2_7 python_targets_python3_6
    >=dev-python/async_timeout-3.0.1 python_targets_python3_6
    =dev-python/attrs-19.2.0 python_targets_python2_7 python_targets_python3_6
    >=dev-python/cffi-1.12.2 python_targets_python2_7 python_targets_python3_6
    >=dev-python/chardet-3.0.4 python_targets_python3_6
    >=dev-python/cryptography-2.8 python_targets_python2_7 python_targets_python3_6
    >=dev-python/future-0.17.1 python_targets_python2_7 python_targets_python3_6
    >=dev-python/idna-2.8 python_targets_python3_6
    >=dev-python/idna-ssl-1.1.0 python_targets_python3_6
    >=dev-python/lxml-4.3.3 python_targets_python2_7 python_targets_python3_6
    >=dev-python/multidict-4.5.2 python_targets_python3_6
    >=dev-python/pbr-5.1.3 python_targets_python2_7 python_targets_python3_6
    >=dev-python/pycparser-2.19 python_targets_python3_6 python_targets_python2_7
    >=dev-python/pyyaml-5.1.2 python_targets_python2_7 python_targets_python3_6
    >=dev-python/six-1.12.0 python_targets_python2_7 python_targets_python3_6
    >=dev-python/yarl-1.3.0 python_targets_python3_6
    >=dev-python/zope-interface-4.6.0 python_targets_python2_7 python_targets_python3_6

- portage does not know in which slots python modules are already installed, some could still be missing in Python 3.7's site-packages, install them manually (after compile errors), in my case i had to install:
  - pyyaml
  - setuptools
  - setuptools_scm
- restart `emerge --ask --changed-use --deep @world` after adding the missing tools and libraries
- Once all packages are updated, you can remove the older targets in `package.use` and run another upgrade to remove support for Python 3.6.
