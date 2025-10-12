# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit estack

DESCRIPTION="Xtensa ESP toolchain (bin)"
HOMEPAGE="https://github.com/espressif/crosstool-NG"

MY_V=$(ver_cut 0-3)
MY_DATE=$(ver_cut 5-)
MY_PV="${MY_V}_${MY_DATE}"
CROSSTOOL_URL="https://github.com/espressif/crosstool-NG/releases/download"
SRC_URI="${CROSSTOOL_URL}/esp-${MY_PV}/${PN}-${MY_PV}-x86_64-linux-gnu.tar.xz -> ${P}.tar.xz"

S="${WORKDIR}/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="strip"

QA_PREBUILT="opt/* usr/lib*"
QA_PRESTRIPPED="opt/*"

RDEPEND=""
DEPEND="${RDEPEND}"

# taken from dev-embedded/esp-idf::guru
do_install() {
	eshopts_push -s globstar

	into /opt/${1}

	if [[ -d "../${1}/lib" ]]; then
		if stat *.so &>/dev/null; then
		for i in ../${1}/lib/**/*.so*; do
			dolib.so ${i}
		done
		fi

		if stat *.a &>/dev/null; then
		for i in ../${1}/lib/**/*.a*; do
			dolib.a ${i}
		done
		fi

		insinto /opt/${1}/lib
		doins -r ../${1}/lib/*
	fi

	exeinto /opt/${1}/bin
	doexe ../${1}/bin/*
	(
	cd ../${1}
	for i in libexec/**/*; do
		exeinto /opt/${1}/$(dirname ${i})
		if [[ -x "${i}" && ! -d "${i}" ]]; then
			doexe ${i}
		fi
	done

	if [[ -d "include" ]]; then
		insinto /opt/${1}
		doins -r include
	fi

	if [[ -d "share" ]]; then
		insinto /opt/${1}
		doins -r share
	fi
	)

	(
		cd "${D}"/opt/${1}/bin/ || die
		for i in *; do
			dodir /opt/bin
			cd "${D}"/opt/bin || die
			dosym ../${1}/bin/${i} /opt/bin/${i}
		done
	)

	eshopts_pop
}

src_install() {
	do_install xtensa-esp-elf
	do_install xtensa-esp-elf/xtensa-esp-elf
}
