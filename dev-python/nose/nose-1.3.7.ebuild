# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="nose extends unittest to make testing easier"
HOMEPAGE="https://nose.readthedocs.io/en/latest/ https://pypi.org/project/nose/"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

src_prepare() {
	eapply "${FILESDIR}/nose-wtf.patch"
	eapply_user
}
distutils_enable_tests pytest
