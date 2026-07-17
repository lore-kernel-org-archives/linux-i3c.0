Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487CBC5516E
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Jul 2026 14:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q347iAL/48CUookbE8LuKU1sUsOPLDZx4wGlQP3OI98=; b=GI12gaMIPc4Ibd62ZOQ0fbpPBJ
	L59lMyBCz3+yVWsCXMN6QnNCI/6gJYltxrHt/dAAl6StvpPD+nLM5klOX8bUKDXNqlv/H+ay2nSXj
	NAMQnh3DAoHmFGD0DsM6qxdHYn0s6ZKRqTz16r2hOJRocPh6J/+H1P/MSwbpR5WMhxqVTndI8DNQP
	wwValORa28arVQc0VFcDVmvGLTQj2ck1UoTXkBOMoKn/gu2TXo2wcxl4CQh6zHqzAoUPC9fWdD0Xf
	PuEJdJ1IzWfGvja70/lUau5Wy7Q4GxUhAbi+dwOXEmNY7YZiDjII1O6zC5yrDb7Tggh1cvpkQljmn
	NzQhN74w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRrl-0000000AlmM-3qww;
	Thu, 30 Jul 2026 14:36:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhHA-00000002D3c-3fXJ;
	Fri, 17 Jul 2026 12:02:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B3F1460A6F;
	Fri, 17 Jul 2026 12:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A1A1F000E9;
	Fri, 17 Jul 2026 12:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784289763;
	bh=M6dliTL3upPz3AWTcFuW/Bf8sQHGqFSf/FvFJ52AEJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=afG26BD5DJqcY9jFPHWwLoeF+nbY3GkVgbzmYISsj7xeZVCukUAa6Tdq4RdHOi1kv
	 VhO0c4wlgnq8/uJ4G1UyEHvTyxI9wOPKKaqgViGb19EFGyS0cg19B9qoWfDnJR0YZm
	 xD7VopeVKolG7iP9adxYqAQAtLV8auh9YJx/PsTDMa4HNn8peJiYCom6ppiEpBE6Ri
	 O5VPY2KO8x4IepP8GFuNG7upUnYOFwAgzIaIiRLTvysiIiBbNcvkYDfO9/wew8cRsb
	 l3JKPUr7GFFU/UKQZM1P948sh1G9gBvmTEg4KhGcT678i50OfZ6MBUBq9hVbqmsveD
	 3Nyo9BqNTTjfQ==
Date: Fri, 17 Jul 2026 13:02:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Swark Yang <syang@axiado.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jan Kotas <jank@cadence.com>,
	Michal Simek <michal.simek@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 6/8] dt-bindings: spi: dw-apb-ssi: add Axiado AX3005
 SPI variant
Message-ID: <6d69cfd0-5f3b-4324-8d64-b4695cbb3e92@sirena.org.uk>
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
 <20260716-upstream-axiado-ax3005-upstream-v3-6-c429095143ec@axiado.com>
MIME-Version: 1.0
In-Reply-To: <20260716-upstream-axiado-ax3005-upstream-v3-6-c429095143ec@axiado.com>
X-Cookie: Enjoy yourself while you're still old.
X-Mailman-Approved-At: Thu, 30 Jul 2026 07:36:08 -0700
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
Content-Type: multipart/mixed; boundary="===============6393451709628847560=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============6393451709628847560==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="70M3+S0UoM/WolbI"
Content-Disposition: inline


--70M3+S0UoM/WolbI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 16, 2026 at 08:51:13PM -0700, Swark Yang wrote:
> Add binding for Axiado AX3005 SPI controller. So far, no changes
> are known, so it can fall back to the snps,dwc-ssi-1.01a compatible.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

If there is no need for things to be part of a multi-subsystem series
(eg, dependencies) it's normally better to send each subsystem
separately.

--70M3+S0UoM/WolbI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpaGdoACgkQJNaLcl1U
h9CYYgf/a6ZXfaJE/jmFwdCosDxknw75RDj7nPAqr8ZtQ6OEKCVRSIVBgwrMG1B6
7TPPAIzIrDPqOWeb/BZihDW7BKUj2aDsl7pZivADMe0txrRhev2UcBUZUMxW1sXn
DgyCTELlXBzkCAltV41zPIZTn6Rwcy8lHkkDXAfh0JGD5azOUiDxKAusCY9IhML1
YtCaED6Zm325NAZ+cUqXIKy177WK3d4XQrt4N/qPahtGnlsER6BwUocE9HGNpNLh
l3iTBw5h+slXmMR6H40Ax4/E64jiKe5RpDEW3MeDQgZLROX+xs5G+fp3eE5NGFPQ
Z9zQeNxaiqK3XtZlukPgm9tW3O9UDA==
=i8XU
-----END PGP SIGNATURE-----

--70M3+S0UoM/WolbI--


--===============6393451709628847560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============6393451709628847560==--

