# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Update Cloudflare DNS A-records."
HOMEPAGE="https://github.com/ludeeus/pycfdns https://pypi.org/project/pycfdns/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.8[${PYTHON_USEDEP}]"
distutils_enable_tests pytest

src_prepare() {
	# remove unsupported dynamic-versioning
	sed 's/"0"/"${PV}"/g' -i pyproject.toml || die
	eapply_user
}
