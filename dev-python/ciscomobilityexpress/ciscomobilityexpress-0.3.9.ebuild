# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Module to interact with Cisco Mobility Express APIs to fetch connected devices."
HOMEPAGE="https://github.com/fbradyirl/ciscomobilityexpress https://pypi.org/project/ciscomobilityexpress/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/requests-2.21.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
