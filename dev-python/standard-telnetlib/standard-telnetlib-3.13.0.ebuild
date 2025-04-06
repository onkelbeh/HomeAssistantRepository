# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="Standard library telnetlib redistribution. 'dead battery'."
HOMEPAGE="
	https://pypi.org/project/standard-telnetlib/
"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

distutils_enable_tests pytest
