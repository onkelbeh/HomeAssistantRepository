# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="An async Python client for connecting to the Evohome webservice"
HOMEPAGE="https://github.com/zxdavb/evohome-async/ https://pypi.org/project/evohome-async/"
SRC_URI="$(pypi_sdist_url --no-normalize)
		 https://raw.githubusercontent.com/zxdavb/evohome-async/${PV}/requirements.txt"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

src_prepare() {
	cp "${DISTDIR}/requirements.txt" "${S}" || die
	eapply_user
}

distutils_enable_tests pytest
