# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1 pypi

DESCRIPTION="Distributed testing and loop-on-failing modes"
HOMEPAGE="
	https://pypi.org/project/pytest-xdist/
	https://github.com/pytest-dev/pytest-xdist/
"

SLOT="0"
LICENSE="MIT"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	dev-python/execnet[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	>=dev-python/pytest-6.2.0[${PYTHON_USEDEP}]
"

BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/filelock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	# disable autoloading plugins in nested pytest calls
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	# since we disabled autoloading, force loading necessary plugins
	local -x PYTEST_PLUGINS=xdist.plugin,xdist.looponfail

	epytest
}
