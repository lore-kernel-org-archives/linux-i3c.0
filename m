Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8637606A327
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Oct 2026 11:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YVXXuVqd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vohz4EvY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fs3+cLVYL0mvtQAu6S+nEZYm4kTJ//BI2ZFOIegf6KM=; b=YVXXuVqdM56qPLgSmH4/f/+1bF
	Ef++xLer26RI7IJdyjWOFyOP9PudvqUDfq8+bUWYtQQwFieJS3QPp8JgDsNsFskMFYReZfA5+CQ6S
	4qknNOLyGY1fICzD7zNZkyNgNm7BFRcwdLukOApmDtN4cCY5816y3tthNqhaQ3RJwFgSapHRW1eUD
	YkrWPYz+CEOiwvemcVj4INP047ss9BRPVH0i+2V0Y4wHeOTBy46UQpCVKuGt9/gzTtUsV/5pipg9K
	AkbDsrVPzgXdpbxSxMJN0n4j1blI3dOXmEbcFmoqsu1+E5UM3e7vf6IMpVezBOrSRImAv+RJIiz1z
	jWZLY5/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLevF-00000004NGf-27aG;
	Tue, 27 Oct 2026 11:00:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LNn-0000000873P-13W3
	for linux-i3c@lists.infradead.org;
	Wed, 23 Sep 2026 11:43:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 034D2406C3;
	Wed, 23 Sep 2026 11:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909761F000FF;
	Wed, 23 Sep 2026 11:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790163806;
	bh=S+mCzNvNXENmtXTTPMRaKFix6DYDfbmgyxoTkd3QOlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vohz4EvYNKD19/f4jllm9DLR9prd89IYzfOFwoTjLrsH5Evsz1IOO7B27D822x0z9
	 sj+UAS/zEU2Svr7xYjEjr91jMJ7KG85Ejy2eEr3VLJLQPQGGf8h20TxBMosCHJr0Vb
	 ofzw/hyMl8xJpQ3WdsKUvOEp5NwYb2fwwLuaKcv9eLc7z7Uyz+B/TdIoXa9Uz1K0hr
	 KjbOCVPyivlvMeOb6RrErpZFNBf5gpYiv7yFC0nHxkKHB+ckozsEcwFXzZnyO+8V2l
	 Vjc9WYr3f+c/wqOxYOfFXCgGjEQglVDt9jReU+o40P0TTwTb9NB0V9MFcAj2KtVIBe
	 cKCq6TkeMpNaw==
Date: Wed, 23 Sep 2026 12:43:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Michal Simek <michal.simek@amd.com>,
	Shubham Patil <shubhamsanjay.patil@amd.com>,
	alexandre.belloni@bootlin.com, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <20260923-overturn-acts-5abc2e4fe6ed@spud>
References: <aqLQaHndX4t1kKLG@SMW015318>
 <778da629-2f23-412b-885f-e87827ce2b5c@amd.com>
 <20260922-ethics-flap-9760347e869d@spud>
 <20260922-bullpen-reprise-f62e01922d88@spud>
 <20260922-immersion-salvage-00450539f1ce@spud>
 <arKr-oapsl5qzo_E@SMW015318>
 <20260922-purple-overnight-2cdd2ddd5270@spud>
 <arLKWE1tJrKnzGdp@SMW015318>
 <20260922-unadvised-stalling-5cbeff8f982a@spud>
 <arL_Zgi1r1IFpNIO@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <arL_Zgi1r1IFpNIO@SMW015318>
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
Content-Type: multipart/mixed; boundary="===============6144697316845583140=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6144697316845583140==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="opfa8OdvW/nf1pjo"
Content-Disposition: inline

--opfa8OdvW/nf1pjo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 05:21:26PM -0500, Frank Li wrote:
> On Tue, Sep 22, 2026 at 10:29:31PM +0100, Conor Dooley wrote:
> > On Tue, Sep 22, 2026 at 01:35:04PM -0500, Frank Li wrote:
> > > On Tue, Sep 22, 2026 at 06:24:52PM +0100, Conor Dooley wrote:
> > > > On Tue, Sep 22, 2026 at 11:25:30AM -0500, Frank Li wrote:
> > > > > On Tue, Sep 22, 2026 at 10:39:23AM +0100, Conor Dooley wrote:
> > > > > > On Tue, Sep 22, 2026 at 10:38:17AM +0100, Conor Dooley wrote:
> > > > > > > On Tue, Sep 22, 2026 at 10:33:44AM +0100, Conor Dooley wrote:
> > > > > > > > On Thu, Sep 17, 2026 at 01:23:19PM +0200, Michal Simek wrot=
e:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > On 9/10/26 17:44, Frank Li wrote:
> > > > > > > > > > On Thu, Sep 10, 2026 at 12:36:45PM +0100, Conor Dooley =
wrote:
> > > > > > > > > > > On Wed, Sep 09, 2026 at 11:21:41AM -0500, Frank Li wr=
ote:
> > > > > > > > > > > > On Tue, Sep 08, 2026 at 06:54:31PM +0100, Conor Doo=
ley wrote:
> > > > > > > > > > > > > On Tue, Sep 08, 2026 at 03:12:55PM +0530, Shubham=
 Patil wrote:
> > > > > > > > > > > > > > In-Band Interrupt and Hot-Join are synthesis-ti=
me options of the AXI I3C
> > > > > > > > > > > > > > IP. Describe them with two boolean properties.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > A Hot-Join request is acknowledged by the IBI m=
achinery, so a hot-join
> > > > > > > > > > > > > > capable design is always IBI capable as well. B=
oth events are reported
> > > > > > > > > > > > > > through the controller interrupt, which is ther=
efore required whenever
> > > > > > > > > > > > > > the capability is present.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Signed-off-by: Shubham Patil <shubhamsanjay.pat=
il@amd.com>
> > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > Changes in V3:
> > > > > > > > > > > > > > - Move in-band-interrupt-capable and hot-join-c=
apable into the common
> > > > > > > > > > > > > >    i3c.yaml schema and drop the xlnx, prefix.
> > > > > > > > > > > > > > - Keep dependencies in the AMD binding.
> > > > > > > > > > > > > > - Update the commit description accordingly.
> > > > > > > > > > > > > > - Conor Dooley acked v2 with the xlnx,-prefixed=
 properties in the AMD
> > > > > > > > > > > > > >    binding [1].
> > > > > > > > > > > > > >    That Acked-by is not carried here: the names=
 lost the vendor prefix
> > > > > > > > > > > > > >    and the definitions moved to i3c.yaml after =
Frank Li's comment.
> > > > > > > > > > > > > >    [1]:https://lore.kernel.org/all/20260824-tig=
htwad-impose-495476599087@spud/
> > > > > > > > > > > > >
> > > > > > > > > > > > > I disagree with Frank. These properties make sens=
e for Xilinx because it
> > > > > > > > > > > > > is an FPGA IP and synthesis options impact this. =
For other devices, this
> > > > > > > > > > > > > should be determined from the compatible.
> > > > > > > > > > > > > Please revert to how things were done in v2, espe=
cially as no rationale
> > > > > > > > > > > > > was provided for why these should be common.
> > > > > > > > > > > >
> > > > > > > > > > > > It is common problems, when IP intergrate by SOC, w=
hich may defeature some
> > > > > > > > > > > > part, It is not appeared now just because IBI and H=
J have not enabled
> > > > > > > > > > > > widely.
> > > > > > > > > > > >
> > > > > > > > > > > > IBI and HJ is optional features of I3C. Ideally it =
should be indicated by
> > > > > > > > > > > > some registers. But not all vendor implement provid=
e this CAP registers.
> > > > > > > > > > > >
> > > > > > > > > > > > IBI and HJ depend on some slow clocks, which monito=
r SDA line change.
> > > > > > > > > > > > Some instances of IP may not have such slow clocks.=
 Some IP's IBI and HJ
> > > > > > > > > > > > use seperate IRQ line, but these irq line may not c=
onnect of difference
> > > > > > > > > > > > instances.
> > > > > > > > > > >
> > > > > > > > > > > All of this should be able to be dealt with by approp=
riate use of
> > > > > > > > > > > specific compatibles.
> > > > > > > > > >
> > > > > > > > > > I understand compatible can cover most cases. Need vari=
ance for property.
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > like previous SPI vendor customized property, we ta=
kes efforts to convert
> > > > > > > > > > > > to common one and also meet back compatiblity probl=
em at convert. I don't
> > > > > > > > > > > > want to do it again. This kind property is most lik=
ely as below.
> > > > > > > > > > >
> > > > > > > > > > > What SPI controller specific properties are you talki=
ng about here?
> > > > > > > > > > > There are relatively few properties in spi-controller=
=2Eyaml, and none of
> > > > > > > > > > > them deal with these kinds of capabilities.
> > > > > > > > > >
> > > > > > > > > > num-cs vs fsl,espi-num-chipselects. Total number CS of =
IP is fixed, but
> > > > > > > > > > some instances have not route all CS to pad.
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > default: 	decide by comaptible string or hardware c=
ap
> > > > > > > > > > > > force-disabled: force disable for some reason, like=
, miss connect irq line
> > > > > > > > > > > > or missed some clock, or IP bugs, or board desgin's=
 some level shift chip
> > > > > > > > > > > > broken IBI/HJ timing requirements.
> > > > > > > > > > >
> > > > > > > > > > > Of these, only the last would be a valid reason for h=
aving a property
> > > > > > > > > > > for it. Missing interrupts, clocks or IP bugs should =
all be dealt with
> > > > > > > > > > > using device specific compatibles.
> > > > > > > > > > > If board wiring causes the breakage, the property may=
 be more
> > > > > > > > > > > appropriate at the i3c device level rather than the c=
ontroller given
> > > > > > > > > > > that wiring to some devices on the bus may not have t=
he problems?
> > > > > > > > > >
> > > > > > > > > > I3C.yaml is for both master controller and devices now.=
 I3C is bus, which
> > > > > > > > > > connect many devices, if wiring issue, whole bus can't =
support IBI. And
> > > > > > > > > > if any broken devices happen at address arbitation, who=
le bus can't support
> > > > > > > > > > IBI.
> > > > > > > > > >
> > > > > > > > > > at beging, I suggest 3 state,
> > > > > > > > > >
> > > > > > > > > > [default, enable, disable], but now I think IBI_broken,=
 HJ_broken is more
> > > > > > > > > > reasonable to disable it, default value should be set b=
y compatible
> > > > > > > > > > string or DCR of I3C regiser.
> > > > > > > > > >
> > > > > > > > > > And some I3C device may be failure to work with IBI eve=
n DCR of I3C register
> > > > > > > > > > show it support IBI.
> > > > > > > > > >
> > > > > > > > > > I don't want to appear two similar property between ven=
dor and common, like
> > > > > > > > > > num-cs vs fsl,espi-num-chipselects.
> > > > > > > > > >
> > > > > > > > > > such as IBI-broken can be used for controller and devic=
es case.
> > > > > > > > > >
> > > > > > > > > > > That said, I think that problem should be dealt with =
when it arises,
> > > > > > > > > > > rather than starting a trend of adding capabilities p=
roperties at the
> > > > > > > > > > > controller level when I am not convinced that there's=
 going to be other
> > > > > > > > > > > users in the same vein.
> > > > > > > > > >
> > > > > > > >
> > > > > > > > > > Understand, I3C is realtive new protocal. 'IBI-broken' =
is more easy
> > > > > > > > > > understand,  logically equial to in-band-interrupt-capa=
ble.
> > > > > > > > > Conor: Any update on this one? I think this thread is stu=
ck at this stage.
> > > > > > > >
> > > > > > > > I didn't think there was any need to reply. I took the firs=
t sentence of
> > > > > > > > this snippet to be acceptance of what I was saying.
> > > > > > > >
> > > > > > > > If yous desperately want to have a generic property, the ne=
gative
> > > > > > > > connotation of the "-broken" is probably better in that it'=
d be more
> > > > > > > > likely to make people set stuff by compatible rather than h=
ave to use a
> > > > > > > > property with that word in it.
> > > > > > >
> > > > > > > That said, technically this platform could be both
> > > > > > > "amd,in-band-interrupt-capable" and "ibi-broken" at the same =
time, since
> > > > > > > one describes the way the IP has been compiled and the other =
wiring. I'm
> > > > > > > not entirely sure whether conflating the two is possible? Dep=
ends on if
> > > > > > > your IP's programming model changes if the option is enabled =
even if it
> > > > > > > cannot be used. Not beyond the realms of possibility.
> > > > > > >
> > > > > > > Also, ibi-broken doesn't work for your platform, since the de=
fault
> > > > > > > before this patch is no ibi and requiring a property for no i=
bi would be
> > > > > > > an ABI break.
> > > > > >
> > > > > > The perils of FPGA IP I suppose, and not being quite careful en=
ough to
> > > > > > document all of the relevant options from the start. Been guilt=
y of that
> > > > > > myself.
> > > > > >
> > > > >
> > > > > Check impliment code
> > > > >
> > > > > +       /*
> > > > > +        * The interrupt only carries IBI events, so it is only d=
escribed for
> > > > > +        * designs synthesized with that feature.
> > > > > +        */
> > > > > +       if (master->ibi_capable) {
> > > > > +               xi3c_master_init_ibi_ops(master);
> > > > > +
> > > > > +               master->irq =3D platform_get_irq(pdev, 0);
> > > > > +               if (master->irq < 0)
> > > > > +                       return master->irq;
> > > > > +
> > > > > +               ret =3D devm_request_irq(master->dev, master->irq,
> > > > > +                                      xi3c_master_irq_handler, I=
RQF_NO_AUTOEN,
> > > > > +                                      dev_name(master->dev), mas=
ter);
> > > > > +               if (ret)
> > > > > +                       return dev_err_probe(master->dev, ret,
> > > > > +                                            "Failed to request I=
RQ\n");
> > > > > +       }
> > > > >
> > > > > They can use master->irq is determinate if support IBI.
> > > >
> > > > That seems viable. Where does that leave them for hot join though?
> > >
> > > No reason to keep hj because the difference between HJ and IBI is the
> > > address when address arbitration. If hardware support IBI, it should =
support
> > > HJ. HJ just use special address 0x2.
> >
> > For this IP, they appear to be controlled by different configuration ti=
me
> > parameters, so I don't think conflating the two is the right thing to do
> > here:
> > https://docs.amd.com/r/en-US/pg439-axi-i3c/Configuration-Tab
> > Per this doc, and the original commit, hotjoin configuration is not
> > permitted when ibi is not supported but can be enabled and disabled
> > separately when it is.
>=20
> I am not sure why provide such flexiblity, only difference is that compare
> address 2 or other value.

It's not unusual for FPGA IPs to provide extreme flexibility so that the
consumption of resources can be kept to a minimum, often to the point of
excessiveness. E.g. for a ethernet MAC IP each individual statistic might
have a configuration option.

>=20
> This feature may be quite common for i3c, if other soft IP provider such
> flexiblity, still common property is the better than vendor specific one.

I'm not at all in favour of speculatively adding properties for
configuration properties of FPGA IPs, particularly given the likelihood
of abuse by others. Without multiple demonstrated users, things shouldn't
be considered for being made common anyway.

--opfa8OdvW/nf1pjo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarO7WgAKCRB4tDGHoIJi
0jCSAQC/sx8j7nAUYKlES+P+BqWIDUtyiANxpY+1isAY8mBzGgEA372kv73/HKwZ
W9xlEe8r5+rFvx5qNI/K6Avo5mXRVQQ=
=R5+y
-----END PGP SIGNATURE-----

--opfa8OdvW/nf1pjo--


--===============6144697316845583140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============6144697316845583140==--

