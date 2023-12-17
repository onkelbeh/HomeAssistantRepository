# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi
DESCRIPTION="Python module to help parse and construct Tasmota MQTT messages."
HOMEPAGE="https://github.com/emontnemery/hatasmota https://pypi.org/project/HATasmota/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/voluptuous-0.12.0[${PYTHON_USEDEP}]"
