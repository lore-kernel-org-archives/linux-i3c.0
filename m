Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01270CAC5AC
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Sep 2025 22:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEF8KLXSLnTvUyISlkWEiZOXI30cW+YdXHCNgg+HUPQ=; b=taxo+9AUCmnK5MFb0MKhXQjL2u
	3MXkCJculeL4R4/jyoFOH8HbrG0Brl24NrJXJ7Lcu1VN04sKTokcge06pkmWjEgRwUDzt9b/wgYLY
	AGxdjkLhs/9ensE7Eh+OSAdx7IF7RCQk9PS4S6m3dXvyPKZHdDL6JnvMgaS4urrDTVxmmBXKaIhr6
	mTsyusH1lv2tMQJc96vdnWCAKE0MWuhBqH+JGgbwyeJXJfdHUKBdRPySpjmBX6RwEhv9l8CIMqRc2
	pviS0j5Xsz9Vg8c6l7nejDW9WEmcAan3X8Cs8dL+MNP84/eomSkswDXGdiYi1QZSdh/BFeV7MtDQg
	7tRWAHEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Bxn-0000000F7Ny-3Fpn;
	Tue, 23 Sep 2025 22:58:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGsT-00000000UWQ-0omU
	for linux-i3c@lists.infradead.org;
	Thu, 18 Sep 2025 15:48:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78148601BC;
	Thu, 18 Sep 2025 15:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A1EC4CEE7;
	Thu, 18 Sep 2025 15:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758210536;
	bh=nhdHKFO5bR2X2/D/hMT1di3VRboSYDncxCVlGCDhYws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QctwkPXgZezc5Uo0p1TcUvL7QB0Sc82tqkeG3pnWMZM+eSrBlp+itzVXFN9zJxO5H
	 p8LB4kSiNTjMTUymK1ItQx5yb2NhQycUIH66QUAoHTDAX5OtUBnbojCYQ3h2EnZaF4
	 zt2tTNcv8isdLiHzt8NVKJuGwBhwTcQcZozCs/sEh0uI4N+CmZu074qQqyjVOH051M
	 /BOUUCzD2v0jkhoENdU80q7Q2bVbdkaSJfEoQ0zrW9gx38a0wczqPOj/wY8fOZ7tH5
	 /QmtCAQChpY9iSvAgTjl9La62Ca5MiFuVQtmbpBL5PrP/DEf9l1Xy4P2YRW3X2hy7p
	 5Giv6O+Iq4a2g==
Date: Thu, 18 Sep 2025 16:48:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Durai Manickam KR <durai.manickamkr@microchip.com>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	balamanikandan.gunasundar@microchip.com,
	nicolas.ferre@microchip.com
Subject: Re: [PATCH 4/4] ARM: dts: microchip: add I3C controller
Message-ID: <20250918-award-cursor-d564edf710e0@spud>
References: <20250918095429.232710-1-durai.manickamkr@microchip.com>
 <20250918095429.232710-5-durai.manickamkr@microchip.com>
 <aMwoxsACdicpAFup@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
In-Reply-To: <aMwoxsACdicpAFup@lizhi-Precision-Tower-5810>
X-Mailman-Approved-At: Tue, 23 Sep 2025 15:58:21 -0700
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
Content-Type: multipart/mixed; boundary="===============8670217213937405072=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============8670217213937405072==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w1hi8Aenph44Z7K4"
Content-Disposition: inline


--w1hi8Aenph44Z7K4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 11:44:06AM -0400, Frank Li wrote:
> On Thu, Sep 18, 2025 at 03:24:29PM +0530, Durai Manickam KR wrote:
> > Add I3C controller for sama7d65 SoC.
> >
> > Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> > ---
> >  arch/arm/boot/dts/microchip/sama7d65.dtsi | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/=
dts/microchip/sama7d65.dtsi
> > index c191acc2c89f..3a5da27f7d83 100644
> > --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> > +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> > @@ -721,5 +721,17 @@ gic: interrupt-controller@e8c11000 {
> >  			#address-cells =3D <0>;
> >  			interrupt-controller;
> >  		};
> > +
> > +		i3c: i3c@e9000000 {
> > +			compatible =3D "mchp,sama7d65-i3c-hci";
>=20
> Need update binding doc for "mchp,sama7d65-i3c-hci"

"mchp" isn't even a valid vendor prefix. It's not acceptable for a v2 to
be like this after the feedback on v1.

--w1hi8Aenph44Z7K4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMwp4wAKCRB4tDGHoIJi
0hTeAQDnpMlsIfqKchO9c7i8p0jUcVfWOYT6zlgMmGj5JLJ9DwD/Qi/0BsK8n1i2
ti7cdxLs5npgg3H7zlwDkBth5D0+2w8=
=IrZi
-----END PGP SIGNATURE-----

--w1hi8Aenph44Z7K4--


--===============8670217213937405072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============8670217213937405072==--

