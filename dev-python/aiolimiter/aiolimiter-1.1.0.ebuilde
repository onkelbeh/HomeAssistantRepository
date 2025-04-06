# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="asyncio rate limiter, a leaky bucket implementation"
HOMEPAGE="https://github.com/mjpieters/aiolimiter https://pypi.org/project/aiolimiter/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

src_prepare() {
	remove uneccesary include
	sed "16d" -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest
