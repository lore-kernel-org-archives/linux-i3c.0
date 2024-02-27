Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B70C5478C
	for <linux-i3c@archiver.kernel.org>; Mon,  4 Mar 2024 19:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/uXfrKnTq44kzLfFmciiMp/7tG9T6KpO/tSgP1M9oQ=; b=eOZa22M4wfsQQZ9obeSfmpSfuJ
	ZAvDrsXLPjUwyfsadwGZOotbxpsXwNBEbfNMoulYy0x1rIG1fOOCjV5GjmPrQ0DIV7XA54ZX417Zo
	vBOMayZUx0NGYrY/6BYfMP2yq903UPX0DefQ85/POZpTlwBwTGv2NDqS1GgBgpoVXdJCAoTvrkAK6
	VNbY+8rBjw2FWaTSZns2XAG4mt3MSTC1A3xqcEfiJz4+7xhMjKWia4Ue5Jflh2hjvGEKaYnNL6rgT
	cvCQl/A4xQEVnxne103GmG3jlexLiOQ74uXH3gybWYiRCn/BbY1fshoU71j49lmdVpRjGjbWbVJzK
	gwXF35xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhEAn-0000000ATFv-3SLr;
	Mon, 04 Mar 2024 19:40:29 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf0sr-000000067zZ-2Vd1
	for linux-i3c@lists.infradead.org;
	Tue, 27 Feb 2024 17:04:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=nx3A
	l3sJLVHlvfnNiUefu/fSlBGWeq90iTuG8ElMJVI=; b=RZWe+IvlEXiNRgwQBlBr
	HkeuLQlomaOzt17btM8FfRjYYXz3GxFr9/zMIUUmAYdMi944hjqvJ6n1YYD/421j
	IAJ0Fy4gEbKYmsPmAAwLkD9BlkG/fVGmFIEg0cx3oeWCRBJr4gfIZ6DeaPo7i7rU
	hgyz3v8BnPUXTrABKnkLDBhaejAUAiV/qndSkX11xH0QRyV34l29hMAF6gN/Pxyt
	kZIYL8ltx8O8ESK60+lQeYkJJyzijLo4Ge+qQm5/9PN7gX/37Zt4vYeNBZRZdlig
	T9o2CB+cbVIyoVuE440kLAtcQ6NSNZisaw76X7iZOQuY4xoAHZ1qnXFozdWiq9FF
	Iw==
Received: (qmail 1670908 invoked from network); 27 Feb 2024 18:04:42 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Feb 2024 18:04:42 +0100
X-UD-Smtp-Session: l3s3148p1@CKOvBWASTKUujnu9
Date: Tue, 27 Feb 2024 18:04:41 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: Remove obsolete i2c.txt
Message-ID: <Zd4WKY966qe4DC3i@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-sound@vger.kernel.org
References: <20240222174343.3482354-2-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240222174343.3482354-2-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_090450_564955_53F94868 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 04 Mar 2024 11:40:27 -0800
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
Content-Type: multipart/mixed; boundary="===============0955461871370390256=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============0955461871370390256==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J5qK8c/j+dsQwcO0"
Content-Disposition: inline


--J5qK8c/j+dsQwcO0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 10:43:42AM -0700, Rob Herring wrote:
> Everything in i2c.txt is covered by schemas/i2c/i2c-controller.yaml in
> dtschema project, so remove i2c.txt and update links to it in the tree.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--J5qK8c/j+dsQwcO0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXeFiUACgkQFA3kzBSg
KbY1UxAAs23gIOVvLkCmeyrbAAN7i3d7cIQP2kzKq9Z4iouxjZavNTtUoLQI3Dkk
i2BhJMPBbngmCwt4X+FDvI5qNRbBLNmX11fyuXpND15iRR6dPZ4jPm7VvMBxy62h
CrNy9H6KK6ydfsaaRCKZvx6SuvcRcPd+rZeHSFLh6/3ESldx7JA/dAtCsFI6KUxF
58lIqJZg++rAfqxaa2lJJFu180EMRcJzRmGx/c14ySOtYszfEU/KMnSFxdLlStBu
S74TiQ8Aif+WUILLavWSCBiXJ3L6eiba+0fS0m+68z3x4UbpiMX8J1Zs4wq0TF+I
wkPJl9iI0EhNZCy2T0l+iAFCBkLG84w9iyd3eQuTyp6Wl2y1jlbw7B4h57P/8CK+
SWI/E6NdS3Gda5CwQw4zqAMlTv1VaJXpOlJv4MohCy1VfzaK/q/9bR9w9WVFOf0T
N4ub2OU3EmKrLvxZfJPPbWgSNsS4zuDrZ1EoC7LYP7+Wx15ktYux9a8pRNC2RwhL
xrRYAR7lPkZwz3IVgrhAFeIssOsWD0C4qOeXvX27cd2mqnDa9xWHIGd1ZEAaiLm7
5tbuk7aF9qizAL35XAeM7/zZnIvGGNDPeu696we834v6Ud5ThnMqjVTnmDgdBT6h
ftuE2WjABe5yP+zBZtKDrNFl0Cf1UtJ6DXn7TyDGkdV1GB0IYBk=
=PXn7
-----END PGP SIGNATURE-----

--J5qK8c/j+dsQwcO0--


--===============0955461871370390256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============0955461871370390256==--

