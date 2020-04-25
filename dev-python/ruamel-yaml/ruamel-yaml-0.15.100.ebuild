# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1 vcs-snapshot

DESCRIPTION="YAML parser/emitter that supports roundtrip comment preservation"
HOMEPAGE="https://pypi.org/project/ruamel.yaml/ https://bitbucket.org/ruamel/yaml"
MY_PN="${PN//-/.}"
SRC_URI="mirror://pypi/${P:0:1}/${MY_PN}/${MY_PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64 x86 amd64-linux x86-linux"
IUSE="test"

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/ruamel-std-pathlib[${PYTHON_USEDEP}]
	)
"

python_install() {
	distutils-r1_python_install --single-version-externally-managed
	find "${ED}" -name '*.pth' -delete || die
}

python_test() {
	# This file produced by setup.py breaks finding system-wide installed
	# ruamel.std.pathlib due to shared namespace
	rm "${BUILD_DIR}/lib/ruamel/__init__.py" || die

	py.test -v _test/test_*.py || die
}
