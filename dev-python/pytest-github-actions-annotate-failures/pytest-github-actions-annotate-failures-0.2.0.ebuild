# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="pytest plugin to annotate failed tests with a workflow command for GitHub Actions"
HOMEPAGE="https://github.com/pytest-dev/pytest-github-actions-annotate-failures https://pypi.org/project/pytest-github-actions-annotate-failures/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/packaging[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
