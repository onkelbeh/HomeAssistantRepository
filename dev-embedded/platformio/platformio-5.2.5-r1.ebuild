# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1 udev

DESCRIPTION="A professional collaborative platform for embedded development. Cross-platform IDE and Unified Debugger."
HOMEPAGE="https://platformio.org https://github.com/platformio/platformio-core/ https://pypi.org/project/platformio/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND=">=dev-python/aiofiles-0.8.0[${PYTHON_USEDEP}]
	dev-python/ajsonrpc[${PYTHON_USEDEP}]
	>=dev-python/bottle-0.12[${PYTHON_USEDEP}]
	<dev-python/bottle-0.13[${PYTHON_USEDEP}]
	>=dev-python/click-8.0.3[${PYTHON_USEDEP}]
	<dev-python/click-9[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	>=dev-python/pyelftools-0.27[${PYTHON_USEDEP}]
	<dev-python/pyelftools-1[${PYTHON_USEDEP}]
	>=dev-python/pyserial-3[${PYTHON_USEDEP}]
	<dev-python/pyserial-4[${PYTHON_USEDEP}]
	>=dev-python/requests-2.4[${PYTHON_USEDEP}]
	<dev-python/requests-3[${PYTHON_USEDEP}]
	>=dev-python/semantic_version-2.9.0[${PYTHON_USEDEP}]
	<dev-python/semantic_version-3[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.8.3[${PYTHON_USEDEP}]
	<dev-python/tabulate-1[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-2.20.5[${PYTHON_USEDEP}]
	~dev-python/starlette-0.18.0[${PYTHON_USEDEP}]
	~dev-python/uvicorn-0.17.6[${PYTHON_USEDEP}]
	dev-python/wsproto[${PYTHON_USEDEP}]
	>=dev-python/python-zeroconf-0.38[${PYTHON_USEDEP}]
	virtual/udev"
DEPEND="virtual/udev"
BDEPEND="test? ( dev-python/jsondiff[${PYTHON_USEDEP}] )"

# This list could be refined a bit to have individual tests which need network
# (within EPYTEST_DESELECT) but so many need it that it doesn't seem worth it right now.
EPYTEST_IGNORE=(
	# Requires network access
	tests/test_builder.py
	tests/package/test_manager.py
	tests/package/test_manifest.py
	tests/commands/test_platform.py
	tests/commands/test_test.py
	tests/commands/test_ci.py
	tests/commands/test_init.py
	tests/commands/test_lib.py
	tests/commands/test_lib_complex.py
	tests/commands/test_boards.py
	tests/commands/test_check.py
	tests/test_ino2cpp.py
	tests/test_maintenance.py
	tests/test_misc.py
)

distutils_enable_tests pytest

src_prepare() {
	sed "s/zeroconf==0.38.\*/zeroconf/g" -i setup.py || die
	sed "s/wsproto==1.0.\*/wsproto/g" -i setup.py || die
	sed "s/semantic_version==2.9.\*/semantic_version/g" -i setup.py || die
	eapply_user
}

src_install() {
	distutils-r1_src_install
	udev_dorules scripts/99-platformio-udev.rules
}
