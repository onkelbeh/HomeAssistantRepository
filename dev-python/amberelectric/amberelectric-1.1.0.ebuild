# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Interface to the Amber Electric API, allowing you to download current and forecast price, as well as download your historic usage."
HOMEPAGE="https://github.com/madpilot/amberelectric.py https://pypi.org/project/amberelectric/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/urllib3-1.25.3[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
