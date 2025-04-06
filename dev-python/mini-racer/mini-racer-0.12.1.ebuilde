# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=standalone
inherit distutils-r1 pypi

DESCRIPTION="Minimal, modern embedded V8 for Python."
HOMEPAGE="https://github.com/bpcreech/PyMiniRacer https://pypi.org/project/mini-racer"
SRC_URI="$(pypi_wheel_url ${PN} ${PV} py3 none-manylinux_2_31_x86_64)"
S=${WORKDIR}

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="dev-python/httplib2[${PYTHON_USEDEP}]"

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" "${DISTDIR}/${PN/-/_}-${PV}-py3-none-manylinux_2_31_x86_64.whl"
}
