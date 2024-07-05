# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3 python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="Universal Linux Application SDK - Create once. Run everywhere."
HOMEPAGE="https://github.com/Antergos/whither"
SRC_URI="https://github.com/Antergos/whither/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/PyQt5
	=dev-qt/qtwebengine-5.15.14_p20240510"
RDEPEND="${DEPEND}"
BDEPEND=""
