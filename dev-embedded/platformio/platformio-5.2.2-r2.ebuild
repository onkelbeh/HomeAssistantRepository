# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="A professional collaborative platform for embedded development. Cross-platform IDE and Unified Debugger."
HOMEPAGE="https://platformio.org https://github.com/platformio/platformio-core/ https://pypi.org/project/platformio/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 x86 ~amd64-linux ~x86-linux"
IUSE=""

BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">dev-python/bottle-0.12[${PYTHON_USEDEP}]
	>=dev-python/click-7.1.2[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-2.20.5[${PYTHON_USEDEP}]
	>=dev-python/pyelftools-0.27[${PYTHON_USEDEP}]
	>=dev-python/pyserial-3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.4[${PYTHON_USEDEP}]
	>=dev-python/semantic_version-2.8.1[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.8.3[${PYTHON_USEDEP}]
	<dev-python/tabulate-1[${PYTHON_USEDEP}]
	>=dev-python/aiofiles-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/ajsonrpc-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/starlette-0.16.0[${PYTHON_USEDEP}]
	<dev-python/starlette-0.17.0[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.15.0[${PYTHON_USEDEP}]
	<dev-python/uvicorn-0.16.0[${PYTHON_USEDEP}]
	>=dev-python/wsproto-1.0.0[${PYTHON_USEDEP}]"

src_prepare() {
	sed -i -e 's/"zeroconf==0.36.*"/"zeroconf"/' setup.py || die "zeroconf version helper failed!"
	eapply_user
}
