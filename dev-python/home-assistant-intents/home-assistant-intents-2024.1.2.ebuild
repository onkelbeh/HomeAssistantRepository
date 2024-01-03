# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Intents for Home Assistant"
HOMEPAGE="https://github.com/home-assistant/intents https://pypi.org/project/home-assistant-intents/"
SRC_URI="$(pypi_wheel_url home_assistant_intents)"
S=${WORKDIR}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="~dev-python/hassil-1.5.1[${PYTHON_USEDEP}]
	~dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}]
	~dev-python/voluptuous-0.13.1[${PYTHON_USEDEP}]
	~dev-python/regex-2023.12.25[${PYTHON_USEDEP}]
	~dev-python/jinja-3.1.2[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" "${DISTDIR}/$(pypi_wheel_name)"
}
