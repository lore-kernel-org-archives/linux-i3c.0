Return-Path: <SRS0=CE6j=UF=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78BDC28EB5
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 18:54:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 974F82089E
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 18:54:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WVvcF3Ir"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 974F82089E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kAZt1cnKcqCsBPnk70u3rq0FpC4Cd+monTt/uZoRNlE=; b=WVvcF3IrBnuoTPqaOWYoEOxer
	MWfwTtkaFTGjlh7FfNFlCHgG5r2qsuPm+0pK/zVsVagDzgj4I3/aLjHoZ5VS3qOPRRu2kTD3nCv6T
	atyEum+hvvPy9e5CI0TWydMfQ8fVlOwHomtploe4j+IYMRsFV23ja048+uOv5/rb+/e5D3l2YsLXh
	wmNGbK5Qo22uDljttDNMNufGPzQy9XUL3s12A3djmtq1gy9SECmj13+0/d5E3FBIRzidN8xoO+oUx
	rNgkoQXEOnC/EfhZJvW5nvlFiY84n1YX3e1JvUnQNXfX2Nk9Ta8f5aGUtzrouDzYGovN4mEHYm0Sk
	wY2tx9Oxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYxWy-0000Ab-Qy; Thu, 06 Jun 2019 18:54:32 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYvCh-00044o-1L
 for linux-i3c@lists.infradead.org; Thu, 06 Jun 2019 16:25:29 +0000
Received: from localhost (p5486CDEB.dip0.t-ipconnect.de [84.134.205.235])
 by pokefinder.org (Postfix) with ESMTPSA id 7FAEA2C35BF;
 Thu,  6 Jun 2019 18:25:23 +0200 (CEST)
Date: Thu, 6 Jun 2019 18:25:23 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v2 0/3] Add ST lsm6dso i3c support
Message-ID: <20190606162522.GA3782@kunai>
References: <cover.1559831663.git.vitor.soares@synopsys.com>
MIME-Version: 1.0
In-Reply-To: <cover.1559831663.git.vitor.soares@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_092527_227937_0D9D04B7 
X-CRM114-Status: UNSURE (   6.06  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 06 Jun 2019 11:54:30 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Joao.Pinto@synopsys.com, rafael@kernel.org, linux-iio@vger.kernel.org,
 gregkh@linuxfoundation.org, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org, linux-i2c@vger.kernel.org,
 lorenzo.bianconi83@gmail.com, linux-i3c@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8215829000310717621=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============8215829000310717621==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 06, 2019 at 05:12:01PM +0200, Vitor Soares wrote:
> This patch series add i3c support for STM LSM6DSO and LSM6DSR sensors.

Why is the I2C list on CC? Is there something relevant I missed?


--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz5Pm4ACgkQFA3kzBSg
KbapNg//cBKxDRaQW1S7u+5yCetAmE74WJLlzFtJOzL0oS+qcPOsi5YATvPGnu/1
k+bPwNGKf3MT1fvax7/qcZjGxLsiGqUfx7AkDYwUEK9Z1Uy6ZN+zdvGjNw9hw5mB
vbF4un8buF3bMxM31ggNx3nQL28SXKgnCiqKkyL/7Ohr1x9jodcSeCrZlLsDjebm
x68IPtUsPZkd3sVfUEdirkoBuX7j0H0dbzUyoxYM/Zfooo79uDH/pXKhiBMWQmtK
vixrFUwZdPO3i2hUtvG4K+8gMUNfH7Z0bLBRVV3P8yZ1Zae0IcBPilJUZifirOLr
8BOxiI03pzrn1LbOG0HkB6RcsgnSaHWZmycLyWJmdcrm6TDzq8e/eCFs9ZhVl0Hx
12OSitCoI2oX8GJnW2uCdruh/twfwXtZMOvJpaRHFApGQbnH+FRIfC9Bm3+Jrt/K
z0baLeWx4fl+YDeKyHhtNcTR0o3hAT7yMiNDDU2duYiCbpH7/+Bp6Pun61WHsPSX
aNmH0UwyPyRQNxrVHi3ytxSfJQ/Zi/dr9XI+ls2idGR5OnjpZhUR1QxNd84Rm529
WTBKK/1ygE72ulUl5aX45FcyGEVLf6QMjDRBAJZebVXNVcEYQauMr/C/JjFUMQN1
1Nitl/qlfEf4FITpEWE351oJF3RjrNgmSmpyEI0vNccDLOVl134=
=/qTU
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--


--===============8215829000310717621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============8215829000310717621==--

