# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="pytest plugin to abort hanging tests"
HOMEPAGE="https://pypi.org/project/pytest-timeout/"

SLOT="0"
LICENSE="MIT"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

# do not rdepend on pytest, it won't be used without it anyway
# pytest-cov used to test compatibility
BDEPEND="
	test? (
		dev-python/pexpect[${PYTHON_USEDEP}]
		!hppa? (
			dev-python/pytest-cov[${PYTHON_USEDEP}]
		)
	)"
