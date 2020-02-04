# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_{5,6,7}} )

inherit distutils-r1

DESCRIPTION="Experiment to convert voluptuous schemas to JSON"
HOMEPAGE="https://github.com/balloob/voluptuous-serialize"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="~dev-python/voluptuous-0.11.1[${PYTHON_USEDEP}]"

python_test() {
	unset PYTHONPATH
	nosetests -v || die "Tests failed"
}
