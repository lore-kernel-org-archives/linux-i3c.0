Return-Path: <SRS0=iJH5=45=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1191C1975A
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Mar 2020 11:21:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B404206EB
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Mar 2020 11:21:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HGtV7SI+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B404206EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dQqxhv1mhojUJQkCyi/6g/A/E/Gipr6R4R634RJGFEE=; b=HGtV7SI+KDYxbcLwgMGjnItZo
	eMCdta7QNLfYZqEpQ3UFNlcuGsjbGdj86NTKuq0hQCFNVVWe5uwRycB1OpOH+0o23SN7Lf25EZJB/
	MyTLcvM/eN2gCP80MK7FmODR3UFMjzqHCfd58uL8VDm7GLzxnKLWUmSSVA9GNjY9KVVcAJh8RCTb+
	uQ0/oidOBiilCuEtKwjMpdgxBtJPFZfXMWAPCC5rdjiCQGmMi6g0Or17jiqHclXmB6LRTp3lZiSNZ
	HqfNIJ3FA27rvDHikzGNj5mcZe+i2cttn0QMfM9jj+o8ZqT8x/c0y2GRBWJIv98omIWvFTGsIAaki
	8zZqgx/4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCLtg-0006un-8B; Thu, 12 Mar 2020 11:21:04 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCLsc-0004Wj-QC
 for linux-i3c@lists.infradead.org; Thu, 12 Mar 2020 11:20:02 +0000
Received: from localhost (p54B331A0.dip0.t-ipconnect.de [84.179.49.160])
 by pokefinder.org (Postfix) with ESMTPSA id E76E22C1ECC;
 Thu, 12 Mar 2020 12:19:53 +0100 (CET)
Date: Thu, 12 Mar 2020 12:19:51 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [RFC PATCH 3/7] i2c: allow DT nodes without 'compatible'
Message-ID: <20200312111950.GA1013@ninjato>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdWaPfc050dZiRr+gAFzsdjSo9Vo70ztWgrMGPJxLUqupw@mail.gmail.com>
 <e43eaaf1-a294-902f-9a52-ebf8b29acab1@lucaceresoli.net>
MIME-Version: 1.0
In-Reply-To: <e43eaaf1-a294-902f-9a52-ebf8b29acab1@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_041959_162785_69F18144 
X-CRM114-Status: GOOD (  19.48  )
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jacopo Mondi <jacopo@jmondi.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-i3c@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============4343325649031639955=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============4343325649031639955==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Luca,

> But the kernel currently ignores nodes that have no matching driver,
> right? So in this case the kernel knows that that address is used, but
> ignores this information and considers the address as available.

I'd rather call it "unbound" than available. See later.

> Seen in this perspective, we should have a "compatible" for all nodes:
> it is just describing the hardware and could be out of the kernel
> control. But instead of discarding all nodes without a matching driver,

And what compatible value would you use if you know there is something
sitting there and don't know what? This is what this series aims to
address because we thought a compatible name like "reserved" would not
be a good idea.

> the i2c-core-of code should mark them as "reserved".
>=20
> Does it sound correct?

With this patch series, this is quite what happens for ancillary
addresses. They get their own dummy device automatically now, are marked
as reserved and can only be obtained by the driver which bound to the
main address (of_node of ancillary addr =3D=3D of_node of main addr).

For the main address, I think things are a bit different. They already
have their struct device. The only thing we gain from reserving them (=3D
binding to the dummy driver) is that they are kinda blocked for
userspace access. The "protection" is kinda low, though. There are
already ways to communicate with bound addresses from userspace.

In kernel space we still need to probe this address until a driver is
bound to it, I don't see what a "reserved" state gains us here. If we
are talking about the pool of available addresses, we are all good
because we operate on existing struct device and don't care if they are
bound or not. Or?

What would be kinda nice, though, is when i2cdetect could show reserved
addresses (unbound but having a struct device) as "RR" or so. However, I
currently can't see a way to do it without breaking compability.

> Clearly this does not fit the case reported by Alexandre: a device
> having a driver which is known to be badly buggy, so we don't want to
> instantiate it. But again, this should not affect DT as it is not
> describing the HW, but only an implementation detail. Probably disabling
> or blacklisting the driver would be a better option there?

"Fixing the driver" is the first thing coming to my mind ;) But yeah,
blacklisting would be another good solution. With only the information
above, DT is not the right place to fix a broken driver.

> My apologies to Wolfram, I appreciate a lot the effort you are doing,
> but before reviewing this patch I have never realized what I tried to
> explain above.

All good, Luca! Talking over code usually brings in viewpoints which
have been missed so far. This is expected. Actually, I am very happy to
have this discussion!

All the best,

   Wolfram


--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5qGtIACgkQFA3kzBSg
Kbbq1g//cGduBAVmcRJ6Vsggj4Ku7GeXkHPmq+ql8nV8hwFA8TL+CLMs7E/uwg7m
cKOtGFlayuUVDPQUNioVeupDTKj35wDbQEXQ9TJaUzqELdDc2oeDYyOnfO/CGc7Y
g32bVMtt/p7G+vvYqPv5yk61q14hSvH4d2+kkhIlD62fHfJEdNtEN0j4avxnNgUz
H2rDXxEAQcSpegYDW+fAytaFqguTW8++Mq8egMucI3t0ol396y7Ils24B21KdqYI
gjOtstIJLcl4NEUJME/Z6YtYQjuXBxgV4tQjkCypm5u+6+13JfiSEZsRD7mP5KGv
QIsU+wlqgMqi2HGB5VtUnDtxkSaQRoMcZ4M5/GqVr0rcAKJKxIeo0AkIkmAlnWVG
1KnFSbLMB0xf6udLt/V5B38xyYvCoohbl3W2kHNRjI1MB1JO1PaaclAu+KNou+i8
jdGKlcc7F/PGGJ50HWqKNlgx45bi5MgGrDOaxru+vVUeBuJJLedPySfxsFJbiZK5
oRY88yHNVzPjtpBOWgQENx2VYEOVrpDdCZjU9S4rCZC/PCFeFm2jvRa9VR5tW2Ol
ovghfXLlzyL/lDjm8eGJxQYk6sqK7JsyYAlWbJp3sNVrgPSm9ufSSN75FBjq7WXk
KLDaK0AY0DXFMpD4Znb3/SMaJrOZ9ZRfx9nnM2JnrNcNd0OgjbM=
=AZPQ
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--


--===============4343325649031639955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============4343325649031639955==--

