# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="A Python library to communicate with Ring Door Bell (https://ring.com/)"
HOMEPAGE="https://github.com/tchellomello/python-ring-doorbell https://pypi.org/project/ring-doorbell/"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="listen test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/oauthlib-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2022.0[${PYTHON_USEDEP}]
	dev-python/asyncclick[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/aiofiles[${PYTHON_USEDEP}]
	dev-python/websockets[${PYTHON_USEDEP}]
	listen? ( >=dev-python/firebase-messaging-0.2.1[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest

python_prepare_all() {
	sed -i -e 's:"LICENSE",::' pyproject.toml || die
	sed -i -e 's:"CONTRIBUTING.rst", ::' pyproject.toml || die
	sed -i -e 's:"CHANGELOG.rst",::' pyproject.toml || die
	distutils-r1_python_prepare_all
	}
