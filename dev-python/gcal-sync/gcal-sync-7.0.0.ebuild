# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="A python library for syncing Google Calendar to local storage"
HOMEPAGE="https://github.com/allenporter/gcal_sync https://pypi.org/project/gcal-sync/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.10.4[${PYTHON_USEDEP}]
	>=dev-python/ical-8.3.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
