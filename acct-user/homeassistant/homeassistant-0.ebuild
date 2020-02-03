# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="Home Assistant Program User"
ACCT_USER_ID=-1
ACCT_USER_HOME="/opt/${PN}"
ACCT_USER_HOME_PERMS=0755
ACCT_USER_GROUPS=( ${PN} )
acct-user_add_deps
