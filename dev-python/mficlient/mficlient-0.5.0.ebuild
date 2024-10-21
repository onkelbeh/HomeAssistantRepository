# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A remote control client for Ubiquiti's mFi system"
HOMEPAGE="https://github.com/kk7ds/mficlient https://pypi.org/project/mficlient/"

LICENSE="MIT"

SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
	)"

src_prepare() {
	echo -ne '\n[build-system]\nrequires = ["poetry>=0.12"]\nbuild-backend = "poetry.masonry.api"\n' >> pyproject.toml  || die
	eapply_user
}

distutils_enable_tests pytest
