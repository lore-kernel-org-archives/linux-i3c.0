Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4D2606A326
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Oct 2026 11:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t9P6uG8R;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fj11jVh9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iENN6FS5TCEgmwyfiKQJ0sSkKOYHDPBSiNVvCTmAI4o=; b=t9P6uG8R6rHhg4pJ8WKFw9xN5E
	TM1oAWgKG8WKTI7+UYntHMxlg28fI6JNlv60iFHRIcYADNWYTFmot8XsYXUebHxr9WfPZuDMYlcZM
	flAyxa9NmAYuzJnhztkwMrnkkl5XyVri3PvJGuNaxCc5uEfVqcVmxBAbnZSJyzHoTz9Pq5ZKiInSz
	cCqEFqs7kwggduGAifr3l0zwew/YF5bh0IEqpjMeD/7zHxgtGxcB52stRL3mcmkNdPfOuwJ1+yldM
	jlODcwVCUk6VQsEfqBnmmXWGPwLrCbGmE5jiQ8zaGx1cZg7ng8Uq9mKPvoH2bXPJp+Tc9QIi0nbA5
	sB8mWUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLevG-00000004NIU-2jtB;
	Tue, 27 Oct 2026 11:00:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdfH-00000004OPY-3fax;
	Tue, 29 Sep 2026 19:38:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F718412CD;
	Tue, 29 Sep 2026 19:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D59D1F000FF;
	Tue, 29 Sep 2026 19:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790710739;
	bh=VsGpWLQ4V1vn9Tkitk4/L46O9pJ0sPXyLWBFVS/Nrs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fj11jVh99BJrwxKYIiKxEfLqjBw8IgTj2t8u8K+Qbhjj6i2r3O4J19cjqCKMcc0x7
	 3pjU1jPb3MmY6lReift+WlXzce/KSulEsw4QGtLAmO8bgUM3PCeJe1IN1Wc0F1PLLY
	 EtE6R0y7ofJDC+Fwp1gsUG7an3u3q+xpOmOfblyT1rsIjQaNi+kqjpVsrHT1dp7EmW
	 t1mQ2zNdRwqPQ0A7TqLalEVPESJhh+fuiO0+GX8uJigtS8EJATk/I8xeiEl9vpMut3
	 hzokpXB+U0h0zadU0cfhGF7mxc7QTCqbBE8ux3N8t0I45sSEVwPZ3fJzuqyOk3/Omz
	 dJ1ya0c+b8LwQ==
Date: Tue, 29 Sep 2026 20:38:52 +0100
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
Message-ID: <20260929-smoked-laurel-087d5a3523a3@spud>
References: <20260929061417.20733-1-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260929061417.20733-1-jszhang@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============7208346477655719802=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7208346477655719802==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ftlp7D0f7O7319jz"
Content-Disposition: inline

--ftlp7D0f7O7319jz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 02:13:57PM +0800, Jisheng Zhang wrote:
> Add initial support for the Synaptics SL261X SoCs and corresponding
> RDK boards.
>=20
> The SL261X SoCs include five pin-to-pin compatible SoCs: SL2611, SL2613,
> SL2615, SL2617, and SL2619.
>=20
> Only reset, pinctrl, clk/pll, uart, gpio, i2c, spi, i3c are included in
> this series. The support for Ethernet, USB, SDHCI, CAN, DMAC, XSPI will
> be submitted after this series is merged.

This series is filled with wildcard compatibles, which we don't permit
typically. The only case for SoCs that I've seen them accepted is when
the devices covered are actually just different binnings of the same
device. I took a look at the docs for this device, but it wasn't clear
to me if these are actually binnings or if there are different
integrations here. If they're binnings, I'd rather you used 0 as the
final digit, rather than x, since that matches the synaptics
documentation for the family. If they're not binnings, there's no
guarantee that they share the same errata etc, and must have different
compatibles.

Cheers,
Conor.

>=20
>=20
> Jisheng Zhang (20):
>   dt-bindings: serial: snps-dw-apb-uart: Add Synaptics sl261x uart
>   dt-bindings: i2c: dw: Add Synaptics sl261x i2c
>   spi: dt-bindings: snps,dw-apb-ssi: Add Synaptics sl261x spi
>   dt-bindings: i3c: dw: support up to two reset lines
>   i3c: dw: switch to array-based exclusive reset control
>   dt-bindings: i3c: Add Synaptics sl261x i3c
>   arm64: kconfig: let ARCH_BERLIN cover Synaptics arm64 SoCs
>   dt-bindings: reset: add Synaptics SL261X SoCs
>   reset: add Synaptics SL261x reset support
>   pinctrl: berlin: use u16 instead of u8 for the offset
>   pinctrl: berlin: enable module build support
>   pinctrl: berlin: add optional pinconf support
>   dt-bindings: pinctrl: berlin: Support Synaptics SL261X SoCs
>   pinctrl: berlin: support Synaptics SL261X SoCs
>   dt-bindings: clock: add Synaptics SL261X clock
>   clk: berlin: add Synaptics SL261X SoC clocks and plls
>   dt-bindings: mfd: Add Synaptics SL261x global block binding
>   regulator: dt-bindings: sy8827n: support standard properties
>   dt-bindings: arm: berlin: Add Synaptics SL261X SoC and RDK board
>   arm64: dts: synaptics: Add Synaptics SL261X SoC and RDK board
>=20
>  .../bindings/arm/marvell,berlin.yaml          |  20 +
>  .../bindings/clock/syna,sl261x-clk.yaml       |  92 +++
>  .../bindings/i2c/snps,designware-i2c.yaml     |   1 +
>  .../bindings/i3c/snps,dw-i3c-master.yaml      |   6 +-
>  .../bindings/mfd/syna,sl261x-gbl.yaml         | 208 +++++
>  .../pinctrl/marvell,berlin2-soc-pinctrl.yaml  |  10 +-
>  .../bindings/regulator/silergy,sy8827n.yaml   |   5 +-
>  .../bindings/reset/syna,sl261x-reset.yaml     |  40 +
>  .../bindings/serial/snps-dw-apb-uart.yaml     |  12 +-
>  .../bindings/spi/snps,dw-apb-ssi.yaml         |   1 +
>  arch/arm64/Kconfig.platforms                  |   4 +-
>  arch/arm64/boot/dts/synaptics/Makefile        |   5 +
>  arch/arm64/boot/dts/synaptics/sl2611-rdk.dts  |  16 +
>  arch/arm64/boot/dts/synaptics/sl2611.dtsi     | 490 ++++++++++++
>  arch/arm64/boot/dts/synaptics/sl2613-rdk.dts  |  16 +
>  arch/arm64/boot/dts/synaptics/sl2613.dtsi     |  12 +
>  arch/arm64/boot/dts/synaptics/sl2615-rdk.dts  |  16 +
>  arch/arm64/boot/dts/synaptics/sl2615.dtsi     |  46 ++
>  arch/arm64/boot/dts/synaptics/sl2617-rdk.dts  |  16 +
>  arch/arm64/boot/dts/synaptics/sl2617.dtsi     |  46 ++
>  arch/arm64/boot/dts/synaptics/sl2619-rdk.dts  |  16 +
>  arch/arm64/boot/dts/synaptics/sl2619.dtsi     |  44 ++
>  .../boot/dts/synaptics/sl261x-rdk-common.dtsi | 135 ++++
>  drivers/clk/Kconfig                           |   1 +
>  drivers/clk/berlin/Kconfig                    |  25 +
>  drivers/clk/berlin/Makefile                   |   4 +
>  drivers/clk/berlin/sl-clk.c                   | 279 +++++++
>  drivers/clk/berlin/sl-clk.h                   |  31 +
>  drivers/clk/berlin/sl-sysmgr-clk.c            | 250 ++++++
>  drivers/clk/berlin/sl-sysmgr-clk.h            |  44 ++
>  drivers/clk/berlin/sl261x-clks.c              | 385 +++++++++
>  drivers/clk/berlin/sl261x-pll.c               | 145 ++++
>  drivers/clk/berlin/sl261x-pll.h               |  14 +
>  drivers/i3c/master/dw-i3c-master.c            |  24 +-
>  drivers/i3c/master/dw-i3c-master.h            |   2 +-
>  drivers/pinctrl/berlin/Kconfig                |   7 +
>  drivers/pinctrl/berlin/Makefile               |   1 +
>  drivers/pinctrl/berlin/berlin.c               | 259 +++++-
>  drivers/pinctrl/berlin/berlin.h               |  17 +-
>  drivers/pinctrl/berlin/pinctrl-sl261x.c       | 745 ++++++++++++++++++
>  drivers/reset/Kconfig                         |   6 +
>  drivers/reset/Makefile                        |   1 +
>  drivers/reset/reset-sl261x.c                  | 224 ++++++
>  include/dt-bindings/clock/syna,sl261x.h       | 131 +++
>  include/dt-bindings/reset/syna,sl261x-reset.h |  80 ++
>  45 files changed, 3899 insertions(+), 33 deletions(-)
>  create mode 100755 Documentation/devicetree/bindings/clock/syna,sl261x-c=
lk.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/syna,sl261x-gbl=
=2Eyaml
>  create mode 100644 Documentation/devicetree/bindings/reset/syna,sl261x-r=
eset.yaml
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2611.dtsi
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2613.dtsi
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2615.dtsi
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2617.dtsi
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2619.dtsi
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
>  create mode 100644 drivers/clk/berlin/Kconfig
>  create mode 100644 drivers/clk/berlin/sl-clk.c
>  create mode 100644 drivers/clk/berlin/sl-clk.h
>  create mode 100644 drivers/clk/berlin/sl-sysmgr-clk.c
>  create mode 100644 drivers/clk/berlin/sl-sysmgr-clk.h
>  create mode 100644 drivers/clk/berlin/sl261x-clks.c
>  create mode 100644 drivers/clk/berlin/sl261x-pll.c
>  create mode 100644 drivers/clk/berlin/sl261x-pll.h
>  create mode 100644 drivers/pinctrl/berlin/pinctrl-sl261x.c
>  create mode 100644 drivers/reset/reset-sl261x.c
>  create mode 100644 include/dt-bindings/clock/syna,sl261x.h
>  create mode 100644 include/dt-bindings/reset/syna,sl261x-reset.h
>=20
> --=20
> 2.53.0
>=20

--ftlp7D0f7O7319jz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarwTywAKCRB4tDGHoIJi
0iSUAQDQBP7yTMTRQHM/PgAAhHzzJvYdwsiryiFIj8dSXwY0TAD9F2PqX3b5V+ld
h0q5oG8eDLbjjVQcWB1DWaQc14lxeQw=
=yJKk
-----END PGP SIGNATURE-----

--ftlp7D0f7O7319jz--


--===============7208346477655719802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============7208346477655719802==--

