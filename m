Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7CCC48BF8
	for <linux-i3c@archiver.kernel.org>; Thu, 22 Feb 2024 18:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+ttC+pEn1sOKw5vJOgXYEkBhrAFyrOaMHwd8of9Qt4=; b=i3f4f3nOBPPma7Xe9nSNCqeTKc
	uY7KoZUo8AsmL4obV24y01wCMudeZXfwJ7bf7XEJ8yzlnCVAEho47gyp1KsPCiydK0LDtXPp8eyYC
	azEZBQK6d9NPJGxZ4JHuqKsbQucPKZ0bPzivK3dOxWvdpnFUEGz40sSaIkyrxWRQdL3mXKPxYRZOR
	EoF6O37DofWPNdAcU0yVI9tmvztJOULs8/+9ERCp0cXCUuIlran5zkuhZp5KTsVbAsnQ+ggITNty/
	szqoV56F5l+ooZfqeI3NPzPAhdkWO6vhJAlpzcs9920YdkleN+nmyXqBhyuIBsqC9LYKU7sGL/O/Z
	Zi18DKDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdDsS-000000066Re-1PM4;
	Thu, 22 Feb 2024 18:33:00 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdDC6-00000005sFX-14ew
	for linux-i3c@lists.infradead.org;
	Thu, 22 Feb 2024 17:49:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 573DACE22EF;
	Thu, 22 Feb 2024 17:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE6FC433F1;
	Thu, 22 Feb 2024 17:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708624145;
	bh=qQIgdPAJqtE8XXmXub0O8Rd/yeQbkMmh3GTE/TK/Tn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hnTrKsDCaXq389V/MLeKuCIQhyo+83RmLnaEuKxroeIjmu7vdV9BGBZb4T8wg9xfQ
	 KLqh8Uvx9DGYffJGHexbXyMJ6q5Ft+dOTR3b3BZ/bnxgpFaX4iDawETtw4kgb6i5v7
	 x8FR3b9BDl2jUVqyP22qzkceHPvWGxyT2LDKNolSFe2vRU5t5MqXY7WrXJ4sGR7irv
	 0ai0DDNl0Rq4oBwl0zYDV7tnSgfEqrfq0xo8qTmdRL6LgdgSMVXTecZ9OfRXSFDkRz
	 gxYrneBs78MbG9/2ZvhNyh++YUNWiCazHIgxIkbe5Czj9vluouYNjeplmB+SnwgvUN
	 gKC68PthD7Rlg==
Date: Thu, 22 Feb 2024 17:48:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: Remove obsolete i2c.txt
Message-ID: <3cc9a239-4985-480c-bd93-2776878089d9@sirena.org.uk>
References: <20240222174343.3482354-2-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240222174343.3482354-2-robh@kernel.org>
X-Cookie: I have accepted Provolone into my life!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_094921_963937_1B114759 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 22 Feb 2024 10:32:59 -0800
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
Content-Type: multipart/mixed; boundary="===============5279310850278973564=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============5279310850278973564==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tY8a9DQ5aOL2GSlO"
Content-Disposition: inline


--tY8a9DQ5aOL2GSlO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 22, 2024 at 10:43:42AM -0700, Rob Herring wrote:
> Everything in i2c.txt is covered by schemas/i2c/i2c-controller.yaml in
> dtschema project, so remove i2c.txt and update links to it in the tree.

Acked-by: Mark Brown <broonie@kernel.org>

--tY8a9DQ5aOL2GSlO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXXiQoACgkQJNaLcl1U
h9AWZgf/ZwqHiNRUE2Vn4dacJ+y7BDJMn5e9t5FVKyff28cZwq1ayS7w+9hDUqnk
dHhYCf28sN2pECB/tiDKzC6Uh6NzFJXBqkT6smD7dRZn2JyDob6caqExxDiz9OF/
bD8ZX0eAo54TlOS9GLDth9iT465twaEU2hBl+GNDP26jGxN1rl2E2ylrYZJAD9aI
I//YgDvN9bLmPiMW+IFe5ekj2xe7wsE+9Ih5dXg/ghDbEyE+b2aSp0Oa6qSyoGU6
7MNFsdc15uJuUv5bmOXYYxTmQw1/VoK9BeVMeOFusHWMshsP/zH/y/xTYC5/Gngq
5YwQDCScCwcInmAmk90oUyZxQXL+YQ==
=23+8
-----END PGP SIGNATURE-----

--tY8a9DQ5aOL2GSlO--


--===============5279310850278973564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============5279310850278973564==--

