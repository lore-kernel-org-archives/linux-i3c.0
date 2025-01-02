Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8AAC02183
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfHl4xp8K6/2Ql8ozhhnY52x7tOHlftbhoFVESM3qPU=; b=jgWBGwj1CK8RfU7gsGQSnvoRCv
	OApvQKZwazJ1FVDApWQVXuLGgFC2wM8RydJcu9j56TSDnghrNLfoQoI/D7miqSAGeBLQ0eZXNDTbf
	bKhb1eGP8V42OwImPhh77NZQvKA3xG3YneSUc9VrbSWUoTma9eiodk+FchgDoLRd4z7ptgaE9YVuf
	CpHY9uDKY8jnNcVO9RZATp+HyrGfD7T5Pst8+rtJExalxi2SWl3plXSoP5/jYfDz81JKiXQMlq2/g
	6dSL+rnhXo1o9AtaezHNvL5s6a+gf4V991dO9iBKzMbbxoUL3G/QQYtSt4QcsuRPoPAwwzuhDx3x7
	qnVTMEHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD2y-0000000F5Sz-2NdL;
	Fri, 10 Jan 2025 11:19:24 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTH8T-0000000A06J-3kr3
	for linux-i3c@lists.infradead.org;
	Thu, 02 Jan 2025 09:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Gs+2
	hPH7cd2bDykXunJcpg5uE8woUThZ9MCwPZZn9t0=; b=RMprv/2byYA06/5TJ6P9
	96Wl8iHffiFp/TG1JP2C8EHmoZFxCaCr4FgK85nw59KiwsjmVlry0nNhPH4hlshe
	oWCo/BlCUx6ttXpMd78kyW4ZGmqA77f8zK7klVgSSwXK8BjSrLPVIAXMd4KXuJU8
	UsbcFnxNC1D+B/cGh4PgBhKE6GcQ6yxrVrph+1o5MdRxmbvtvhkN6ctICoEQWeIf
	kOPDFJiHyZdTPxQVIyl5+skwlx9Oc97RmCWf8q9Oe0qOZhJ5sXjiaH4sDjrZjMe3
	AmLw3supcVDZMTcLkK/JgDHasAHSjd+nPsbvGETlkmCn0dqlzPyUsnnG56IUjWP0
	+g==
Received: (qmail 569827 invoked from network); 2 Jan 2025 10:04:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jan 2025 10:04:56 +0100
X-UD-Smtp-Session: l3s3148p1@TLO3dLUqBJcujnsY
Date: Thu, 2 Jan 2025 10:04:55 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RFT v2 5/5] i3c: cdns: use get_parity8 helper instead of
 open coding it
Message-ID: <Z3ZWt0Whyppr6GKX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20241229101234.2896-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdWSQvyLwHyci+WVtTj4rGeR-hkjw1ap52=5X29ZzVchSA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWSQvyLwHyci+WVtTj4rGeR-hkjw1ap52=5X29ZzVchSA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_010458_208967_BF29480A 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 10 Jan 2025 03:19:21 -0800
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
Content-Type: multipart/mixed; boundary="===============4724946321262800917=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============4724946321262800917==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U50NYcqUFG7jCC2J"
Content-Disposition: inline


--U50NYcqUFG7jCC2J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >         /* RR0[0] =3D ~XOR(addr[6:0]) */
> > -       if (!(hweight8(addr & 0x7f) & 1))
> > -               ret |=3D 1;
> > +       ret |=3D parity8(addr & 0x7f) ? 0 : BIT(0);
>=20
> Perhaps keep the if()-construct, to better match the example in the
> documentation in 1/5?

Can do, don't care super much. I chose this construct because the other
drivers in I3C use the above pattern. You still like the if() better?


--U50NYcqUFG7jCC2J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd2VrcACgkQFA3kzBSg
KbYSfQ/8CfgGrO0RTP7xeBKPxOpWOzkAj6hdyH5myy2b8d9GgHV/vJA2UHBZP0os
BKcPYVCIhNlae+FVmHVsH4RYesj5TGIHnqN9XBDQWV5GRaFtlSnpiB49qgI0EPcg
nZABv4xvqaAF3ZuNIcm1AWoY2Uy6diSmfXcfVQ9uXtCLtaak/fXf6MAB0KWedacL
dTn3paH0hVM+xYTarqVNbkDkKPdPaNzNzA+Vt/63n49A68M2noZ3rTt90FE0Pq7I
ByCE7l7drWUg53KTIRXHGYp4b1wwqdcNqRHfHyoR6bQaa4gObAg45fmJ2y2U0O2K
z3gZYEAKkwsqNmUO8sQyUKptt0CHu1rCXrnazdWwQ7/rJgLfPBtvxQQcv+jGn46c
ZGYsqWiATXGfqPxzQ1NVIckC8Mp/A5KOySK0n3QMiSXNXebK9PNFE029sPWSpqu4
gVNHzNSLonylc+bHuozdu0jX85rVI1KhSQGC/EGprS21AD+7AbDkPlgUmf1b+dbq
lboOCox54EX0Ro4MyZCn9zNB8sRdOiC2hbotiXIbCijY1qzRwQruXn7AdTEdaY2h
Y0T4jIWArdNxCNSFaiVODm9AxvO7BYZMTxD838FVKk4N0PKQDZWngKRlW1NcocSU
TC8p+Km+Z+8tJ2AWS9BIj4QAn31rqmo9A38dJMZZMOp7tb2eGQo=
=8Qzu
-----END PGP SIGNATURE-----

--U50NYcqUFG7jCC2J--


--===============4724946321262800917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============4724946321262800917==--

