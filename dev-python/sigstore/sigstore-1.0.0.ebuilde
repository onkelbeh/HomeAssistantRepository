# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=flit
inherit distutils-r1 pypi

DESCRIPTION="A tool for generating and verifying Sigstore signatures."
HOMEPAGE="https://www.sigstore.dev https://github.com/sigstore/sigstore-python https://pypi.org/project/sigstore/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="~dev-python/appdirs-1.4.4[${PYTHON_USEDEP}]
	>=dev-python/cryptography-39.0.0[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-22.0.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/securesystemslib[${PYTHON_USEDEP}]
	>=dev-python/tuf-2.0.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
