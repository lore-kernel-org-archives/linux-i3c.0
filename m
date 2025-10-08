Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07D3CCD195
	for <linux-i3c@archiver.kernel.org>; Fri, 17 Oct 2025 18:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niUEJMVsdg6OZzUyGT8x7ii69q1pNISYJ91fGnc+Gn8=; b=F49XgK+JZJlEy93eZHxvWZgy4V
	bnVCzJKhQA+2iHE4wdxMX8BFPEQTQ1kBEUjyhgesnepAW2B898WMgVTqzNz2UuPy9an5MmdnnXj2E
	k9P5tlQrD5j65cixPdfAx8KP4D/J9n53ewO82THtp4wgQxNQGL9cbJOxonIm3FoO96I+HoT3bv3J1
	Odb7rsDJVP+pRRZV/vJYdVvwDtn3HatXoHbZj35tXXJpDq9aYuhkRpckyOqrHIWI+cc/XWMYvBCoo
	VQkh0vOOjKvioFFSLEKvL3JQhyvQCtJBaP9f9TKN4XGzG6Q1aCujXmsASVFdDx+vID6XsqC5FzGz4
	KbUwzlZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pUU-00000008hsS-1Rgq;
	Fri, 17 Oct 2025 18:47:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6acS-00000004cEm-3OXn
	for linux-i3c@lists.infradead.org;
	Wed, 08 Oct 2025 20:18:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69ECC48B72;
	Wed,  8 Oct 2025 20:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51887C4CEE7;
	Wed,  8 Oct 2025 20:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759954719;
	bh=NPfFVoW/LsVVuz6xy4asuQtfUdYNXIh1K0Bl95lxHK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eWEuV7Nd5F7lsXWr/UkCGuvskUUzW9C9N2qKdcElDqx/deuTzBTWJueKZCqT5MWC/
	 kE9/oj3IagxHP2hfMgU4vzc/Njx/JocASOAc5uKkczRX+NIlOw6Mqyp/fQefLpzg8G
	 wdZ0PE/DJ3aqz4hxPAy53TqIx2L5wSKfK5n3GRFbuiq6XWwlUvSyo5gBcH5hYoqXPG
	 MjuNTh9Zt8dK2y/pJsA6K5jRLX+DyJVYc+XBwb5npwxFnU6Tg5tJW+37C8v8Bly8tm
	 xAGkxk47sVjIiMklhP2bNpjIUHz4ummV0re5RGFKkE0hpc6l4oMmX042tikLqLgpwE
	 JgOoQ+b6LPL7g==
Date: Wed, 8 Oct 2025 21:18:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 4/5] dt-bindings: trivial-devices: add MEMSIC 3-axis
 magnetometer
Message-ID: <20251008-subtitle-estranged-b35dfcd2d3a7@spud>
References: <20251007-i3c_ddr-v5-0-444184f7725e@nxp.com>
 <20251007-i3c_ddr-v5-4-444184f7725e@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20251007-i3c_ddr-v5-4-444184f7725e@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_131840_867483_191CFEF6 
X-CRM114-Status: GOOD (  12.92  )
X-Mailman-Approved-At: Fri, 17 Oct 2025 11:47:48 -0700
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
Content-Type: multipart/mixed; boundary="===============4500902240216394841=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============4500902240216394841==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sqGdDHF1UKLk1vs2"
Content-Disposition: inline


--sqGdDHF1UKLk1vs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2025 at 04:06:16PM -0400, Frank Li wrote:
> Add compatible string 'memsic,mmc5603' and 'memsic,mmc5633' for
> MEMSIC 3-axis magnetometer.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
--
pw-bot: handled-elsewhere

> ---
> Changes in v4
> - add memsic,mmc5603
>=20
> Changes from v1 .. v3
> - None
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Doc=
umentation/devicetree/bindings/trivial-devices.yaml
> index 7609acaa752d5c1c89a26bb007fa38357dee1a28..72786eebfbd63beffd2a09fc2=
0c7aedbe9e96a8e 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -225,6 +225,10 @@ properties:
>            - meas,tsys01
>              # MEMSIC magnetometer
>            - memsic,mmc35240
> +            # MEMSIC 3-axis magnetometer
> +          - memsic,mmc5603
> +            # MEMSIC 3-axis magnetometer (Support I3C HDR)
> +          - memsic,mmc5633
>              # MEMSIC 3-axis accelerometer
>            - memsic,mxc4005
>              # MEMSIC 2-axis 8-bit digital accelerometer
>=20
> --=20
> 2.34.1
>=20

--sqGdDHF1UKLk1vs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaObHGQAKCRB4tDGHoIJi
0kYFAQDlJRBo3V6un4TdXGebaBOYpaei0g/okMdZdefOo2s6WAEA7JKupNoV9yYg
TZOT/iUlzA563LqVO58o6aXWJEQGyQk=
=vzKo
-----END PGP SIGNATURE-----

--sqGdDHF1UKLk1vs2--


--===============4500902240216394841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============4500902240216394841==--

