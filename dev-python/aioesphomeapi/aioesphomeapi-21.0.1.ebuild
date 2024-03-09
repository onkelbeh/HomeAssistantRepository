# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Python API for interacting with ESPHome devices."
HOMEPAGE="https://github.com/esphome/aioesphomeapi https://esphome.io/ https://pypi.org/project/aioesphomeapi/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="dev-python/aiohappyeyeballs[${PYTHON_USEDEP}]
	>=dev-python/protobuf-python-3.19.0[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.128.4[${PYTHON_USEDEP}]
	>=dev-python/chacha20poly1305-reuseable-0.12.0[${PYTHON_USEDEP}]
	>=dev-python/noiseprotocol-0.3.1[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/async-timeout[${PYTHON_USEDEP}]' python3_10)"
BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
