# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
SRC_URI="$(pypi_wheel_url)"
S=${WORKDIR}

DESCRIPTION="Refoss to support for Home Assistant"
HOMEPAGE="https://github.com/ashionky/refoss_ha https://pypi.org/project/refoss-ha/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" "${DISTDIR}/${P/-/_}-py3-none-any.whl"
}
