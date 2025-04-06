# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="AWS IoT SDK based on the AWS Common Runtime"
HOMEPAGE="https://github.com/aws/aws-iot-device-sdk-python-v2 https://pypi.org/project/awsiotsdk/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="~dev-python/awscrt-0.21.1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
