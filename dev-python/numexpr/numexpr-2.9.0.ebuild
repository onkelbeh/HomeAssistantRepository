# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1

DESCRIPTION="Fast numerical array expression evaluator for Python and NumPy"
HOMEPAGE="
	https://github.com/pydata/numexpr/
	https://pypi.org/project/numexpr/
"
SRC_URI="https://github.com/pydata/numexpr/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

DEPEND="
	<dev-python/numpy-2[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.13.3[${PYTHON_USEDEP}]
"
RDEPEND="
	${DEPEND}
	dev-python/packaging[${PYTHON_USEDEP}]
"

python_test() {
	pushd "${BUILD_DIR}/install/$(python_get_sitedir)" >/dev/null || die
	"${EPYTHON}" - <<-EOF || die "Tests failed with ${EPYTHON}"
		import sys,numexpr
		sys.exit(0 if numexpr.test().wasSuccessful() else 1)
	EOF
	pushd >/dev/null || die
}
