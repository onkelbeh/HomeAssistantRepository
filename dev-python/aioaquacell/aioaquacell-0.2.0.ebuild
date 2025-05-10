# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous library to retrieve details of your Aquacell water softener device"
HOMEPAGE="https://github.com/Jordi1990/aioaquacell https://pypi.org/project/aioaquacell/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/requests-aws4auth[${PYTHON_USEDEP}]
	dev-python/pycognito[${PYTHON_USEDEP}]
	dev-python/aws-request-signer[${PYTHON_USEDEP}]
	dev-python/aiobotocore[${PYTHON_USEDEP}]
	dev-python/attrs[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
