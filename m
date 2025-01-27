Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39881C0219E
	for <linux-i3c@archiver.kernel.org>; Wed, 29 Jan 2025 20:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXkYb7G9KoECJmDrvi+K1TCYxBJGRw9D4AsQ1aOcP3g=; b=SKcvrWnH5MC1Iv7bqKcabAIl+6
	lbtGkiMBNFfhdT/TgutQ/rdPGkVkEbQBaZi5D0pmjEpZRSnjW9t9LExIhgvWebBnefh8Xbr7cmnyQ
	mNhuVNuxarmLgAgVGPCv/rJ0Iq6jwBjSuJneJuy6leDm7GTKKsc1iuJaiaUkSmr9dvzGXIREIKHxk
	lOdHnbM1KJG5550WecTnky4/Yg9U6irubyreKg0DFjUNtU0WbB89jhRMGm7noh/LXFrtpE/SMMEN4
	RNDxoJRapPR6D3DFFDdjwB+pG81KRe86HvyPFG6V5cV9MotzaW7DRB3HEpiIGQX8F88DhXgx3WiW2
	9vfrJdVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdElv-00000007lRz-47hN;
	Wed, 29 Jan 2025 20:34:51 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcNKU-00000002DbR-1Fig
	for linux-i3c@lists.infradead.org;
	Mon, 27 Jan 2025 11:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=EjPd
	SZN2hmK9qO+VNqttvEI6BshE8XfK0xeJRa0IUvs=; b=Do5XSKW/kK6McdcYyOof
	IOLvi0IrSTQIJ3lDFZHdsroel8LMU0i1o4HALYs7Dp2UOdgCzsZQ1GBoy3HqBahJ
	2MfenQPwnQGzCM61sZbY6L5e4S311qZgpjB77pCZpyu6vIwo45bjCBgmNemMzyZg
	kzmB71ATyO+jobP9loBLaL1opCtuyHeRJRmu7RNHLFL0Iih7Xcm3zS08s8valWyK
	3kNfZcm0ewR8opuQ+864SE2Uk14F/nb9vJBUZDQK0VH5+mz9mI33N/f8VZq8DHPc
	ykn4EKRGq4Kc3CirF9BOPhZxx6m7uvpdKF/gNEu8srfpOKJr95hIRsqHCXDHBsFo
	CQ==
Received: (qmail 218467 invoked from network); 27 Jan 2025 12:30:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jan 2025 12:30:56 +0100
X-UD-Smtp-Session: l3s3148p1@oY3paK4sos8ujnvm
Date: Mon, 27 Jan 2025 12:30:54 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Yury Norov <yury.norov@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, linus@ucla.edu
Subject: Re: [PATCH] bitops: use safer link explaining the algorithm
Message-ID: <Z5dubh2mVR9vD0Ws@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yury Norov <yury.norov@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, linus@ucla.edu
References: <20250125130320.38232-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com>
 <Z5Z06WowFspmXby9@thinkpad>
 <CAKwiHFjM+H4ZQ5MjY9FVaHni3XiWnMkoVM8na=KPfHN2Q0eWTg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKwiHFjM+H4ZQ5MjY9FVaHni3XiWnMkoVM8na=KPfHN2Q0eWTg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_033058_612817_347E68C2 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============5158381348922657682=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============5158381348922657682==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b/hMV8ZJr9tNtuk5"
Content-Disposition: inline


--b/hMV8ZJr9tNtuk5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> So when I saw this, I even wondered why it needed a comment or
> reference at all. I thought table-in-a-constant was a standard trick
> everybody knows.

I wouldn't go that far.

> Isn't "The constant 0x6996 has bits set in exactly the positions
> corresponding to four-bit numbers with odd parity." enough?

As I wrote in the mail before, I want to aid users who wonder if they
can replace an existing implementation with this generic helper although
it looks different.


--b/hMV8ZJr9tNtuk5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeXbm4ACgkQFA3kzBSg
Kba2Kg/7BZ6VUzBV6uveLQVHwVpxPZ4YQWeS32XeC2dwnCOY0QLIOt1yardHOoAy
xVk0TL3v4inL4cnvgr7Dvg5C84IYQwJ83tK2/+cXe9TXS/EY0aP7D85plSBfm+YS
uJUx9wXHYLsKY5QW6A+KOOXaN+s99qV/Hn4b06le0V+7yLnlQDzvuKqkTJFIKp+N
FxlUkcbzKrgqGW7QORh94t3vYpMiuaM8AT4DFbfTMnZuDGoFn9zqM2tWg7Fzz2GJ
G/ivYFbdo9OJ3EPee4mCPv7jKue4ma8dwpsiJbtYlzb5ONb27IbLxZqr8eP6hvBc
y0ttlzBrzU15Bn1vwW+YvbwRfF0+U3DDXu29wu7VSJ17OCpVeWs/WFBi9KNm+uhn
5/DXGl1HdTnTNhEAHJCrrSDIBRzJhPejLAwE6Gns1nIT7ixduoGgjUCEbASlUK6q
gexZbBUbElETP4kgSG+tuwVJn0LYtlGFqZUZGF7L+g1pWf23k3PTy+2syNPdj6H1
CJpS2e7SfehLoLQdLae6hC2uQ4PYHFoHpb0up8qZGzA9ry/W9u0sjCXbNQ1sWnzV
H+gTd14Bf+IxNEMU40y33tVRkZPZammXLHFWaxwCg3ySedMVU/oT80EpL1+9d/rp
+VAgRt2BJrah4ko05CSgjqlxlsXMH3ep2VclbZZKL7V1/g5hoyg=
=WuZb
-----END PGP SIGNATURE-----

--b/hMV8ZJr9tNtuk5--


--===============5158381348922657682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============5158381348922657682==--

