Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E85C47DB7
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Jan 2024 20:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xuRi4X9S9LnAePJSMukqg+6mj2vSD2wastK1Lf7qEo=; b=GbOmBNB2WQ6+iGTTXupY5mkMqW
	fp5vRDwTPQndbW0ChYK7DRDZ8Y6J5k8egEWmdALn4XcyDPM45TskFATpIuNb7RW5UchOld2tuD9Kv
	uRqva1xvFZ5dlMph9Kq18RZmT4Zz9WsMmx97K+gR2zv5/nJ7uzH8fAsK55F3XDkIUcwisS50PZONH
	fnh9Grpd/hTIP1aCL8JTLh8s3CWhKNcT9hQYQUspgOmvIfDMfWIqFMxlutnrKHhA//VBzC4EaSG2r
	jChblXk1oCZZI/1qk5GfH2rjJiuHbfwSqiqaNTGzOGHqpQr71ou/NyoCRg01X7vLd03IKyqqtj9p5
	xExKLW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQZPt-003qb5-0G;
	Thu, 18 Jan 2024 20:55:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ7ad-00HOXa-0H;
	Wed, 17 Jan 2024 15:12:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E99B4616AE;
	Wed, 17 Jan 2024 15:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EFAC43394;
	Wed, 17 Jan 2024 15:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705504339;
	bh=A34tDGOyjAsdjOUsmbUUAZArIqY5t5xrNGVo1R3xsl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MUADrWpVR/Uh/G90UDB9uyE8Sv2+CswU6qdMlBPrM1g6LCEUVO2ry3Jo6StjLjmE/
	 QDJnRRprGq5yIHIr7/4y/OerT4PVr/pslwuAosBTeVAOV32QMFVgT/33jAAL9NpisL
	 HAQuNRHCqi4aVTqljfjfDK64KIk654MSDzyZDOJ2Sn0VI9vRevvUfmJc6S7bQIBd22
	 pc3cqWNfMxGXdbZC42cWNiZq5rVWvyY4989o11tH+H76p6R8GmypkAZKzMuccV1xWj
	 DeZmCbnE0CSNAYx+cIvY5jZ7qRuepoCGKe7jevKi0wmKgrtMkX8ihL8De1MC5vE4gx
	 L9L1wzOKO4Udw==
Date: Wed, 17 Jan 2024 15:12:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Nicolas Pitre <npitre@baylibre.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i3c: drop "master" node name suffix
Message-ID: <20240117-endurance-caliber-e3424450d291@spud>
References: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_071227_392073_A5825D90 
X-CRM114-Status: GOOD (  10.95  )
X-Mailman-Approved-At: Thu, 18 Jan 2024 12:55:11 -0800
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
Content-Type: multipart/mixed; boundary="===============3682454916796707396=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============3682454916796707396==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aLyhfwRZwwPVc64g"
Content-Disposition: inline


--aLyhfwRZwwPVc64g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 08:56:16AM +0100, Krzysztof Kozlowski wrote:
> Drop the requirement of "-master" suffix in node names because:
> 1. "Master" word is discouraged and MIPI Alliance renamed it to
>    "Controller".
> 2. Some devices can operate in Controller (Master) or Target mode, thus
>    the name is not accurate in such cases.
> 3. Other buses, like I2C controllers, use simple "i2c".
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--aLyhfwRZwwPVc64g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZafuTAAKCRB4tDGHoIJi
0qOUAQCiE1lrShOfXW5DHVs22SCv9n0E+X01iWyVhRYwByKe7wD/WsaG8wOfwFiK
a4TeDt3owTN4VnKqNpdfHPpPnU9H+g4=
=PuQ9
-----END PGP SIGNATURE-----

--aLyhfwRZwwPVc64g--


--===============3682454916796707396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============3682454916796707396==--

