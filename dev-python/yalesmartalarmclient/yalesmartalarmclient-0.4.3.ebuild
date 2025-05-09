# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Interact with Yale Smart Alarm systems"
HOMEPAGE="https://github.com/domwillcode/yale-smart-alarm-client https://pypi.org/project/yalesmartalarmclient/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/requests-2.32.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
