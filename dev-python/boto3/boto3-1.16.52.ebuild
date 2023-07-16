# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="The AWS SDK for Python"
HOMEPAGE="https://github.com/boto/boto3"
LICENSE="Apache-2.0"
SLOT="0"

if [[ "${PV}" == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/boto/boto3"
	inherit git-r3
	BOTOCORE_PV=${PV}
else
	SRC_URI="https://github.com/boto/${PN}/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
KEYWORDS="amd64 arm arm64 x86"

	# botocore is x.(y+3).z
	BOTOCORE_PV="$(ver_cut 1).$(( $(ver_cut 2) + 3)).$(ver_cut 3-)"
fi

RDEPEND="
	>=dev-python/botocore-${BOTOCORE_PV}[${PYTHON_USEDEP}]
	>=dev-python/jmespath-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/s3transfer-0.3.0[${PYTHON_USEDEP}]
"

distutils_enable_sphinx docs/source \
	'dev-python/guzzle_sphinx_theme'

python_prepare_all() {
	# don't lock versions to narrow ranges
	sed -e '/botocore/ d' \
		-e '/jmespath/ d' \
		-e '/s3transfer/ d' \
		-i setup.py || die

	# prevent an infinite loop
	rm tests/functional/docs/test_smoke.py || die

	distutils-r1_python_prepare_all
}
