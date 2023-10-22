# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="A library for zigpy which communicates with TI ZNP radios"
HOMEPAGE="https://github.com/zigpy/zigpy-znp https://pypi.org/project/zigpy-znp/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/zigpy-0.56.3[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/async-timeout[${PYTHON_USEDEP}]' python3_10)
	dev-python/voluptuous[${PYTHON_USEDEP}]
	dev-python/coloredlogs[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

# TODO: Make symlinks for zigpy_znp/tools and add TOOLS.md and docs/*.pdf , but only it is in github package
