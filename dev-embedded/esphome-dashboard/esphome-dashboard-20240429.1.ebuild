# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="ESPHome dashboard"
HOMEPAGE="https://pypi.org/project/esphome-dashboard/ https://github.com/esphome/dashboard"
SRC_URI="https://files.pythonhosted.org/packages/a0/23/4b670fdb351bfcf1a208e1494c2c13b5762bcb9757615c508b81e56ff8d1/esphome_dashboard-20240429.1.tar.gz"

S=${WORKDIR}/esphome_dashboard-${PV}

SLOT="0"
LICENSE="Apache-2.0"
KEYWORDS="amd64 arm arm64 x86"
DOCS="README.md"
