# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
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

RDEPEND=">=dev-python/requests-2.4.2[${PYTHON_USEDEP}]
		 dev-python/python-dateutil[${PYTHON_USEDEP}]
		 dev-python/six[${PYTHON_USEDEP}]
		 dev-python/python-magic[${PYTHON_USEDEP}]
		 >=dev-python/decorator-4.0.0[${PYTHON_USEDEP}]
		 dev-python/blurhash[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
