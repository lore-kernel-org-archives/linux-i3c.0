Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1397CD343F
	for <linux-i3c@archiver.kernel.org>; Sat, 16 May 2026 01:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOEfHtu8nLMSvomsioEo9Y2vUcVON/DgUmpJ9X3Bht0=; b=kYIv1IfTAHgyp2BKvaOCrztZK8
	7Nf//Z2OKoFzqZk5fln9mZ8bkRgFWvvRvUyBMVbaV/VdYnKGmmaU76dQdsk5svc1nsJQ1M/mh99Bu
	yd6y2/byFRks2UFKYEcRQpdd8HGt0fZ4/th7TDnEeYrYvzsb+un0ReRB+TFjNRZfKRKvVPuReQ1mg
	q9YgbwAadEA/pEvk77lyD0sDJfJh5XDvVgoLGrGzTE9VB18r5pvJUajpnY5sjDwzX+NBf3gXS+dEL
	cuB1OjOEFHIouQGfHYAiNMfE900Z8eRctTeKaHRFvuuixhon92HN7xFIYd51rJa2OtBDR7gNxWsxz
	fSLhAcMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO3jV-00000009sFW-019x;
	Sat, 16 May 2026 01:22:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYpE-000000062jV-1PRW
	for linux-i3c@lists.infradead.org;
	Thu, 14 May 2026 16:22:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE8B360132;
	Thu, 14 May 2026 16:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469AFC2BCB3;
	Thu, 14 May 2026 16:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778775735;
	bh=73fxWTuyiBOp6+GjEI2yaO9EgtXApTP1T+BOeTS3rAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KFbaG9QVp1qytR13DVfdptqgNWmRSqoEcj1AZPIJ3K40WgWlY5MxwrT2YOPXDxBon
	 S3FUrX48+glSKCgdEO7ME6HFjzO66pSNbCOYRindSFkZJSUzvJIN0AUdZzhNnIAvJt
	 1dydMn6238ZkjndwD3hppo1s9jOrR3SO4GouDHflcUom5KAkrnO7tkdvNzlEENdfV0
	 Dzuf96JYFEC5dZDTGIzoLX5eD316+k4Vbw8cjec2aZFFqh/amKdq9AWrxfIQEL3/0w
	 ultgIlAnQ6TDt4E8dAZ1vCl395lo8pOU8y1UmFrrl1R9svh86jWTSibUQsbAjl8X4p
	 mEqkPlBovnzSQ==
Date: Thu, 14 May 2026 17:22:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: i3c: dw: Add apb reset
Message-ID: <20260514-gestation-hatred-69029fd05f70@spud>
References: <20260511031945.3228-1-jszhang@kernel.org>
 <20260511031945.3228-3-jszhang@kernel.org>
 <20260511-amnesty-afoot-84537aafc02c@spud>
 <20260514-fat-unyielding-jaguarundi-a5ddc6@quoll>
MIME-Version: 1.0
In-Reply-To: <20260514-fat-unyielding-jaguarundi-a5ddc6@quoll>
X-Mailman-Approved-At: Fri, 15 May 2026 18:22:23 -0700
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
Content-Type: multipart/mixed; boundary="===============3296595753378329675=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============3296595753378329675==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BbfoBwP5jS6lf41o"
Content-Disposition: inline


--BbfoBwP5jS6lf41o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 02:17:55PM +0200, Krzysztof Kozlowski wrote:
> On Mon, May 11, 2026 at 05:02:18PM +0100, Conor Dooley wrote:
> > On Mon, May 11, 2026 at 11:19:44AM +0800, Jisheng Zhang wrote:
> > > Add dt-binding for support of apb reset which is to reset the APB
> > > interface.
> > >=20
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> >=20
> > Please squash both dt-binding patches.
>=20
> I think this should stay separate, because first commit is trying to fix
> undocumented existing ABI. It will have different rationale and could be
> chosen for backports.

Ah, I guess I didn't read the commit message. Sorry about that Jisheng!

--BbfoBwP5jS6lf41o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagX2sgAKCRB4tDGHoIJi
0m78APoC7BNZBKHuVWzSNwad6VS12v/38/OUqyzyeFhLxAyYrQD/UAu/Y28omxU8
tywp9InGV8Iox+8BKGMTg4/oq6IjNAY=
=efLo
-----END PGP SIGNATURE-----

--BbfoBwP5jS6lf41o--


--===============3296595753378329675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============3296595753378329675==--

