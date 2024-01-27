# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
DESCRIPTION="Recover bluetooth adapters that are in an stuck state"
HOMEPAGE="https://github.com/bluetooth-devices/bluetooth-auto-recovery https://pypi.org/project/bluetooth-auto-recovery/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/PyRIC-0.1.6.3[${PYTHON_USEDEP}]
	>=dev-python/btsocket-0.2.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/async-timeout[${PYTHON_USEDEP}]' python3_10)
	>=dev-python/usb-devices-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-adapters-0.16.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
