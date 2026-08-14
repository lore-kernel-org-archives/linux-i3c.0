Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F36C5DF7E
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Aug 2026 13:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpxug4BDOvMQQaCaTOfLb1vURMhMWmM+aIjxHJGsLok=; b=szjNZ7s6D5W92qFXcduiExI6xg
	8LyzQtbi4ELFqNqIVGtOlAUxx6CqcBkuEe2dv8KoMwowOMectABudqEKK5D21Qz50wmkoWWPfCwd8
	4evtGabfbriat/yTkivwgWWrOcFj5ThcjYqzbvVa8tVrJhgDglGWuvIMjRVyJrSpT2RhjXRf5KsxJ
	UK6c3hEGndtgi6gg5uFUjCDhbZpmmFmcC4ML06nLjouYk6yrTzAkzMV7iNgOzI/HVlL4McsY1Yb0f
	//KA0HcFKOhmuVfLnEyMnV/FIZKgA6Rm5QoDjd5C+T55OjaQwnkPx4hlCw300v3swmJ3KxJ0txVJD
	WM/CbQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJS5-0000000807F-46Qk;
	Tue, 18 Aug 2026 13:02:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wutzU-00000002s7b-0E3v
	for linux-i3c@lists.infradead.org;
	Fri, 14 Aug 2026 15:38:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 69279600C3;
	Fri, 14 Aug 2026 15:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF8C1F000E9;
	Fri, 14 Aug 2026 15:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786721919;
	bh=2zDsdfvqyAQGNQFpULwmV74pld1nNrSo0Q52aSj3naM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fzg4PSI9SdrWRn6jAIQSbkKwFucvq0bVzHIsg4DRzhiAXdrkzVna9PG5F6kkhfrAn
	 QHgTltd//bEtUfJ35JFWt5f2dzI5Wzf9UFDEXuwvTJ+noHEgbkbtj1hTiueaySVT7+
	 qop6gUunUCoBLG83gO2Fh1J1BuG8iFqev9lqnZN+/WJK3i8wm16z4fPLQp4cAJFLjG
	 l4h5JA8+cMGGeIkAVTCsgWCXYSsIviM9Tej7jZXsSiu+4F1WeaZmoAvsyLJY23P2SS
	 28PhBWOF8pBHz/iPLv60IvPqpGE9BjIOPasGi2+J8O+TZxrdObj3qinONq1xkDuvaf
	 u/3WlPWty5/Zw==
Date: Fri, 14 Aug 2026 16:38:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <20260814-cubical-transpire-413101a0c4c2@spud>
References: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
 <20260814115155.3974988-2-shubhamsanjay.patil@amd.com>
MIME-Version: 1.0
In-Reply-To: <20260814115155.3974988-2-shubhamsanjay.patil@amd.com>
X-Mailman-Approved-At: Tue, 18 Aug 2026 06:02:01 -0700
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
Content-Type: multipart/mixed; boundary="===============6091110323167401157=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

--===============6091110323167401157==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+DtxFDk3UUG+rw01"
Content-Disposition: inline

--+DtxFDk3UUG+rw01
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 05:21:53PM +0530, Shubham Patil wrote:
> In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
> IP. Describe them with two boolean properties.
>=20
> A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
> capable design is always IBI capable as well. Both events are reported
> through the controller interrupt, which is therefore required whenever
> the capability is present.
>=20
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---
>  .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml =
b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> index 2caa245a8656..07e3d0b4d767 100644
> --- a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> +++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> @@ -32,13 +32,34 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> +  xlnx,ibi-capable:
> +    type: boolean
> +    description:
> +      The IP is synthesized with In-Band Interrupt support. IBIs are rep=
orted
> +      through the controller interrupt.
> +
> +  xlnx,hj-capable:

tbh, I'd prefer if these were spelt out a little bit more, characters
are cheap. Not a big deal though.

> +    type: boolean
> +    description:
> +      The IP is synthesized with Hot-Join support. A Hot-Join request is
> +      acknowledged by the same machinery as an In-Band Interrupt.
> +
>  required:
>    - compatible
>    - reg
>    - clocks
> =20
> +dependencies:
> +  xlnx,hj-capable: ["xlnx,ibi-capable"]
> +
>  allOf:
>    - $ref: i3c.yaml#
> +  - if:
> +      required:
> +        - xlnx,ibi-capable
> +    then:
> +      required:
> +        - interrupts

Why is one dependency expressed this way, and the other expressed using
the dependencies property? Can the interrupts property be handled that
way too?

Cheers,
Conor.

> =20
>  unevaluatedProperties: false
> =20
> @@ -54,5 +75,7 @@ examples:
>          interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
>          #address-cells =3D <3>;
>          #size-cells =3D <0>;
> +        xlnx,ibi-capable;
> +        xlnx,hj-capable;
>      };
>  ...
> --=20
> 2.34.1
>=20

--+DtxFDk3UUG+rw01
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCan82egAKCRB4tDGHoIJi
0iQrAQCs8qebR4quXdJpbjsXqfeQ608+ln1zNqvEfX7zedYCOAD/cYD8S+Ph/N6i
2fWFRkepRMirbphPDInTh0ZEKaL38Aw=
=GetW
-----END PGP SIGNATURE-----

--+DtxFDk3UUG+rw01--


--===============6091110323167401157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============6091110323167401157==--

