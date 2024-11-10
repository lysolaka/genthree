# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517="setuptools"
inherit pypi distutils-r1

DESCRIPTION="A set of tweening / easing functions implemented in Python"
HOMEPAGE="https://github.com/asweigart/pytweening"
SRC_URI="$(pypi_sdist_url)"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

distutils_enable_tests "unittest"
