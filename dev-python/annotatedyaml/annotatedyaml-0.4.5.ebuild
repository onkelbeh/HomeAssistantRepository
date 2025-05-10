# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Annotated YAML that supports secrets for Python"
HOMEPAGE="https://pypi.org/project/annotatedyaml/ https://github.com/home-assistant-libs/annotatedyaml"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/propcache-0.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.15[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
