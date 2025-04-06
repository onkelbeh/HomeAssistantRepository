# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="An LTS port of Python's audioop module"
HOMEPAGE="
	https://pypi.org/project/audioop-lts/
"

LICENSE="PSF-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

