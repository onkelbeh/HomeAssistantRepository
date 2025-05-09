# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Kusto Ingest Client"
HOMEPAGE="https://github.com/Azure/azure-kusto-python https://pypi.org/project/azure-kusto-ingest/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

#DOCS="README.md"

RDEPEND="~dev-python/azure-kusto-data-${PV}[${PYTHON_USEDEP}]
	>=dev-python/azure-storage-blob-12[${PYTHON_USEDEP}]
	>=dev-python/azure-storage-queue-12[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.0.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

src_prepare() {
	sed -i -e '/namespace_packages/d' setup.py || die
	distutils-r1_src_prepare
}
