# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="An asynchronous Python library to communicate with PG LAB Electronics devices over MQTT."
HOMEPAGE="
	https://pypi.org/project/pypglab/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	dev-python/voluptuous[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
