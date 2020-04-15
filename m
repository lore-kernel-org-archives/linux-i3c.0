Return-Path: <SRS0=g9Ly=57=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E46C38A2B
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2020 08:17:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EF3D20775
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2020 08:17:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NrMJlmeT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EF3D20775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7klrXiUtiams0NFx3EuhgaECF6ZiDuRz1r/8icrZJy0=; b=NrMJlmeTm3c58S4G9h1uDYesm
	O8EjrY1kWh1qgzewt73zTZDGjnKUE3yLRK/jrwexaWKXVXUNW3As+o+dYkAzyDGQIwG+UoQLBfsd+
	5NrCoiksmIkdlQ+3B9/UTSwHs7Ft8ODxxa4hi7PGr/8UqfA0tP8bBowMGuRfFIwb3+VBXcRUf7o2l
	u2GIPBLHVd7g+dWRKpGo1MxBGiv4TVWYV8+Y3LUbjKPNpXZER6Dit2/QhTsOf9cYUNoEl5DmE6D/Y
	eHjIWuCXdyu0B4Nr6c6WXEsd6LfuHvcOoLbi9CG2eTXVxoKHR7Q/p1HwPALGZNimzKEDrlDbD4aLh
	uJlgPQkiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOdEA-0008T6-Ve; Wed, 15 Apr 2020 08:16:58 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOdE7-0008Iw-N6
 for linux-i3c@lists.infradead.org; Wed, 15 Apr 2020 08:16:57 +0000
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
 by pokefinder.org (Postfix) with ESMTPSA id 023F92C1F58;
 Wed, 15 Apr 2020 10:16:54 +0200 (CEST)
Date: Wed, 15 Apr 2020 10:16:54 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH v2 2/6] i2c: allow DT nodes without 'compatible'
Message-ID: <20200415081654.GC1141@ninjato>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-3-wsa+renesas@sang-engineering.com>
 <11ca7487-ac07-f714-8573-20d1a0040212@lucaceresoli.net>
 <20200415075911.GA1141@ninjato>
 <8937e466-fe3f-3686-98a9-8013990bc3f9@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <8937e466-fe3f-3686-98a9-8013990bc3f9@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_011655_903608_F54472C9 
X-CRM114-Status: UNSURE (   7.06  )
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
Cc: Rob Herring <robh@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vz@mleia.com>, linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 Luca Ceresoli <luca@lucaceresoli.net>, linux-i3c@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============1875753792455355339=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============1875753792455355339==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E/DnYTRukya0zdZ1"
Content-Disposition: inline


--E/DnYTRukya0zdZ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Aha, is it easy enough to distinguish that difference in user-space so
> that we can present a specific character to indicate this in i2cdetect?
> Or is that not so easy?

I thought about it shortly but have not come up with a way of doing
that. This is the code in i2cdetect:

	/* Set slave address */
	if (ioctl(file, I2C_SLAVE, i+j) < 0) {
		if (errno == EBUSY) {
			printf("UU ");
			continue;
		} else {
			fprintf(stderr, "Error: Could not set "
				"address to 0x%02x: %s\n", i+j,
				strerror(errno));
			return -1;
		}
	}

So, if we chose to use another errno to indicate 'reserved' and update
i2cdetect, all old versions of i2cdetect will have ugly error messages.
And adding another IOCTL just for printing reserved addresses neither
sounds great.


--E/DnYTRukya0zdZ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6WwvYACgkQFA3kzBSg
KbZfTw//TrCAhfJ/znCZ5SkE/evodYpzpW+VCDNvh7VfXv1OKWhQwRPxUWhfOIbo
l0H1DNk1swBMUICCbWCs0/jJ146amGzUsY/fp8fE8bVtUN9JMg3xuXeMnL5m4dYW
b+6l7hm8sbHqs+ED6BgRd5fPBJATNVTldukoImwfTsYHpBMTayNgPDeECkdEHfrc
LBZJwbarG+jvIV4AoDpakG5qg4Gp6D0j5V0lDfEW87DEqtn+/HwZI3QqJ4G2HKqS
ywhxTHiehdg0ScVk7uijgqXuyJ6uAmRAw5sBehUcTRDO3V5Hqmt2yE2gaGO/VlKj
JIcdUJjDFVAQJo3VbiwFViFYerxCECvAifRvJmwDwFB5KtsgBmEmBuYolEjXgi0N
h3mWF+wGZKyRC8ErSahWgAk8QqKjLRlYMSCdddZxOZcd+1NwdyP7PrfL3wvRzZFw
c/8VNnvFual/M1o/aYViqqAPbiVtj2MfKLm8ZViTKptZg+KUvZjATTv+jac1llo+
J4rjYwrhJANcmgVFTRlpQwI2iIFprtwO6+PF0HK/MTA6LsbTSNit4IFzWwwgeb+7
ALJQZMEGGFHx3H0cBaNEs3AY4jE24X1l//0k2QhfadTK3wUwqoZ+i7Mw/gZhtM/O
tBOu6IgKqeMcmw2e7IvAcMWM8ZCTaoDFF4gt66h4f48LOuVMeG4=
=964D
-----END PGP SIGNATURE-----

--E/DnYTRukya0zdZ1--


--===============1875753792455355339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============1875753792455355339==--

