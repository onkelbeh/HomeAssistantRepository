# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1

DESCRIPTION="An async Python client for connecting to the Evohome webservice"
HOMEPAGE="https://github.com/zxdavb/evohome-async/ https://pypi.org/project/evohome-async/"
SRC_URI="https://github.com/zxdavb/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/aiohttp-3.11.12[${PYTHON_USEDEP}]
	>=dev-python/aiozoneinfo-0.2.3[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.15.2[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_prepare() {
	# remove dynamic-versioning
	sed "s/dynamic = \\[\"version\"\\]/version = \\\"${PV}\\\"/g" -i pyproject.toml || die
	eapply_user
	}
