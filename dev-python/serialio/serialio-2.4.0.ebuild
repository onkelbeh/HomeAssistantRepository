# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="Concurrency agnostic serialio API"
HOMEPAGE="
	https://pypi.org/project/serialio/
"

LICENSE="GPLv3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pyserial-3.0[${PYTHON_USEDEP}]
	>=dev-python/sockio-0.15.0[${PYTHON_USEDEP}]
"

