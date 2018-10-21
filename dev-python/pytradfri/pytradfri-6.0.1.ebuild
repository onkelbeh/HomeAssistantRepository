# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python3_{5,6})

inherit eutils distutils-r1

DESCRIPTION="Control/observe IKEA Trådfri devices"
HOMEPAGE="https://github.com/ggravlingen/pytradfri"
SRC_URI="https://github.com/ggravlingen/pytradfri/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	>=dev-python/aiocoap-0.4_alpha1[${PYTHON_USEDEP}]
	>=dev-python/dtlssocket-0.1.4[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.md"
