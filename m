Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3CCE7719F
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jU6+NDT2XlCLSn/z+pvNa01UlxCB8Jh5XGFYH5P8Puw=; b=zzpTJ2wQyAjKOyhSNYywXRUwX7
	SnM6k5FIUW1a/88349XQ4WCwH78AKYS4gnCYpnu1J/0GiPhFStNRMUOD/3J1/DoqZXP2UQ2jwR1C1
	Nyt9VCLWJ432Zg+r7RyKJDKdAEvtiIQKTBWKEQy49d139jZgIJx4DhJSkqs0MXqE0QC83DHxRy7U9
	76yvzXS0IMF+YwCuXDRsdZaX7PXLxa06rgGTauD3zE7vEXewJqVnN2iOjE4/OYseO5E5Chvz8UoJn
	56hGmeeCAZqeAv4l96k6w0ch2aMUjBUPodN3m63rNf5lPnfeyqM0dnlX2+TPzusDub9lRYFuaGJ1O
	E0QJhKsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD33-0000000F5a8-1gJA;
	Fri, 10 Jan 2025 11:19:29 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUN3H-0000000GcIj-0VP4
	for linux-i3c@lists.infradead.org;
	Sun, 05 Jan 2025 09:36:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Lg+N
	BRfh54fWFx52Hkh4gEJKYKU2srlPITGlMgvSBrM=; b=Lku8/YFMGHSESXSA66o4
	duPWSjRPQU/D8Ye2uuVKnfbsLKcqu7jlryY+NTK5Y0sWXy7ffKWKqfl9oeAg/zXJ
	QZ1TuCcpBzQBTORNEBPeW24vRO8jYzSekO0Jh3jPrhY/bi3lqKxXfBQmhmT76oRB
	PJZRtR8BV01OV/MHYeW4S9ecNuk1Fvne5gDdYVs1HZbJss7fZPGdukzLy5FmsiZ/
	7rrgwinRJeB0Ebm6MhA0GguKtvoKIyXZuaxTtPTPg3AJIYTkGJUb4K5Zh74RP8+c
	K2udpZY3842iPeEW1jcCnGeEKJZXekGFsOg04FlMiH9GCzXweCBM6O+6bJ6Dc2Me
	ww==
Received: (qmail 1374028 invoked from network); 5 Jan 2025 10:36:00 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jan 2025 10:36:00 +0100
X-UD-Smtp-Session: l3s3148p1@ikRYPfIqupQujntM
Date: Sun, 5 Jan 2025 10:35:57 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, linus@ucla.edu
Subject: Re: [PATCH RFT v2 0/5] i3c: introduce and use generic parity helper
Message-ID: <Z3pSfU2fNd12csNP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yury Norov <yury.norov@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, linus@ucla.edu
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20250103221117bb066057@mail.local>
 <Z3hhw_pwFAicsEDi@shikoro>
 <Z3n-z5xA2ue8ojiF@yury-ThinkPad>
MIME-Version: 1.0
In-Reply-To: <Z3n-z5xA2ue8ojiF@yury-ThinkPad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_013608_033260_27228133 
X-CRM114-Status: GOOD (  10.59  )
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
Content-Type: multipart/mixed; boundary="===============0657206835718370116=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============0657206835718370116==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uDaZtfxN/yUvTHs2"
Content-Disposition: inline


--uDaZtfxN/yUvTHs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yury,

> Rasmus is reviewer. I'm - maintainer.

Oh, sorry. I just saw your both entries in MAINTAINERS and missed that
Rasmus has "R:" instead of "M:". No offence!

> I'm a bit doubted about adding a web link in sources because it may
> become invalid one day, but if Wolfram commits to maintain comments
> up-to-date, I'm OK with that.

I just added the page to the wayback machine. We could use this link
now: http://web.archive.org/web/20250105093316/https://funloop.org/codex/problem/parity/README.html

Better?

> I already acked the patch, so no need to ack it again.

Thanks!

   Wolfram


--uDaZtfxN/yUvTHs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd6UnoACgkQFA3kzBSg
KbZJURAAnv6nzkWmoKQYH7H4SS+GZuo/ko0u5I1imRm8pogda6eEpXSm29qY6IUI
YAnWotXTJr7xLPkcJszZ+Q9Al5akFGwyuH+nnwKtkBlNmhK1WZS5Mpw1QCPR4RN5
GF2gr8cj0tR7I04rF8U65lbPAy99LWQNVwXX02smR8nZy18bi74MVA2gqy6KicoT
kmF28gqONIptdwrGyS+chFEcOO+dtrAtKfL9IsB8evIOzzDYTRH/SNLJ+kEumvZT
8lxyTdWaEtvsnAx9KRRltPsP2wRTGq/hXTUoCrOd+6RDiLJp4rip0oumqPXTg5f7
iPmehB8OzB96akmVGYMJtxgBoF9DMy6A+CkHfj6yOY/zEq+TbNpRWsoVg0g3Fv9z
O9MfC320Qz7E/3xfWqy17jFt7DcNLpGWkSZ/c/AuvZODYRTdR8xkX7r6BdJekiCg
vDyDCvYHVMuuQrU+X8jpdBcUvR5mNfNS3kuotG8pk/wLw8f2yOaNhIz4GZkPPXxw
JsKbMaANCOoQqcEQS8GcPiJ6zSQJYuZjOf63x6JM8PCrYnEnaLrGHqcl1Sn+Oem7
UB2VM3ETAZ4z+QhQ7OMGZ2ii+p2Thm/frOhdvjzvqapKHddxIdBqMUMhaFYv/ELv
Qq2c8jEpA9eZyFlOoorCoWJEL6v5CvFAfeMXIWNPUUST9JiGl2Q=
=706U
-----END PGP SIGNATURE-----

--uDaZtfxN/yUvTHs2--


--===============0657206835718370116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============0657206835718370116==--

