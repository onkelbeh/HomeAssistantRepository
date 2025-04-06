# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Library to communicate with Govee local API"
HOMEPAGE="https://github.com/Galorhallen/govee-local-api https://pypi.org/project/govee-local-api/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

src_prepare() {
	echo "" >> pyproject.toml || die
	echo 'build-backend = "poetry.core.masonry.api"' >> pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest
