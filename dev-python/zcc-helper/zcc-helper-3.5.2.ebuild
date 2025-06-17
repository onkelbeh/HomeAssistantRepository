# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="ZIMI ZCC helper module"
HOMEPAGE="https://pypi.org/project/zcc-helper/ https://bitbucket.org/mark_hannon/zcc/src"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

distutils_enable_tests pytest
