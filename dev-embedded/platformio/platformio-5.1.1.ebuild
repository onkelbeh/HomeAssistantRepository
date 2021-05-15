# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7..9} )
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1

DESCRIPTION="A professional collaborative platform for embedded development. Cross-platform IDE and Unified Debugger. Static Code Analyzer and Remote Unit Testing. Multi-platform and Multi-architecture Build System. Firmware File Explorer and Memory Inspection. IoT, Arduino, CMSIS, ESP-IDF, FreeRTOS, libOpenCM3, mbedOS, Pulp OS, SPL, STM32Cube, Zephyr RTOS, ARM, AVR, Espressif (ESP8266/ESP32), FPGA, MCS-51 (8051), MSP430, Nordic (nRF51/nRF52), NXP i.MX RT, PIC32, RISC-V, STMicroelectronics (STM8/STM32), Teensy"
HOMEPAGE="https://platformio.org https://github.com/platformio/platformio-core/ https://pypi.org/project/platformio/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

BDEPEND="
	$(python_gen_cond_dep '
		dev-python/setuptools[${PYTHON_MULTI_USEDEP}]
	')"
RDEPEND="${DEPEND}
	$(python_gen_cond_dep '
		>dev-python/bottle-0.12[${PYTHON_MULTI_USEDEP}]
		>=dev-python/click-5[${PYTHON_MULTI_USEDEP}]
		<dev-python/click-8[${PYTHON_MULTI_USEDEP}]
		dev-python/colorama[${PYTHON_MULTI_USEDEP}]
		>=dev-python/pyserial-3[${PYTHON_MULTI_USEDEP}]
		<dev-python/pyserial-4[${PYTHON_MULTI_USEDEP}]
		>=dev-python/requests-2.4[${PYTHON_MULTI_USEDEP}]
		>=dev-python/semantic_version-2.8.1[${PYTHON_MULTI_USEDEP}]
		<dev-python/semantic_version-3[${PYTHON_MULTI_USEDEP}]
		>=dev-python/tabulate-0.8.3[${PYTHON_MULTI_USEDEP}]
		<dev-python/tabulate-1[${PYTHON_MULTI_USEDEP}]
		>=dev-python/marshmallow-2.20.5[${PYTHON_MULTI_USEDEP}]
	')"
