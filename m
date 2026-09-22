Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991D3606A329
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Oct 2026 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a46BySt3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TanqOUlO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=F77p3OykbJ1K4ktX5+xcmckaBbasBXhwHFQULBk05to=; b=a46BySt38AfahMG9rG+X1/2AfJ
	v5dVDrSxCfZko+Zq20zZr/5jAS6hH9ZVEurQWO1iA0AOiOIjcI/jVgettpQFQqFM5R6HHPHTEe6W/
	Gz8fEgGlBhelufZUv4v9wPHXVecKzSivju/EW8PLMLQ1qJ6ElL3Ev3Wvkjx6VDNPvxLpN2VAF6uvP
	RtDZTok+hD5xBQxpPdxQLdwShUYzRywz+hn6b7kCNYu/9LuLqZrnqv/Z68oQydvfZx73OMITRfoTz
	MWmG7vJSyvipaAFExsDvuCyJHv8XAePsn6tHGltweCzC7ftykmOF6oNC5dWNLedGAWyNezKrb2K6F
	+NnWA3Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLevD-00000004NE8-1TwS;
	Tue, 27 Oct 2026 11:00:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wx8-00000004wQ2-2qEJ
	for linux-i3c@lists.infradead.org;
	Tue, 22 Sep 2026 09:38:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 085E860234;
	Tue, 22 Sep 2026 09:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB841F000FF;
	Tue, 22 Sep 2026 09:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069897;
	bh=V/NYY5hFag4x5iwV4LJnPoitUXHVLUK3NMl/jr1TO6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TanqOUlOgF2p197FdP8p4ohOJtOEWuwZiSh01hQD31BLbrNsJoZITWBEz3VyrsLmT
	 w4FGCbvTTPYOBh6xKhvJkJwA7PwdiXCQ/hg+EJz0ilPwe80VPlm7kXYNkMCv+w5WB8
	 B4q+4KVWZzZxNaEVICmyMsYJZZ3gvjznDZFyoAJEt+lxU0dcfZEpTttGHHO1X7bL2G
	 QryUs2SkRDMGTl4aQgMp+fOmLbRFUXl6SJtyjsGqlO3iG5betGK/Nz4hx4WbLDPNMj
	 /gJRb/EQK+aZw58N0rChDN3WCKQTE7Mm2aovHhrA3BXbFhyrwQr34vJTvtjaLnlk2H
	 hIdkByZ6MilMA==
Date: Tue, 22 Sep 2026 10:38:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Shubham Patil <shubhamsanjay.patil@amd.com>,
	alexandre.belloni@bootlin.com, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <20260922-bullpen-reprise-f62e01922d88@spud>
References: <20260908094257.3196120-1-shubhamsanjay.patil@amd.com>
 <20260908094257.3196120-2-shubhamsanjay.patil@amd.com>
 <20260908-groin-undivided-0af701135404@spud>
 <aqGHlWpQjpHEft3j@SMW015318>
 <aqKWTT47S_zPzvbN@squawk>
 <aqLQaHndX4t1kKLG@SMW015318>
 <778da629-2f23-412b-885f-e87827ce2b5c@amd.com>
 <20260922-ethics-flap-9760347e869d@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260922-ethics-flap-9760347e869d@spud>
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
Content-Type: multipart/mixed; boundary="===============0888662664649550609=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0888662664649550609==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wHTQBnNixbIjMCZ2"
Content-Disposition: inline

--wHTQBnNixbIjMCZ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 10:33:44AM +0100, Conor Dooley wrote:
> On Thu, Sep 17, 2026 at 01:23:19PM +0200, Michal Simek wrote:
> >=20
> >=20
> > On 9/10/26 17:44, Frank Li wrote:
> > > On Thu, Sep 10, 2026 at 12:36:45PM +0100, Conor Dooley wrote:
> > > > On Wed, Sep 09, 2026 at 11:21:41AM -0500, Frank Li wrote:
> > > > > On Tue, Sep 08, 2026 at 06:54:31PM +0100, Conor Dooley wrote:
> > > > > > On Tue, Sep 08, 2026 at 03:12:55PM +0530, Shubham Patil wrote:
> > > > > > > In-Band Interrupt and Hot-Join are synthesis-time options of =
the AXI I3C
> > > > > > > IP. Describe them with two boolean properties.
> > > > > > >=20
> > > > > > > A Hot-Join request is acknowledged by the IBI machinery, so a=
 hot-join
> > > > > > > capable design is always IBI capable as well. Both events are=
 reported
> > > > > > > through the controller interrupt, which is therefore required=
 whenever
> > > > > > > the capability is present.
> > > > > > >=20
> > > > > > > Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> > > > > > > ---
> > > > > > > Changes in V3:
> > > > > > > - Move in-band-interrupt-capable and hot-join-capable into th=
e common
> > > > > > >    i3c.yaml schema and drop the xlnx, prefix.
> > > > > > > - Keep dependencies in the AMD binding.
> > > > > > > - Update the commit description accordingly.
> > > > > > > - Conor Dooley acked v2 with the xlnx,-prefixed properties in=
 the AMD
> > > > > > >    binding [1].
> > > > > > >    That Acked-by is not carried here: the names lost the vend=
or prefix
> > > > > > >    and the definitions moved to i3c.yaml after Frank Li's com=
ment.
> > > > > > >    [1]:https://lore.kernel.org/all/20260824-tightwad-impose-4=
95476599087@spud/
> > > > > >=20
> > > > > > I disagree with Frank. These properties make sense for Xilinx b=
ecause it
> > > > > > is an FPGA IP and synthesis options impact this. For other devi=
ces, this
> > > > > > should be determined from the compatible.
> > > > > > Please revert to how things were done in v2, especially as no r=
ationale
> > > > > > was provided for why these should be common.
> > > > >=20
> > > > > It is common problems, when IP intergrate by SOC, which may defea=
ture some
> > > > > part, It is not appeared now just because IBI and HJ have not ena=
bled
> > > > > widely.
> > > > >=20
> > > > > IBI and HJ is optional features of I3C. Ideally it should be indi=
cated by
> > > > > some registers. But not all vendor implement provide this CAP reg=
isters.
> > > > >=20
> > > > > IBI and HJ depend on some slow clocks, which monitor SDA line cha=
nge.
> > > > > Some instances of IP may not have such slow clocks. Some IP's IBI=
 and HJ
> > > > > use seperate IRQ line, but these irq line may not connect of diff=
erence
> > > > > instances.
> > > >=20
> > > > All of this should be able to be dealt with by appropriate use of
> > > > specific compatibles.
> > >=20
> > > I understand compatible can cover most cases. Need variance for prope=
rty.
> > >=20
> > > >=20
> > > > > like previous SPI vendor customized property, we takes efforts to=
 convert
> > > > > to common one and also meet back compatiblity problem at convert.=
 I don't
> > > > > want to do it again. This kind property is most likely as below.
> > > >=20
> > > > What SPI controller specific properties are you talking about here?
> > > > There are relatively few properties in spi-controller.yaml, and non=
e of
> > > > them deal with these kinds of capabilities.
> > >=20
> > > num-cs vs fsl,espi-num-chipselects. Total number CS of IP is fixed, b=
ut
> > > some instances have not route all CS to pad.
> > >=20
> > > >=20
> > > > >=20
> > > > > default: 	decide by comaptible string or hardware cap
> > > > > force-disabled: force disable for some reason, like, miss connect=
 irq line
> > > > > or missed some clock, or IP bugs, or board desgin's some level sh=
ift chip
> > > > > broken IBI/HJ timing requirements.
> > > >=20
> > > > Of these, only the last would be a valid reason for having a proper=
ty
> > > > for it. Missing interrupts, clocks or IP bugs should all be dealt w=
ith
> > > > using device specific compatibles.
> > > > If board wiring causes the breakage, the property may be more
> > > > appropriate at the i3c device level rather than the controller given
> > > > that wiring to some devices on the bus may not have the problems?
> > >=20
> > > I3C.yaml is for both master controller and devices now. I3C is bus, w=
hich
> > > connect many devices, if wiring issue, whole bus can't support IBI. A=
nd
> > > if any broken devices happen at address arbitation, whole bus can't s=
upport
> > > IBI.
> > >=20
> > > at beging, I suggest 3 state,
> > >=20
> > > [default, enable, disable], but now I think IBI_broken, HJ_broken is =
more
> > > reasonable to disable it, default value should be set by compatible
> > > string or DCR of I3C regiser.
> > >=20
> > > And some I3C device may be failure to work with IBI even DCR of I3C r=
egister
> > > show it support IBI.
> > >=20
> > > I don't want to appear two similar property between vendor and common=
, like
> > > num-cs vs fsl,espi-num-chipselects.
> > >=20
> > > such as IBI-broken can be used for controller and devices case.
> > >=20
> > > > That said, I think that problem should be dealt with when it arises,
> > > > rather than starting a trend of adding capabilities properties at t=
he
> > > > controller level when I am not convinced that there's going to be o=
ther
> > > > users in the same vein.
> > >=20
>=20
> > > Understand, I3C is realtive new protocal. 'IBI-broken' is more easy
> > > understand,  logically equial to in-band-interrupt-capable.
> > Conor: Any update on this one? I think this thread is stuck at this sta=
ge.
>=20
> I didn't think there was any need to reply. I took the first sentence of
> this snippet to be acceptance of what I was saying.
>=20
> If yous desperately want to have a generic property, the negative
> connotation of the "-broken" is probably better in that it'd be more
> likely to make people set stuff by compatible rather than have to use a
> property with that word in it.

That said, technically this platform could be both
"amd,in-band-interrupt-capable" and "ibi-broken" at the same time, since
one describes the way the IP has been compiled and the other wiring. I'm
not entirely sure whether conflating the two is possible? Depends on if
your IP's programming model changes if the option is enabled even if it
cannot be used. Not beyond the realms of possibility.

Also, ibi-broken doesn't work for your platform, since the default
before this patch is no ibi and requiring a property for no ibi would be
an ABI break.

--wHTQBnNixbIjMCZ2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarJMhQAKCRB4tDGHoIJi
0t8aAQCEP/5vz+QcJl/+yHMmNGM7LWuQRTtz67M5r6BgVxAxKQD/VGtPf7uaNs+9
jI3yVSfj8JGdm2mlTl8fkKCISOSNWgc=
=5Pql
-----END PGP SIGNATURE-----

--wHTQBnNixbIjMCZ2--


--===============0888662664649550609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============0888662664649550609==--

