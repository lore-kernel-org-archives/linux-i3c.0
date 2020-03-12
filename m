Return-Path: <SRS0=iJH5=45=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03618C4CECE
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Mar 2020 11:21:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD388206F1
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Mar 2020 11:21:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cUwuqmr1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD388206F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uTMU8i3RyyZBNWyPNgyYmBkKgUCj8gCpILl+dcecrGs=; b=cUwuqmr1Vb0VKYhfLW5pjZzwD
	Ed9GSdTSB6A6Rg6+tzx4Y2tCe4d+1/lM8thhYepqTD05r0Qf42818yFO2p9kVmLIXnjN4vTTr2Z3A
	81UOzc5SbzSH6o8ZOV5HMODQ4btPW7XXuZ8IcARSk1bakrehtaSI/cWDQSzu+9UD7IQmJl/VfokO7
	21Q2Jll2IDCZvf1H1A0Q1j5NqXQLr+wNTgqxbF2ijFbw01u1S3wNQ5ShYmmXSpjPPlD0gGFN2Ejo+
	vWe2+UqQI9K2fj1ncqDDURmKqcMJkKQ/b51WWrqNS+5QJtckNtaSIh2+voYjinaEHDBhYa1G/5/jo
	36YFN6mVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCLuF-00072q-Hc; Thu, 12 Mar 2020 11:21:39 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCLuD-00072T-C4
 for linux-i3c@lists.infradead.org; Thu, 12 Mar 2020 11:21:38 +0000
Received: from localhost (p54B331A0.dip0.t-ipconnect.de [84.179.49.160])
 by pokefinder.org (Postfix) with ESMTPSA id AB7A02C1ECC;
 Thu, 12 Mar 2020 12:21:36 +0100 (CET)
Date: Thu, 12 Mar 2020 12:21:36 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC PATCH 7/7] i2c: core: hand over reserved devices when
 requesting ancillary addresses
Message-ID: <20200312112136.GC1013@ninjato>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-8-wsa+renesas@sang-engineering.com>
 <CAMuHMdV-dfjukuSKiFg4vb4Ntn+XWU0XwHPxyoaWs1vtQVg4cw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV-dfjukuSKiFg4vb4Ntn+XWU0XwHPxyoaWs1vtQVg4cw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_042137_556510_9E22BC65 
X-CRM114-Status: UNSURE (   5.17  )
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
 Luca Ceresoli <luca@lucaceresoli.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jacopo Mondi <jacopo@jmondi.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-i3c@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============5726762383985914975=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============5726762383985914975==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LwW0XdcUbUexiWVK"
Content-Disposition: inline


--LwW0XdcUbUexiWVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> (perhaps i2c_verify_client() checking dev was not such a great idea, as
>  callers need to act on dev && !verified anyway?)

Can be argued. I will have a second thought about it.


--LwW0XdcUbUexiWVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5qG0AACgkQFA3kzBSg
KbZ1pw//a08b5SMNFzv8kd0sP91WzfI8fKmIuGx/frUmdIaZ30e5cNuotjUL02ek
Tswmx+2eMxogD6/Q+N7jNbwFh/YghCpxY/hthdc9XKcwJBtCxzSgZzDyFo65aZ2d
ZmMR1Yfh3O/bk3fzSU9HcRn9MiBksaPnPNOCQMXhu2BWc1ugDJiM4c8bSiGeqqVd
4EMjxl+M8x4VvSRv26qwerrjyXWEU7rW0+NoBL704qgIKfgecOARCf8/2L96vX9A
14U8VtRE6E8z07EvyQHdT+9S/Er0daYI+tb2iAP0S496Zaar/PBeaC8xoSXY1SKK
lSXlthO8tgycRkyoZuYaai91+KPRq1WpYRPaHqkeVOmGzWR2INk7Ne8v/CRwL9f/
hUhnMfylrIAE5F1/QRA67HrzFy/yX7bC918wCTk2hrmA8wWkkkn9e2Ab9ToXu9S+
7rysp5gE82jgf2w/PqPhtkLbhtvcll3K9r9xBb0Mo11saIjk5UskUX4N45RpoIVx
5Wptct5MKdnEUv2gAj4oNWJ4mvlQOgqfY+KWjjl4usR9KfYfbknhGSPxp4WNqXPX
KrYPDcWnfFpHqHWPdOrbLd0aTpdxHMyswcj20jkmHPUDs1jnhroa8au5yiG67qEK
mO2Q2Cvik/4H4A3HL1DuT64wnt5Ev9m35rYC1tYc14+WKkDBarw=
=8zo1
-----END PGP SIGNATURE-----

--LwW0XdcUbUexiWVK--


--===============5726762383985914975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============5726762383985914975==--

