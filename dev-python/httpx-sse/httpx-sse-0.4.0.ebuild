# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="Consume Server-Sent Event (SSE) messages with HTTPX."
HOMEPAGE="https://github.com/florimondmanca/httpx-sse https://pypi.org/project/httpx-sse/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND=""
BDEPEND=""

distutils_enable_tests pytest
