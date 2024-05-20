# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit bash-completion-r1 distutils-r1 pypi

DESCRIPTION="Add a progress meter to your loops in a second"
HOMEPAGE="
	https://github.com/tqdm/tqdm/
	https://pypi.org/project/tqdm/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="examples"

BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

EPYTEST_IGNORE=(
	# Skip unpredictable performance tests
	tests/tests_perf.py
)

python_install_all() {
	doman tqdm/tqdm.1
	newbashcomp tqdm/completion.sh tqdm
	if use examples; then
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
	distutils-r1_python_install_all
}
