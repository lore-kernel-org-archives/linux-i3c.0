Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AB2C77B7C
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Jun 2025 00:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGM0+6rJng/fI8WDR6PqLr3w3KgkGxlipL+c7VlYw/A=; b=DOed5efDNy3iDu9nFbEMq6//Se
	99BPSgc3RMglii9uStx5feT/mBndoxnMJWKBbo8u0o6eocOjQEzCQ/2YRmcKBoNbBXWqIC11Aalwe
	5pQFflyKNXKzutSv3tcdW0E5rOqNVuOSbcGdwPZ/OV8O6PJifjVAu7VC/O76bbDOyW855p05d8DiZ
	HoNUhgNDdfm5RpyKh0iqzVvvksOIQs4xIOA/uG6v4ZkCjrbuCm/rZk/DQtRYHxGrOZRuqyll8LSe/
	YrQabWoQlcAhfx0bWtpFh60hDIGqU+a26UJAGgePAU/bUTz83rQ+IV+IhidDi1wdop2xkr4eKvCmQ
	q/5rhbKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrYp-00000004EgT-23Qx;
	Tue, 24 Jun 2025 00:30:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNZcg-00000000br8-1qLi
	for linux-i3c@lists.infradead.org;
	Fri, 06 Jun 2025 16:08:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D7EEA61136;
	Fri,  6 Jun 2025 16:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CF1C4CEEB;
	Fri,  6 Jun 2025 16:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749226129;
	bh=m2TJ06NSfnjbzVgJp7+Aa4QRI/goAHsiXLyozAXhKBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AF+/+ynGBC9CqRuCphqPdWg19oKQBNefs5Uo86usrjuiyCzqXTz3arq/QRBB2kE++
	 WBYvqNa7gNTEV/V0/yaRnCRPEvR/T2etKdB1i7c6cdn3/OLhGg4/x+8NXs/Twzk5ID
	 5sidnesVZvfKDRX5IaC1qbNkEeLXxgJ8Ra40cCWABoVBFMUJEl5GME7FLU36gpRaaf
	 hLQScvfH7On4uCXpvL98u8/TyVLM8jvaqK0/WtemhWMzGZ+xlvH/LSvj7pQv64QrR+
	 2IZ1njtV5REZXtoj6KOUOcAh2Lirj9gyQRkJOxdrDNHCAaSH+UUJq+xn2MIXBWlOVK
	 nUabw3G++wPVQ==
Date: Fri, 6 Jun 2025 17:08:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <20250606-sliver-freeing-d01268258c25@spud>
References: <20250606-adi-i3c-master-v2-0-e68b9aad2630@analog.com>
 <20250606-adi-i3c-master-v2-1-e68b9aad2630@analog.com>
MIME-Version: 1.0
In-Reply-To: <20250606-adi-i3c-master-v2-1-e68b9aad2630@analog.com>
X-Mailman-Approved-At: Mon, 23 Jun 2025 15:46:42 -0700
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
Content-Type: multipart/mixed; boundary="===============7998085617108325529=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============7998085617108325529==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6hQ4mkac1n7o3C5/"
Content-Disposition: inline


--6hQ4mkac1n7o3C5/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 06, 2025 at 03:21:02PM +0200, Jorge Marques wrote:
> Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> core that implements the MIPI I3C Basic controller specification.
>=20
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  .../devicetree/bindings/i3c/adi,i3c-master.yaml    | 63 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 68 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml b/=
Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e7fae394ad8fd4143eb1fffb9=
591a30a2d6cc6ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/adi,i3c-master.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices I3C Controller
> +
> +description: |
> +  The ADI I3C controller implements a subset of the I3C-basic specificat=
ion to
> +  interface I3C and I2C peripherals [1].
> +
> +  [1] https://analogdevicesinc.github.io/hdl/library/i3c_controller
> +
> +maintainers:
> +  - Jorge Marques <jorge.marques@analog.com>
> +
> +properties:
> +  compatible:
> +    const: adi,i3c-master

Seeing this with no versioning info is pretty suspect.
The adi spi, pwm, axi-dmac etc all have versioning info, please try to
emulate that.

Otherwise, I think this is okay.

Cheers,
Conor.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: The AXI interconnect clock.
> +      - description: The I3C controller clock.
> +
> +  clock-names:
> +    items:
> +      - const: axi
> +      - const: i3c
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i3c@44a00000 {
> +        compatible =3D "adi,i3c-master";
> +        reg =3D <0x44a00000 0x1000>;
> +        interrupts =3D <0 56 4>;
> +        clocks =3D <&clkc 15>, <&clkc 15>;
> +        clock-names =3D "axi", "i3c";
> +        #address-cells =3D <3>;
> +        #size-cells =3D <0>;
> +
> +        /* I3C and I2C devices */
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96b82704950184bd71623ff41fc4df31e4c7fe87..6f56e17dcecf902c6812827c1=
ec3e067c65e9894 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11243,6 +11243,11 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
>  F:	drivers/i3c/master/ast2600-i3c-master.c
> =20
> +I3C DRIVER FOR ANALOG DEVICES I3C CONTROLLER IP
> +M:	Jorge Marques <jorge.marques@analog.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> +
>  I3C DRIVER FOR CADENCE I3C MASTER IP
>  M:	Przemys=C5=82aw Gaj <pgaj@cadence.com>
>  S:	Maintained
>=20
> --=20
> 2.43.0
>=20

--6hQ4mkac1n7o3C5/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEMSjQAKCRB4tDGHoIJi
0rbTAP4spTJrUASLewamc2NSPCBtIjPY8qbsTcW2CmsKLmo9OwEAlhaoy3iBc6BX
xk8rWner/IjjAMNN64diVOneBUcjbgE=
=gjg3
-----END PGP SIGNATURE-----

--6hQ4mkac1n7o3C5/--


--===============7998085617108325529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============7998085617108325529==--

