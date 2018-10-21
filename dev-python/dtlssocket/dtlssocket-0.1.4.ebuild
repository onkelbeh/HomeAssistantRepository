# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python3_{5,6})

inherit distutils-r1

MY_PN="DTLSSocket"

DESCRIPTION="A cython wrapper for tinydtls with a Socket like interface"
HOMEPAGE="https://git.fslab.de/jkonra2m/tinydtls-cython"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_PN}-${PV}.tar.gz"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README"
S="${WORKDIR}/${MY_PN}-${PV}"
