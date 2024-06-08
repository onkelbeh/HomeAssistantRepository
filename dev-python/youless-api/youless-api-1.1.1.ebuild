# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A bridge for python to the YouLess sensor"
HOMEPAGE="https://github.com/gjong/youless-python-bridge/ https://pypi.org/project/youless-api/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]"

src_prepare() {
	# Make it easy, this guy pins everything
	cut -d "=" -f1 < requirements.txt > requirements_new.txt
	mv requirements_new.txt requirements.txt
	eapply_user
}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
