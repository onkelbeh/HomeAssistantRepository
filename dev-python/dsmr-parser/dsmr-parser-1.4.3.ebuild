# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Library to parse Dutch Smart Meter Requirements (DSMR)"
HOMEPAGE="https://github.com/ndokter/dsmr_parser https://pypi.org/project/dsmr-parser/"
SRC_URI="https://github.com/ndokter/dsmr_parser/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="
	dev-python/pytz[${PYTHON_USEDEP}]
	>=dev-python/pyserial-3[${PYTHON_USEDEP}]
	>=dev-python/pyserial-asyncio-fast-0.11[${PYTHON_USEDEP}]
	~dev-python/tailer-0.4.1[${PYTHON_USEDEP}]
	~dev-python/dlms-cosem-21.3.2[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
