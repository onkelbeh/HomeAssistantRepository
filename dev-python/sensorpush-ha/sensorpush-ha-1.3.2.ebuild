# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="SensorPush Cloud Home Assistant Library"
HOMEPAGE="https://pypi.org/project/sensorpush-ha/ https://github.com/sstallion/sensorpush-ha"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/pydantic-2.10.0[${PYTHON_USEDEP}]
	>=dev-python/sensorpush-api-2.1.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
