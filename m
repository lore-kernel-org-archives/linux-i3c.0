Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D719606A339
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Oct 2026 11:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UQ+cjmcX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P2d3TTkI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OjIEF3BVFt04Yf3c6mQ0eP5z4Y6YcMLlVzS+v+zH/VE=; b=UQ+cjmcXiQ31/SZFm8exNFeQFG
	/fJRFxBMitmr8KxjMhofFdS1voWvC3iPhbGSGsKAokJpLxXllqRLXehvG2rXfosY/2qsLR/eCq1Ow
	M6U7AAb5iZRHUIYi2I+6/tc1LmPUKHQr9rFP+/ylSLQQtIQkgKWy8i/Irg1OTmZ7dldDR/fLloam3
	Y3rpCDVAwSgrTTKKWrdE/cniLdElF+oRIPoCObnjypd3xoDrlzkpPOZhJbl9lWVame7waOiRQ5TKk
	rG/9PFcniWzdXQxRhsfk1PBV45SL8nqmdmzxHmnibNGtQ2w5yJUOpz8ByAjDwU6epPGtCy3THfRsx
	0DWZmXcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLevH-00000004NKH-2voD;
	Tue, 27 Oct 2026 11:00:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdhE-00000004Ogl-0IWb;
	Tue, 29 Sep 2026 19:41:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 474326022F;
	Tue, 29 Sep 2026 19:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20111F000FF;
	Tue, 29 Sep 2026 19:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790710859;
	bh=KAUghNeL44tviTaVmIMjHkDsIJ29Dhpn/+AN6JDKLAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P2d3TTkISdUJC1YsLuhZljaOYdZOKKzQF+g7bVMFxM78S9Y9e+uNzUmoc/ZtK4D3F
	 LIstQvkhHvev0H5nG4LCBasAdNG0umlWOg8/QZW+Zjk4C1PfR3W71azyaBKDfe+hiU
	 sI/Mnpfc/dntc7NK0ZruCuOnKM8ucxfqNICfC9BmvVnXi115NbQ2a2Ne0F2TnBjPAl
	 lXvm4XHznPyHKOhVeq8wj/Ay9+UZdpd0NtahbFiQ4kYL22BdR8YhMCjt2ZqjkPu+Bs
	 juq/wcsIezSGXOEDR7kvrCbPcLsZdyC15CG3OetKSBLIGAPE5Y1rJGTW31qSg+EOSA
	 mOqszPh2hETDw==
Date: Tue, 29 Sep 2026 20:40:51 +0100
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
Subject: Re: [PATCH 18/20] regulator: dt-bindings: sy8827n: support standard
 properties
Message-ID: <20260929-childish-ethically-0a9c6d63ee62@spud>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-19-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260929061417.20733-19-jszhang@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============5821177156889907172=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5821177156889907172==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6jYRsrYHOKy0uFBN"
Content-Disposition: inline

--6jYRsrYHOKy0uFBN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--6jYRsrYHOKy0uFBN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarwUQwAKCRB4tDGHoIJi
0kiZAP98RDyWo+sgTIVhEcs8b/0YZbaCHEucmwHwYittmSNXQgD/ViPojKzhd0DA
1NfubBBIQUkUPapBQUZaKnCSWaP1BAw=
=mlj2
-----END PGP SIGNATURE-----

--6jYRsrYHOKy0uFBN--


--===============5821177156889907172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============5821177156889907172==--

