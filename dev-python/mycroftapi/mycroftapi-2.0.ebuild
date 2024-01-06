# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="a library to communicate with Mycroft API"
HOMEPAGE="https://github.com/StuartJMackintosh/mycroftapi https://pypi.org/project/mycroftapi/"

LICENSE="all-rights-reserved"

SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test ) mirror"

RDEPEND="dev-python/websocket-client[${PYTHON_USEDEP}]"

src_prepare() {
	sed -i "s/websocket-client==0.44.0/websocket-client/g" -i setup.py || die
	eapply_user
	}

distutils_enable_tests pytest
