Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC0DC7EE30
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Jun 2025 00:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhovwjohfoLkbOQ+yfIJG1jaW7gTwhicBcXhua2rNZo=; b=S6m1sia62StnXgssfVC/tGjFOT
	xepIYKcmsEovNiY1ZP8IAk/cZRPJzqUYEDBCXSnBrc3mcaujHMlysIm6G+QrXpiZursuAeD/VKLxv
	fJ1ALNyp+JpvLLhZ7+PbeRKrzvi3816C+qPgY4lpQG0Q7h1No6OrD4oPd5/jgFtZ+3nCadw7FOPRf
	Ufw3IgB3uUbRgHq6yoBuxIS2oyOopQeljX040Sxpqe5F/IzeA4aUDNFJ+nVwFN2/Ct3xCeLSrqLqn
	lUTfXFKUnVrszANskcJW8/pGwl1ONREF0ZlMrpL6FYa1pC97OQVBwFEgvzpQzXnEyB2BAvsGUY8s9
	H/dqdR0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrYq-00000004EiW-2iqB;
	Tue, 24 Jun 2025 00:30:52 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPQcf-0000000AvJG-3UBh
	for linux-i3c@lists.infradead.org;
	Wed, 11 Jun 2025 18:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+sHL
	OtvVQAWPzK90izduJIoY+Zm6g8PEnogD+3ePDdk=; b=O0Su8fYL2y6JCn4UtX02
	MxQ8BZJNCO6R1O8DyI5SQxIYUYq2CuHf4RF/TxYVy9Qilfc2b9attcXNGbmYOcos
	SfUSDlBGmw1Y0cSjfzp3X33b1JVjNIbwrnL+ed/nxle2WVaAWJcgL83xEC7V5KeS
	s3z4dCk20wFvFlGF8FFRRe3SoGaQ/AN2M0d0lgLm9afs2xQrPFQyGV2Csg5Oyaqn
	DwJAN2xeSjTdLKgblPllneWRFWmnb1HkNNccwRGsZYl4SWO0lPFOAQ463VslSb9C
	WbxHLglYdhvLLbcFRc1AZzXARaD5smw7dM0SvflySCOXhxR4ORo9G9GQAVIDBrKw
	yQ==
Received: (qmail 3350333 invoked from network); 11 Jun 2025 20:56:24 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jun 2025 20:56:24 +0200
X-UD-Smtp-Session: l3s3148p1@x1CSXlA3cIEujnuC
Date: Wed, 11 Jun 2025 20:56:23 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-hardening@vger.kernel.org, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH RFC 0/7] i3c: add driver for the Renesas IP and support
 RZ/G3S+G3E
Message-ID: <aEnRV_ORTzoxv0sM@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Rob Herring (Arm)" <robh@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-hardening@vger.kernel.org, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <174964724485.330045.2181706921272138816.robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <174964724485.330045.2181706921272138816.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_115630_754441_32919B06 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 23 Jun 2025 15:46:42 -0700
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
Content-Type: multipart/mixed; boundary="===============5218327933523087643=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============5218327933523087643==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aSViWGA52tcJQoQY"
Content-Disposition: inline


--aSViWGA52tcJQoQY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/renesas=
/' for 20250611093934.4208-1-wsa+renesas@sang-engineering.com:
>=20
> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: /soc/i3c@1005b000/tem=
p@4a: failed to match any schema with compatible: ['adi,adt7411']

I sent a patch for 'trivial-devices' to fix this already [1]. I forgot
to add it to this series, sorry.

[1] https://lore.kernel.org/r/20250608162240.3023-2-wsa+renesas@sang-engine=
ering.com


--aSViWGA52tcJQoQY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhJ0VQACgkQFA3kzBSg
KbbGQQ/+Jku4T09kmX5TY0+yOrTfJx5eErXFxKVs/BqNK8vt10Uwi8RNOe0E8cb3
kiOQjG2P1cbu6KD/jH4hbKJh/AiQXUJTfYWt95PDLqsLTa/9XzdbeOE5BoH1syl/
UZ2vmjA5cEIUgdTx1YdHMK5XipyeeKa6giMj56jFajjXKayAnpfYn+kKDKgvfYs4
sYuIX1jyhOoJRP1DADW3sLrMXVBgCnmaKwbR05OK8VshzXjYDdPLZYgH/W6rzEb7
hZ4yT3vGCXYw5Sz7aVk1+q/u91ZhTAcz08A3oEhHmSpuuaeCViWk+mOpPhhHR7Gf
V18zhJVyapl4Mm0XfwgmeAp/g7iPsMga1V72ajDNs85PO9V2itHtpysMepHGXT0K
Jag70wsEDL+gm+eg1MWmx80ucltZ78ytY71p4mtszJ8IA/QTdyhf6FFXZeo+r/Dk
HmL7RWiFSvKh6iukMcs+/+EEfo5d0InJ8ALbTq9Slv/TvuCJxrIdOEi7K5o2vXAW
NhfzbJ6EyamcMxRmDwj4ubcVk/TQcu5RYmpMj1TrNgYgSpIRymhe5I0XLpLsB3Km
9dtw0bqAn7FLRcCyISn+TJK1L4FZ2Ps6fi5hFXUvyeM9uXP6R1yoy6EvTNeIDKru
FMPv8Xn2ksbKeP+a4rSVyQqJvmWJ1jhkAVNeq1LTjr2RI+OUSJI=
=coKS
-----END PGP SIGNATURE-----

--aSViWGA52tcJQoQY--


--===============5218327933523087643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============5218327933523087643==--

