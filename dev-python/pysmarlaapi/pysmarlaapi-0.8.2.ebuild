# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Swing2Sleep Smarla API"
HOMEPAGE="https://pypi.org/project/pysmarlaapi/ https://github.com/Explicatis-GmbH/pysmarlaapi"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	~dev-python/aiohttp-3.11[${PYTHON_USEDEP}]
	~dev-python/jsonpickle-4.0.0[${PYTHON_USEDEP}]
	~dev-python/pysignalr-1.1.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
