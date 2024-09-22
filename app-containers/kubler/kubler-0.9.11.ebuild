# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A generic, extendable build orchestrator."
HOMEPAGE="https://github.com/babykart/kubler.git"
LICENSE="GPL-2"

inherit bash-completion-r1

inherit vcs-snapshot
EGIT_COMMIT="f74cfd5"
SRC_URI="https://github.com/babykart/kubler/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

KEYWORDS="alpha amd64 arm arm64 ia64 ppc sparc x86"
IUSE="+docker podman +rlwrap"
SLOT="1"

DEPEND=""
RDEPEND="dev-vcs/git
         docker? ( app-containers/docker app-misc/jq )
         podman? ( app-containers/podman )
         rlwrap? ( app-misc/rlwrap )"

src_install() {
	insinto /usr/share/${PN}/${PN}_1
	doins -r bin/ cmd/ engine/ lib/ template/ kubler.conf kubler.sh README.md COPYING

	fperms 0755 /usr/share/${PN}/${PN}_1/kubler.sh
	fperms 0755 /usr/share/${PN}/${PN}_1/engine/docker/bob-core/build-root.sh
	fperms 0755 /usr/share/${PN}/${PN}_1/engine/docker/bob-core/portage-git-sync.sh
	fperms 0755 /usr/share/${PN}/${PN}_1/engine/docker/bob-core/sed-or-die.sh
	fperms 0755 /usr/share/${PN}/${PN}_1/engine/docker/bob-core/etc/portage/postsync.d/eix
	fperms 0755 /usr/share/${PN}/${PN}_1/lib/ask.sh

	dosym /usr/share/${PN}/${PN}_1/kubler.sh /usr/bin/kubler1

	insinto /etc/
	doins kubler.conf

	if has_version "=app-containers/kubler-0.9.10"; then
		#do nothing
		elog "Bash completions already installed for slot 0"
	else
		newbashcomp lib/kubler-completion.bash ${PN}
	fi
}

pkg_postinst() {
	elog
	elog "Kubler's documentation can be found at /usr/share/kubler/kubler_1/README.md"
	elog
	elog "Installing app-shells/bash-completion is highly recommended!"
	elog
}
