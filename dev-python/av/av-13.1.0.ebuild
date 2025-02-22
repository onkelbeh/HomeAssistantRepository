# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Pythonic bindings for FFmpeg's libraries."
HOMEPAGE="https://github.com/PyAV-Org/PyAV https://pypi.org/project/av/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="!dev-python/ha-av
	>=media-video/ffmpeg-7.0.0
	dev-python/ha-ffmpeg[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
