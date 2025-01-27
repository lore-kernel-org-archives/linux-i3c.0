Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4ABC0219B
	for <linux-i3c@archiver.kernel.org>; Wed, 29 Jan 2025 20:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WxaYag6lcHx5jqVUatZyjCwodYPJ9BnDQb+KTSKpXec=; b=rMvrrchDIYNoyD3A6vlrN0agYk
	ILysxxsty/P7TXuz1mBG+jLr57ffqTAKB+ClomcySSgms7Zij002HIx9iaEuNN++B/2s+0rfiLBPS
	ONkJ+iEQTWcQeoZRQa0sKQNXUkWsGSU0/lQUJCIc5jYZ1pXJnrduXALgRCLpl6LnNXoXjeYRfjzoF
	Q5nd5ucy+P8W2jvhxo5+ZvWAtsVRiEbsTi7LVGi6kuajBkJMj7MQm8GMoZMB4uO7AKHJ1Y6pdDcZP
	RSUUNrpIbvU1nZBPqlIw5F9XQ7kskWQmjLgDaZ4NR+iCPScG9V19h+rqNy45Opri5Dga7VA20gied
	nFofWexg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdElu-00000007lQ4-28O8;
	Wed, 29 Jan 2025 20:34:50 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcMzz-00000002Bsa-1bLh
	for linux-i3c@lists.infradead.org;
	Mon, 27 Jan 2025 11:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=oV3A
	Wrb26ltPPfsSvhWryonnU4zGUtHKF+UY/G6MyII=; b=ZpY9oPOINk6J9AX7nFTC
	vCsMSG4K8bCkZVM93gLQYzuhw/TPEeyLGG07yINMlcjyh7w/5M3Hh2Jq2znrN7zJ
	UPcR7AdKYKHWyCFkf4pPWvJWKRBw6JFDP0GhstCuLk0v0yTUX978lqHRMWGTFfJz
	+UXyzxrowDoHpw0uxtQuYa46qBreAMUxRogvRQgRLrqTtxuUwjkwdezKtoGHv/aw
	E4560+5VP6mrld0svUl+Mgm39+5YFD1smlCd7cnw3LO92kOScjWa5hy7SjYBB5Di
	OqPnh9D6xuEQVuhL4KXeb4gjYUO/JQPtXGTrNkNVKYyQD8BU4q2zMPU2Il4LvThv
	9Q==
Received: (qmail 211291 invoked from network); 27 Jan 2025 12:09:39 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jan 2025 12:09:39 +0100
X-UD-Smtp-Session: l3s3148p1@H83NHK4s4qQujnvm
Date: Mon, 27 Jan 2025 12:09:37 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, linus@ucla.edu
Subject: Re: [PATCH] bitops: use safer link explaining the algorithm
Message-ID: <Z5dpcZdHrn6XVlCI@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, linus@ucla.edu
References: <20250125130320.38232-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_030948_286256_7DFC52D1 
X-CRM114-Status: GOOD (  12.99  )
X-Mailman-Approved-At: Wed, 29 Jan 2025 12:34:46 -0800
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
Content-Type: multipart/mixed; boundary="===============2652742719109078605=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============2652742719109078605==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jesu6J593TrEfwul"
Content-Disposition: inline


--jesu6J593TrEfwul
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Is the plan to replace all weblinks by webarchive links as a precaution?

Dunno if there is a plan but 'git grep' showed at least a trend.

> Even websites backed by big companies may disappear[1]...

I think you are comparing apples with oranges here. The main site
(intel.com) still exists last time I checked.

> Putting the webarchive link here also impacts the funloop.org server
> statistics, downplaying its relevance, and possibly even causing an
> earlier shutdown.

Could be. But could also be the opposite: not using an alternative will
eat all the traffic and increase maintenance duty, so it will be shut
down because of too much work. Who has the better crystal ball?

> The URL can always be updated when the original site disappears.

Still, the good thing is that the site is *now* backed by the Wayback
Machine. I needed to request the backup because I wanted the link.

That all being said, I don't care much which link we use. I just wanted
to address review comments.


--jesu6J593TrEfwul
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeXaW4ACgkQFA3kzBSg
KbZabQ/+LH74I0ra1YSymaFuieBvsP+proArGKqwdO8TWGMoUz16xe1PcvsEkURp
DNpA9SUeIsZtITrzNj45kv7GCugcZDsFCenxf5TauHXZE6PQ+NLs7se5Mx6r0PNn
O5yx4RKElXvwqusYBUIZlshZlANkanW2w5EYBBMsRike9Srszeqa8Zyi4Jcb+fs3
tQmbTilmF7EcRXWDshnUB2m4081pDziFTfz6cOJ+JsP2NAuALky6D6awliUqUaab
+oLGsjPo2AzTok7NIaI+9Co4rGn8ahW+2M45uxE+hjubpaEn7GBzNWbPmfeKwlWC
ovxcme3+trSye8QkgYq5mgAvVWF/uj0qJ8e2ZGZg0RKKYZU0oa6o6N2jx5xBJd+1
IBagSOaX3iilEZ4qw1PcxNqX/oeD9NN70zG/66lWhl91EY8cHhm/5O7a42s1k+qL
CDQLSBLnljZ9J924pLUReHRMFTxR5Czj6BtpBzk+Aq/1VEY965N9d1AhpuzERVI6
jnnPSID0qoXlXb/0fZjmlO8DceUFg6ZSD5nKb3XRRl0Uv90GHB57a4NqkXwdqimO
0WJ/burnbyzMOf6hZMXq+xPMEwohFQj8X1pZ+a1Pip8y8kQHICwt2AVqegGq7H/I
Sg/WpobDFWV6E0HaRtO3O1UamT6DhTVzwcnswLXO2iEj1h9fjBw=
=2tBH
-----END PGP SIGNATURE-----

--jesu6J593TrEfwul--


--===============2652742719109078605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============2652742719109078605==--

