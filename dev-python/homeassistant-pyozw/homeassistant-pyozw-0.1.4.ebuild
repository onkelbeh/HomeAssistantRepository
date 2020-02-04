# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1

MY_PN=${PN/-/_}
MY_P=${MY_PN}-${PV}

DESCRIPTION="python_openzwave is a python wrapper for the openzwave c++ library."
HOMEPAGE="https://home-assistant.io/ https://pypi.org/project/homeassistant-pyozw/ https://www.openzwave.net/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${MY_P}.zip -> ${P}.zip
		 https://raw.githubusercontent.com/home-assistant/python-openzwave/hass/archives/open-zwave-hass-${PV}.zip"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=""
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

S=${WORKDIR}/${MY_PN}

src_unpack() {
	unpack ${A}
	mkdir ${MY_PN}/openzwave-embed
	mv open-zwave-hass ${MY_PN}/openzwave-embed/
}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
