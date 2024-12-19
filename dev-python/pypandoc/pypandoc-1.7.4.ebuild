# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
DESCRIPTION="Thin wrapper for pandoc."
HOMEPAGE="https://github.com/bebraw/pypandoc https://pypi.org/project/pypandoc/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

src_prepare() {
	# remove the 'include' section
	sed -i '35,42d' pyproject.toml || die

	#rm -R examples || die
	#rm filter_test.md || die
	#rm LICENSE || die
	eapply_user
}
