# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1
MY_PN=${PN//-/_}

if [[ ${PV} == *9999* ]]; then
	inherit git-r3

	EGIT_REPO_URI="https://github.com/home-assistant/frontend.git"
	EGIT_BRANCH="dev"
	S="${WORKDIR}/home-assistant-frontend-9999/"
else
	MY_PV=${PV/_beta/b}
	MY_P=${MY_PN}-${MY_PV}
	SRC_URI="https://github.com/home-assistant/frontend/releases/download/${MY_PV}/${MY_PN}-${MY_PV}.tar.gz -> ${P}-artifacts.gh.tar.gz"
	S="${WORKDIR}/${MY_PN}-${PV}"
fi

DESCRIPTION="The Home Assistant frontend"
HOMEPAGE="https://github.com/home-assistant/frontend https://pypi.org/project/home-assistant-frontend/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"
DOCS="README.md"
RDEPEND="~dev-python/user-agents-2.0[${PYTHON_USEDEP}]"
