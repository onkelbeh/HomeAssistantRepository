# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="API For huawei LAN/WAN LTE Modems"
HOMEPAGE="
	https://github.com/Salamek/huawei-lte-api/
	https://pypi.org/project/huawei-lte-api/
"
SRC_URI="
	https://github.com/Salamek/${PN}/archive/refs/tags/1.10.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	dev-python/pycryptodome[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]
"

python_prepare_all() {
	# make cryptodome-friendly
	sed -i -e 's:pycryptodomex:pycryptodome:' setup.py || die
	find . -name '*.py' -exec \
		sed -i -e 's:Cryptodome:Crypto:g' {} + || die

	distutils-r1_python_prepare_all
}
src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}/huawei-lte-api-1.10" "${WORKDIR}/huawei-lte-api-1.10.0"
}
distutils_enable_tests pytest
