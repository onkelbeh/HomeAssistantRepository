# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python2_7 python3_{4,5,6})

inherit distutils-r1

DESCRIPTION="Python bindings to the Ed25519 public-key signature system"
HOMEPAGE="https://github.com/warner/python-ed25519"
SRC_URI="https://github.com/warner/python-${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

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

DOCS="README.md"
S="${WORKDIR}/python-${PN}-${PV}"
