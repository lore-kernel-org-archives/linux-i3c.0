Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2744CCD13DE
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Apr 2026 10:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkuzNpa5OZcG+EwJqbhBppn9UXDgJWjFtHekzibYC3c=; b=Mv8YVbpwekFstV7a6Cd6+LHnQ4
	oDZPsvGtJxiOcDbKLdUzz9ECKFbRd+zpchF1jABRJnsk8u5ELZrCfBZQWyNIAvq4W1uQfu23jB0Gd
	UiFyJbDs+Mhfp/7xILAb1EYNUutMOO9XxcLfxiy1SZZQIrk2aZ4c73+vd0EtOjCxemJ6InaU2v7tl
	BVBn1Srdc+X9OhclB03iRyy690WyoxhC0U/v4xhxG48SwNFM6v8fHiJoarNvj7wbgtIpnMeOLfbEo
	UgWqb4/0N8qMTlIc7htHk00IgO1NOTbDXkKzewCoZMrUsBvIvd9I/6nA6Ozjzaq3Bn5JyIWDRSnL8
	quIAeS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOFu-000000059sS-2rA9;
	Thu, 30 Apr 2026 10:04:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NvN-00000003QOL-3QgE
	for linux-i3c@lists.infradead.org;
	Wed, 25 Mar 2026 13:05:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 18D126013C;
	Wed, 25 Mar 2026 13:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47260C2BCB2;
	Wed, 25 Mar 2026 13:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774443928;
	bh=Nd8wP6iLVfhuyQt7uT+GPPJVlZFWhFntjUM8RUS0D+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F5xStT4B36TVquA6exeu5U6m+NS1v5gmT95cCU2NkTx9t4Dz8CfqAxHZlJhG4mOd9
	 SD4v4Tluc5Y3WR4wHwLMr9dhByg0yonEcrChqq8uDnv667Sbre66wwzdgQySy/uKWX
	 zOYOHNMBNlqAbHIc1TO8p1sM2EsyZVyQG0tHFz6g/SRQYTnQjk0+G9+wbsm+gUu9QR
	 Zj6LI+CKJ+Y80C2TSnnSEoZxVCrhT/MDFnsMeWVYFib0rvAirraNtIb5fwmHDDSbri
	 8hqWIRdf+IGuH+mGnGKwYiKky6aF1CG1w2WmX9kU3Tij6HS9jKTl6pU2JlhrvgE9VQ
	 Jk8JKh5RUlO1Q==
Date: Wed, 25 Mar 2026 14:05:26 +0100
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
Message-ID: <acPcM4dlvpdo3L59@orome>
References: <20260319-nano-manatee-of-vastness-fbafa1@quoll>
 <20260319170929.14543-1-akhilrajeev@nvidia.com>
 <67165a1f-9fa3-4853-b530-b1f9d6e4c2cf@kernel.org>
 <acO4NKPDUayny-I4@orome>
 <6342b6fd-9802-49d9-a269-ecb3b70b4604@kernel.org>
 <acPWvjCJ426AyIQh@orome>
 <61ec49e8-9b60-467e-8ca9-c1246ae5caa2@kernel.org>
MIME-Version: 1.0
In-Reply-To: <61ec49e8-9b60-467e-8ca9-c1246ae5caa2@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============3317366774417549452=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============3317366774417549452==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fc67txugx4wle5yh"
Content-Disposition: inline


--fc67txugx4wle5yh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
MIME-Version: 1.0

On Wed, Mar 25, 2026 at 01:47:44PM +0100, Krzysztof Kozlowski wrote:
> On 25/03/2026 13:41, Thierry Reding wrote:
> > On Wed, Mar 25, 2026 at 11:59:36AM +0100, Krzysztof Kozlowski wrote:
> >> On 25/03/2026 11:31, Thierry Reding wrote:
> >>> On Thu, Mar 19, 2026 at 06:15:14PM +0100, Krzysztof Kozlowski wrote:
> >>>> On 19/03/2026 18:09, Akhil R wrote:
> >>>>> On Thu, 19 Mar 2026 10:40:34 +0100, Krzysztof Kozlowski wrote:
> >>>>>> On Wed, Mar 18, 2026 at 10:57:25PM +0530, Akhil R wrote:
> >>>>>>> Add I3C subsystem support, DesignWare I3C master controller, and
> >>>>>>> SPD5118 hwmon sensor as modules to the defconfig.
> >>>>>>
> >>>>>> Why? If there is no user of that, why would we want it? Your commi=
t msg
> >>>>>> should explain that.
> >>>>>
> >>>>> Ack. This is for Tegra410 which has a DesignWare I3C host controlle=
r.
> >>>>> I will add this in the commit message.
> >>>>
> >>>> Board or products. Not SoCs.
> >>>
> >>> Is this a new requirement? I see a bit of both in defconfig changes.
> >>
> >> Almost every review from me has it for 2-3 years... And it is a known
> >> thing since always in a bit different wording: we do not care about
> >> downstream things and downstream products. defconfig does not serve
> >> downstream at all, makes no sense outside of our (upstream) work.
> >=20
> > I don't understand why you're turning this into a downstream vs.
> > upstream discussion. This is all code that is being submitted upstream,
> > because we want these new platforms with I3C support enabled upstream.
> > It's as simple as that.
> >=20
> >>> Some mention specific products, other mention SoCs. Does this
> >>> requirement apply to DT platforms or also ACPI platforms?
> >>
> >> Just like kernel, applies to all platforms, regardless of firmware
> >> interface.
> >=20
> > Hm... again, I don't think there's every been a rule to the effect of
> > needing to specify a particular platform or product when adding a new
> > defconfig change. There's plenty of things that we're enabling in the
> > defconfigs because we think they are generally useful.
>=20
> And the commit msg MUST always explain WHY we are doing it, in this case
> - why do you think it is generally useful.
>=20
> If you add new driver, it is usually obvious why it is generally useful.
>=20
> If you add defconfig change for dead stuff, it is not obvious. That's
> why commit msg must provide arguments WHY do we want it, WHY do you
> think it is useful for us.

You're making too many assumptions. What's your basis for calling this
dead stuff? Do you really think we'd be spending any time on this if it
wasn't going to get used?

> If you add defconfig change for device which no one (in terms of
> upstream) can use, then automatically it is not useful. Whether this
> change is like that - I do not know. That's why you have commit msg to
> provide argument WHY maintainer should take it. And it is as simple as
> one sentence explaining the upstream kernel user/use case of this
> defconfig change...

Again, why are you making this about upstream vs. downstream? The goal
of these submissions is to make upstream capable of running on real
devices that real people want to run (preferably upstream) Linux on.

Anyway, I think this clarifies some of the questions I posed in my other
mail, so we'll go and add more information to this commit message to let
you know what products this will be used in.

Thierry

--fc67txugx4wle5yh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnD3ZYACgkQ3SOs138+
s6HqnA/+P03d+00aePdIY1d5lvoSj0XuW+/aqqO4nV1DoFXpS+mnbELzT7yPwaK/
sfkhXNyOUvsUmlQ7ju57UnZ3XnhytbtcpeNl3cqulmYIZI66lyES7Y62pspIYNQS
m3pgJON/az0czoUtBUT91iecML/P7L9ptHSxUwlwtZTeLNjwMw7a7+IV2gnfe1s0
wgAhwgs9aWKRJPFZGJU4YFeOL9GS9KHX4gvwgrMG/ywarpYonmpZU1x4AxA7HU6Z
mYxc6Of/re6QeIS9uYLQ13zniIA9FF1DetMIJLoroRkTfIYKeSWfVrdEMEYVUFEU
TIpkb056mdTO72yITBR9rNWG1tK0AxdDrBl4w/LedEDnKGsLAHyEyAMfPHJh2/Ux
a33Tp98ARFO0b3ofSMXCheNW8ouvVb2wzA+5zyP50yvkP1uC7JMtVUkFH/5ccTQO
ZwL42W9mO/MYg4hvhowS0OZhbjGPAJP2ikHwLXoN4iAjbBVdhfib74SWlO1IRfRg
eIz8P8Eu4VzAnnZSj+2l/xf4XTj/3SflK8yeSeix0foPVDxZkR1QPPywtBomrRyb
XQ2a58nsFXBdNaTMAH+MVU6xTD7/FNE2BapUN07rw7zvnewqK3xKhdT1NHn83wyO
KJ9ByhxUakXBv7sxc3f46Ri4D3XIznGUPf1Fsk342HR6PsWIoVc=
=ysnB
-----END PGP SIGNATURE-----

--fc67txugx4wle5yh--


--===============3317366774417549452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============3317366774417549452==--

