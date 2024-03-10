# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="A GeoRSS client library for the IGN Sismologia feed."
HOMEPAGE="https://github.com/exxamalte/python-georss-ign-sismologia-client https://pypi.org/project/georss-ign-sismologia-client/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/dateparser-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/georss-client-0.17[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
