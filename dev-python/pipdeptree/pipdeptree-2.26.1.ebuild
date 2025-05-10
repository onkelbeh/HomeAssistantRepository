# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi optfeature

DESCRIPTION="Utility for displaying installed packages in a dependency tree"
HOMEPAGE="https://github.com/tox-dev/pipdeptree/ https://pypi.org/project/pipdeptree/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/packaging-24.1[${PYTHON_USEDEP}]
	>=dev-python/pip-24.2[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/hatch-vcs-0.4[${PYTHON_USEDEP}]
	test? (
		dev-python/graphviz[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/virtualenv[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p pytest_mock
}

pkg_postinst() {
	optfeature \
		"visualising the dependency graph with --graph-output" \
		dev-python/graphviz
}
