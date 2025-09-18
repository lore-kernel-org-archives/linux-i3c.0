Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8DCCAC5A5
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Sep 2025 22:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2pEhEeA00eS6kTd9cdZag0p+f7/VLUsUOfLKt6si/I=; b=Ex9KSusyHHAUM01kVhNXBG8bcJ
	npTATLu2w1o+HhK2vsnEPjpRM2oaMxSnysTo5a7cfASJFbnAaspm65gmbjvnU6FPwmgBa4CmoVEIf
	LFkflswZ+5x0/or3AffP8+mnzqdC95Vz9MpvRfXagJrxfyB4/8f7Jxm7WrSFbatTmbh8EhSx7KVCT
	q2PW1kJs0kIwCHrB1lAOL9AA1t0l/2IPdQg0R3KX7JAD0ASKqW/ISmC8n8LsgiBjentyy9TGsIMeM
	3zOPyRV9meH6E/XxgMtZX5JvN63KUBK2cQo4cvQq96+Oosm2Jqb3msPIMNodfRHo+68ahQGbJLO5/
	c2ysrXyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Bxn-0000000F7Ns-2F6Z;
	Tue, 23 Sep 2025 22:58:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGIK-00000000INZ-0TnA
	for linux-i3c@lists.infradead.org;
	Thu, 18 Sep 2025 15:11:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 79D1F40826;
	Thu, 18 Sep 2025 15:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397A8C4CEEB;
	Thu, 18 Sep 2025 15:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758208295;
	bh=zSISbfSAvIt3x62Kcz2q+Cmr5WtqzDMvYwREtN1Ye3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nDe8kENvBX+0INSopoFzFkqf332HLouvm8uIc+v7stjAvIdky41ObXlsqXoRSWG0D
	 hcgbA7ZsJSB/F62qUm6RYr7U713ADWdkAKCTVS8La7pSfhA13HaXf6uU8BNk8eTbjw
	 WMljP0vd9rtCLxFVXcpqXQ0+MQIBLctmCBCI1LRD1hNWbeD9a9jbO9Aop3Lsi1JObU
	 gbF0c2yoqx624PI+TkG4iN40VbZQ3KoR3OirY6WGErBaANuArKsvHyFiFemBuEkO4R
	 WMd9E2B7kJ8NomWpRex52KX2HM9EWhibXoXoDpOohEJDEAxBM++uJ88KwDa376htvw
	 jQiblV6r7hOOQ==
Date: Thu, 18 Sep 2025 16:11:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Durai Manickam KR <durai.manickamkr@microchip.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, balamanikandan.gunasundar@microchip.com,
	nicolas.ferre@microchip.com
Subject: Re: [PATCH 0/4] Add microchip sama7d65 SoC I3C support
Message-ID: <20250918-empathy-geology-7aeb6d44921c@spud>
References: <20250918095429.232710-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20250918095429.232710-1-durai.manickamkr@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_081136_172761_0CE20103 
X-CRM114-Status: GOOD (  16.37  )
X-Mailman-Approved-At: Tue, 23 Sep 2025 15:58:21 -0700
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
Content-Type: multipart/mixed; boundary="===============4779702128187140032=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============4779702128187140032==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MHxoOq4p4ayT609I"
Content-Disposition: inline


--MHxoOq4p4ayT609I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 03:24:25PM +0530, Durai Manickam KR wrote:
> Add support for microchip sama7d65 SoC I3C master only IP which is based =
on=20
> mipi-i3c-hci from synopsys implementing version 1.0 specification. The pl=
atform=20
> specific changes are integrated in the existing mipi-i3c-hci driver by in=
troducing=20
> a quirk and SoC specific config option.
>=20
> I3C in master mode supports up to 12.5MHz, SDR mode data transfer in
> mixed bus mode (I2C and I3C target devices on same i3c bus).
>=20
> Testing done:
> With this patch we are able to fully configure the lsm6dso I3C slave
> device. Unlike I2C, I hope there is no linux utility to check the
> various transactions supported in the host controller. These features
> will be tested later probably with I3C analyser KIT.
>=20
> Durai Manickam KR (4):
>   clk: at91: sama7d65: add peripheral clock for I3C
>   i3c: mipi-i3c-hci: add microchip sama7d65 SoC
>   ARM: configs: at91: sama7: add sama7d65 i3c-hci
>   ARM: dts: microchip: add I3C controller
>=20
>  arch/arm/boot/dts/microchip/sama7d65.dtsi     | 12 ++++++
>  arch/arm/configs/sama7_defconfig              |  2 +
>  drivers/clk/at91/sama7d65.c                   |  5 ++-
>  drivers/i3c/master/mipi-i3c-hci/Makefile      |  3 +-
>  drivers/i3c/master/mipi-i3c-hci/core.c        | 28 ++++++++++++
>  drivers/i3c/master/mipi-i3c-hci/hci.h         | 12 ++++++
>  .../i3c/master/mipi-i3c-hci/hci_quirks_mchp.c | 43 +++++++++++++++++++
>  7 files changed, 102 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci_quirks_mchp.c

This is actually v2 right? v1 was here:
https://lore.kernel.org/all/20250910-magician-retold-a6835179f71d@spud/

Where is the dt-binding that you also omitted there?

--MHxoOq4p4ayT609I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMwhIgAKCRB4tDGHoIJi
0t9gAQDOkpMj2tViMD06sKNAhxnTkDwdCR2IP1r1ujZ7VOQ2SAEAw0y9nbfOBpbu
nsN6QSqf5uc3Yz7gHuIwhOycF3D/GA0=
=bCaE
-----END PGP SIGNATURE-----

--MHxoOq4p4ayT609I--


--===============4779702128187140032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============4779702128187140032==--

