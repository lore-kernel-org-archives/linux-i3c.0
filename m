Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F6FE7719F
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0orUg0JYFxf4Enc5BNY6XSkyzzEZYNCgGncQzMh2zM=; b=Sk3BwhDUe/MX0Z7Sx6cB1Y28aK
	dqFQTF5EBR4NHqVZ1/P7aML1XyTqaWZnf/nyLSXDichjIGwbFfII2GDWuPwfbgywqWp2P20GPT26A
	CElj/ohaP+JlrX1RQy3oOwhNlLlmuapn3BEwiwPcvz6d/rFK3e2MgP84fY3mJU4zPlpDzIr6RXBmU
	/+21gYIZLnXLGLQQ12DEJlv4TtVyWdreLEvX9hmuSyPf7UpVeXJsbEvWSpxtn9TS11BOuoBmFGgmJ
	a6tn/gzbTIghWaL4H5hP+gDrQnqOqcEdDr+jiMmvwa3Ca+QhanlSNNgEeH8CvwTe56VWvc1dEfTiS
	T2W+3usw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD2x-0000000F5SH-3fB9;
	Fri, 10 Jan 2025 11:19:23 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTGzc-00000009yr7-21gN
	for linux-i3c@lists.infradead.org;
	Thu, 02 Jan 2025 08:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=wj2q
	kNTrCNfULZcoLbNKl0IaQxdt+Jxn3nPeJQdoml4=; b=EAIh7WLnwSnyuRx9C1sY
	6n52Yx6cUD9E44BVY0yh5b6e4ELQClNWPZtYPwfSGa7LwhpD9R/UKQn6JWXVlXsO
	scxFp8ZdS/8ZLZzl/iP1o+Uar8vJf4R3fUrIDoP/HFhT0g7bnVjcr1t1D7SxYqY1
	hcPS9jj20L2RLdPCXd+x27LfXD0AasCjEDjwyEmewDMNDrC8do6UGwBf69xrkKJ2
	gzOHoxsbnQ3wXL46nFDBrPkX9gZkc62xARrLzk3wVi0nJT9oV94O8f/EuEbkskNy
	k7lEznSwgoLuPyDDs8Ahs+Nr9odEEYIN+4hpsehhkmYnbzNDNU9/JkQghPx/zMxP
	gw==
Received: (qmail 565308 invoked from network); 2 Jan 2025 09:55:42 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jan 2025 09:55:42 +0100
X-UD-Smtp-Session: l3s3148p1@hJy9U7UqZKYujnsY
Date: Thu, 2 Jan 2025 09:55:38 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yury Norov <yury.norov@gmail.com>,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: Re: [PATCH RFT v2 1/5] bitops: add generic parity calculation for u8
Message-ID: <Z3ZUit3usbDSblTb@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	David Laight <david.laight.linux@gmail.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yury Norov <yury.norov@gmail.com>,
	Kuan-Wei Chiu <visitorckw@gmail.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20241229101234.2896-2-wsa+renesas@sang-engineering.com>
 <20241229111129.2602d219@dsl-u17-10>
MIME-Version: 1.0
In-Reply-To: <20241229111129.2602d219@dsl-u17-10>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_005549_401657_5C1DC9BA 
X-CRM114-Status: GOOD (  15.20  )
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
Content-Type: multipart/mixed; boundary="===============5038072243244820650=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============5038072243244820650==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ln6sxa6tLb+g0/hr"
Content-Disposition: inline


--Ln6sxa6tLb+g0/hr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +/**
> > + * parity8 - get the parity of an u8 value
> > + * @value: the value to be examined
> > + *
> > + * Determine the parity of the u8 argument.
> > + *
> > + * Returns:
> > + * 0 for even parity, 1 for odd parity
>=20
> I think I'd return 0x80 for even and 0 for odd.

This would be a very non-intuitive result which makes code more
complicated to read. And increases chances that people get it wrong.

> That just need the 'magic constant' changing and masking with 0x80.

Not all users will have the parity in bit 7, some have it in bit 0, some
have it in a different register even. So, returning 0x80 would be a
micro-optimization for some cases in a code path which is not hot.

> Also rename to parity8_even() - since it returns non-zero for even parity.

The name has been agreed on with the maintainer of bitmap.h already.

> (and I'm sorry, but IMHO 0x80 is better than BIT(7))

No need to feel sorry, but it is really your HO. We have reasons for
switching from 0xXY to BIT() tree-wide. You might want to check commit
messages of such changes.


--Ln6sxa6tLb+g0/hr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd2VIYACgkQFA3kzBSg
KbZ7CBAAh0jlbvTMw6abaiwqbkRGmbqaqId4ldJv/BY6XEMlcfTEkUUYNspV/X46
QiYkmabBEg2I6CvjJAFPimNr7zyU6Ve9mTtx40P6LT5E5o8m+uTgUo/ppB6oQgVJ
p5CgWcTTYdpqVY0yyDt9QpqqrGPYAHWFMv07ynTDcXAieDmD3oL+gaE+HSDWgdlu
9+pXqoSxw+DR66c2v2V07zmpAoaAIAL+9hBVs0x4R2HZMtjvj5Zm4Z2aKBJ+LHrl
86X7jk9fVeQZ5Xmal9mROnpMaOnyRdIZUoM2NzYVF/5FcWyOpTVFvplrvoYKTcdd
6jr6B3qs8O7sTg/eGroPQ5NjDcMko09P/bXK5PjLLQSq6e2dVdpruNq71Zus1n5T
BNQlOzeL4LxGL9oW9jAEo2ISguqUT9PKjQh/639EiU/e8TpL4azbj9hwUnsb6j5D
MrKRbBvvJNab+VV9xzjpATxX7/GtVsCDsdMBKRBv2N+L8T/AVog9ESxiy9hyJRDD
Ln9TlHhDKxKYJjMkNqPy50obWwZmmg7CJRvtUpM43U1UMJRH5Uh5JlFnOuabKmLj
af7BnshmlwzJdLhTpSy96wuDbuMj0HmLF1B+SO4ILuZICo4eUtcSn+phWUORkG4I
m7a98TNxb+EFTrRBaa/AOnBURu5ibs55Hjk0wMVTC5Hrd3cqf8s=
=RPRo
-----END PGP SIGNATURE-----

--Ln6sxa6tLb+g0/hr--


--===============5038072243244820650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============5038072243244820650==--

