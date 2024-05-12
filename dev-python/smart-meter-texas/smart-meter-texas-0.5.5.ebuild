# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Package to connect to and retrieve data from the unofficial Smart Meter Texas API"
HOMEPAGE="https://github.com/grahamwetzler/smart-meter-texas https://pypi.org/project/smart-meter-texas/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.0.1[${PYTHON_USEDEP}]"
# 	>=dev-python/asn1-2.4.1[${PYTHON_USEDEP}]

distutils_enable_tests pytest
