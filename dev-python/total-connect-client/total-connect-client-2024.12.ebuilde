# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Interact with Total Connect 2 alarm systems"
HOMEPAGE="https://github.com/craigjmidwinter/total-connect-client https://pypi.org/project/total-connect-client/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/zeep-4.1.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
