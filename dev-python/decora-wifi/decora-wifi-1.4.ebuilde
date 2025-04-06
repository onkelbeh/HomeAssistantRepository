# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Python API for controlling Leviton Decora Smart WiFi switches"
HOMEPAGE="https://github.com/tlyakhov/python-decora_wifi https://pypi.org/project/decora-wifi/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
	dev-python/inflect[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
