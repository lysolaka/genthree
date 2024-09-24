# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A generic, extendable build orchestrator."
HOMEPAGE="https://github.com/edannenberg/kubler"
LICENSE="GPL-2"

inherit bash-completion-r1

inherit vcs-snapshot
EGIT_COMMIT="f74cfd5"
SRC_URI="https://github.com/babykart/kubler/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

KEYWORDS="amd64"
IUSE="+docker podman +rlwrap"
SLOT="fork"

DEPEND=""
RDEPEND="dev-vcs/git
		 app-eselect/eselect-kubler
         docker? ( app-containers/docker app-misc/jq )
         podman? ( app-containers/podman )
         rlwrap? ( app-misc/rlwrap )"

src_install() {
	insinto /usr/share/${PN}/${PN}_fork
	doins -r bin/ cmd/ engine/ lib/ template/ kubler.conf kubler.sh README.md COPYING

	fperms 0755 /usr/share/${PN}/${PN}_fork/kubler.sh
	fperms 0755 /usr/share/${PN}/${PN}_fork/engine/docker/bob-core/build-root.sh
	fperms 0755 /usr/share/${PN}/${PN}_fork/engine/docker/bob-core/portage-git-sync.sh
	fperms 0755 /usr/share/${PN}/${PN}_fork/engine/docker/bob-core/sed-or-die.sh
	fperms 0755 /usr/share/${PN}/${PN}_fork/engine/docker/bob-core/etc/portage/postsync.d/eix
	fperms 0755 /usr/share/${PN}/${PN}_fork/lib/ask.sh

	if [[ ! -e ${EPREFIX}/usr/bin/kubler ]]; then
		dosym /usr/share/${PN}/${PN}_fork/kubler.sh /usr/bin/kubler
	fi

	insinto /etc/
	doins kubler.conf

	if has_version "=app-containers/kubler-0.9.10a"; then
		elog "Bash completions installed for slot a. Ommiting..."
	else
		newbashcomp lib/kubler-completion.bash ${PN}
	fi
}

pkg_postinst() {
	elog
	elog "Kubler's documentation can be found at: "
	elog "/usr/share/kubler/kubler_fork/README.md"
	elog "Installing app-shells/bash-completion is highly recommended!"
	elog
	ewarn
	ewarn "This repo distributes a slotted version of kubler."
	ewarn "More information can be found at:"
	ewarn "https://github.com/lysolaka/eselect-kubler"
	ewarn
}
