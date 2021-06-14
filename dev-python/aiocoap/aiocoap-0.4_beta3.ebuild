# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

MY_PV="0.4b3"

DESCRIPTION="The Python CoAP library"
HOMEPAGE="https://github.com/chrysn/aiocoap"
SRC_URI="https://github.com/chrysn/${PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
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
