# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Get your Fido consumption (wwww.fido.ca)"
HOMEPAGE="https://github.com/titilambert/pyfido https://pypi.org/project/pyfido/"
SRC_URI="$(pypi_sdist_url)"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
DOCS="README.rst"
RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]"
