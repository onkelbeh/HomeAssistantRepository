# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
DESCRIPTION="ChaCha20Poly1305 that is reuseable for asyncio"
HOMEPAGE="https://github.com/bdraco/chacha20poly1305-reuseable https://pypi.org/project/chacha20poly1305-reuseable/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/cryptography-36.0.2[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
