# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Work with the Webex APIs in native Python!"
HOMEPAGE="https://github.com/WebexCommunity/WebexPythonSDK https://pypi.org/project/webexpythonsdk/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.8.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed -i -e '/include = /d' pyproject.toml || die
	distutils-r1_src_prepare
	}

distutils_enable_tests pytest
