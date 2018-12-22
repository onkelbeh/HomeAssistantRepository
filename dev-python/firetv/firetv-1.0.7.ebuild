# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Communicate with an Amazon Fire TV device via ADB over a network."
HOMEPAGE="https://github.com/happyleavesaoc/python-firetv/"
SRC_URI="https://files.pythonhosted.org/packages/1d/12/e3787d5c8d9096ace333973d7f0a7a4918587ef9fa152819bee98162896c/firetv-1.0.7.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="alpha amd64 ~arm arm64 hppa ~ia64 ~mips ppc ppc64 s390 ~sparc x86 ~amd64-fbsd ~amd64-linux ~x86-linux"
IUSE="test"

DEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
RDEPEND="
	>=dev-python/rsa-4.0[${PYTHON_USEDEP}]
	>=dev-python/adb-homeassistant-1.3.1[${PYTHON_USEDEP}]
	>=dev-python/libusb1-1.7[${PYTHON_USEDEP}]
"

python_test() {
	py.test -v || die "Tests failed under ${EPYTHON}"
}
