Return-Path: <SRS0=ax63=5N=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FDAC43331
	for <linux-i3c@archiver.kernel.org>; Sat, 28 Mar 2020 03:50:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27B562074A
	for <linux-i3c@archiver.kernel.org>; Sat, 28 Mar 2020 03:50:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TOpHZoIU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27B562074A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=urUz5YVdCej2Q1DYvHy/KOwFcudCUzfvx4zBYd7/0X8=; b=TOpHZoIU+xXvXicxB1rP2JOdt
	cRJ0Hk+sdrCHsAAlNRkdlP3pMYGSpBsidZNIi2NSyVIc/MgPysa6lssMDQPM9vXwpZqf9smxm+YdV
	kPolEQ5JqRoElkPBC4vCwIXQmIGxA9I9w38kdsYd5HpeaHp6QH1JkWmbiZYeKLi4Vx/Hf/AEidTbO
	51AphC8QOKGxDcmttV0wqnZ9PdqOX9HInGIb0V445Y4cADPToQIUNvNh0EdcIKX5+TY2hg7uU09ac
	AegvFOfxX1ptcB1mjw27iR/Ld00eSbnQelUeCi4jXSOM/zke1W4FW7A/GGlccpzydxRwvovKzQNtS
	QfVGViVkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jI2Uh-0004H7-70; Sat, 28 Mar 2020 03:50:47 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jI2Ub-0004GC-VX
 for linux-i3c@lists.infradead.org; Sat, 28 Mar 2020 03:50:45 +0000
Received: from localhost (p5486CEA0.dip0.t-ipconnect.de [84.134.206.160])
 by pokefinder.org (Postfix) with ESMTPSA id 404F02C1F87;
 Sat, 28 Mar 2020 04:50:37 +0100 (CET)
Date: Sat, 28 Mar 2020 04:50:36 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [RFC PATCH v2 0/6] i2c: of: reserve unknown and ancillary
 addresses
Message-ID: <20200328035036.GA1017@kunai>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
In-Reply-To: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_205042_164202_03A0B36C 
X-CRM114-Status: UNSURE (   8.36  )
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
Content-Type: multipart/mixed; boundary="===============2928888974992927477=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============2928888974992927477==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> There is only one thing giving me some headache now. There is a danger
> of a regression maybe. If someone has multiple 'reg' entries in the DT
> but never used i2c_new_ancillary_device but i2c_new_dummy_device, then
> things will break now because i2c_new_dummy_device has not enough
> information to convert a "reserved" device to a "dummy" one. It will
> just see the address as busy. However, all binding documentations I
> found which use 'reg' as an array correctly use
> i2c_new_ancillary_device. On the other hand, my search strategy for
> finding such bindings and DTs do not feel perfect to me. Maybe there are
> also some more corner cases in this area, so this series is still RFC.

So, I used another search strategy: I checked every
i2c_new_dummy_device() caller in the kernel tree and made sure they
don't get the address to use from DT. I can confirm this is not the
case. That gives me enough trust to say the above issue is a non-issue.

Still open for comments, of course...


--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5+yYcACgkQFA3kzBSg
KbZ9Ng//dnoXJcsOM/i5HdaeoT4RtiKz8dQZpX6hMND/LRLTrKeuk7QYfcmHGD5O
mTZkGIQJh2TcLPIb3fJ2457+c2rJvDY9UBdFlaoRNgn/X5Dgvp7wW7Nilq1GVHZV
w/+aPpL8rRM5Bty7W+kSWWUisECdGjVNEOPbD6O1klsb2Cq61rdvmGqCivHHjTFV
5Y/AeqZEIUWyA9Ga5LUg7EX/qOhCG+i5qVsYDj66qb19jITb6VY8/VLdZqLPPzIa
xtGipLEwe+JmfdBSUWY7OX34nMz2xLe3wWMyMtVHLvG+tqk81YJD5E4nNfzZObSK
Myi3F7X1hO3Vid0GBkB56xhwU3ZezIm+cGJA407hcCHO8GimbRxXax+3fR6GsIBQ
ihTUG1ZkUBfuakm0JvW0tE75qS1cR0nlcIyLwFKPXo0nrPaLmQvY+VtlLwxU+lp1
+dtKxOHUEuQpUxCKBu3gRMI7f/OizK78nytTc5HDkWf/tJ2X3qhXWIdiFak7GF9L
dR6DSB3WCXhAqNQiMjeCQfQDYMf04bqzknr+Y+Xqo2ltP2oGtNvr+8Vdn3+ajEob
KYdfDZvTaQBJe/NrS6poQdRX/UqydVJh1dgKwsRNMEnG6+2y3w4SrVzZsyvahAx7
DPlpG5Sxfm5/jpf6NaC1GQ7/rppzXjm/m56e6aXxGQ4yDsVbiuM=
=scYs
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--


--===============2928888974992927477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============2928888974992927477==--

