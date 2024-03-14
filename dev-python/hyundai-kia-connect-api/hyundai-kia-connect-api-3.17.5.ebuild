# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="This is a Kia UVO and Hyundai Bluelink written in python for Homeassistant"
HOMEPAGE="https://github.com/fuatakgun/hyundai_kia_connect_api https://pypi.org/project/hyundai-kia-connect-api/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/curlify-2.2.1[${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup4-4.10[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	>=dev-python/pytz-2021.3[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
