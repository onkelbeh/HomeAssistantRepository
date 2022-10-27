# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="ESPHome dashboard"
HOMEPAGE="https://github.com/esphome/dashboard https://pypi.org/project/esphome-dashboard/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="Apache-2.0"
KEYWORDS="amd64 arm arm64 x86"

DOCS="README.md"
BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
