Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0677BCD13DA
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Apr 2026 10:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AR7X+PpEiegiepOpCf1D9c6k0wQQbKryxj6Qs+Uc4Gk=; b=X80wDWll17oRT1VSdOJw9Y8uth
	6gt/jjV9CBrnE7VXEA5e7p2utJUJ1IiUKiRwGGbzugLzzmu5lvp4KCKqpo4/T1jrYskZ83tI94D2a
	RDazgOUphVhTdLsdVO4cXA4Gb62okhlWL1uRzShFHkvSBLHhG+Xc825VcVKuJm3tyy1EJefKPUdPg
	io1O2snK9oRX4wdTbo1V+A4BpMNZJ+5tIXzYASL71G6G93mM6Inpj6h2wsy7RVxT3H+Wh7iMifXhT
	dcFI+BEiBFRq8ue089zNLByX9iaxTvJOHrrC7Ffa7Pl2jYV69MdgcmgWhLKYpDkCIBhmOVxF/ByNO
	5EO5PbOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOG1-000000059ve-3388;
	Thu, 30 Apr 2026 10:04:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ukP-000000095MM-2sSf
	for linux-i3c@lists.infradead.org;
	Wed, 18 Mar 2026 17:31:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4707D4434A;
	Wed, 18 Mar 2026 17:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0E4C19421;
	Wed, 18 Mar 2026 17:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773855117;
	bh=HhmffGUp9Y91NzAt05HzDzuECj5jUzcfd9L5WeMVgRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fOhJ7numKOTyFBGnbu6sjnslIaPgCJ6YJoNRlo6wqbaJaq+9rC7PSaCpwXncYgTUX
	 9MqJ59SRYVHNytkkWTAwz0gzeu7m+MXqf/eEDMBtZGVSYSGpXzXWULVV77yqfflHDq
	 ilse5DP9qMKG9asn0/dUsMEMzuh6B5OU3L3zdoJ91s9Ic/2y0asVQMle9Mf7X2uBGU
	 q3sRJWhRMSGUytZmVNHhxbl+jQFHQUILMBBTBQvOjsU5EaI+uKOsD6GZVZ31IxG4ya
	 wn0OvCp5ve3TA23cpFHAZ+Qc2cfH7s65Vrvt9Axuv2SufIQ0b+JY6op8DbG3hqOVol
	 1tZ8ip/vfNkYQ==
Date: Wed, 18 Mar 2026 17:31:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Fredrik Markstrom <fredrik.markstrom@est.tech>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Suresh Mangipudi <smangipudi@nvidia.com>,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: i3c: Add mipi-i3c-static-method to
 support SETAASA
Message-ID: <20260318-tweed-herbicide-eb924ef056b8@spud>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
 <20260318172820.13771-2-akhilrajeev@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20260318172820.13771-2-akhilrajeev@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_103157_773441_05499266 
X-CRM114-Status: GOOD (  30.43  )
X-Mailman-Approved-At: Thu, 30 Apr 2026 03:04:33 -0700
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
Content-Type: multipart/mixed; boundary="===============1723399908213032092=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============1723399908213032092==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EmK0zunkW5CWMMpV"
Content-Disposition: inline


--EmK0zunkW5CWMMpV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 10:57:14PM +0530, Akhil R wrote:
> Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
> Discovery and Configuration Specification [1] to specify which discovery
> method an I3C device supports during bus initialization. The property is
> a bitmap, where a bit value of 1 indicates support for that method, and 0
> indicates lack of support.
> Bit 0: SETDASA CCC (Direct)
> Bit 1: SETAASA CCC (Broadcast)
> Bit 2: Other CCC (vendor / standards extension)
> All other bits are reserved.
>=20
> It is specifically needed when an I3C device requires SETAASA for the
> address assignment. SETDASA will be supported by default if this property
> is absent - which means for now the property just serves as a flag to
> enable SETAASA, but keep the property as a bitmap to align with the
> specifications.
>=20
> [1] https://www.mipi.org/specifications/disco
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  .../devicetree/bindings/i3c/i3c.yaml          | 30 ++++++++++++++++---
>  1 file changed, 26 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentati=
on/devicetree/bindings/i3c/i3c.yaml
> index e25fa72fd785..1705d90d4d79 100644
> --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> @@ -31,10 +31,12 @@ properties:
>        described in the device tree, which in turn means we have to descr=
ibe
>        I3C devices.
> =20
> -      Another use case for describing an I3C device in the device tree i=
s when
> -      this I3C device has a static I2C address and we want to assign it a
> -      specific I3C dynamic address before the DAA takes place (so that o=
ther
> -      devices on the bus can't take this dynamic address).
> +      Other use-cases for describing an I3C device in the device tree ar=
e:
> +      - When the I3C device has a static I2C address and we want to assi=
gn
> +        it a specific I3C dynamic address before the DAA takes place (so
> +        that other devices on the bus can't take this dynamic address).
> +      - When the I3C device requires SETAASA for its discovery and uses a
> +        pre-defined static address.
> =20
>    "#size-cells":
>      const: 0
> @@ -147,6 +149,26 @@ patternProperties:
>            through SETDASA. If static address is not present, this addres=
s is assigned
>            through SETNEWDA after assigning a temporary address via ENTDA=
A.
> =20
> +      mipi-i3c-static-method:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0x1
> +        maximum: 0xff
> +        default: 1
> +        description: |
> +          Bitmap describing which methods of Dynamic Address Assignment =
=66rom a
> +          static address are supported by this I3C Target. A bit value o=
f 1
> +          indicates support for that method, and 0 indicates lack of sup=
port.

I really am not keen on properties that are bitmaps, why can't we just
use the strings "setdasa", "setaasa" etc?

> +          Bit 0: SETDASA CCC (Direct)
> +          Bit 1: SETAASA CCC (Broadcast)
> +          Bit 2: Other CCC (vendor / standards extension)
> +          All other bits are reserved.
> +
> +          This property follows the MIPI I3C specification. The primary =
use
> +          of this property is to indicate support for SETAASA, i.e Bit 1=
, but
> +          will allow all values so that it is aligned with the specifica=
tions.
> +          SETDASA will remain as the default method even if this propert=
y is
> +          not present.
> +
>      required:
>        - reg
> =20
> --=20
> 2.50.1
>=20

--EmK0zunkW5CWMMpV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabrhhgAKCRB4tDGHoIJi
0kMwAP9M6TXwaUc/BKHm+0Rt/FM5DM33/g7JjBxK1p/4dzSpUAD/Qrggu6aS3gqn
FhlL6llczwN+H7jlvZoHMk1JsE+xJgc=
=/Hz0
-----END PGP SIGNATURE-----

--EmK0zunkW5CWMMpV--


--===============1723399908213032092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============1723399908213032092==--

