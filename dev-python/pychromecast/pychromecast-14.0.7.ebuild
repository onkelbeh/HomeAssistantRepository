# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_PN=PyChromecast
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Python module to talk to Google Chromecast"
HOMEPAGE="
	https://github.com/home-assistant-libs/pychromecast/
	https://pypi.org/project/PyChromecast/
"
DOCE="README.rst"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/casttube-0.2.1[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
	dev-python/zeroconf[${PYTHON_USEDEP}]
"
