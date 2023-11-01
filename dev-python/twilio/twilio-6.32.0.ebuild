# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 vcs-snapshot

DESCRIPTION="Helper library for the Twilio API"
HOMEPAGE="https://github.com/twilio/twilio-python https://www.twilio.com/docs/python/install"
SRC_URI="https://github.com/twilio/${PN}-python/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${P}.gh"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

IUSE="test"
RESTRICT="!test? ( test )"

CDEPEND="dev-python/six[${PYTHON_USEDEP}]
		dev-python/httplib2[${PYTHON_USEDEP}]
		dev-python/PySocks[${PYTHON_USEDEP}]"

RDEPEND="${CDEPEND}"
DEPEND="test? (
			${CDEPEND}
		)"

python_test() {
	nosetests tests || die "Tests fail with ${EPYTHON}"
}

distutils_enable_tests pytest
