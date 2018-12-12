# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python3_{4,5,6})

inherit distutils-r1

DESCRIPTION="Library for controlling an Apple TV"
HOMEPAGE="https://github.com/postlund/pyatv"
SRC_URI="https://github.com/postlund/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	>=dev-python/aiohttp-2.3.6[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.0.2[${PYTHON_USEDEP}]
	>=dev-python/curve25519-donna-1.3[${PYTHON_USEDEP}]
	>=dev-python/ed25519-1.4[${PYTHON_USEDEP}]
	>=dev-python/setuptools-2.0[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.17.7[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.rst"  # add -r docs/

src_prepare() {
		rm -rf examples  # FIXME

		eapply_user
}
