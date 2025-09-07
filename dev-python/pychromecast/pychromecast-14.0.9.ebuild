# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_PN=PyChromecast
PYTHON_COMPAT=( pypy3_11 python3_{11..14} )

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
	>=dev-python/protobuf-5.29.3[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.147.0[${PYTHON_USEDEP}]
"
