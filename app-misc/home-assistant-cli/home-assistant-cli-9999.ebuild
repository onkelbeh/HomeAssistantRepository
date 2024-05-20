# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/home-assistant/home-assistant-cli.git"
else
	SRC_URI="https://github.com/home-assistant/${PN}/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
fi

DESCRIPTION="The Home Assistant Command-line Interface (hass-cli)"
HOMEPAGE="https://github.com/home-assistant/home-assistant-cli/"
EGIT_REPO_URI="https://github.com/home-assistant/home-assistant-cli.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/aiohttp-3.9.5[${PYTHON_USEDEP}]
		 >=dev-python/dateparser-1.2.0[${PYTHON_USEDEP}]
		 >=dev-python/jsonpath-ng-1.6.1[${PYTHON_USEDEP}]
		 >=dev-python/jinja-3.1.4[${PYTHON_USEDEP}]
		 >=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
		 >=dev-python/tabulate-0.9.0[${PYTHON_USEDEP}]
		 >=dev-python/regex-24.5.10[${PYTHON_USEDEP}]
		 >=dev-python/ruamel-yaml-0.18.6[${PYTHON_USEDEP}]
		 >=dev-python/click-8.1.7[${PYTHON_USEDEP}]
		 >=dev-python/click-log-0.4[${PYTHON_USEDEP}]
		 >=dev-python/netdisco-3.0.0[${PYTHON_USEDEP}]"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		>=dev-python/mypy-1.10.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-timeout-2.3.1[${PYTHON_USEDEP}]
		>=dev-python/requests-mock-1.12.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-sugar-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
