# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="An SDK to interact with the AladdinConnect (or OHD) partner API"
HOMEPAGE="https://github.com/genie-garage/aladdin-python-sdk https://pypi.org/project/genie-partner-sdk/"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test ) mirror"

DOCS="README.md"

distutils_enable_tests pytest
