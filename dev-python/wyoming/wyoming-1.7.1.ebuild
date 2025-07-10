# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=standalone
inherit distutils-r1 pypi

DESCRIPTION="Protocol for Rhasspy Voice Assistant"
HOMEPAGE="https://github.com/OHF-voice/wyoming https://pypi.org/project/wyoming/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
