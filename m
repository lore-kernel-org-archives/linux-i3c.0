Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59C1CD37B6
	for <linux-i3c@archiver.kernel.org>; Wed, 13 May 2026 10:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHiMbj+x/hTwtS49+XfNv+gh+2Ob6ee30XMcTkkjbFQ=; b=QnrM4JOhESfc1MMEoSNTAbYQKV
	NOmVxCe4mEnylXq16NtEbXcFSLYn7ac55eGPK5Hy4PBKsht55bVnKANc4kKnlTWnVOlvwk2wXCGwL
	gePrFXPrhbTQZOmWSp3sGwaUpstATpaSBquq8+5/hMZ7S2g/cDZVzR7S16vriODYbmVSOFFQlMwWH
	7HLaf2plpa2D90BbDDhg7IXot7sHVJte+CfXiD0CQdhAdGQlsArIWl0/gRhbY8VEkKm7HL2KGuwbR
	NmpRTtqRuacfyPRpMhQBdQ8TrN11Y+ABTOs2CNHc2t5mzszj8JPmXQXy3xKozIAnkduIZUbfi6GH8
	wPkJd+0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6Ro-000000025iz-1YiV;
	Wed, 13 May 2026 10:04:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIZR-0000000GrsK-1di6;
	Tue, 05 May 2026 16:24:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 924E4419B3;
	Tue,  5 May 2026 16:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE04C2BCB4;
	Tue,  5 May 2026 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777998268;
	bh=/UB6MuZVu1wH16AzcLmdudUfOsdVTK2ldP8gyOgjFPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DymjIbDBQ7v6YinmHZT129hxnR1yEV9gg47ge9IsQCkBSYyRCpSnwcOrTtIeDZDRh
	 0lMbiFmww7nZ0Vc30/FxtzNNXkIt1sqUU9YhfUVbedlc+fBHvZhMyf+N4wa1sPF4AH
	 Yvq99bP9c9LrJoFISFgD+7ySYNdysewK9HCAdvPWIpXHbd2OV769hoK0xYjUGqDshr
	 mTvvF2tbXoWHqTJVd/EBKql9FqCBn0mhCYk24ReAK0GGiTr4bnwomSLpBF1HuHn3lQ
	 /CJAuDuf+GPU4TTIxhJbEHibX5pN2ELu+nKCiyruCzepomKKL7fQGGGi9l/5LlWvV+
	 /+TuUeEJv3YPg==
Date: Tue, 5 May 2026 17:24:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org,
	Ryan.Wanner@microchip.com, tytso@mit.edu,
	romain.sioen@microchip.com, aubin.constans@microchip.com,
	cristian.birsan@microchip.com, adrian.hunter@intel.com,
	jarkko.nikula@linux.intel.com, npitre@baylibre.com,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: i3c: mipi-i3c-hci: add Microchip
 SAMA7D65 compatible
Message-ID: <20260505-prewar-disarm-04392f03d61e@spud>
References: <20260505071327.125787-1-manikandan.m@microchip.com>
 <20260505071327.125787-2-manikandan.m@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20260505071327.125787-2-manikandan.m@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_092429_447981_BF243EE5 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 13 May 2026 03:04:10 -0700
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
Content-Type: multipart/mixed; boundary="===============4654504095047767770=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============4654504095047767770==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0l+HBF2vu6FcRNjE"
Content-Disposition: inline


--0l+HBF2vu6FcRNjE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2026 at 12:43:23PM +0530, Manikandan Muralidharan wrote:
> Add the microchip,sama7d65-i3c-hci compatible string to the MIPI I3C
> HCI binding. The Microchip SAMA7D65 I3C controller is based on the
> MIPI HCI specification but requires two clocks, so add a conditional
> constraint when this compatible is present.
>=20
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--0l+HBF2vu6FcRNjE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafoZtQAKCRB4tDGHoIJi
0t5tAP9j1Ts8TV5Nm9gBaXbBndqBbbHst/jK10FipNvviPDt+wD/T1eaRHjorVh5
jpi/+IbbVA5d+oR7IgRe2HlgNZMqRQU=
=SHjI
-----END PGP SIGNATURE-----

--0l+HBF2vu6FcRNjE--


--===============4654504095047767770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============4654504095047767770==--

