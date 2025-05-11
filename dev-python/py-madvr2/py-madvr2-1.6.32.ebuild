# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A package to control MadVR Envy over IP"
HOMEPAGE="https://github.com/iloveicedgreentea/py-madvr https://pypi.org/project/py-madvr2/"
PATCHES="${FILESDIR}/${PN}-fix-setup-py.patch"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"
