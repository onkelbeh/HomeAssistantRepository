# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1

DESCRIPTION="A library that handling with ffmpeg for home-assistant"
HOMEPAGE="https://github.com/home-assistant-libs/ha-ffmpeg https://pypi.org/project/ha-ffmpeg/"
SRC_URI="https://github.com/home-assistant-libs/${PN}/archive/refs/tags/${PV}.tar.gz -> ${PV}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
RESTRICT="test"

DOCS="README.md"

RDEPEND="dev-python/async-timeout[${PYTHON_USEDEP}]
	media-video/ffmpeg"
