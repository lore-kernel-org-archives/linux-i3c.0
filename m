Return-Path: <SRS0=iJH5=45=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8A7C1975A
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Mar 2020 11:30:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B295320716
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Mar 2020 11:30:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sI91tB66"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B295320716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YTvUu/d24qk64m0fA0cqhzvv8ZZPr4eMxjhTX9NjX68=; b=sI91tB66jrvvmcMFJ7sWb54bS
	9J0wuPZYsixF7F95WUVcjKMkK5hsJMjcaNBJur/CDaAS3bH7ecctHRpq00z9OJlXVgCi1Z8nehAW9
	I5tjw5SYzJUUDnku6RZOehVXKUEYChPJ+I7EJFSoUzyTFxtVBrREzlyp9vujqRDlWKAW10Cs6ECi3
	ggdt7AC9xYD7GCYY22LgjvixkC4ztc1oTWA7czd3IKWMIx3yv2vaYq0vQuFNU1kOLK/cO7nOH9tfj
	ZeEPAxTFtITVNPKhor2rhDfaKmdcoh6DdewrNkN0sok+cPb1BNR4qG9WjprK4W2lCZ8x/mft7iM+9
	vOEpDc77A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCM35-0001pG-3W; Thu, 12 Mar 2020 11:30:47 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCM32-0001oc-Cs
 for linux-i3c@lists.infradead.org; Thu, 12 Mar 2020 11:30:45 +0000
Received: from localhost (p54B331A0.dip0.t-ipconnect.de [84.179.49.160])
 by pokefinder.org (Postfix) with ESMTPSA id 66DED2C1ECC;
 Thu, 12 Mar 2020 12:30:43 +0100 (CET)
Date: Thu, 12 Mar 2020 12:30:43 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [RFC PATCH 7/7] i2c: core: hand over reserved devices when
 requesting ancillary addresses
Message-ID: <20200312113042.GD1013@ninjato>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-8-wsa+renesas@sang-engineering.com>
 <CAMuHMdV-dfjukuSKiFg4vb4Ntn+XWU0XwHPxyoaWs1vtQVg4cw@mail.gmail.com>
 <dc831357-8545-6f6e-71a2-bef282e0bd94@lucaceresoli.net>
MIME-Version: 1.0
In-Reply-To: <dc831357-8545-6f6e-71a2-bef282e0bd94@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_043044_586219_0CF62E36 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kieran Bingham <kieran@ksquared.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jacopo Mondi <jacopo@jmondi.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-i3c@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============1739966848714027661=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============1739966848714027661==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rz+pwK2yUstbofK6"
Content-Disposition: inline


--rz+pwK2yUstbofK6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >> +               strlcpy(reserved_client->name, I2C_DUMMY_DRV_NAME, siz=
eof(client->name));
>=20
> Any strong reason for not giving the device a more informative name?

Yes, sadly...

> Reading "dummy" in several /sys/bus/i2c/devices/?-????/name files is not
> helping. Using the 'name' string that is passed to
> i2c_new_ancillary_device() would be way better, perhaps prefixed by
> dev->name. But this opens the question of why not doing it in

=2E.. I never liked the plain "dummy" name as well. However, because
'name' is what we need to bind to a driver we can't have a more
descriptive or run-time generated name at that place.

> i2c_new_dummy_device() as well, which currently receives no "name"
> parameter.

I thought about it but discarded the idea because then you still have
no connection to the driver which created the dummy device. My
favourite idea so far is to advertise i2c_new_ancillary_device() instead
of i2c_new_dummy_device(), because there we already have access to the
client structure. With that, we could add another link in sysfs to the
main address and vice-versa.

> Of course this is not strictly related to this patch and can be done in
> a later step.

Exactly.


--rz+pwK2yUstbofK6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5qHWIACgkQFA3kzBSg
KbYqEA//dr8XFHEYXWhQXqlofteHQgPuqLLgw5ruq9PvVCpv51Scsz/RjoUKvanT
s3/CZjL+MvvHDvvpKjCpW6/ImDM2KSGalPy0ZAQ0GaOtS2aqaLvieLsnxGPF2FLl
QLBufHNjG6DOkO6PrQ44SLRFvpKw2iBMihmGyJBRjWWMtPrpgw5fO0omoM3IogPj
t+W0+Fou6p6dgiTYhGCIOYi8YHAHEZt+HPhBExDRHfbeF3K9IXGwA84m8uTCVEP6
2XZoR4mjO5fbXGMWp5uhB9EtXridUSmUTavnG/vOFki6i8Nw36bscICAgRVaHk3m
nhK4s53VEt1EB8dyW61ZUAfBqwwCHKfbmRneKpDtytOi7PS2eHrSTC1hCioparvh
ifGDynlbyaEbJtxmmp2ukgSxLiO9V3r4HgHnnU7L+yUMUApcVX6o7ftRgMjKK4oj
rYOnylcJyC151MOY4T+2fSl9VCmkcBsz8K5LoU/iN0TF6/x0W3OQ6Nv1p+t1k2oe
105gZoZ/9d+7ja7MfJB23p0neb8SE0BVgkFtvLkJyvpyEw3f/JMdE1g3fjCAlb4u
dB0enc8/ncA+yoGOTtN2ADXCPvteTcfK+GC9/Tlmd1HJwWlIWu24IVYJFAg6a4Ln
HTILjLrr6L9HRNaemVxKdq1c/fTAPMFJB2ReDoHJokKjoTPULn0=
=WKGM
-----END PGP SIGNATURE-----

--rz+pwK2yUstbofK6--


--===============1739966848714027661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============1739966848714027661==--

