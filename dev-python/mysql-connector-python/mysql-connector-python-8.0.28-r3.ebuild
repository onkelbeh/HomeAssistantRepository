# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Python client library for MariaDB/MySQL"
HOMEPAGE="https://dev.mysql.com/downloads/connector/python/"
SRC_URI="https://github.com/mysql/mysql-connector-python/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

KEYWORDS="amd64 arm arm64 x86"
LICENSE="GPL-2"
SLOT="0"
IUSE="examples test"

BDEPEND=">=dev-libs/protobuf-3.6.1"

RDEPEND="
	>=dev-db/mysql-connector-c-8.0
	>=dev-python/protobuf-3.6.1[${PYTHON_USEDEP}]
	dev-python/dnspython[${PYTHON_USEDEP}]
"
# tests/mysqld.py does not like MariaDB version strings.
# See the regex MySQLServerBase._get_version.
DEPEND="${RDEPEND} test? ( virtual/mysql[server(+)] )"

# Tests currently fail.
# mysql.connector.errors.DatabaseError: 1300 (HY000): Invalid utf8 character string: ''
RESTRICT="test"

DOCS=( README.txt CHANGES.txt README.rst )

python_test() {
	"${EPYTHON}" unittests.py --with-mysql="${EPREFIX}/usr" --unix-socket="${T}" --mysql-topdir="${T}"
}

# Yeah, this is really broken, but the extension will only build this way during "install"
python_install() {
	distutils-r1_python_install \
		--with-mysql-capi="${EPREFIX}/usr" \
		--with-protobuf-include-dir="${EPREFIX}/usr/include/google/protobuf/" \
		--with-protobuf-lib-dir="${EPREFIX}/usr/$(get_libdir)" \
		--with-protoc="${EPREFIX}/usr/bin/protoc"
}

python_install_all() {
	distutils-r1_python_install_all
	if use examples ; then
		dodoc -r examples
	fi
}
