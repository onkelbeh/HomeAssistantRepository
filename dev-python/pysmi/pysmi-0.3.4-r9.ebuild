# Copyright 2017-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
DESCRIPTION="Virual for replacing pysmi with pysnmp-pysmi"
HOMEPAGE="https://github.com/pysnmp/pysmi https://pypi.org/project/pysnmp-pysmi/"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
RDEPEND="dev-python/pysnmp-pysmi"
