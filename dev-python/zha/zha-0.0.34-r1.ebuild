# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Library implementing ZHA for Home Assistant"
HOMEPAGE="https://github.com/zigpy/zha/ https://pypi.org/project/zha/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="~dev-python/zigpy-0.69.0[${PYTHON_USEDEP}]
	~dev-python/bellows-0.40.6[${PYTHON_USEDEP}]
	~dev-python/zigpy-znp-0.12.4[${PYTHON_USEDEP}]
	~dev-python/zigpy-deconz-0.23.3[${PYTHON_USEDEP}]
	~dev-python/zigpy-xbee-0.20.2[${PYTHON_USEDEP}]
	~dev-python/zigpy-zigate-0.13.1[${PYTHON_USEDEP}]
	~dev-python/zha-quirks-0.0.122[${PYTHON_USEDEP}]
	~dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	~dev-python/pyserial-asyncio-fast-0.13[${PYTHON_USEDEP}]
	dev-python/voluptuous[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
