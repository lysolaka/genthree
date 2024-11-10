# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517="setuptools"
PYPI_PN="PyAutoGUI"
inherit pypi distutils-r1

DESCRIPTION="A cross-platform GUI automation Python module for human beings. \
	Used to programmatically control the mouse & keyboard"
HOMEPAGE="https://github.com/asweigart/pyautogui"
SRC_URI="$(pypi_sdist_url --no-normalize)"

S="${WORKDIR}/${PYPI_PN}-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+screenshot msgbox tweening"

RDEPEND="
	>=dev-python/python-xlib-0.33
	screenshot? (>=dev-python/pyscreeze-1.0.1)
	msgbox? (>=dev-python/pymsgbox-1.0.9)
	tweening? (>=dev-python/pytweening-1.2.0)
"
DEPEND="${RDEPEND}"

distutils_enable_tests "unittest"
