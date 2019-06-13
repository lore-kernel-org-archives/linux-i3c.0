Return-Path: <SRS0=bY92=UM=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66689C31E4A
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Jun 2019 18:38:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4362F208CA
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Jun 2019 18:38:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m0Sujuau";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="KVerzfWI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4362F208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lao4oWn7n/FusKG/UwB4HmpaRek7RdageIvj8D5Foug=; b=m0SujuauFvMz3KV8mXq+KIzUy
	h5g3zdkuk8U4U1RZ86f4TlfXMurNpkIJRWmCv8md1LzRKCEnBZVE4+mCX/Z7juY486I7k26VpAXwQ
	NZCaL29vBCR+f0h9I7MCZBIcHmJTq6liL8cjVZYbfhQXqlY0n9bU6Y+ATuZPz5Lz/2maWydLLtpjR
	CH6twAhvCe+g2MsZxeuDG6cbvqMBotYXHi+iA7AfWlW/6NDkZxclOE34e1LLU2Ywk5YX32u5NLsGB
	CXJ7nltaD7uABor0m9YW/leuS3GAApT5bLXk7dX50aB8fpLndSE7CgLuEiksV4mgUBbfuqZym2oul
	CvPYvXcwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbUcI-0008Ga-Sh; Thu, 13 Jun 2019 18:38:30 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbUcG-0008G5-Ki
 for linux-i3c@lists.infradead.org; Thu, 13 Jun 2019 18:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N5gjGcYoQZZl5JqrcxsUv1o4lauQ728+0lZMR0CyIYo=; b=KVerzfWIuvgOGWj2T9+4xZwpz
 SPEygCiZ+IwCDwxWi17byi9WoJLv220Lg9VWaSRDHpxJj35cTBKSsOHyrT8B5/wBxWgYb7B4XC+A6
 JDIpMtJIdmhAVNRQpM/uq6kXhytOSAYEaafiQJFdlJOVWY5vQIiZ4q2DPgcrBqy5aNDb4=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hbUcB-0005Oc-Il; Thu, 13 Jun 2019 18:38:23 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 0726D440046; Thu, 13 Jun 2019 19:38:22 +0100 (BST)
Date: Thu, 13 Jun 2019 19:38:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v2 0/3] Add ST lsm6dso i3c support
Message-ID: <20190613183822.GS5316@sirena.org.uk>
References: <cover.1559831663.git.vitor.soares@synopsys.com>
 <13D59CF9CEBAF94592A12E8AE55501350AABEAF3@DE02WEMBXB.internal.synopsys.com>
MIME-Version: 1.0
In-Reply-To: <13D59CF9CEBAF94592A12E8AE55501350AABEAF3@DE02WEMBXB.internal.synopsys.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_113828_827981_CA16314D 
X-CRM114-Status: UNSURE (   8.32  )
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
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lorenzo.bianconi83@gmail.com" <lorenzo.bianconi83@gmail.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============8821528634290686737=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============8821528634290686737==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1Sa0i77dkqaUxqYg"
Content-Disposition: inline


--1Sa0i77dkqaUxqYg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2019 at 11:42:50AM +0000, Vitor Soares wrote:

> Since the regmap-i3c.c was already applied in:
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git=20
> tags/regmap-i3c

> I wonder what is clean way to submit this patch set?

Just mention in the cover letter that it depends on that tag, the point
with the tag is to allow other trees to pull it in if they need it.

--1Sa0i77dkqaUxqYg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0CmB4ACgkQJNaLcl1U
h9DdLAf6A5rVHIcRFaF0D/uW7cFQ1G2BO4pg7pNoyrzr8oOHuBBi48aBuLG2UETF
9QXMIPL3tXBf1d+zYcAadqM1mmZJ1Rhqb9KmRSMVrHj14gmHJ0t/9WOiwA3kCpdJ
ka0ybLtuSwRilY6jyol7h6sMsaIhn32Ua4tWwBBpiPvsIxGYwZE0sdvmG0racV5p
rjEVIJhfPrRIfH4+C9g9W3EwzhfAiyolf+8+r7SgoQCrAiNTCQjc8Kyg8iGLObbj
ORZwz4GDHk0FJq0ntnYhN317EQflHz3NXyqPkNpEzVtYTvNmnLkk1TZpvPvPbAQD
fP8ERKAe0E5wwy+9AKHTlB+iWfqLVQ==
=DRFp
-----END PGP SIGNATURE-----

--1Sa0i77dkqaUxqYg--


--===============8821528634290686737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============8821528634290686737==--

