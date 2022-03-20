# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Yet another URL library"
HOMEPAGE="https://github.com/aio-libs/yarl/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86 ~amd64-linux ~x86-linux"

RDEPEND=">=dev-python/multidict-4.0[${PYTHON_USEDEP}]
	>=dev-python/idna-2.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
distutils_enable_sphinx docs \
	dev-python/alabaster

PATCHES=(
	"${FILESDIR}"/${PN}-1.4.2-test-without-coverage.patch
)

python_test() {
	cd tests || die
	# broken by CPython CVE fix
	epytest \
		--deselect tests/test_url_query.py::test_semicolon_as_separator
}
