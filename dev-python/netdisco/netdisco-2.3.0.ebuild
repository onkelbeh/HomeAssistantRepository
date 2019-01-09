# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python3_{4,5,6})

inherit distutils-r1

DESCRIPTION="Discover devices on your local network"
HOMEPAGE="https://github.com/home-assistant/netdisco"
SRC_URI="https://github.com/home-assistant/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	>=dev-python/requests-2.0[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.19.1[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.md"
