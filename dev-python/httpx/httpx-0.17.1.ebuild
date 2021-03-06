# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1

DESCRIPTION="Fully-featured HTTP client which provides sync and async APIs"
HOMEPAGE="https://github.com/encode/httpx https://pypi.org/project/httpx/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"

RDEPEND="
	dev-python/certifi[${PYTHON_USEDEP}]
	dev-python/sniffio[${PYTHON_USEDEP}]
	<dev-python/httpcore-0.13[${PYTHON_USEDEP}]
	>=dev-python/httpcore-0.12.1[${PYTHON_USEDEP}]
	>=dev-python/rfc3986-1.3[${PYTHON_USEDEP}]
	<dev-python/rfc3986-2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/brotlipy[${PYTHON_USEDEP}]
		dev-python/cryptography[${PYTHON_USEDEP}]
		dev-python/hyper-h2[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/trustme[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_prepare_all() {
	# Require Internet access
	sed -i 's/test_async_proxy_close\|test_sync_proxy_close/_&/' \
		tests/client/test_proxies.py || die
	# trio is not currently in the tree
	sed -i '/^import trio/d' tests/concurrency.py || die
	distutils-r1_python_prepare_all
}
