# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Kubler eselect module"
HOMEPAGE="https://github.com/lysolaka/eselect-kubler"

inherit vcs-snapshot
EGIT_COMMIT="2214f58"
SRC_URI="https://github.com/lysolaka/eselect-kubler/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="app-admin/eselect
|| ( =app-containers/kubler-0.9.10a =app-containers/kubler-0.9.10b )"

src_install() {
	insinto /usr/share/eselect/modules/
	doins kubler.eselect
}
