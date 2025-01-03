Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C480CC02186
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDtsHGaEwCtDkFA1stfJdOl32klazJZD09NMeLLzJVo=; b=NhLPZ2cjg1LCtbD/skBeHHsCfk
	eOk3pKuTjXKBsukJmd1SGP9Bysk2DxfSYS33FbSf6xdNSBjdKgCwRYGNOHkpUjmjO5FBRT7nX6QYS
	vDY87Ma+EjbWGk6Jv6Y4waVsAILSWuk0YsJIzr04IlUPW0YdxFSoFbLlL9McaVZQS0NFjQi2yGd3u
	ojYzT9aGkhOHZjyuQVhgojje/cLxgzNzDUaMu/kAM3q1mSskIO4x27qeYHkBjifDXXb7sL8uaP80e
	wdfnjyj1JAocxygK/80jDWzK431KNWc/pjk3fZpk18+8W6BuzThBV5OQ2BRlBwsIPoECJYxAnUsXl
	Qluq1whQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD30-0000000F5Vq-2GsQ;
	Fri, 10 Jan 2025 11:19:26 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTeVq-0000000CgEz-0gQY
	for linux-i3c@lists.infradead.org;
	Fri, 03 Jan 2025 10:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=NUMw
	HtNan+TxpgJjkQKR7rfLku7RbwxkAScy6YXapl4=; b=lSmi9E/lpme3wFYe0E4U
	0jNjl7GUxc/8hlBI3bNo6zE+KMFkvdV9km7KTsmIDtgkJqJuE1luCeHGVfRrCGwn
	5Vqr96MqY2CnlUyVCpXxasDotZv7pETPs+xgqwU0dkjtOdsCugZdeBQmz/mW0UWH
	7pjusz65iq1Po9ir23nSnXwT6PLdxIi3+rgOa89OihFMo1RCrtF9bsSqddFJ9rQI
	FVwWq4h+/X7VwrFH6iGYPSutZsLlw0C0na1FBZiS1MyRkt6GZ1Ti2IGbMUZHQdYH
	DT9jnLSJZVLd0gVmjYXPA9bohVYWQ5FZxQVmZcNg3jqQmJ7VQvPPBZnY1q/w6TG3
	Mg==
Received: (qmail 863052 invoked from network); 3 Jan 2025 11:02:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jan 2025 11:02:31 +0100
X-UD-Smtp-Session: l3s3148p1@VFV8YMoqeuEgAwDPXw20AOMQ2KO98fSH
Date: Fri, 3 Jan 2025 11:02:30 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RFT v2 4/5] i3c: mipi-i3c-hci: use get_parity8 helper
 instead of open coding it
Message-ID: <Z3e1tuAR5GsEhYLz@shikoro>
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
MIME-Version: 1.0
In-Reply-To: <20250102185109.0862cae6@dsl-u17-10>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_020239_061712_7F17842D 
X-CRM114-Status: GOOD (  11.48  )
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
Content-Type: multipart/mixed; boundary="===============5133492889668960021=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============5133492889668960021==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XkLW/A6lvfQrGhmi"
Content-Disposition: inline


--XkLW/A6lvfQrGhmi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > > -		  (dynaddr_parity(address) ? DAT_0_DYNADDR_PARITY : 0);
> > > > +		  (parity8(address) ? 0 : DAT_0_DYNADDR_PARITY); =20

=2E..

> The old code is:
> > -static inline bool dynaddr_parity(unsigned int addr)
> > -{
> > -	addr |=3D 1 << 7;
> > -	addr +=3D addr >> 4;
> > -	addr +=3D addr >> 2;
> > -	addr +=3D addr >> 1;
> > -	return (addr & 1);
> > -}
>=20
> So:
> 1) it always sets 0x80.

Right, this is why the arguments of the ternary operator above are
exchanged. The old function was basically 'is_odd'.

> 2) it uses addition not exclusive or.

True, but it will work nonetheless because we are only interested in bit
0 of the result. For one bit, XOR and addition are interchangable. The
overflow to other bits is not important.

> So just not the same definition of 'parity'.

I think it is. I mean, I3C wants odd parity, otherwise it will not work.
And Jarkko kindly confirmed it still works.


--XkLW/A6lvfQrGhmi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd3tbMACgkQFA3kzBSg
KbYNeg/+PNb2KMDMP0ewXl/IwD1G7mkS7bO+bTs1JpnpLpZvEoq5U1mCOIj72NpH
Oy7GqlMS6dsy9nQ59V0Mhsh9ggSKUqcE52xmT2Vg6hmk2yAp4V45MWSNxpvxGMNU
Q7PAj+Wad7haeb2EQNIuTRTYfVwbGu6wBH4jmeTji8uoW5g6IfsDlQHpw8kkOTuq
a27m135CELE18toAlUNzsxKRjafEP+y4af+mvJQ30D+sz6pR7UybKT729c0tYfc5
clrmZ/4G8OWtaaNvqHwTYynEj65x0KaJur/F2pyohX9Z93WHLrxA7n3ChP89bYv3
clJGwaUxzT1DPpUBpFeIOjRlYMV3AHPSOMI2NCvjcM6YGLEvSjXJ84pm+67up/Qc
FevD72MQ1SJua4x1P7eIxs2xivQ7IaqXaOSsisUmAmXSjnQhbDFbeHd14d+pCRN0
Z+/oP1dpB2gkYzlo2mDazhnan+caHoXqIj7ljUDLOLVDmZ6VQQ1M5MlisIdg/7zH
Kdjla22TaiS6oRJ2qKpVJge++MZLr5h96kdrC1jcr+PSn+NwiOie//u1cOk9lOdr
4pNGZHYY8MQxLaHlu9+OWrjCUNQSqeoV3cq/X12TE10xYWzUrsHycoKAgQa+O6AA
FiuPqiiQtOFLxVmHt7JjvoHxvwzrpgB+CJZ6ewXXPBjx1Id53U0=
=Lanw
-----END PGP SIGNATURE-----

--XkLW/A6lvfQrGhmi--


--===============5133492889668960021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============5133492889668960021==--

