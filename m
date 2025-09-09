Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE852CAC587
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzCcmh5mLQtfsD+y3EBvwztVRHGqwQL3fDYvzV23U4w=; b=JJKkIiWgag18vhqJzt9VkDrnDL
	0KBdAfjtxRClE8XPCRklVXGaUWXYaFr4yWUIwnK7mbfR95W2u/54ckpRjFmxP6pKWnfaQmYZiQ7ub
	W4rj5qHbMCbtRLnAbGbOP4k1l7PFi2/zZXWiHfoPR8det5K8qdoIH8dn058fk+mB33Z5Ay5OH15YC
	iPwUke29NUHvEwk7kZkWYasIfOEQVnRKNuqV9wRoJv/laqIxMN30zOEchnhPN0GjHXsEb2JBJKqsj
	XrZZSAihZFCnxggcU+mdivZwjsBUaneWlsIEsNg/xYtRyf/X4hgNm/vMMLO0tMqAe3GuYcBDof/Vb
	LoyOMgjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtPl-00000002A0x-2d4L;
	Sun, 14 Sep 2025 20:33:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw4Iq-00000009myZ-44Mb
	for linux-i3c@lists.infradead.org;
	Tue, 09 Sep 2025 19:46:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CB12601F0;
	Tue,  9 Sep 2025 19:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B51C4CEF4;
	Tue,  9 Sep 2025 19:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757447216;
	bh=7ScPPDBLqgTRfpZVYiWUNROBp2LC930SYUNUqIVvSGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MgING1j8ITYqo+w+ZE720yT1uAvmfUiHE3V835LRWXenuJ1lk/4/mRRscnat2bsar
	 2cJRK4/rXdd54ryhLk1TaqD1uKJhI+HK36zHCBsEKTRarkMXAsAncGIyiArq0M05gE
	 A0qQYCH8do+8onOr3WJq48phZKCxajOy89tLOFZ7F8Q0QRZEnjH0z4rR4AMkIUR/vz
	 kTmIuZIngv7gtu91Br8aF6t68tFQfsdIed9ePNDTInAW/OYBJvn2uCk6YeuhZeCK1d
	 5lmJGCNX372lzDMeiS2JFtR74kSJTpCVgTp960djrpNQ24RnykxgrfnFftjXzqCAtb
	 pG4nnSeGFao4Q==
Date: Tue, 9 Sep 2025 20:46:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Durai Manickam KR <durai.manickamkr@microchip.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, balamanikandan.gunasundar@microchip.com,
	nicolas.ferre@microchip.com
Subject: Re: [PATCH 0/4] Add Microchip I3C controller
Message-ID: <20250909-pointy-tanning-8e7b4320979d@spud>
References: <20250909111333.170016-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20250909111333.170016-1-durai.manickamkr@microchip.com>
X-Mailman-Approved-At: Sun, 14 Sep 2025 13:33:23 -0700
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
Content-Type: multipart/mixed; boundary="===============1642065137703790608=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============1642065137703790608==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bccwR6h2lKhRSsYP"
Content-Disposition: inline


--bccwR6h2lKhRSsYP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 09, 2025 at 04:43:29PM +0530, Durai Manickam KR wrote:
> Add support for microchip SAMA7D65 I3C HCI master only IP. This
> hardware is an instance of the MIPI I3C HCI Controller implementing
> version 1.0 specification. This driver adds platform-specific
> support for SAMA7D65 SoC.
>=20
> I3C in master mode supports up to 12.5MHz, SDR mode data transfer in
> mixed bus mode (I2C and I3C target devices on same i3c bus). It also
> supports IBI mechanism.
>    =20
> Features tested and supported :
> 	Standard CCC commands.
>        	I3C SDR mode private transfers in PIO mode.
>        	I2C transfers in PIO mode.
>        	Pure bus mode and mixed bus mode.
>=20
> Testing done:
> With this patch we are able to fully configure the lsm6dso I3C slave
> device. Unlike I2C, I hope there is no linux utility to check the
> various transactions supported in the host controller. These features
> will be added later on this driver after testing (probably with I3C
> analyser KIT).
>=20
> Durai Manickam KR (4):
>   clk: at91: sama7d65: add peripheral clock for I3C
>   i3c: master: add Microchip SAMA7D65 I3C HCI master driver
>   ARM: configs: at91: sama7: Add SAMA7D65 I3C HCI master
>   ARM: dts: microchip: add I3C controller
>=20
>  arch/arm/boot/dts/microchip/sama7d65.dtsi    |   12 +
>  arch/arm/configs/sama7_defconfig             |    2 +
>  drivers/clk/at91/sama7d65.c                  |    5 +-
>  drivers/i3c/master/Kconfig                   |   14 +
>  drivers/i3c/master/Makefile                  |    1 +
>  drivers/i3c/master/sama7d65-i3c-hci-master.c | 2705 ++++++++++++++++++
>  6 files changed, 2737 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/i3c/master/sama7d65-i3c-hci-master.c

Where is your dt-binding?

--bccwR6h2lKhRSsYP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMCEKwAKCRB4tDGHoIJi
0r7ZAQCTBnAV4Wn+pTN3+wCIOYGS0jYhZs+X+llJ2HIcWkKVdgD/SvAvKvYbuKH+
hwqxPztZvWI/Ee+rfQJb8gQQ0XPEDgA=
=Eui4
-----END PGP SIGNATURE-----

--bccwR6h2lKhRSsYP--


--===============1642065137703790608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============1642065137703790608==--

