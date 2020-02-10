# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="plugin and hook calling mechanisms for python"
HOMEPAGE="https://pluggy.readthedocs.io/ https://github.com/pytest-dev/pluggy https://pypi.org/project/pluggy/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/setuptools_scm[${PYTHON_USEDEP}]
	>=dev-python/importlib_metadata-0.12[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	PYTHONPATH="${BUILD_DIR}/lib" pytest -v || die "tests failed with ${EPYTHON}"
}
