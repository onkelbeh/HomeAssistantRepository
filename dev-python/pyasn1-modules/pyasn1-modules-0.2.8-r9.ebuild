# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Virtual for replacing pyasn1-modules with pysnmp-pyasn1-modules"
HOMEPAGE="https://github.com/pysnmp/pyasn1-modules https://pypi.org/project/pysnmp-pyasn1-modules/"
LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86 ~amd64-linux ~x86-linux"
RDEPEND="dev-python/pyasn1-modules[${PYTHON_USEDEP}]"
