Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFA6CDB465
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Oct 2023 21:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpZSQlTlqweDr1xLgGRIMKLtoRxNDl15armeW1qeh1E=; b=Jqt7CsuV+7A7FaxM2NzWt1uZLp
	WyFe8042RAL52hgKpMfqrKm+cLDf7nZOofp6aHY6O+HncX88dmP2aHYOE1kRLFqb2rBJv8OsOJmZe
	uuewIpLLO0T0YU5lyMtRmA2UBuDcoZ3zPqaifCYpsDPEFtcUC3HGX5PTYGqnKmaVBDa2rZ3Wuia2t
	1GGrHBbx9jc1o9+r4hNXk3rUNJE+RsEXMq6sA9lVQuwOb+EBO8g7zHpLcPCbSUtWuBme5pIWQs/rW
	CcibEyDZHZfGti5MFzty04DNwfeV7/Nk0A7aMa6M01FH6tYIS3utYd05WlqU0FBGw7B45dqV6VQ78
	s7aGBUPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVES-00AaZz-0O;
	Mon, 16 Oct 2023 21:34:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsRQ4-00AEWQ-1a;
	Mon, 16 Oct 2023 17:30:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A7AF5B817F8;
	Mon, 16 Oct 2023 17:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F00C433C7;
	Mon, 16 Oct 2023 17:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697477418;
	bh=GpeYS7W+QOHnKL9KvaNin7WOIs87VzXBHY68R4EuxOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uWi5UtGLX5OiupKPagSbadl9W/hpoMnJjLJpT39aTyFP1o6H3ZWHGfEx4sCsPYKg6
	 lff/tE1oun/D/dp8UONbZWMGioqvZMxPHa6PUGvd4kp2orzQ7qPb8fdBvQp/urPnwi
	 6ZrPMHAQWk4RdC2a/Nlh3y66MEgfdbXbMQr7F9Y8ep65UHJw0ff7Nv83jbqqK8XPVE
	 YvPUUtIHtsrzP3zbggjAPNLQW5DE+nE7tx/ydOVsYYDZi6TW1XDcM5tCatq/YpFNfG
	 +BO4kQ5ka5FCPGBWjWQ0XVU5hklssx5MfX1Qjcm90cCu+beoR+m2iFKx3lVpeHZP/9
	 hSdqs3y3MIIAA==
Date: Mon, 16 Oct 2023 18:30:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
	alexandre.belloni@bootlin.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, joe@perches.com,
	peng.fan@nxp.com, alexander.stein@ew.tq-group.com,
	haibo.chen@nxp.com, ping.bai@nxp.com, xiaoning.wang@nxp.com,
	sherry.sun@nxp.com, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: i3c: Fix silvaco,i3c-master compatible
 string
Message-ID: <20231016-chatroom-regulator-a75f1d8be809@spud>
References: <20231016152450.2850498-1-Frank.Li@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20231016152450.2850498-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_103020_680850_7697D5B1 
X-CRM114-Status: GOOD (  15.47  )
X-Mailman-Approved-At: Mon, 16 Oct 2023 14:34:34 -0700
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
Content-Type: multipart/mixed; boundary="===============2890057997561995826=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============2890057997561995826==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8ov1p1bhS36bcpal"
Content-Disposition: inline


--8ov1p1bhS36bcpal
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 11:24:49AM -0400, Frank Li wrote:
> In driver, compatible string is silvaco,i3c-master instead of
> silvaco,i3c-master-v1.

And what makes the driver right & the binding wrong? AFAICT, this is an
IP sold by silvaco & the -v1 suffix was explicitly requested during
review of the binding.

Thanks,
Conor.

>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yam=
l b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> index 133855f11b4f..19e3f75eb45c 100644
> --- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> @@ -14,7 +14,7 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: silvaco,i3c-master-v1
> +    const: silvaco,i3c-master
> =20
>    reg:
>      maxItems: 1
> @@ -49,7 +49,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      i3c-master@a0000000 {
> -        compatible =3D "silvaco,i3c-master-v1";
> +        compatible =3D "silvaco,i3c-master";
>          clocks =3D <&zynqmp_clk 71>, <&fclk>, <&sclk>;
>          clock-names =3D "pclk", "fast_clk", "slow_clk";
>          interrupt-parent =3D <&gic>;
> --=20
> 2.34.1
>=20

--8ov1p1bhS36bcpal
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS1zIwAKCRB4tDGHoIJi
0n52AP40LdahncQIBrlmquA9d27bYIZbq2UevD1+ijXUlaBdaAEAhYr4fgRjvJxx
Lr+TH3PlrbTOEzDsaF/mY4qqOSnkjgU=
=Nlun
-----END PGP SIGNATURE-----

--8ov1p1bhS36bcpal--


--===============2890057997561995826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============2890057997561995826==--

