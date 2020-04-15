Return-Path: <SRS0=g9Ly=57=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4014C2BA19
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2020 08:27:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86A70206E9
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2020 08:27:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jwOADBAq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86A70206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l9qeE3sbJCMJ2ySzw+ChAdSLXkwdXqjleD7rRz76t9k=; b=jwOADBAq9fUSZa8KjpRZFyj6w
	P9hagfdEGF+YhkTpUfQ+iTUZFeUGGzqhZCnMKIbmqV1scTxzovp9wxESXcfcosp/fW/nGi0n7bV2s
	RurjjM16U8odSjmhThlW+7Qcn8aYZ4wf1xvLtxTktfNHRWm+pVUQW6E0189PerFNxdB4N7MWlUSA0
	L5aVFBhwHug6hUVZ7xWupMAQZh9hND+kTwUWd0kIUhRP1mM1GdU+mb9jcvy0knrmM0uvwVHT4yNI3
	P6EyoWZ1MjdlYoj7NdbOkogcoeDG1SYTDP19sui6tmhXUG/nLv+xbdLN6d6oaUkVT4ZucpIR4NwLZ
	BgdUpye2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOdO8-0000Fb-CP; Wed, 15 Apr 2020 08:27:16 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOdO5-0000F8-DK
 for linux-i3c@lists.infradead.org; Wed, 15 Apr 2020 08:27:15 +0000
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
 by pokefinder.org (Postfix) with ESMTPSA id 956F72C1F58;
 Wed, 15 Apr 2020 10:27:12 +0200 (CEST)
Date: Wed, 15 Apr 2020 10:27:12 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [RFC PATCH v2 0/6] i2c: of: reserve unknown and ancillary
 addresses
Message-ID: <20200415082712.GD1141@ninjato>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
In-Reply-To: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_012713_601764_AFD92454 
X-CRM114-Status: UNSURE (   8.63  )
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
Cc: Jacopo Mondi <jacopo@jmondi.org>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-kernel@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
 linux-renesas-soc@vger.kernel.org, Kieran Bingham <kieran@bingham.xyz>,
 linux-i2c@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>,
 linux-i3c@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============4832300184958837449=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============4832300184958837449==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DiL7RhKs8rK9YGuF"
Content-Disposition: inline


--DiL7RhKs8rK9YGuF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Status update on this series:

> TODO: make sure there are no concurrency issues in patch 6 when handling
> the struct i2c_client.

This turns out to be annoying. How to make sure that we don't modify the
i2c_client while the adapter it is sitting on just gets removed. AFAICS
we need a new locking scheme just for that and I am not convinced this
is the way forward.

Also, there is still this small room for regressing when there are DTs
having multiple addresses specified in the DT and the drivers use
i2c_new_dummy_client on these addresses. I have verified that no in-tree
users of i2c_new_dummy (and friends) do work on extra addresses but
still I'd like to completely avoid this potential regression.

One solution to both problems would be to unregister the reserved device
when its address is requested. I am working on this prototype currently.
However, I am not sure yet if one issue might make this approach messy:
re-registering the reserved device when the probe of the requested
address fails.

We will see...


--DiL7RhKs8rK9YGuF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6WxWAACgkQFA3kzBSg
Kbae9w//RJrz6RPLZSRlLMCbftnMujapFw1Mb4d6vzU283/gdeAkzuz/C38XWPA8
xcUJsFWpHCDYOhaXdav0Jf7UL5KssTT2XdrdWneLKmn/QN/8NdeOkiROzTq2pavX
lcQhC9V9tjGe09MfRlpyg6mZDti/09vxJ6QZbOVpHyJg5chqht1NgwjYtAVCwsby
Fd3ucuyN5r1rPwyRXuVVnXQ0D/itOsacyLzpAfA3BQNlLPWe71fsytlCrlPX31Ys
+yh7z+0BAprWcPNNXLVrOG87+Agi7p426lpV94D5BsoEbSbdMC97vLShzooOVFBS
BXhziJ66I1btW/yaXBYO9RWcm0bPH/yN0NTFE9X3H7OqTcVh9TFin33oGR/PEZF0
gkvDnFLOfCUWLO/697U8x+Km0bN/rsOcdapGkjZaeSxZF/QQ3vWGo4S3AibS9GPA
scR//jSVYL+iphxlOa08YRqSfPd2L32vDirk4iTsKTt45850jzGcilFkrEKx4uUm
UTp5VmQkIoVj0CO+E7ByjkM+5yG2o9CTNZHY5X5kLsaiETjGCD0yH4SNrADpiY4o
F13eHJvBFVGtjR969TuiT4tpAzRh+xKAuJNfC3Z8yRyT/uKSS+RAajfc2SCKoWxC
6iSF2T57Tclts7MFdaBCeYN5f16uSvyQR5UTSFezGHb1qd642wI=
=blKZ
-----END PGP SIGNATURE-----

--DiL7RhKs8rK9YGuF--


--===============4832300184958837449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============4832300184958837449==--

