# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN=${PN/-/_}
MY_P=${MY_PN}-${PV}
PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="A Python library for interacting with Google Assistant API via text"
HOMEPAGE="https://github.com/tronikos/gassist_text https://pypi.org/project/gassist-text/"
SRC_URI="https://github.com/tronikos/${MY_PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE=""

DOCS="README.md"

BDEPEND="
	dev-python/google-auth
	dev-python/grpcio
	dev-python/protobuf-python
	dev-python/requests
	"
S="${WORKDIR}/${MY_P}"

distutils_enable_tests pytest

src_configure() {
    cat > pyproject.toml <<-EOF || die
        [build-system]
        requires = ["setuptools"]
        build-backend = "setuptools.build_meta"
EOF
}
