# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="A python library for automating interaction with websites"
HOMEPAGE="https://pypi.org/project/MechanicalSoup/"
SRC_URI="https://github.com/${PN}/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE="examples test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/beautifulsoup4-4.7[${PYTHON_USEDEP}]
	>=dev-python/requests-2.22[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		${RDEPEND}
		>=dev-python/requests-mock-1.3.0[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-httpbin[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)"

distutils_enable_sphinx docs

python_prepare_all() {
	# We don't need pytest-runner to run tests via pytest
	sed -i "s/'pytest-runner'//" setup.py || die
	distutils-r1_python_prepare_all
}

python_test() {
	# Override pytest options to skip coverage and flake8
	pytest -vv --override-ini="addopts=" \
		|| die "tests failed with ${EPYTHON}"
}

python_install_all() {
	if use examples; then
		docompress -x "/usr/share/doc/${PF}/examples"
		dodoc -r examples
	fi
	distutils-r1_python_install_all
}
