# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="The official Python API for ElevenLabs text-to-speech software."
HOMEPAGE="https://colab.research.google.com/gist/flavioschneider/49468d728a816c6538fd2f56b3b50b96/elevenlabs-python.ipynb https://pypi.org/project/elevenlabs/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"
PATCHES="${FILESDIR}/${P}-pyproject-name.patch"
DOCS="README.md"

RDEPEND="
	>=dev-python/httpx-0.21.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-core-2.18.2[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-11.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/python-dateutil[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
