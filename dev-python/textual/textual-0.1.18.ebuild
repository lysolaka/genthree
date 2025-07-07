# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
# pulled from Gentoo overlay GURU on 7.07.2025 from:
# dev-python/textual/textual-0.88.1.ebuild
# 7.07.2025 - lysolaka <lysolaka@gmail.com>
# "downbump" to 0.1.18, remove docs leftovers

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 optfeature

DESCRIPTION="Modern Text User Interface framework"
HOMEPAGE="https://github.com/Textualize/textual https://pypi.org/project/textual/"
SRC_URI="https://github.com/Textualize/textual/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/rich-12.3.0[${PYTHON_USEDEP}]
"
BDEPEND=""
DEPEND="${RDEPEND}"

EPYTEST_XDIST=1
EPYTEST_DESELECT=(
	# Those tests ask to press keys
	tests/snapshot_tests/test_snapshots.py
	tests/test_xterm_parser.py::test_escape_sequence_resulting_in_multiple_keypresses

	# Need a package that should be optional
	tests/text_area/test_languages.py
)
distutils_enable_tests pytest
python_test() {
	if [[ ${EPYTHON} == python3.13 ]]; then
		EPYTEST_DESELECT+=(
			# See https://github.com/Textualize/textual/issues/5327
			"tests/text_area"
		)
		epytest -m 'not syntax' tests
	else
		epytest tests
	fi
}

pkg_postinst() {
	optfeature "bindings for python" dev-python/tree-sitter
}
