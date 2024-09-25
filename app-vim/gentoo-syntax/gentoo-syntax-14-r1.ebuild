# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="vim plugin: Gentoo and Portage syntax highlighting"
HOMEPAGE="https://github.com/gentoo/gentoo-syntax"
SRC_URI="https://gitweb.gentoo.org/proj/gentoo-syntax.git/snapshot/${P}.tar.bz2"

LICENSE="vim"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	rm "${WORKDIR}/${P}/COPYING"
	rm "${WORKDIR}/${P}/README.rst"
	rm "${WORKDIR}/${P}/Makefile"
	mkdir -p "${D}/usr/share/vim/vimfiles"
	cp -R "${WORKDIR}/${P}/*" "${D}/usr/share/vim/vimfiles/"
}

pkg_postinst() {
	ewarn "The syntax highlighting will not work out of the box on neovim."
	ewarn "To enable it follow the instructions at:"
	ewarn "https://wiki.gentoo.org/wiki/Neovim"
	ewarn "In the section: No syntax highlighting on Gentoo configuration files"
}
