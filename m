Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022BFC8303C
	for <linux-i3c@archiver.kernel.org>; Wed,  2 Jul 2025 22:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYH1gHsmyWLVc3usaRvZHmt1Zq4Huo9kCMOq9q8/jNE=; b=VVEVuA2BmWBGJpWBRScQTkyDBk
	ViGybpOw8SKFkFRipzFlGB7iENmIvwlVRu4XeIEgFa4EUucQXldg5vHNpkSuMO4ZLq690WCyHqjlF
	dr7y7re/usUNwzhIe4+svPENCgCxH+iJDlKuPpdVQ1k+uWTohfcykL+utc/hmliUtkkaBpKoCcgFt
	jfFJrzeT5IaDUhBzgHcnzP0HUn03/oN9XpcspIeAx8hgTexYhwNwesqVBTz/PFLldVax3nrITyVLG
	fSN05n/VO42Ix2InZM7XmxVyfjXHLsYwXWkivD2AIYm2jsNik0iriY+uOomoPn11MqxUAXj0L+oFe
	P4ORP1fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5bR-00000009f4w-2r74;
	Wed, 02 Jul 2025 22:06:53 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTnEo-00000003sRu-2TRq
	for linux-i3c@lists.infradead.org;
	Mon, 23 Jun 2025 19:53:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=cH7K
	nOxBUZBuXKRnPPy6pTRvR1h8NRqONwt2Cqt9QcU=; b=hnBYidR3z8bVpw3W3ITm
	iRoMGrhyxIAoMbVAKhZENg7BWH4XHMh3WLGRX5erN29zvegArWhW9uJVGd1z/+eb
	XnltWc4IDAmhZHymuP+5nFu8qJd1mvw0h8GAWUqlT9sWDedHFyiAKFt0DCGh1RDj
	Wd3jQxsCr4aSA3zJVSxBNFoZg6NXrvl6PHXd/j5C5VC41EfUe4V2tyWHafsp4ZZy
	rUZeC8V5aIT51KrkEnTETO8yHHho0ZYBAOGbUGNM5t8JVycrOBSPuDvx61QtK55e
	pg9KScMY/y/RtZN4s3OCkV/pyETt9V3nBqzq43GclmSSLd1s2NkHU39Wop4Vdz3E
	zg==
Received: (qmail 3961359 invoked from network); 23 Jun 2025 21:53:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jun 2025 21:53:50 +0200
X-UD-Smtp-Session: l3s3148p1@O6QRkkI4iIlb5ybD
Date: Mon, 23 Jun 2025 21:53:44 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i3c: master: Add inline i3c_readl_fifo() and
 i3c_writel_fifo()
Message-ID: <aFmwyJ4W30PM_sCM@shikoro>
References: <20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com>
 <20250622-i3c-writesl-readsl-v2-1-2afd34ec6306@analog.com>
MIME-Version: 1.0
In-Reply-To: <20250622-i3c-writesl-readsl-v2-1-2afd34ec6306@analog.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_125355_490767_C8EE9287 
X-CRM114-Status: GOOD (  11.31  )
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
Content-Type: multipart/mixed; boundary="===============1400029543593950372=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============1400029543593950372==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FBNJcydYAuSpbMsr"
Content-Disposition: inline


--FBNJcydYAuSpbMsr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 11:18:58AM +0200, Jorge Marques wrote:
> The i3c abstraction excepts u8 buffers, but some controllers have a bus
> width of 32-bits and don't support flagging valid bytes, so it is
> required to read/write long words and to use memcpy on the remainder of
> the number of bytes by 32-bits to not write/read outside the buffer
> bounds.
>=20
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>

Despite Frank's valid comments, I tested this code with the Renesas
driver and it worked so far. Thanks!

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--FBNJcydYAuSpbMsr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhZsMQACgkQFA3kzBSg
KbbQfQ//WpaA79hddaYGwP6aWouZRwirdT5xvdHalNjViR7/uStFd350FW21CnQ8
PGotjCka2Wq7tQWJZQfwjktRdv0xdx0Yz2T9menTE40WKOL5hEHZnjc9jXPfjxQy
fBLZsPAV8MmUuxzykRX2YxQlW7n0G1ZYySPSAH0Qa7oC/7ToJqnzVUjcz/RGQasA
ef6J1GUVAXTT5y4Xmrt87PS4bmn9bDW30uC6UKUV0x8UydANSsQRKvZOSPlOGrL3
PW57AhpQqSb6SI0j+hpyx/MaaMHkLFpnBFcHjzl/ZlrmdUWC9XN0lnZNuo6gtLSQ
WF3/5bchlG9AydeeCeiwuvTLXOygvs/+EO7hRFhUUnC80FvTTV2CzQL/PPXJbgAr
n+MMKEYmFT7QCKe42P52G/laIJV15BBzi1qcmNQEcYf8kiH92OSrPOORaBpldsWS
99Fyrh37I1o//NOquOYsHf9WtSS6332y1zYg14ExVLipwSC+cyf5oc7LQRmd/419
7EbGXDjb1vvlTBCnFkc9rXTmo6DkJxPQ0cZaBotuN0eWwzZVcI0F57baQp6tFtYw
vp+NYgvaxOFp8Nn21VoyGK1oh4Z6hPON/A+gHDjkLjAJixcCYPGhXTz/6jiQ2Zkf
/i1BqKtynKSaYvOqA3f/dFuFWVGm1rHXefU90VDKZA3Sww4Ak8E=
=x+Sz
-----END PGP SIGNATURE-----

--FBNJcydYAuSpbMsr--


--===============1400029543593950372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============1400029543593950372==--

