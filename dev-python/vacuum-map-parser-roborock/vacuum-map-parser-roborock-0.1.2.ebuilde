# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Functionalities for Roborock vacuum map parsing"
HOMEPAGE="https://github.com/PiotrMachowski/Python-package-vacuum-map-parser-roborock https://pypi.org/project/vacuum-map-parser-roborock/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/pillow[${PYTHON_USEDEP}]
	~dev-python/vacuum-map-parser-base-0.1.2[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

src_prepare() {
	# remove unsupported dynamic-versioning plugin
	sed 's/0.0.0/${PV}/g' -i pyproject.toml || die
	eapply_user
}
