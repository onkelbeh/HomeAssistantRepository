# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python library for serializing any arbitrary object graph into JSON"
HOMEPAGE="https://github.com/jsonpickle/jsonpickle/ https://pypi.org/project/jsonpickle/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="doc test"
RESTRICT="!test? ( test )"

# There are optional json backends serializer/deserializers in addition to those selected here
# jsonlib, yajl.
RDEPEND="
	dev-python/simplejson[${PYTHON_USEDEP}]
	dev-python/feedparser[${PYTHON_USEDEP}]
	dev-python/ujson[${PYTHON_USEDEP}]
"
# toml via setuptools-scm[toml]
BDEPEND="dev-python/setuptools-scm[${PYTHON_USEDEP}]"

distutils_enable_sphinx "docs/source"
distutils_enable_tests pytest

python_prepare_all() {
	# too many dependencies
	rm tests/pandas_test.py || die
	sed -e '/pandas/ d' -i tests/runtests.py || die

	sed -i -e 's:--flake8 --black --cov --cov-append::' pytest.ini || die

	distutils-r1_python_prepare_all
}

python_test() {
	pytest -vv tests || die "Tests failed with ${EPYTHON}"
}
