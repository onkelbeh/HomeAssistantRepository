# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
PYPI_PN=${PN/-/.}
inherit distutils-r1 pypi
DESCRIPTION="Python wrapper for the Mastodon API"
HOMEPAGE="https://github.com/halcy/Mastodon.py https://pypi.org/project/Mastodon.py/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="
	>=dev-python/requests-2.4.2[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/python-magic[${PYTHON_USEDEP}]
	>=dev-python/decorator-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/blurhash-1.1.4[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
