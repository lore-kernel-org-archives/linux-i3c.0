Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26253C47422
	for <linux-i3c@archiver.kernel.org>; Wed, 17 Jan 2024 08:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/R+E1yI60a5gvuHgSp/9Sr1ZRzt2Mw8HHDYFgmzyWs=; b=cqtIMPhsGT3gwjt9gf6wIcazVy
	xZ51LQD+Eel6yqxEE6XZEhux+j8LY2VUMEfkVSQT1GRZoFlVas8MVnv+tN4LpgDctpQY0qyEW1PQ2
	RxbmSVoDvmY9XXJXQgH7JE6emf9xBgFDC6hZoiM5oBjOM72rdTVuxJYiyFZiGjFi5UChubBG6+OWI
	dN11m1wwfjyMWljzzAmnf3L5zZearLNXNu+XGCEF+gDSnfvxrSq7Nuz/K2ePXyv6tin9kLZNj6RiQ
	vE4XPWfW2x8jLb1iQ13iPFLtdL+2ACULmeJXucuZvj28Xs46fA1FsmB/VQuQXIqrlVmoxQfUH/rVZ
	wZXJdo+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ1Su-00EucE-2U;
	Wed, 17 Jan 2024 08:40:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPo5l-00CyGv-06
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jan 2024 18:23:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7DDC7B80E77;
	Tue, 16 Jan 2024 18:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9565AC433F1;
	Tue, 16 Jan 2024 18:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705429394;
	bh=BZZrwB54NzVpdIKnJH5IBEBJlnxfuCsPO9zMgTYYx0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=udPD62dbadhMBLT6wXnbk/PYsrCAhEDzjxtawZJ9t1xIzxa7qfbeCQZOMjoea3fNW
	 ny+vVTuIADQ7GD+7sSRh8UkwpzCq8tRLvoVD1YVU3y8RlPNrvhJaPpGtGNVQ7KuO22
	 UY8nTAwYCb42cZNy+jP21tJ/QioS8vTLwiEwsExq/qag4FgJ8znilhvRbhZm7y66b1
	 tRzF0R/qHyskJBWBYZfiOHQgcKgDt0IAHFQ8cv33ftqROoOt7W8C7TJgl137N72wn6
	 VFHO8HARbFh3IEiUgbMNiIv+izNcblv8i63ErRkDoKK+o68aALBny2lm8lYFeq9y9Y
	 QWDaX98aExH2A==
Date: Tue, 16 Jan 2024 18:23:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	robh@kernel.org, alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com, gregkh@linuxfoundation.org,
	imx@lists.linux.dev, jirislaby@kernel.org, joe@perches.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, miquel.raynal@bootlin.com,
	zbigniew.lukwinski@linux.intel.com, devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH v2 2/7] dt-bindings: i3c: svc: add compatible string i3c:
 silvaco,i3c-target-v1
Message-ID: <20240116-retract-conclude-c47a7fc8cb21@spud>
References: <e3b9aa63-25a5-41cc-9eb7-6e7d1eacb136@linaro.org>
 <ZaFjaWCA6k+tiCSJ@lizhi-Precision-Tower-5810>
 <ZaWLCrWJEMtFx8cR@lizhi-Precision-Tower-5810>
 <1b628901-7f71-4c97-9a16-723912988417@linaro.org>
 <ZaXqCoCHPWER94Hh@lizhi-Precision-Tower-5810>
 <d45e31c4-914e-4cea-a145-9775b6f516ab@linaro.org>
 <20240116-bleach-herbicide-48d636967134@wendy>
 <3199c245-3d2d-49e8-951e-2b059de4d683@linaro.org>
 <20240116-achiness-thievish-10a12b3c08cd@wendy>
 <Zaa+cLGVVDSB5MYr@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
In-Reply-To: <Zaa+cLGVVDSB5MYr@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_102317_334874_6543D9AB 
X-CRM114-Status: GOOD (  33.80  )
X-Mailman-Approved-At: Wed, 17 Jan 2024 00:40:01 -0800
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
Content-Type: multipart/mixed; boundary="===============5315425179542165981=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============5315425179542165981==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qdmJxKjtdyHy6e/u"
Content-Disposition: inline


--qdmJxKjtdyHy6e/u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 12:35:44PM -0500, Frank Li wrote:
> On Tue, Jan 16, 2024 at 09:48:08AM +0000, Conor Dooley wrote:
> > On Tue, Jan 16, 2024 at 10:33:48AM +0100, Krzysztof Kozlowski wrote:
> > > On 16/01/2024 10:30, Conor Dooley wrote:
> > > > On Tue, Jan 16, 2024 at 08:24:20AM +0100, Krzysztof Kozlowski wrote:
> > > >> On 16/01/2024 03:29, Frank Li wrote:
> > > >>>>> 	Patches were accepted after discussion, what you ponit to. So I
> > > >>>>> think everyone agree on the name 'silvaco,i3c-master-v1'.
> > > >>>>> 	I plan send next version to fix auto build error. Any addition=
al
> > > >>>>> comments about this?
> > > >>>>
> > > >>>> I still do not see how did you address Rob's comment and his poi=
nt is
> > > >>>> valid. You just did not reply to it.
> > > >>>
> > > >>> See https://lore.kernel.org/imx/ZXCiaKfMYYShoiXK@lizhi-Precision-=
Tower-5810/
> > > >>
> > > >> First of all, that's not the answer to Rob's email, but some other
> > > >> thread which is 99% ignored by Rob (unless he has filters for
> > > >> "@Rob"...). Therefore no, it does not count as valid answer.
> > > >>
> > > >> Second, explanation does not make sense. There is no argument gran=
ting
> > > >> you exception from SoC specific compatibles.
> > > >=20
> > > > The patch could have been applied two months ago had Frank done as
> > > > was requested (multiple times). I don't understand the resistance
> > > > towards doing so given the process has taken way way longer as a re=
sult.
> > >=20
> > > I think that Rob's comment was just skipped and original master bindi=
ng
> > > was merged without addressing it. I don't want to repeat the same
> > > process for the "target". Indeed I could point this earlier... if I o=
nly
> > > knew that Rob pointed out that issue.
> >=20
> > Oh I think I got confused here. The context for this mail led me to
> > think that this was still trying to push the i3c-master-v1 stuff through
> > and I was commenting on my frustration with the resistance to applying
> > the feedback received. I didn't realise that this was for another
> > patch adding a target.
> >=20
> > I think you already said it, but NAK to adding any more compatibles here
> > until the soc-specific compatible that was asked for for the imx93 is
> > added.
>=20
> Is it okay for 'silvaco,i3c-target-imx93'?

I don't know. Is the device in question capable of also operating in
master mode? I have no idea from the commit message since it contains
zero information on the hardware.
If the exact same controller can operate in master and target mode,
having two compatibles for the same device does not seem okay to me.

Also, "silvaco" does not make the imx93 so that is not a suitable vendor
prefix. If the imx93 only supports i3c IPs in target mode, I would call
it "<vendorofimx>,imx93-i3c" with "silvaco,i3c-target-v1" as a fallback.

Thanks,
Conor.

--qdmJxKjtdyHy6e/u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZabJjQAKCRB4tDGHoIJi
0oBVAQDDSQszcWBHPjv+zzPJ4Jwf5F3zvlWOZOaPQSVALMBS1AEAjehMKKMgybnn
hKiuBGxe+C7CLnu7Tf0NAw78Xj6lcQY=
=fPBb
-----END PGP SIGNATURE-----

--qdmJxKjtdyHy6e/u--


--===============5315425179542165981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============5315425179542165981==--

