# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 optfeature

DESCRIPTION="A minimal low-level HTTP client"
HOMEPAGE="
	https://www.encode.io/httpcore/
	https://github.com/encode/httpcore/
	https://pypi.org/project/httpcore/
"
IUSE="http2 socks trio asyncio"
SRC_URI="
	https://github.com/encode/httpcore/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	dev-python/certifi[${PYTHON_USEDEP}]
	>=dev-python/h11-0.13[${PYTHON_USEDEP}] <dev-python/h11-0.15[${PYTHON_USEDEP}]
	http2? ( >=dev-pyhon/h2-3[${PYTHON_USEDEP}] <dev-pyhon/h2-5[${PYTHON_USEDEP}] )
	socks? ( >=dev-python/sockio-1.0.0[${PYTHON_USEDEP}] <dev-python/sockio-2.0.0[${PYTHON_USEDEP}] )
	trio? ( >=dev-python/trio-0.22[${PYTHON_USEDEP}] <dev-python/trio-0.26[${PYTHON_USEDEP}] )
	asyncio? ( >=dev-python/anyio-4.0.0[${PYTHON_USEDEP}] <dev-python/asyncio-5.0.0[${PYTHON_USEDEP}] )
"
BDEPEND="
	dev-python/hatch-fancy-pypi-readme[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-httpbin[${PYTHON_USEDEP}]
		dev-python/pytest-trio[${PYTHON_USEDEP}]
		dev-python/socksio[${PYTHON_USEDEP}]
		dev-python/trio[${PYTHON_USEDEP}]
		dev-python/trustme[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

pkg_postinst() {
	optfeature "SOCKS support" dev-python/socksio
}
