# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Small python lib to create quickly daemons which interact with HomeAssistant through MQTT."
HOMEPAGE="https://gitlab.com/ttblt-oss/hass/mqtt-hass-base https://pypi.org/project/mqtt-hass-base/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
#IUSE="test"
#RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	~dev-python/aiomqtt-2.0.0[${PYTHON_USEDEP}]
	dev-python/paho-mqtt[${PYTHON_USEDEP}]
	|| ( app-misc/homeassistant-min[mqtt,${PYTHON_USEDEP}] app-misc/homeassistant[mqtt,${PYTHON_USEDEP}] app-misc/homeassistant-full[mqtt,${PYTHON_USEDEP}] )
"

#BDEPEND="
#	test? (
#		dev-python/aioresponses[${PYTHON_USEDEP}]
#		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
#		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
#		dev-python/pytest-cov[${PYTHON_USEDEP}]
#		dev-python/pytest-timeout[${PYTHON_USEDEP}]
#	)"

PATCHES=("${FILESDIR}/${PN}-aiomqtt-2.0.0.patch")

src_prepare() {
	# remove dynamic stuff and force version
	sed 's/dynamic = \[.*\]/version = \"'${PV}'\"/g' -i pyproject.toml || die
	sed 's/, "setuptools-git-versioning<2"//g' -i pyproject.toml || die
	distutils-r1_src_prepare
}

distutils_enable_tests pytest
