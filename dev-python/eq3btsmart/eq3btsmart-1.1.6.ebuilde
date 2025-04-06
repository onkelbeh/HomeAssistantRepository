# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python library that allows interaction with eQ-3 Bluetooth smart thermostats. "
HOMEPAGE="https://github.com/eulemitkeule/eq3btsmart https://pypi.org/project/eq3btsmart/"
#SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/bleak-0.21.0[${PYTHON_USEDEP}]
	>=dev-python/construct-2.10.68[${PYTHON_USEDEP}]
	>=dev-python/construct-typing-0.6.2[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
