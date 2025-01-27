Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD3EC0218D
	for <linux-i3c@archiver.kernel.org>; Wed, 29 Jan 2025 20:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MlMu8ymF1kjmKmA4UZEQfJVMAO38vFOxWmQWwKQvrMU=; b=mWXiNNx4g64BPPvixXAMMCPEDp
	lpHEIdGqna9Ru5bMSEAJzbYyoDPCtZXWUntqRAaS52osHFBWGLstRgMyIY38sykRZOLrBcJ289XNV
	4X4YPcenQ5iLK8nvA3GCjoT778CUnOGGkPd1FjFXPBs2/jWWj2PWIAQO6q7ihtFplToPNwcxx5FGQ
	oQgBbJ2K72pzwdwCbg6TOWVPYjtobkm7/jK7q5LjFZQbVkrfSidsWK+0F66KR0S7aNdX1eoImbsBK
	nLMz5LIEdkVs4rue0NIJzbH3N4ZVD6YtsL43smzwhRYgtByqq0EHvCxtFCzTTgIDCYRJ0vBmKiX5z
	d8+QG7xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdElu-00000007lQP-3bCk;
	Wed, 29 Jan 2025 20:34:50 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcNHl-00000002DNB-0prZ
	for linux-i3c@lists.infradead.org;
	Mon, 27 Jan 2025 11:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=IFLD
	WEy0w93gL9rOdMlcc5J/OmXkevlT83n3T+1Y06s=; b=ICkJZ3ZS1rrbPzf1n/wv
	UoX2wCzvAi1mX/HV53bzIxj5wXm3EgJPxw4N17wVQptC3RF3eUqRAezY2GdCeo3q
	73pwY1NHoE4Wrvd8kdvznIno/ZwUoyag8G2/7bhD9y463BQSgodH7KFe8iVQhxUA
	4lwq2843AUZUeVXUjBrxfKs2zjg9zd/+ugLlwBOAumbkgACkrd0fiiwxMsKDQA6v
	unqoSxnY9nhwsbh9MfVQ/ra4+c+KNx1pTZBOcK/3kyC6aa/mfIP/KT7nFk7jPa1T
	7k53g2f6BPJkzLlSDcD1rUyHeucMMRmNX6Y6ApYTYYEmwZHgBOA+SU2egpIYGVs7
	NA==
Received: (qmail 217505 invoked from network); 27 Jan 2025 12:28:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jan 2025 12:28:06 +0100
X-UD-Smtp-Session: l3s3148p1@1UTLXq4seu0ujnvm
Date: Mon, 27 Jan 2025 12:28:04 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, linus@ucla.edu
Subject: Re: [PATCH] bitops: use safer link explaining the algorithm
Message-ID: <Z5dtxESPVtg2Ba2J@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yury Norov <yury.norov@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, linus@ucla.edu
References: <20250125130320.38232-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com>
 <Z5Z06WowFspmXby9@thinkpad>
MIME-Version: 1.0
In-Reply-To: <Z5Z06WowFspmXby9@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_032809_517085_8430BCAE 
X-CRM114-Status: GOOD (  16.30  )
X-Mailman-Approved-At: Wed, 29 Jan 2025 12:34:46 -0800
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
Content-Type: multipart/mixed; boundary="===============6001879132616449648=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============6001879132616449648==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zc+KCNiSvVhpUGWZ"
Content-Disposition: inline


--Zc+KCNiSvVhpUGWZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> If you guys feel that you can explain the algorithm you're employing
> in a half-VGA-screen comment, it would be the best choice, and that's
> enough.

I agree that in-kernel would be super-great to have. On the other hand,
I especially liked the *detailed* explanation of different approaches on
this website. Which is helpful for users wondering if they can use the
new generic helper even though the algorithm they want to replace looks
different. Yet, this is not half a VGA-screen.

> If it's impossible or you think that external reference is really needed,
> I trust you. But please refer the original source. In this case, it's:
>=20
>         Warren, H. S. (2013). Hacker=E2=80=99s Delight (2nd ed), page 97.

I decided against this reference. It is a great book, but why pay bucks
when there is freely available information for just this one topic.
Besides, the book is a collection of algorithms and references other
sources for this implementation as well. Maybe as a second reference?

> If you think that pointing to a web-page with nice summary to the topic=
=20
> is helpful - please do. And if you would like to cache the link - I've
> got nothing against it - as soon as you commit to maintain those links
> up-to-date in the kernel sources.

Sure, yet then I would prefer the wayback-machine link and have this
patch accepted.


--Zc+KCNiSvVhpUGWZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeXbcQACgkQFA3kzBSg
Kbb7rBAAmixT4N07kb5ZPvbL/AsjoZXqYdXx6MUbDUA0GDbwuoNCDdLAIpW0xgeA
0yUz/bpen5yjZUNcmRa/FEjMdcnOPx/pFU2MAQwUS4i0IRklBumD5+PC9iSnXEsu
l1J7D98tr54l15GRDFBD2aBz5OAkwXoOxWjpwe27UfJjvnVwJomGvS9UOSqg074p
LhvFWsKgzGBvoQZrUBGeeTIJJqQHKL+KESErPsZOtmlZby0PeKacaN4vYGftgB0q
jSiDbnH8AaP00C74k5mRuWjhPEYH404rs9uiLM7+0o2PPU5P/j5tNI0miNCHiWaW
SwDodivWc59eEVUrz31dwwwlWN9hIRI73Y2OxQamy34/eBtaNSQNEKKFE+3rEfEL
zAicdTxBnncwTmSWtNvGuMlSwA7kzWqIoFQmp54ut8NGcuIPvNUfD3mLG4csvAEY
usZnGJPH2sr501HrgZ7f2XO3zTvczpb86COxfy/bgqEDcF3ef2KRV0Gi4E/C3Jib
EoOj3MskbYiGmKILaQwWbith5Bf4ss72h7QbfhEz0kFNHd95yPPo2djYdDH0lfm7
juUgs1/WeWIxaaBsmYAAPWD4h9MiSwVYsEEOxyMzPbkQhsRCdy4Uf5MMuA59Ogn4
oOe64rP2XmGmUnRVSbGUjmzCePzTY/wPX/cdS/w/YWvFTvAjH3Y=
=khsO
-----END PGP SIGNATURE-----

--Zc+KCNiSvVhpUGWZ--


--===============6001879132616449648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============6001879132616449648==--

