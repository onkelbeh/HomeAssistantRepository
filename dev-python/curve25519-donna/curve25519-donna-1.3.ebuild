# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python2_7 python3_{4,5,6})

inherit distutils-r1

DESCRIPTION="Implementations of a fast Elliptic-curve Diffie-Hellman primitive"
HOMEPAGE="https://github.com/agl/curve25519-donna"
SRC_URI="https://github.com/agl/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="curve25519-donna"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README"
