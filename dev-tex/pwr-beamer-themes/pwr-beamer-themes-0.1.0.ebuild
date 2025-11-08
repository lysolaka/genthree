# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit latex-package

DESCRIPTION="Beamer theme collection for WUST (PWR) presentations"
HOMEPAGE="https://git.kcir.pwr.edu.pl/ssztuka/pwr-beamer-themes"
SRC_URI="http://panamint.kcir.pwr.edu.pl/~ssztuka/devspace/${PN}-v${PV}.tar.gz"
S="${WORKDIR}/${PN}-v${PV}"

LICENSE="LPPL-1.2 GPL-3.0"
SLOT="0"
KEYWORDS="amd64"

src_install() {
	latex-package_src_doinstall sty
	insinto "${TEXMF}/tex/latex/${PN}"
	doins *.pdf
}
