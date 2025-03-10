# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="HTTP client/server for asyncio"
HOMEPAGE="
	https://github.com/aio-libs/aiohttp/
	https://pypi.org/project/aiohttp/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test-rust speedups"

RDEPEND="
	>=dev-python/aiohappyeyeballs-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/aiosignal-1.1.2[${PYTHON_USEDEP}]
	>=dev-python/attrs-17.3.0[${PYTHON_USEDEP}]
	dev-python/brotlicffi[${PYTHON_USEDEP}]
	>=dev-python/frozenlist-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/multidict-4.5.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		<dev-python/async-timeout-5[${PYTHON_USEDEP}]
		>=dev-python/async-timeout-4.0[${PYTHON_USEDEP}]
	' 3.10)
	speedups? (
		>=dev-python/aiodns-3.2.0[${PYTHON_USEDEP}]
		dev-python/brotlipy[${PYTHON_USEDEP}]
		dev-python/brotlicffi[${PYTHON_USEDEP}]
		)
"
BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	test? (
		dev-python/freezegun[${PYTHON_USEDEP}]
		www-servers/gunicorn[${PYTHON_USEDEP}]
		dev-python/pytest-forked[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/re-assert[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/time-machine[${PYTHON_USEDEP}]
		' 'python3*')
		test-rust? (
			dev-python/trustme[${PYTHON_USEDEP}]
		)
	)
"

DOCS=( CHANGES.rst CONTRIBUTORS.txt README.rst )

EPYTEST_XDIST=1
distutils_enable_tests pytest

src_prepare() {
	# increase the timeout a little
	sed -e '/abs=/s/0.001/0.01/' -i tests/test_helpers.py || die
	# xfail_strict fails on py3.10
	sed -i -e '/--cov/d' -e '/xfail_strict/d' setup.cfg || die
	sed -i -e 's:-Werror::' Makefile || die

	distutils-r1_src_prepare
}

python_configure_all() {
	# workaround missing files
	mkdir tools || die
	> requirements/cython.txt || die
	> tools/gen.py || die
	chmod +x tools/gen.py || die
	# force rehashing first
	emake requirements/.hash/cython.txt.hash
	> .update-pip || die
	> .install-cython || die
	emake cythonize
}

python_test() {
	local EPYTEST_IGNORE=(
		# proxy is not packaged
		tests/test_proxy_functional.py
		# python_on_whales is not packaged
		tests/autobahn/test_autobahn.py
	)

	local EPYTEST_DESELECT=(
		# Internet
		tests/test_client_session.py::test_client_session_timeout_zero
		# broken by irrelevant deprecation warnings
		tests/test_circular_imports.py::test_no_warnings
		# TODO
		tests/test_client_session.py::test_request_tracing_url_params
		# fragile timing test
		tests/test_imports.py::test_import_time
		# crash in time-machine
		# https://github.com/aio-libs/aiohttp/issues/7851
		# https://github.com/adamchainz/time-machine/issues/403
		tests/test_cookiejar.py::TestCookieJarSafe::test_max_age
	)

	case ${EPYTHON} in
		pypy3)
			# upstream unconditionally blocks building C extensions
			# on PyPy3 but the test suite needs an explicit switch,
			# sigh
			local -x AIOHTTP_NO_EXTENSIONS=1
			;;
	esac

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PYTEST_PLUGINS=pytest_mock,xdist.plugin,pytest_forked
	rm -rf aiohttp || die
	epytest --forked
}
