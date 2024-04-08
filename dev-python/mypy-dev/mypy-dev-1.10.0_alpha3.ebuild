# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
MY_PV=${PV/_alpha/a}
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Optional static typing for Python"
HOMEPAGE="https://github.com/cdce8p/mypy-dev https://pypi.org/project/mypy-dev/"
SRC_URI="$(pypi_sdist_url --no-normalize "${PN}" "${MY_PV}")"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/packaging[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
