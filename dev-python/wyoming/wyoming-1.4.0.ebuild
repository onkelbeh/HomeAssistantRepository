# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=standalone
inherit distutils-r1 pypi

DESCRIPTION="Protocol for Rhasspy Voice Assistant"
HOMEPAGE="http://github.com/rhasspy/rhasspy3 https://pypi.org/project/wyoming/"
SRC_URI="$(pypi_wheel_url)"
S=${WORKDIR}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

#DOCS="README.md"

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" "${DISTDIR}/${P}-py3-none-any.whl"
}
