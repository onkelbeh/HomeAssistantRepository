# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="SensorPush Public API"
HOMEPAGE="https://pypi.org/project/sensorpush-api/ https://github.com/sstallion/sensorpush-api"
PATCHES="
	${FILESDIR}/${PN}-build-system.patch
	${FILESDIR}/${P}-option-json-missing.patch
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/python-dateutil-2.5.3[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.25.3[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.10.5[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
"
src_prepare() {
	default
	touch "${S}/requirements.txt"
	touch "${S}/test-requirements.txt"
	touch "${S}/release-requirements.txt"
}
src_install() {
	rm -rf "${D}/test"
	default
}
distutils_enable_tests pytest
