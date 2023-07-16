# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
PYPI_PN="PyJWT"
PYPI_NO_NORMALIZE=1
inherit distutils-r1 optfeature pypi

DESCRIPTION="JSON Web Token implementation in Python"
HOMEPAGE="https://github.com/jpadilla/pyjwt/ https://pypi.org/project/PyJWT/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="!dev-python/python-jwt"
BDEPEND="
	test? (
		>=dev-python/cryptography-3.3.1[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

pkg_postinst() {
	optfeature "cryptography" dev-python/cryptography
}
