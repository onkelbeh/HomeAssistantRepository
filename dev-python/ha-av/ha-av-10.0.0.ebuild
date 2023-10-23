# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
DISTUTILS_EXT=1
inherit distutils-r1 pypi

DESCRIPTION="Pythonic bindings for FFmpeg's libraries."
HOMEPAGE="https://github.com/conda-forge/av-feedstock/
		https://github.com/PyAV-Org/PyAV https://pypi.org/project/ha-av/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
RESTRICT="test"

DOCS="README.md"

RDEPEND="!dev-python/av
	media-video/ffmpeg:=[network]
	dev-python/ha-ffmpeg[${PYTHON_USEDEP}]
	"
BDEPEND="dev-python/cython[${PYTHON_USEDEP}]
	"
