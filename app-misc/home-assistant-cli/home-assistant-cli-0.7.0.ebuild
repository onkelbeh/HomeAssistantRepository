# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="The Home Assistant Command-line Interface (hass-cli)"
HOMEPAGE="https://github.com/home-assistant/home-assistant-cli/"
SRC_URI="https://github.com/home-assistant/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="~dev-python/aiohttp-3.5.4[${PYTHON_USEDEP}]
		 ~dev-python/click-log-0.3.2[${PYTHON_USEDEP}]
		 ~dev-python/click-7.0[${PYTHON_USEDEP}]
		 ~dev-python/dateparser-0.7.1[${PYTHON_USEDEP}]
		 >=dev-python/jinja-2.10[${PYTHON_USEDEP}]
		 ~dev-python/jsonpath-rw-1.4.0[${PYTHON_USEDEP}]
		 ~dev-python/netdisco-2.6.0[${PYTHON_USEDEP}]
		 ~dev-python/regex-2019.04.14[${PYTHON_USEDEP}]
		 >=dev-python/ruamel-yaml-0.15.96[${PYTHON_USEDEP}]
		 ~dev-python/requests-2.22.0[${PYTHON_USEDEP}]
		 ~dev-python/tabulate-0.8.3[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		~dev-python/coveralls-1.2.0[${PYTHON_USEDEP}]
		~dev-python/flake8-docstrings-1.3.0[${PYTHON_USEDEP}]
		~dev-python/flake8-3.7.7[${PYTHON_USEDEP}]
		~dev-python/mock-open-1.3.1[${PYTHON_USEDEP}]
		~dev-python/mypy-0.701[${PYTHON_USEDEP}]
		~dev-python/pydocstyle-3.0.0[${PYTHON_USEDEP}]
		~dev-python/pylint-2.3.1[${PYTHON_USEDEP}]
		~dev-python/pytest-cov-2.6.1[${PYTHON_USEDEP}]
		~dev-python/pytest-sugar-0.9.2[${PYTHON_USEDEP}]
		~dev-python/pytest-timeout-1.3.3[${PYTHON_USEDEP}]
		~dev-python/pytest-4.4.1[${PYTHON_USEDEP}]
		~dev-python/requests_mock-1.6.0[${PYTHON_USEDEP}]
		~dev-python/wheel-0.33.1[${PYTHON_USEDEP}]
		~dev-python/codecov-2.0.15[${PYTHON_USEDEP}]
		~dev-python/twine-1.13.0[${PYTHON_USEDEP}]
	)"

src_prepare() {
	eapply_user
	cd "${S}"
	sed -i -e "s/'ruamel.yaml==0.15.96'/'ruamel.yaml>=0.15.96'/" setup.py || die "Sed version helper failed!"
}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
