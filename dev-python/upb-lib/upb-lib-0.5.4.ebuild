# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
DESCRIPTION="Library for interacting with UPB PIM."
HOMEPAGE="https://github.com/gwww/upb-lib https://pypi.org/project/upb-lib/"
SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="CHANGELOG.md"

RDEPEND="dev-python/pytz[${PYTHON_USEDEP}]
	>=dev-python/pyserial-asyncio-0.5[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

src_prepare() {
	sed -e 's/"CHANGELOG.md",//' -i pyproject.toml || die
	eapply_user
	}

distutils_enable_tests pytest
