# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="ThinQ Connect Python SDK"
HOMEPAGE="https://github.com/thinq-connect/pythinqconnect https://pypi.org/project/thinqconnect/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/awsiotsdk[${PYTHON_USEDEP}]
	dev-python/pyopenssl[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
