# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit latex-package

DESCRIPTION="Beamer theme for WUST (PWR) presentations"
HOMEPAGE="https://myszka.kmim.wm.pwr.edu.pl/project/beamer"
SRC_URI="http://panamint.kcir.pwr.edu.pl/~ssztuka/devspace/${P}.tar.xz"
S=${WORKDIR}/${PN}

LICENSE="LPPL-1.2"
SLOT="0"
KEYWORDS="amd64"

src_install() {
	latex-package_src_doinstall sty
	insinto "${TEXMF}"/tex/latex/pwr-beamer
	doins Hr_p1.pdf Hr_p3.pdf
	doins *.png
}
