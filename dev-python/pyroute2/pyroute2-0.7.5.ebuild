# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
PYTHON_REQ_USE="sqlite"

inherit distutils-r1

DESCRIPTION="A pure Python netlink and Linux network configuration library"
HOMEPAGE="https://github.com/svinota/pyroute2"

SRC_URI="https://github.com/svinota/${PN}/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
