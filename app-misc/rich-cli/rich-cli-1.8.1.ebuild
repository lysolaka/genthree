# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Rich-cli is a command line toolbox for fancy output in the terminal"
HOMEPAGE="https://github.com/Textualize/rich-cli"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/rich-12.4.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.2.1[${PYTHON_USEDEP}]
	>=dev-python/textual-0.1.7[${PYTHON_USEDEP}]
	<dev-python/textual-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/rich-rst-1.1.7[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

distutils_enable_tests "import-check"
