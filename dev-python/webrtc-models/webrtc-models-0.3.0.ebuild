# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Python WebRTC models"
HOMEPAGE="https://github.com/home-assistant-libs/python-webrtc-models/ https://pypi.org/project/webrtc-models/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/mashumaro-3.13[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.10.7[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
