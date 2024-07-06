# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson ninja-utils

BUILD_DIR="${WORKDIR}/${P}/build/"

DESCRIPTION="A modern, visually appealing greeter for LightDM."
HOMEPAGE="https://github.com/Antergos/web-greeter"
SRC_URI="https://github.com/Antergos/web-greeter/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"

KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-libs/dbus-glib-0.112
	>=x11-misc/lightdm-1.32.0[introspection]
	>=x11-libs/libX11-1.8.9
	>=x11-libs/gtk+-3.24.41
	=net-libs/webkit-gtk-2.44.1"
DEPEND="${RDEPEND}"
BDEPEND=">=dev-build/meson-1.1.1"

src_unpack() {
	default
	mv ${WORKDIR}/web-greeter-2.2.5 ${WORKDIR}/lightdm-webkit2-greeter-2.2.5/
}

src_configure() {
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

src_install() {
	eninja DESTDIR=${D} install
}
