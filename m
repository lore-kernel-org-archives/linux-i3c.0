Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33766E7719C
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCuegBnSzBildVi9e6C3mxLWBVTqQoaAqBvoEKxDTRc=; b=0UUkOwJgkjQlSbGzCuey5d5b4q
	F6ihvfHD0vqmM1fp2nENkO5BnnpREB66MWSlJ59lktFqZElpd5i8ireMdtTEowItRKguaGXlu8+DU
	atA4shtiIFlD7CttqAhJiMvkd/zYImQ7rvIDt+c9jGteItToGpltkzafsmBfgWd15dmSyhC2FA0LX
	9wWu9N2V/TniY49HZynZucC1ey1pNOVpj8isUdZWI8Irpxzc40yfowm5Af41Smh47W3uIxlaUAC9x
	yqetB5SBWlB6oYMld/IH6yjvoASiBA29ToYTJVo36/6++piUjX5xeRZ/+R1L8LWf1Kk8Vv3tpsPOb
	LccvXFqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD31-0000000F5Xm-3YN2;
	Fri, 10 Jan 2025 11:19:27 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTp2Z-0000000E0TB-3seg
	for linux-i3c@lists.infradead.org;
	Fri, 03 Jan 2025 21:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=lW9q
	216v/MpYpcldJp7rmupZIQwjR4e7csFThX//ud4=; b=ZJxcqJ6tjzbqh6Dc8V9G
	O8kgOEtaxdYpIjK6rdk4J78s5lzivO/BoodISSw4JHHZhdDTwLI7JRXpbaoYpa/e
	VRMnMGrzO8BN+6/oj+EqInpEXTaaiAfZFLEQIryGfIWu9d5f1fGiXv4npzdx+kxO
	/AFuLcGWd2rvQ9db0JMdx0C/NFoJFR3GkDz55JBjWLWo/ZjPSmpu3OuSlBcXafnK
	+de870OwRTrW2dxyz5Ez2JaDDG9BWpND16geNz8K/NIFL6YaPfVORLK/bRdEfGts
	NsQuZrjsNc79hdLN+zE+jkdWBI/P3cNqZzksaT9nsEO3Iv+RUQGFn1jH0tY3rnAn
	Lw==
Received: (qmail 1005039 invoked from network); 3 Jan 2025 22:17:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jan 2025 22:17:03 +0100
X-UD-Smtp-Session: l3s3148p1@ou7UzNMqSpsujntM
Date: Fri, 3 Jan 2025 22:17:02 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RFT v2 4/5] i3c: mipi-i3c-hci: use get_parity8 helper
 instead of open coding it
Message-ID: <Z3hTzvxp-Hzqnlj0@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	David Laight <david.laight.linux@gmail.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20241229101234.2896-5-wsa+renesas@sang-engineering.com>
 <20250101121431.05d831c7@dsl-u17-10>
 <Z3ZV_D5AIUxFR1Bw@shikoro>
 <20250102185109.0862cae6@dsl-u17-10>
 <Z3e1tuAR5GsEhYLz@shikoro>
 <20250103134935.2a341ce0@pumpkin>
MIME-Version: 1.0
In-Reply-To: <20250103134935.2a341ce0@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_131708_892206_9707A282 
X-CRM114-Status: UNSURE (   9.84  )
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
Content-Type: multipart/mixed; boundary="===============3637283853407030768=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============3637283853407030768==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EcPlJkNb456QJKj5"
Content-Disposition: inline


--EcPlJkNb456QJKj5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Right, this is why the arguments of the ternary operator above are
> > exchanged. The old function was basically 'is_odd'.
>=20
> Provided the high bit isn't already set - which it may not be.

Not here. Temporary I3C addresses are in the range 0-0x7f.

> add: 00010001 =3D> xxxx0010 =3D> xx10 =3D> x1
> xor: 00010001 =3D> xxxx0000 =3D> 00xx =3D> x0

This point goes to you :)

> I bet the target isn't checking...

Could be, I can't tell. I don't have this HW.

> So you might be fixing a bug.

Heh, which better argument could one have for a generic implementation.


--EcPlJkNb456QJKj5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd4U8oACgkQFA3kzBSg
Kba2VBAAmBhXzsbbdQpWixvV4lFcW6UgXPdolUdoXYNCvH5vxoem89KEyLTQjit0
HzbKVWbXNb2MpTnBIrukZjB+XV2qacvxYhyXMc9mPx+GyAk/5QnaSvng+n4ycf04
MYwLQcO2003DJLJff1rOUGCeBVWGWgnNS0bII7h/UZlsuBNBtrJcGUk0qq9zPEqy
rqyT2bMK4O10T1+B38ZeVqJTXOX5LsJYjluYk5Szbc31qTfaVBavnOYoqlPONsMs
Ql8TZFeNU6kk8u49yFZej7gQBdGNHhur+eByy7u8emv7XmmA+SIzsvhb72Rc2ut3
+OmB5ZdCsoU8guzZmnoZtX31N5GFA4vHqfqL7edgD4n8fCOYwXze7Z4XJH4jIAmM
HOX1Em1gC+T3YIC4KnVP8+kMWMm+4K+yK9O/AHWeO8LKwMxet1c02y9lA3kjQMmQ
LOL6UVuiTuqPPfNBtYMH8Hq27ivh9ZYPGh51bamR9l0F9ntx0fze4qa+4Wy8z1ZU
0AbB8ldlmKFOuMNUJdQ/+AtE367c/qDRnU81ggpJxOV9dPL8tIzPM4pY1uz9nIEk
9Q6MywuN8kvl9zj2T6j/PqeGR7Gsv/aSsiE28reNJpRGH4lUeD6TCPCkwCSfr96H
lvahmkVIRiJ3CNxfGvuu0rtGcReQDnNp8HPeUSYTb0p+Cs8VQcw=
=sQJU
-----END PGP SIGNATURE-----

--EcPlJkNb456QJKj5--


--===============3637283853407030768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============3637283853407030768==--

