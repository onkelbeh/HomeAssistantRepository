# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6,7} pypy pypy3 )

inherit distutils-r1

MY_PV="0.4a1"

DESCRIPTION="The Python CoAP library"
HOMEPAGE="https://github.com/chrysn/aiocoap"
SRC_URI="https://github.com/chrysn/${PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="MIT"
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

DOCS="README.rst"
S="${WORKDIR}/${PN}-${MY_PV}"

src_prepare() {
	      rm -rf tests  # FIXME
	      eapply "${FILESDIR}/aiocoap-0.4a1-no-umlaut.patch"
	      eapply_user
	      }
