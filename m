Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661ECCCFA13
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Apr 2026 10:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skRJD+msAOX7og3UTdKeDZ3V3FFO1mN3AvV/nLhFJlc=; b=n/9Q/n4KslUDFMBXJZfHc3y9Bq
	HAILJ4klHQcFSY0b8LoHyeorOV1+rp9U+YWjEQmotOlqdt8ce9zAKY4BPlcyh5GO41AFDkZezyOPu
	n42NhVEIJeGM4GIf658ccT6+Xsnbyjjzk73d/vhn/492Rs2pIpQ54MUw7J8IoJt0+lOdRMbV1hRtS
	i3sV661YrD6bDNdZ3OcXSUMjT+79zH2BCAzMTeRwQ/5DeWB6a9eaYF5ZB+f2fJQhMxmGOfUuGqi80
	6Keu9Jk0q1j5po4tjTGGQfDuYTrdEGUe6WBjSrjYEpC52rXNSEjWnX0hqRpNB+/D/E3mkFzzCtm4r
	0wIcgVxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOFt-000000059re-1oBc;
	Thu, 30 Apr 2026 10:04:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NY5-00000003ORU-0ZKw
	for linux-i3c@lists.infradead.org;
	Wed, 25 Mar 2026 12:41:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EA6860121;
	Wed, 25 Mar 2026 12:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857BAC4CEF7;
	Wed, 25 Mar 2026 12:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774442484;
	bh=GFTUx3kdhgQgTWvb7Q2fjG3wR+lIHMZ/P3hX/zvDfV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f16WpEVQ60zjYzS+sVNF502WXxMyeiBgyt2Q9wXCYo9w09DS/KwlV8lV3Cf4xrFU+
	 u8uOaH2kdR8bZKl/0Rdghb4RBSMZRM8peRogRgbvew+wRQqtN0NDo5JJsZvWGpg3Jd
	 y/O1waNE3BsFE7ij3l3/vw6aRmuRgWH24gY07DhtfoPvyWbZHCDrF0Fk6nF1ZhpcOP
	 qf1X6IRQeDhdCt29bG480HRF0fNhOKSOBFPbhZwHPydtDMEKGcBTXPv6FiSgrHp5+H
	 j+F76UZXDXTekW3r7AqjV6rmrODczfx9ulxNartk6tdcj1W86RiFzB5GDWcdWscD7t
	 rEGL/gaG0612Q==
Date: Wed, 25 Mar 2026 13:41:21 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Akhil R <akhilrajeev@nvidia.com>, Frank.Li@nxp.com, 
	acpica-devel@lists.linux.dev, alexandre.belloni@bootlin.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, ebiggers@kernel.org, fredrik.markstrom@est.tech, 
	jonathanh@nvidia.com, krzk+dt@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux@roeck-us.net, miquel.raynal@bootlin.com, 
	p.zabel@pengutronix.de, rafael@kernel.org, robert.moore@intel.com, robh@kernel.org, 
	smangipudi@nvidia.com
Subject: Re: [PATCH 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
Message-ID: <acPWvjCJ426AyIQh@orome>
References: <20260319-nano-manatee-of-vastness-fbafa1@quoll>
 <20260319170929.14543-1-akhilrajeev@nvidia.com>
 <67165a1f-9fa3-4853-b530-b1f9d6e4c2cf@kernel.org>
 <acO4NKPDUayny-I4@orome>
 <6342b6fd-9802-49d9-a269-ecb3b70b4604@kernel.org>
MIME-Version: 1.0
In-Reply-To: <6342b6fd-9802-49d9-a269-ecb3b70b4604@kernel.org>
X-Mailman-Approved-At: Thu, 30 Apr 2026 03:04:23 -0700
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
Content-Type: multipart/mixed; boundary="===============1699622974958091471=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============1699622974958091471==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qna5mk7v3eomnmx3"
Content-Disposition: inline


--qna5mk7v3eomnmx3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
MIME-Version: 1.0

On Wed, Mar 25, 2026 at 11:59:36AM +0100, Krzysztof Kozlowski wrote:
> On 25/03/2026 11:31, Thierry Reding wrote:
> > On Thu, Mar 19, 2026 at 06:15:14PM +0100, Krzysztof Kozlowski wrote:
> >> On 19/03/2026 18:09, Akhil R wrote:
> >>> On Thu, 19 Mar 2026 10:40:34 +0100, Krzysztof Kozlowski wrote:
> >>>> On Wed, Mar 18, 2026 at 10:57:25PM +0530, Akhil R wrote:
> >>>>> Add I3C subsystem support, DesignWare I3C master controller, and
> >>>>> SPD5118 hwmon sensor as modules to the defconfig.
> >>>>
> >>>> Why? If there is no user of that, why would we want it? Your commit =
msg
> >>>> should explain that.
> >>>
> >>> Ack. This is for Tegra410 which has a DesignWare I3C host controller.
> >>> I will add this in the commit message.
> >>
> >> Board or products. Not SoCs.
> >=20
> > Is this a new requirement? I see a bit of both in defconfig changes.
>=20
> Almost every review from me has it for 2-3 years... And it is a known
> thing since always in a bit different wording: we do not care about
> downstream things and downstream products. defconfig does not serve
> downstream at all, makes no sense outside of our (upstream) work.

I don't understand why you're turning this into a downstream vs.
upstream discussion. This is all code that is being submitted upstream,
because we want these new platforms with I3C support enabled upstream.
It's as simple as that.

> > Some mention specific products, other mention SoCs. Does this
> > requirement apply to DT platforms or also ACPI platforms?
>=20
> Just like kernel, applies to all platforms, regardless of firmware
> interface.

Hm... again, I don't think there's every been a rule to the effect of
needing to specify a particular platform or product when adding a new
defconfig change. There's plenty of things that we're enabling in the
defconfigs because we think they are generally useful.

But alright, we'll either add more details to the commit message, or
drop this patch entirely.

Thierry

--qna5mk7v3eomnmx3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnD1+4ACgkQ3SOs138+
s6FDCg//TEr1ZBNYM0xe8kwbmPyZIx3Vx3e28JVg+qyEspS58LsOeq9esxtRuXxS
nbLyK6ZR2UMQSz8flsE3eTLe6uX2nS4M2ulMPPhiGmS68FWBMX87sjcgm838wRCY
81kws1U2fMSmqX/4cPJ1GX+t0v5h33bMZR6NZnfQnuZA4XAUMpX8tc/yR1N7WkUM
xx8snURBoY1HEyabSqye0F1kwIwBP4uD0Lp+BLb3WTcLnRlTShkmUiYN5XoIaZAr
qqgERKNeG48lK8XB07DSNEi/vZF0SxMUvlv5xKZlK+G0m+Wdd8QaNrMqfZPQfvzk
mT/ixvLEwmWhI6TjzbNeAh84MZoCNm6M1/khnUfiwECVZbiRubyO1f2MDwCC/Vej
D8mZm0IKzSS1Nni8cccKarGjtf7AtziB6cTwmihlqpBvYCDMMtF/Pkz8JVX4rCSR
F3F/dwnFWLHfzn9XIz0YFPQyeXYOjI8GpwdcCAYUv86M1c+b8hp6W2CDwdVhZrX6
wcSAxuep2zqjuQ9qDMD+l2DHSuC4raYwmHR4SwkumNAUGumrOP5tGHpwPvcfzdBv
W1vEzFjECkS6NxWfDxLtF3NbjKPbQ8WZHoKMmC8vQW8p5fd0WKHOfJjYSx9HSaET
3Tk9L+O4ChP4yfX+vwPicJqk8Vo9yZUmeGXIN9hKUBBfYHR+tLQ=
=TaJr
-----END PGP SIGNATURE-----

--qna5mk7v3eomnmx3--


--===============1699622974958091471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============1699622974958091471==--

