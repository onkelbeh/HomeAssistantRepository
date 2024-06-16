# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Rain Bird Controller"
HOMEPAGE="https://github.com/jbarrancos/pyrainbird/ https://pypi.org/project/pyrainbird/"
SRC_URI="https://github.com/jbarrancos/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/pycryptodome-3.16.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.4[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.12[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.2[${PYTHON_USEDEP}]
	>=dev-python/ical-4.2.9[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-retry-2.8.3[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
