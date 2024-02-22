Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1917C48BF8
	for <linux-i3c@archiver.kernel.org>; Thu, 22 Feb 2024 20:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5DKlrQPksNIxKK0z9k7xkdP337D1sP8djxBwhERv0g=; b=jp+NVVvXPcDphKO7sExTOkp28u
	EtQ2LLhIHtNuz4k50hOtuvjulyrdTX3DZn1X+QlWUGzzXwQok/+IGvDdh931f5/Dejr5Nd/C8vuW7
	MzF98ggpgO3B6zSrgCWMoLPDoF8ayaMEus3L29/LqjbdMeuLAL8JU0jZ7PaLJ7Lq45e/Jh6n0m8yg
	3vQcdqoXtjmaH9+kUuJy98uU0asalv4UPN+MGFZij49JYTt+1PMFt+5aU68ZTEqrHD2nWpPbapGeD
	qPz/k42UTPL7U+ZrSW9xR0WXPdskWrc69lM9FILO8A9WpJjDHB5QB7ou4KQgl6Pc0fxH9eMjXvBgP
	h0LBIBCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdFGi-00000006Qkh-0DKM;
	Thu, 22 Feb 2024 20:02:08 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdFAa-00000006Pps-1BzC
	for linux-i3c@lists.infradead.org;
	Thu, 22 Feb 2024 19:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=jhVW
	YIYPS+WQc6qJONpuGdYkkC+vizXSWdkxmtKR2Zw=; b=dMhLdZCo1B8/rATCc2vu
	mLNgJZko4QxGxAqBAHcqm1HMnlSyh3p6MujX/axkL2zz8dOKBqbrKaSsWZzlK2/1
	lLOLt6chZwcranpAh2zMDdV6DcIHwWDRDhnPfEYVSMYcEKJaZjkHmRGpV9Qo2k1q
	QAtgFkfbF3TTzNf1+9Uer1VUghhsvMhMPxCrjVcRcSDZwqTSfYA3QG+cI/UmCweK
	rGJuAkiEyQyyIGAdDDDUn2aHixyNcPeHL+JOW4FjSeYjpFHe5ZHN8iUbSqKQbe8A
	Nd+ANcb1k4G1B8J5XWOa6OJ10OnuAYQKf3vyh+MsQFvWm4QblGP6iD2T9nu1PTRC
	zQ==
Received: (qmail 4086918 invoked from network); 22 Feb 2024 20:55:30 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Feb 2024 20:55:30 +0100
X-UD-Smtp-Session: l3s3148p1@iyNN0/0R+OQujnsZ
Date: Thu, 22 Feb 2024 20:55:29 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: Remove obsolete i2c.txt
Message-ID: <ZdemsdGQE0RtilCd@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-sound@vger.kernel.org
References: <20240222174343.3482354-2-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240222174343.3482354-2-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_115549_232441_EFDCF704 
X-CRM114-Status: GOOD (  12.93  )
X-Mailman-Approved-At: Thu, 22 Feb 2024 12:02:06 -0800
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
Content-Type: multipart/mixed; boundary="===============9191674841073687317=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============9191674841073687317==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xwbnszeJhFgpzihu"
Content-Disposition: inline


--xwbnszeJhFgpzihu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 10:43:42AM -0700, Rob Herring wrote:
> Everything in i2c.txt is covered by schemas/i2c/i2c-controller.yaml in
> dtschema project, so remove i2c.txt and update links to it in the tree.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Differences to i2c.txt:

* In the schema, "clock-frequency" has a minimum of 1kHz and a maximum
  of 3MHz. Why? The specs do not say anything about a minimum freq and
  fastest speed mentioned in the docs is 5Mhz (Ultra fast mode).

* new binding "i2c-scl-clk-low-timeout-us" has a description which I do
  not understand. What is a waiting state?

* new binding "no-detect" is broken. At the least, it should be named
  something like "bus-fully-described" and then the OS can decide to
  leave out auto-detection mechanisms. If you are interested in the
  latter, you can simply disable class based instantiation on the host
  controller. No need to describe this in DT.

> Wolfram, you can take it or I can.

Once we are done, I guess it is better if you take it.

Thanks for the work,

   Wolfram


--xwbnszeJhFgpzihu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXXprEACgkQFA3kzBSg
Kba7Ng//f2uJIbUxhVqaRPb6cEvRbSMkgp3fOuy7aYo9Chftjp+DCOgB+z/d29DB
4q9Hsd4mNQAHMYKPeieoE/wm6PC7fQQqw/F4mczeiKY+XS1PpFwSXjS3flVBPYOW
UeUYPRZCvWFck7FCOUF9XK2qR/88V1pSDzw5kHf8+CABuFX2RSjyVmiXFbdSV1qf
/I4DfO2M40MkAVGkKIwJcaCBuk6QMjGrJqw+qWYnYmAWsltiWgdy/pOt1Ge03ieM
CinXc9GP6Jg4eDUcpWLETd3ehz9uV40IPugp7fXJxIR38V0Pxbz1G9BUbPjPCj28
Mp3lm3o/60TE68NXU0DEN75PpVz/M/zkv9cx0UJucMDFplec/4BH38TzTsNlAPWV
R5Sh6wD4y6MgfkxqTVEeEaQibH7JTSYK5PwWmR8MNyGk1YN5+avCk2YbUxs618wJ
jauxhbeZNDQ+XWplirsMKB0lrWbV75OxiJ4sGljcpy16MfXaMfP7J7HG+18GOuS1
wD0qBTKzSVrClGu79/LwV90OieqSpAJuEbex5Ls4wNV5/VJUj7t4PH2rOPDZRxc4
nlOpJ5SYSgWwOnGYVgh6wDr6QFCmZGZpQbQlxlezaRkwhQZKmA87/jM+ZkFt8Rwc
3d5oj6TIiOFWfkl3zdbl9/voX7DTTY3ku/KgG5OvEPy9nl120C0=
=o5Lw
-----END PGP SIGNATURE-----

--xwbnszeJhFgpzihu--


--===============9191674841073687317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============9191674841073687317==--

