Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31668C83F03
	for <linux-i3c@archiver.kernel.org>; Wed,  2 Jul 2025 22:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcMqrlrk9GWXBuQGFeUyWnc9vZKftJcyJSuKDZAyTfc=; b=EbA+innJD7lLJMMiFV5rf/KVmV
	AGtSimiYk0AtRejmDlJjeqdXBglJj0mSbLbSSp9PwOdT12mz+l1PuabRcsbTxHGsMYNm+6zugdt+t
	/LThnZPYERK4NOi4jCHVAVyD0zmESkDvbxoyy5UKNmYvfpw/CcRzOiRXFCVxeRnLz3jBhBWFiFNee
	2H+U+71QBZ92gvgbeLkQouhGFDEcokkInkHSbb/147G8JeDy0BXtvht3fSHmgTmOD9h5TWccxfJkX
	01MmrigmCZVS0X0mZ/qNmLNzNMtiFVDVlEVQBEWtzBijXbhk9BGqzglpEbs57HArRKtTZkpFAJ+17
	kL2eSm2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5bR-00000009f52-42pQ;
	Wed, 02 Jul 2025 22:06:53 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAIT-00000006lnB-0wgB
	for linux-i3c@lists.infradead.org;
	Tue, 24 Jun 2025 20:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fjZN
	GDyllQnn8tFdItYnh39YaQXB37rws0UPQyn/t58=; b=IHB1uNfMhk1Wkc0/yjhQ
	LKWipz5+aS4kBEvaw3C0/H63tYRUYzQk2+u+OjLtxMZfePOK88MBNF8We5sYgTOY
	oyP+crlw2wOwXYgK4M0Mivz4eOgPcj4UlEMyKA8WfWzW2TprbPOT4b64rz9lwyIh
	cu81oXzkBpoo3+ewb0luxdihkBpyFqpw6Euaeg9qTSkHJG592XglG+wB0XHROnTb
	wQmDSiCithRRuG0gQEjXnA38hdx3zq76yB9OamG7BrNnDgszMXj+MTnEnEPT559g
	2UXXHtY8BcqwPVf169q9ljA4DuO1xFWOZNYqsKpPCPmMytkC7sVRuieV+uki7UTE
	UA==
Received: (qmail 391406 invoked from network); 24 Jun 2025 22:30:58 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jun 2025 22:30:58 +0200
X-UD-Smtp-Session: l3s3148p1@8Ee7NFc4IK5b5ybD
Date: Tue, 24 Jun 2025 22:30:42 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] i3c: master: Add inline i3c_readl_fifo() and
 i3c_writel_fifo()
Message-ID: <aFsK8sDj7WvIBZvW@shikoro>
References: <20250624-i3c-writesl-readsl-v3-0-63ccf0870f01@analog.com>
 <20250624-i3c-writesl-readsl-v3-1-63ccf0870f01@analog.com>
 <aFrpra9j69OkkMbL@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
In-Reply-To: <aFrpra9j69OkkMbL@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_133114_117373_4857FC9D 
X-CRM114-Status: GOOD (  12.59  )
X-Mailman-Approved-At: Wed, 02 Jul 2025 15:04:02 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4920031827136179837=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============4920031827136179837==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+KvzQyFvaXi022NC"
Content-Disposition: inline


--+KvzQyFvaXi022NC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 02:08:45PM -0400, Frank Li wrote:
> On Tue, Jun 24, 2025 at 11:06:04AM +0200, Jorge Marques wrote:
> > The I3C abstraction expects u8 buffers, but some controllers operate wi=
th
> > a 32-bit bus width FIFO and cannot flag valid bytes individually. To av=
oid
> > reading or writing outside the buffer bounds, use 32-bit accesses where
> > possible and apply memcpy for any remaining bytes
> >
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>=20
> > ---
> >  drivers/i3c/internals.h | 37 +++++++++++++++++++++++++++++++++++++

Is there a reason we don't put this in 'include/linux/i3c/master.h'?
'internals.h' is used for the core only so far, and '#include
<../something.h>' also looks a bit like a layering violation.


--+KvzQyFvaXi022NC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhbCu4ACgkQFA3kzBSg
KbanHA/+KRBtGPAzjnCNvCQGL/q6OOpYG/fRRmtCzXRfY8dS5S+n2YubH0wQWJCs
poMvmKUQIdjfpb0TwS9dE/K3y/wfgWgxa8R64ljVif6mS5S40aC2BJIAa63PaPF/
dhzkGjpvhyeEhDF72eZlLWOUE6e4kGev+qvounSdNuuUQR0HQLjqxhVN1TYtT0vn
3gHgOgrl2PQz56N4IPrw+uql1Z91UBWVr6KSoofEs+m67n/nNg2bOzIzHTh0PQTv
+SNgzV1hN7Gm0rp8KvRreraKHEC4ljxJWsZpxzBSXV7PH9dTyBerwzylVVI+sLWH
Pr9/DxVMmNKJlC68hpedk8L5zTWtokSKx42GmSx1zwBCYHi+CWwhPf+BYzaw0D3i
Xv5wSDuluUaEMWsLWCaYZ5uc1T9XcyIEIPJ4BUAosbTWUpu6+0xIQuEhZsEZ0nqr
FxrzaS538u+sXUR3Lev/oJ8J08FpVeFO0pd0m4YiVuxFngVK0n3w5WyXBhppI5aE
lpcuXpEZZi1+yJhfMmo+LmmL4BeqA2SBMdQ5pGjAoukfxldSfhud/bjjin3uXm83
vnSZN3mFfKu/PufFxfrEgdpv5HRN8EDCn6mwF4sRf6G5ZSA0eSJDy7sX/1412pSB
9GG7ZUT/vX+D0r6PHxBXvOLTSy7Fnp7+Ucvz6dXraR6MjN6VPiM=
=ocWZ
-----END PGP SIGNATURE-----

--+KvzQyFvaXi022NC--


--===============4920031827136179837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============4920031827136179837==--

