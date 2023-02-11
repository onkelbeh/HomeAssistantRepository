# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="IKEA Tradfri/Tradfri API. Control and observe your lights from Python."
HOMEPAGE="https://github.com/ggravlingen/pytradfri https://pypi.org/project/pytradfri/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/pydantic[${PYTHON_USEDEP}]
	~dev-python/aiocoap-0.4.5[${PYTHON_USEDEP}]
	~dev-python/dtlssocket-0.1.12[${PYTHON_USEDEP}]"

DOCS="README.md"

DEPEND="${DEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
	  dev-python/pytest[${PYTHON_USEDEP}]
	  dev-python/pytest-cov[${PYTHON_USEDEP}]
	  >=dev-python/pytest-timeout-2.1.0[${PYTHON_USEDEP}]
	  dev-python/flake8[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
