# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Pythonic bindings for FFmpeg's libraries."
HOMEPAGE="https://github.com/PyAV-Org/PyAV https://pypi.org/project/ha-av/"
# 'ha-av-8.0.4_rc1.tar.gz' -> ha-av-8.0.4rc1.tar.gz
MY_P=${P/_/}
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${MY_P}.tar.gz -> ${P}.tar.gz"

# dev-python/ha-av-8.0.4_rc1/work/ha-av-8.0.4_rc1 -> dev-python/ha-av-8.0.4_rc1/work/ha-av-8.0.4rc1/
S="${WORKDIR}/${MY_P}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DOCS="README.md"

RDEPEND="media-plugins/gst-plugins-libav"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
