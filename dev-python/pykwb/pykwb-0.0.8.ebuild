# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="KWB Easyfire serial library, for inclusion into homeassistant"
HOMEPAGE="https://github.com/bimbar/pykwb.git https://pypi.org/project/pykwb/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/pyserial-3.0.1[${PYTHON_USEDEP}]"
