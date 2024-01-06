# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Dremel 3D Printer Python Library running on Python 3"
HOMEPAGE="https://github.com/godely/dremel3dpy https://pypi.org/project/dremel3dpy/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/decorator-5.0[${PYTHON_USEDEP}]
	>=dev-python/imageio-2.0[${PYTHON_USEDEP}]
	>=dev-python/imutils-0.5[${PYTHON_USEDEP}]
	>=dev-python/requests-2.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.0[${PYTHON_USEDEP}]
	dev-python/validators[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
