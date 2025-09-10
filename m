Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B63ECAC598
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMcg6fewW8b59w0I0IJNYl+ehSpgt4s3XfL+neY1GuY=; b=1rtZ3hQSxtcK1rhAnUbyz7iawj
	oeRFzZ5yZ8q2F3NTPLqMY4XRUBT93MEq/kpOfyN/iHy9rsb0YDDAItHoAyKC+fPmVg1SnFg1zpOG9
	XZH2osCi1HAqk8AFeFnsADOe1bSAMIIHFmxTAfyne9eHpeVasXhcxmA/+8E/nx8T9E2xf4jdovFgM
	bhZf6K0GYnDlrgI5N8FzEINd670fGuACKJ+jDj+n4ntN+RzmbMNaKqWfMKhFywBj/A9anqvheRkVM
	oC2AVMLKWCuRZ5Gf8a8qn9fTdqsC9elpCcRuZmltDdb+TmXp6jIIOxrN3Y65IvGmxRaOsTwKfX8FH
	LozKbH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtPm-00000002A3g-3mTA;
	Sun, 14 Sep 2025 20:33:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwP2c-0000000FtwJ-45K8
	for linux-i3c@lists.infradead.org;
	Wed, 10 Sep 2025 17:55:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 18F2E601AB;
	Wed, 10 Sep 2025 17:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9893FC4CEF0;
	Wed, 10 Sep 2025 17:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757526903;
	bh=azrvDpWLRoLEgILDy3un95kIXS4nsuMR6SFCe0uv0Jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sUYb3e2gbdZy8wiixXLm4XD34LbyRbGP6Jm92K7vvghi7OoicbELkGpFo2LW5QInX
	 vVf/FsVCspyMXZ19zDEbBePnm/65TR96SWRiZC/I8B0ADnOiBeZ1rks64fxzE/U5qi
	 xJOFn6ziO+yLaOWo7N81T10eEWFD5+Qh1ulbQxet57SO8cL4WBqeahMzHL3z/4A5nw
	 TlHZSijMFZO4ObnshfDnTpppKRXKEJm2jijOL+ipL52+IZ5HQIVsRVTjRFgf5LbHA1
	 NN0pnfTAp1Sk/HxATR/IPTbVcP2012OZBJQ6XLqqOLtzL6qtEZewYYj9hKlXBEdLj/
	 z3yoR5r0L9GeA==
Date: Wed, 10 Sep 2025 18:54:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Durai.ManickamKR@microchip.com
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Balamanikandan.Gunasundar@microchip.com,
	Nicolas.Ferre@microchip.com
Subject: Re: [PATCH 0/4] Add Microchip I3C controller
Message-ID: <20250910-magician-retold-a6835179f71d@spud>
References: <20250909111333.170016-1-durai.manickamkr@microchip.com>
 <20250909-pointy-tanning-8e7b4320979d@spud>
 <d3daaab9-71f5-49e6-b3de-b05339fa7adf@microchip.com>
MIME-Version: 1.0
In-Reply-To: <d3daaab9-71f5-49e6-b3de-b05339fa7adf@microchip.com>
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
Content-Type: multipart/mixed; boundary="===============4011288270367824757=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============4011288270367824757==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bU1/wKBcuNijAj8P"
Content-Disposition: inline


--bU1/wKBcuNijAj8P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 06:14:21AM +0000, Durai.ManickamKR@microchip.com wr=
ote:
> On 10/09/25 01:16, Conor Dooley wrote:
> > On Tue, Sep 09, 2025 at 04:43:29PM +0530, Durai Manickam KR wrote:
> >> Add support for microchip SAMA7D65 I3C HCI master only IP. This
> >> hardware is an instance of the MIPI I3C HCI Controller implementing
> >> version 1.0 specification. This driver adds platform-specific
> >> support for SAMA7D65 SoC.
> >>
> >> I3C in master mode supports up to 12.5MHz, SDR mode data transfer in
> >> mixed bus mode (I2C and I3C target devices on same i3c bus). It also
> >> supports IBI mechanism.
> >>     =20
> >> Features tested and supported :
> >> 	Standard CCC commands.
> >>         	I3C SDR mode private transfers in PIO mode.
> >>         	I2C transfers in PIO mode.
> >>         	Pure bus mode and mixed bus mode.
> >>
> >> Testing done:
> >> With this patch we are able to fully configure the lsm6dso I3C slave
> >> device. Unlike I2C, I hope there is no linux utility to check the
> >> various transactions supported in the host controller. These features
> >> will be added later on this driver after testing (probably with I3C
> >> analyser KIT).
> >>
> >> Durai Manickam KR (4):
> >>    clk: at91: sama7d65: add peripheral clock for I3C
> >>    i3c: master: add Microchip SAMA7D65 I3C HCI master driver
> >>    ARM: configs: at91: sama7: Add SAMA7D65 I3C HCI master
> >>    ARM: dts: microchip: add I3C controller
> >>
> >>   arch/arm/boot/dts/microchip/sama7d65.dtsi    |   12 +
> >>   arch/arm/configs/sama7_defconfig             |    2 +
> >>   drivers/clk/at91/sama7d65.c                  |    5 +-
> >>   drivers/i3c/master/Kconfig                   |   14 +
> >>   drivers/i3c/master/Makefile                  |    1 +
> >>   drivers/i3c/master/sama7d65-i3c-hci-master.c | 2705 ++++++++++++++++=
++
> >>   6 files changed, 2737 insertions(+), 2 deletions(-)
> >>   create mode 100644 drivers/i3c/master/sama7d65-i3c-hci-master.c
>=20
> Hi Conor,
>=20
> Was planning to sent along with the review comments received for the i3c=
=20
> driver. Will add this and send in patch v2 series.
>=20
> > Where is your dt-binding?

Weird quoting going on here. Why didn't you just send it with the v1,
like is normally done? There's no explanation provided about why you've
omitted it.

--bU1/wKBcuNijAj8P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMG7cgAKCRB4tDGHoIJi
0s05AQCP7G23S1NipJsfJOd8wie6aelbD8Sa6UynTd7Ochn8+gD+K5Xc1U9x1a/Y
M4nWFL3C49jxzVXqTIRFRPhMFJxZIww=
=Iava
-----END PGP SIGNATURE-----

--bU1/wKBcuNijAj8P--


--===============4011288270367824757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============4011288270367824757==--

