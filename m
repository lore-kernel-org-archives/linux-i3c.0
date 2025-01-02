Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB59C02184
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKHhz6/xG1NzY8wlhVtU+F+lk1lIGkF+//VyKxT/JzQ=; b=zQ7ErneO275m3C4MuLmvrQM/f9
	Y8RnUIZRxCkCvmBYNhLqWingsQgxsl8/wyX945WJF713BydO/iUKvrjH7tBCq1dwUsFlvSmtFT+Y3
	+AUTFOTT49TBU4943d7vuLwUiIib8Q2Ya6+EBDRACvFu7QsSqWWfrvscy6/aQDNMEP19FVfkyshkk
	9KDPzCnQlXtTC8FbFdaDKOrgCiXBK5JLixBJ70kEGPwwZ43jHLElNNCLXFL7lHOZnYaxm3O1XsoP2
	dylBJQ2sHKo4KBc3CWINGD6vqdw15TrDJccq5x2RdgNnoH6svsvMobTDOz+iPZA3ucCPlTWEP97qN
	De2Km/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD2y-0000000F5TG-3fIE;
	Fri, 10 Jan 2025 11:19:24 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHai-0000000A3Mt-0mn2
	for linux-i3c@lists.infradead.org;
	Thu, 02 Jan 2025 09:34:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/ah5
	xhm6mtrySf6gsY3Egz2SD7FibMEgTbn2LDw8Un0=; b=laUvLUErUFBxGEnolQny
	+yeaxgT3or1obE2jkH1yzN0xsDjExJFnXqD2Ci4u9GdxJweIgWR5PGETGDtqchH8
	J8hYyCw7PVNs/ZF47IwMhY7m+LOKMLCiqbu0pCCEkB5EAuuqgHjJFgGygPwTCpl5
	ktol4wibhQSmrF0SUO9LaXXHEa3DNqZD0WGVPHLeb5S2o/jmNByeRCACfvRLgLRh
	fTX107iUZsLyAMzVP27ZuRyIvKPJ8jrA0828Uq98IQAb8iHRjSl3Z2d7BgCbY4Pu
	i0Oe2WZedX3SOJVnKzLwALW0X8pputgwCQ3H/mGv/al0WIAtPNnFCM1vhfJEGFm/
	tg==
Received: (qmail 576982 invoked from network); 2 Jan 2025 10:34:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jan 2025 10:34:06 +0100
X-UD-Smtp-Session: l3s3148p1@VscJ3bUqrKwujnsY
Date: Thu, 2 Jan 2025 10:34:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RFT v2 5/5] i3c: cdns: use get_parity8 helper instead of
 open coding it
Message-ID: <Z3ZdjRQa0nF1IYaU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20241229101234.2896-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdWSQvyLwHyci+WVtTj4rGeR-hkjw1ap52=5X29ZzVchSA@mail.gmail.com>
 <Z3ZWt0Whyppr6GKX@shikoro>
 <CAMuHMdWTUwtVFV0o-Hsxp+eTscHHuzOmnBjv7BPoK8moQ7i9Qg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWTUwtVFV0o-Hsxp+eTscHHuzOmnBjv7BPoK8moQ7i9Qg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_013408_509850_B07DD825 
X-CRM114-Status: UNSURE (   7.92  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 10 Jan 2025 03:19:21 -0800
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
Content-Type: multipart/mixed; boundary="===============4294262219561423336=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============4294262219561423336==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dG7YwNWMrpV0uZwn"
Content-Disposition: inline


--dG7YwNWMrpV0uZwn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Let's add more bike-shedding in 2025 ;-)

Yaaay... :/

> There's also a general dislike for the ternary operator (BTW, I do
> agree it has its uses), especially if one of the paths is a no-op,
> like ORing with zero.

Well, let's see what Alexandre's view is on this. I'll switch to that.


--dG7YwNWMrpV0uZwn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd2XYoACgkQFA3kzBSg
KbZuyhAAiV3y/bQnMst/gXIaeHGX4FaSgRuGw0HCqDl/yvD4AcPuD3AmmfOJ3/+J
bMcnOSoGve2OgFK8vQR//GuXh3qb6EXO2yteIC7veSYnmqWTJAer2T+660zXd0gh
yedlGhkN5YLIPcPxSS8057lczfBm2rDs1MlbRa0vBwxI9i7rSXH7fDCn+FGA5wve
SrrSHDol8TmZPw+9xn6Faukgai28dhbwIZ4vRHpgE15VO4y8wUBpNpIF7yqdNWFS
2iWkXMwGLMThGAsRWrUY3u1HEaf3PDf0RYp0Vj8skWiS7jNFVaB91XDi51nGD9YJ
NCq1zoIBfyJNJ2JrsDJTcPcez9uSu1++J+NnPh+SbzuZB5rhU8ehXqW/3pIDipQ+
6sjPcSfaamJbcgl+ED0cnuGohGqSdPoL+vD5FJYnJfNkKcsYP8+1+a6I8QVZ8Bq4
c+zTDKyog1EsQNJe5cVNaqWTow2EL7kqceZUp1GtSbQJ3uL/RL+D5mXTdUDLvc16
XduvtGKrioCBPO4OzcuqN/cxEo15dA7UTZEsWSvdd7PlpZo/Uf69VgrW/n1+sjHT
0tCC5a+gJd+r7THCE+DDkGy1RBQEt7bv8fq+ANvUMCdy1mhYIEZbDsUl7r8s0y0r
k4ExQbIFIhY2WAAhUwMudQNWsUAq3dDLvXIIoChkv3TqyGvcei0=
=U6wC
-----END PGP SIGNATURE-----

--dG7YwNWMrpV0uZwn--


--===============4294262219561423336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============4294262219561423336==--

