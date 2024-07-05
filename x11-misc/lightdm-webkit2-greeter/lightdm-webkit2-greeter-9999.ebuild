# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A modern, visually appealing greeter for LightDM."
HOMEPAGE="https://github.com/Antergos/web-greeter"

EGIT_REPO_URI="https://github.com/Antergos/web-greeter.git"

LICENSE="GPL-3"
SLOT="0"

KEYWORDS="~amd64"

IUSE=""

RDEPEND=">=x11-misc/lightdm-1.32.0-r2[introspection]
	>=dev-python/whither-0.3.2
	>=dev-python/pygobject-3.46.0-r1
	dev-vcs/git"
DEPEND="${RDEPEND}"
BDEPEND=""

src_compile() {
	emake _build_init
	emake build
}

src_install() {
	emake DESTDIR="${D}" install
}
