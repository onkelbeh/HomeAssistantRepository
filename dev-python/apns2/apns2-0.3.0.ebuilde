# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Interacting with the Apple Push Notification Service via HTTP/2 protocol"
HOMEPAGE="https://github.com/Pr0Ger/PyAPNs2 https://pypi.org/project/apns2/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/pyjwt-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-1.7.2[${PYTHON_USEDEP}]
	>=dev-python/hyper-0.7[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
