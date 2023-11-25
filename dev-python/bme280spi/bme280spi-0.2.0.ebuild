# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
DESCRIPTION="Library for BME280 sensor through spidev"
HOMEPAGE="https://github.com/Kuzj/bme280spi https://pypi.org/project/bme280spi/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/spidev-3.5[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
