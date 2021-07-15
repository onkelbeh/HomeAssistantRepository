# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1 git-r3

DESCRIPTION="Unofficial wrapper around Avri endpoints"
HOMEPAGE="https://github.com/timvancann/pyavri https://pypi.org/project/avri-api/"

MY_PN="pyavri"
EGIT_REPO_URI="https://github.com/timvancann/${MY_PN}.git"
EGIT_COMMIT="90f9cdb808f0d59181c6318ab06badee6c0e0b6a"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DOCS="README.md"

RDEPEND=">=dev-python/requests-2.22.0[${PYTHON_USEDEP}]
	>=dev-python/pyfunctional-1.3.0[${PYTHON_USEDEP}]"
BDEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		>=dev-python/requests-mock-1.8.0[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
