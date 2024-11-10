# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517="setuptools"
PYPI_PN="PyScreeze"
inherit pypi distutils-r1

DESCRIPTION="PyScreeze is a simple, cross-platform screenshot module for Python"
HOMEPAGE="https://github.com/asweigart/pyscreeze"
SRC_URI="$(pypi_sdist_url)"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	>=dev-python/python-xlib-0.33
	>=dev-python/pillow-11.0.0-r1[jpeg]
"
DEPEND="${RDEPEND}"

distutils_enable_tests "unittest"
