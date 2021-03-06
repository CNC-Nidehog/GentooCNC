# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
ETYPE="sources"
K_SECURITY_UNSUPPORTED="1"
K_DEBLOB_AVAILABLE="0"
inherit kernel-2
detect_version

DESCRIPTION="RTAI patched linux kernel sources"
HOMEPAGE="http://www.kernel.org http://www.rtai.org"

KEYWORDS="~amd64 ~x86"
IUSE="deblob"

if [[ ${ARCH} == "amd64" ]] ; then
	RTAI_ARCH="x86"
else
	RTAI_ARCH=$ARCH
fi

RTAI_PATCH_PN="hal-linux"
RTAI_PATCH_P="${RTAI_PATCH_PN}-3.16-${RTAI_ARCH}-3"

RTAI_PN="rtai"
RTAI_PV="4.1.1"
# RTAI_PV="5.0-test1"
RTAI_P="${RTAI_PN}-${RTAI_PV}"
RTAI_URL="https://www.rtai.org/userfiles/downloads/RTAI/${RTAI_P}.tar.bz2"

SRC_URI="${KERNEL_URI} ${RTAI_URL}"

src_unpack() {
	kernel-2_src_unpack
	cd "${WORKDIR}"
	unpack "${RTAI_P}.tar.bz2"
}

src_prepare() {
#     cd "${S}"
	epatch "${WORKDIR}/${RTAI_P}/base/arch/${RTAI_ARCH}/patches/${RTAI_PATCH_P}.patch"
}
