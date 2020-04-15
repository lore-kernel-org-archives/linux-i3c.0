Return-Path: <SRS0=g9Ly=57=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EBCC2BA19
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2020 09:47:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C27FC206D9
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2020 09:47:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="npsJ7HPi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C27FC206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ycpMk1E2YzF2NM+0fTCyfLz2bx5FL/kPET7Z2g+YEiM=; b=npsJ7HPiAqvviWuUpeOZBrUfV
	0HzaL8LfIo/KqBk4kBoN7P280vb0wU1YGzdG2i/PQRAj/unXSvnDXic+rKNGlnRs5xlQhKUh8EjzF
	jZpeU+H4JiUTi4T/POSitp6ALyrdmQMD3u4G/RbsYp/JsEQoWDINeg+FH3wTmC7XTZsL/+i0WMPml
	8ntkS4XBvgoxpSRAm8fKcVQa3Bz2soT5/X1kfkNyEn9G/SFkNQvIe+V1xaOe6eNgYLQZ4Q8RzYQGT
	k0wklp0tVFUdVaNUqHoorxm5Hrw4oWHyU0JUCpXIBljeKABSeD4nlFZHMOtpWlaAgUa4or0wRFB3i
	jPGvL5ekQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOedJ-0005oI-Uj; Wed, 15 Apr 2020 09:47:01 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOedH-0005nA-E4
 for linux-i3c@lists.infradead.org; Wed, 15 Apr 2020 09:47:00 +0000
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
 by pokefinder.org (Postfix) with ESMTPSA id 5E9472C1F58;
 Wed, 15 Apr 2020 11:46:57 +0200 (CEST)
Date: Wed, 15 Apr 2020 11:46:57 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Kieran Bingham <kieran@bingham.xyz>
Subject: Re: [RFC PATCH v2 2/6] i2c: allow DT nodes without 'compatible'
Message-ID: <20200415094656.GE1141@ninjato>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-3-wsa+renesas@sang-engineering.com>
 <74aa4084-588f-1b6f-2256-44588c48edf6@bingham.xyz>
MIME-Version: 1.0
In-Reply-To: <74aa4084-588f-1b6f-2256-44588c48edf6@bingham.xyz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_024659_616877_4BA44B1F 
X-CRM114-Status: GOOD (  10.74  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vz@mleia.com>, linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 Luca Ceresoli <luca@lucaceresoli.net>, linux-i3c@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============1406786024054318606=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============1406786024054318606==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SNIs70sCzqvszXB4"
Content-Disposition: inline


--SNIs70sCzqvszXB4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Sometimes, we have unknown devices in a system and still want to block
> > their address. For that, we allow DT nodes with only a 'reg' property.
> > These devices will be bound to the "dummy" driver but with the name
> > "reserved". That way, we can distinguish them and even hand them over to
> > the "dummy" driver later when they are really requested using
> > i2c_new_ancillary_device().
>=20
> Oh how I long to be able to give these 'identifiable names' within the
> system, but that will probably mess up all the driver matching and
> binding, so would be quite tricky perhaps.

I haven't found a way yet to use 'name' to give more meaningful
descriptions to dummies. My best bet so far is to use additional links
in sysfs.


--SNIs70sCzqvszXB4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W2AwACgkQFA3kzBSg
KbZ74Q//XCUnM5Uqs3MGl93+zlEkU9qid076otxKrc7nkRrR4PlkbIAd6KTkD74F
ElytalAQei2cjwYeI6rj6gNh1QgIFn5Fp7VE3cmu/QGVGksVNkPlonP+gjsxbvSp
j+UWFHfi5FxKDgFPdj+0N9UjqsnhLu1zOyAiLw6IXJOSd8uyEX87MWx3Ga60tzwN
QlZ1B/7Yn1Ysg0Xxtxmr1xtBm+9BzJh0zlBbgSvswju+qLzAVVImbT+WeNloVilz
PPoynShY7BhHHxMyPX8cXUYD6z8x2OqCDhPQn4Z+rsnq78Oqx+zLr2k/4RylC1BZ
xSYjqa77r79swX/pn42ycef9pWfuS3tKnja0hFEt3FdIFTW1bJwGDsV1/Q7HFrSL
+z/ZB/+6EP5oHq95lKtWyaUohGSRjZiMTi2l5EuYW6hS5RyYBYMpHWjG22EwfqK/
XiH/cPlD0FpEHem9TeiadOhH7DRKzZziLNLI9bNIL29jzQ3xu2LcPZUHp3zJvXD6
aZoRH7JYWHoyXNrbS/EbPVNW7k4Q1ebgk3oTqz//BUjzqAciLnj6ZMWgqvDGt2ig
XV1SMC20tyS2NlR6gvGt2tj9y3PEnAUJMHJgIXCv9tIvCRUmBsSBO5BRuc3hc5sO
+0+tMY/luasA3dfosRj5qwt46+zTB0YKYMRumDhBKmpFB1K5hvU=
=XY5W
-----END PGP SIGNATURE-----

--SNIs70sCzqvszXB4--


--===============1406786024054318606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============1406786024054318606==--

