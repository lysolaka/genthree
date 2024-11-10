# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517="setuptools"
PYPI_PN="PyMsgBox"
inherit pypi distutils-r1

DESCRIPTION="Simple, cross-platform, pure Python module to display message \
	boxes, and just message boxes"
HOMEPAGE="https://github.com/asweigart/pymsgbox"
SRC_URI="$(pypi_sdist_url --no-normalize)"

S="${WORKDIR}/${PYPI_PN}-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

distutils_enable_tests "unittest"
