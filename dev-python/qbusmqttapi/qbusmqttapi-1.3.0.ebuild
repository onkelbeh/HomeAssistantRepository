# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="MQTT API for Qbus Home Automation."
HOMEPAGE="https://pypi.org/project/qbusmqttapi/ https://github.com/Qbus-iot/qbusmqttapi"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	|| ( >=dev-python/mypy-1.13.0[${PYTHON_USEDEP}] >=dev-python/mypy-dev-1.13.0[${PYTHON_USEDEP}] )
	>=dev-python/mypy-extensions-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
