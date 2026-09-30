Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7692E60A2600
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Oct 2026 11:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jCmZ84Pf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BqkbTaeE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NgWWC5pG+XPJ7EwgGDZqg9hQ3thELF/ZFTqLVZouY+M=; b=jCmZ84PfIAHBZG96Gp12zkNWx/
	PeCbuKDRQxKjdc7z+8BsukL+ay879kaMSwtL8l0c9IakbS5Zk3eepojhhUwxMRW3yhdciEefr9nOf
	TavRxtmCIjFZy66V5Hbm1BhvcPXXwV7kza4UATQqxC/r7LVl7go+gwSMXR7et/UxrWzU8uryBThTH
	pFf+/2DqHeyVqduJi8nE2v77ml42XRm7fTule8m58Z8ixGzCQeizuZWGE8yXLp9nw4IHj4vZs+frE
	ql2OFNOcRQjPuHqRc0W0K/WlPxLpND8PUApim0Qpru9ljawWLyde/Z/iT+JYMGjNax4egjvxubPpM
	cw7uyZ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLevI-00000004NLk-0kLN;
	Tue, 27 Oct 2026 11:00:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxH3-00000006iKK-087O;
	Wed, 30 Sep 2026 16:35:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 73C4F60252;
	Wed, 30 Sep 2026 16:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11FCA1F00893;
	Wed, 30 Sep 2026 16:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790786116;
	bh=IotFDljTrZjJVOHJs5Jb8Ssuv+icr3IseWCLlR0xMJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BqkbTaeEJGPn65JzBCPQabvkfi4q3suZsUonrQ3JIYiiyBzhY/r9JNQUUwQ4lEnDf
	 UHIK5MS3srRqxbW56VkqD3p70BI2Y0c6OKFlj6G4gltrPwBGrgKdbY408ULgmc4Tm0
	 Ztg7yaeTGTz9GRlUb3PsnbV39dgYKKXEQJsjbdmo0RgLhWDe00VmQ+JF0ITPnrBbHF
	 9szCsNcsoKrnCD6vV9vh4wvdr2bSD3+XSqIb5sGXvL/J2w291GLOEWYhZkQ2L7TsXM
	 xDS79Vy3/jO+IhE+uyNP7JEPXozepUeV4VPYvK7sJgvoA4nYxECPu4SXOKrFPEXz95
	 +aGYtEz7XxSYQ==
Date: Wed, 30 Sep 2026 17:35:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org, mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/20] arm64: add Synaptics SL261X SoCs and RDK boards
Message-ID: <20260930-consoling-scouting-e60864374d04@spud>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929-smoked-laurel-087d5a3523a3@spud>
 <ar0da71zOeeYxURQ@xhacker>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ar0da71zOeeYxURQ@xhacker>
X-Mailman-Approved-At: Tue, 27 Oct 2026 04:00:48 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7020796014814420037=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7020796014814420037==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0aKKosY+SZkBUlIw"
Content-Disposition: inline

--0aKKosY+SZkBUlIw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 10:32:11PM +0800, Jisheng Zhang wrote:
> On Tue, Sep 29, 2026 at 08:38:52PM +0100, Conor Dooley wrote:
> > On Tue, Sep 29, 2026 at 02:13:57PM +0800, Jisheng Zhang wrote:
> > > Add initial support for the Synaptics SL261X SoCs and corresponding
> > > RDK boards.
> > >=20
> > > The SL261X SoCs include five pin-to-pin compatible SoCs: SL2611, SL26=
13,
> > > SL2615, SL2617, and SL2619.
> > >=20
> > > Only reset, pinctrl, clk/pll, uart, gpio, i2c, spi, i3c are included =
in
> > > this series. The support for Ethernet, USB, SDHCI, CAN, DMAC, XSPI wi=
ll
> > > be submitted after this series is merged.
> >=20
> > This series is filled with wildcard compatibles, which we don't permit
> > typically. The only case for SoCs that I've seen them accepted is when
> > the devices covered are actually just different binnings of the same
> > device. I took a look at the docs for this device, but it wasn't clear
> > to me if these are actually binnings or if there are different
> > integrations here. If they're binnings, I'd rather you used 0 as the
> > final digit, rather than x, since that matches the synaptics
> > documentation for the family. If they're not binnings, there's no
> > guarantee that they share the same errata etc, and must have different
> > compatibles.
>=20
> BTW: May I query a qustion?
> After searching the maillist archieves, it seems now maintainers prefer
> spiliting this kind of SoC initial support series into separate patches
> for different subsystems, e.g uart, i2c, i3c, spi and so on, then the
> SoC pinctrl, clk, reset and dtsi/dts files, but AIUI, there will be
> dtb check failures with the SoC dts(i) files patch(es), what's
> the normal solution then?

Depends on the type of failure, but yes it can be okay. If the failure is
some missing schema causing validation to fail, that's fine as long as it
passes in linux-next (same as when you add a new driver and binding, but
the dts goes to a different branch). What's not acceptable is breaking the
build because some header that provides clock defines is missing in the dts
branch or in the driver branch. In that case, either send all that stuff in
one "New SoC" PR to the soc tree, or put the binding headers in a shared
tag that is the basis for your PR to the relevant maintainers (typically
clock) and the dts PR to the soc tree.

--0aKKosY+SZkBUlIw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar06PAAKCRB4tDGHoIJi
0hpkAP0blrEbmogoZD0AKnwhpfLwMnReZOlvZF7i9+6g8f+4VAEAnxRjQq9YWWJf
7AVUGg191KqlxkjCS4xQdsNuVaTiiQw=
=6gkk
-----END PGP SIGNATURE-----

--0aKKosY+SZkBUlIw--


--===============7020796014814420037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============7020796014814420037==--

