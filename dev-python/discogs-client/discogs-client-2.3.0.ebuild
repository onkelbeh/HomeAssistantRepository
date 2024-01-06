# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Official Python API client for Discogs"
HOMEPAGE="https://github.com/discogs/discogs_client https://pypi.org/project/discogs-client/"

LICENSE="all-rights-reserved"

SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test ) mirror"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/oauthlib[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
