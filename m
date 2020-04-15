Return-Path: <SRS0=g9Ly=57=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32806C2BA19
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2020 07:59:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 034FA206F9
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2020 07:59:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PPtMTfMx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 034FA206F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CchYR7fjv5xubPrjqofYyOE+cRUzUfnIgAU44jtpPlQ=; b=PPtMTfMxWXnI94wRJ/Yt+qYL1
	Xx1kCcNFEdFE9+BibthxtkCDDEy8VnSpctrNxUsYeSvfKGJsoqjUuRkKnv+f+gjr2Dlwgi40vL3VG
	Lyt9+BOAGM2brAYBGJTngzikFg3ObIRyzDhpf61DUAVs99Z51sJc1FwcHxYPft/FjIPJhEbw6Ej77
	mX9dggYHJ9vryh4HpDIuBBtlyx/TNpKiXFiUuqk8EYOTyjL5QFB71bJaPg7DdL0OIWcLP8z6xU8sE
	4TTx8/D7N39EmPkJbmYsvFhU/5A2n3Gg5eEQxGmVbNjrBg2KNNVaUDJkW3BkE80n9VA+AC3vsd5Yg
	LgBw4Wr4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOcx7-0002wW-Rz; Wed, 15 Apr 2020 07:59:21 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOcx4-0002vM-GC
 for linux-i3c@lists.infradead.org; Wed, 15 Apr 2020 07:59:20 +0000
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
 by pokefinder.org (Postfix) with ESMTPSA id DD7442C1F58;
 Wed, 15 Apr 2020 09:59:14 +0200 (CEST)
Date: Wed, 15 Apr 2020 09:59:11 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [RFC PATCH v2 2/6] i2c: allow DT nodes without 'compatible'
Message-ID: <20200415075911.GA1141@ninjato>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-3-wsa+renesas@sang-engineering.com>
 <11ca7487-ac07-f714-8573-20d1a0040212@lucaceresoli.net>
MIME-Version: 1.0
In-Reply-To: <11ca7487-ac07-f714-8573-20d1a0040212@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_005918_688097_5CA7FDAB 
X-CRM114-Status: UNSURE (   7.79  )
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran@bingham.xyz>, linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vz@mleia.com>, linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-i3c@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============5400427326787648539=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============5400427326787648539==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> As I said in the reply to v1, I think we should reserve addresses also
> when there is a compatible string but no matching driver, but this is
> another story and can be handled separately.

Unless I misunderstand you, I think they do already. Note that
only 'i2cdetect' shows a device as busy *IFF* there is a driver bound to
it. The internal 'i2c_check_addr_busy' does not care about a driver
being bound. You can check this by trying to use
i2c_new_ancillary_device() with an address which is already described in
DT but which driver is disabled.


--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6WvssACgkQFA3kzBSg
KbYQ8hAAruiFHx6/xDYq9vD1D8WLWFXqoxuwD4NbJPlRSuzJvimBjPE7ynrPH4Ga
S96O5ehETCXYz2yXLQmo1cwCbnIRo8W9kl+H/knosYOOdBd5jFpKNd7Z3+R2ldHL
jr7z0qYXDcN+ErsIKUL4jJpmcSQL26GrNSmUFbadRvcsGDTq19Qwc+mhNx90oDyh
xxb3RZs1cZWdkc+PygDNWwbh0dvbMHL0LBl6smJxf0z4wyVEx3YWxB4Rzfb4wVo6
HRr1Ubdz1sSGhxyJoZ1PZqQy7lrpg+vLNv+sYG5nrdPsX5KTXlKBXowdWHeSFlXv
nZ2DtsHzwSzE2LaeY9HmlV9iZEFGD/21NQ+u5B5wxcV5EbPyPHeOLUXp2t+6gOLC
TT5vjxshNUPKBYBC/XrPIPC8P08Ajp6+gzckYqLY2/E+Nzmv8akKSNq4+idrw+59
+Gj89nHXXzqSPMDUJ3XfMgLTQcRVNW46H+f6Ix+xwj/JuV1uR0XWELnn/cfH+Q7V
rAuCawvjljjh/h9KfcHAbzpfCSkxXR4dYdKQGD8YeVCrQFvC5IMrZ/cwqF6W0Jj1
xJ5lngRYJsdqRc0Y2/rLpAae8UT54bzPbn4KFNCZ9LHx2Qx0dStIFhG+k927OlZe
6cDCHUXGwC4ypb0pJdeSxD8Y3rRe7GbHfawZkLzzl8z3OjQ3K54=
=LEQy
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--


--===============5400427326787648539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============5400427326787648539==--

