Return-Path: <SRS0=CE6j=UF=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC73C28EB9
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 18:54:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B7DE2089E
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 18:54:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rSwQI0hH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B7DE2089E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pcuH+AchjDXYCkvDxqKEiufcM5s26/TS8KE5pRC3gnU=; b=rSwQI0hHGu13lFOb4oF0ggKSc
	KoJA5GlsFnfZgNwb05XUhzeM7jpIS+5IV+M2nBOfCufYlk0+7JTIsxWy9dzJOH+YQDfY/GoWxEStp
	VZ9feW/TpoUBzEJb8+bJBBV0x8QxdnlM9w5Qd/Jlfuha6GTmV163LiQ287zGjVjX4GjgvMw9ZRL1x
	czqw9KfQLcvd2VrAsnK2I+c97k0uZ/86c6nz5nSbnosLSOsZZG+BrsofImFA+T3G9gke1wVjZ4CTW
	spItKOUURFJJwuZDFtJiSiI5KpNZsML4NEEcyQXmhRgeDFAD6VgZHRS3IB6WcuFZpZndedM7i220K
	3+7woXMrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYxWz-0000BZ-TE; Thu, 06 Jun 2019 18:54:33 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYwhi-0006x7-JG
 for linux-i3c@lists.infradead.org; Thu, 06 Jun 2019 18:01:35 +0000
Received: from localhost (p5486CDEB.dip0.t-ipconnect.de [84.134.205.235])
 by pokefinder.org (Postfix) with ESMTPSA id 89B1D2C35BF;
 Thu,  6 Jun 2019 20:01:33 +0200 (CEST)
Date: Thu, 6 Jun 2019 20:01:33 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v2 0/3] Add ST lsm6dso i3c support
Message-ID: <20190606180133.GB3782@kunai>
References: <cover.1559831663.git.vitor.soares@synopsys.com>
 <20190606162522.GA3782@kunai>
 <13D59CF9CEBAF94592A12E8AE55501350AABE7B3@DE02WEMBXB.internal.synopsys.com>
MIME-Version: 1.0
In-Reply-To: <13D59CF9CEBAF94592A12E8AE55501350AABE7B3@DE02WEMBXB.internal.synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_110134_784458_7AEC3573 
X-CRM114-Status: UNSURE (   7.71  )
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
Cc: "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "lorenzo.bianconi83@gmail.com" <lorenzo.bianconi83@gmail.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============1583348416349088663=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============1583348416349088663==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> I think I2C ecosystem is also part interested in I3C due the=20
> compatibility and maybe they can provide some feedback.
> If you think differently, sorry I will remove I2C list next time.

No worries, but please do remove next time, for two reasons:

a) even for I2C clients, the i2c-list is usually not added if the client
   only uses standard I2C communication. If there is something which
   needw special attention, OK. But most of the time, the list is for the
   I2C core and bus master drivers, and not clients.

  (That might be different for I3C, though...)

b) if the patch in question is "self-contained" in the I3C world and not
   affecting I2C, I think there is no need to add I2C. Interested
   parties can subscribe to the I3C list.

Yes, that was a good occasion to write this publicly.

Thanks,

   Wolfram


--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz5VPgACgkQFA3kzBSg
Kbak4w//QNYKgfXtT0eQ+1cxXqpk+Kp3HUNCapn0Lm87sidQL1KJZp8EeQfv4RmG
PBFwx3+y2E5zSpOrlHAc5q2UYhIuQYaXNZjF4ZkHI//mhyuH8z9R/auU2Sc6Nqcb
F42untEqzImhr5wIDrnQSkQiDYT7ewJS03yXxHEGNS6GEmSEeJkRZ/KcbhoGoboo
mNYbJyY9EGfn14/TSoIaSu+cO4VivS0YXpVGr7KbIPViWCGBPexW5XafShvsWz4H
3w0KXk69/rdWAJkw+o+9nBgD8HX3EgEK6Xd3/c6t/BwcupEVC2k5yQHAPFZP0cw0
Lx1NAOdOBHjpY9wQKyDC3K7aClRhrkIvI4lFWlmEi7XZyBSH8MJwZ8sneNadlgsr
qFguhSJlULggJJuacbmWFnbrpB14TqqAkTYpLuBrtWbi/jr+xGoTft78lU5X3GjC
ZPdHvodYAKJxk6Unk6y/z6yZHX9B9ymvfl6STiImu01jpaFuC1mEbs4BVAHi9Nng
QDUcwoL/Fwa71jnJKXh24dqjh1xvYWSvE7HT0HdiwoWAx/m+5aAyHSkG8I4dX7zl
M6TNjN1Zvw43cbYQbzUEH/pTsRUdl3vb/R4MYIKOvbXFEjOHOqypuFxSKQ2nF2Uw
PHEDhX4gYl0t2tkquHWTA9nPxbDXIDVQXChux7VQdkja0+eBEfA=
=ZB1I
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--


--===============1583348416349088663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============1583348416349088663==--

