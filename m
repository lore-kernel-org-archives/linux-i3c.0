Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C2AC02194
	for <linux-i3c@archiver.kernel.org>; Wed, 29 Jan 2025 20:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/vdnCnpycYMHE48xgE32hjJ4sbALgd0+pzV+X7ZPoQ=; b=q2Y/dPVOzFE4/wQeIDu4Sz0PmO
	SQ4ebulCJTC++N+hivn59CkO9X6jM+2xiM8BbyVuC3h/eIyHQhMLUxvto4rvA6qUYbL8PyfO1pBwd
	7Bv3pEjHEu909IGRWX7+0xX0xiVX7jEyEKbqD0CTsgbVg1QM++8vuXNBTpBMLYT7hVLdnz+S4cgiI
	V0o0etWgXjmvBmr7ngMLqcnUgJRUhe4kAvDDhn06RSVBLi+j39a+onlkfTFN492vJYypqjPBX07hE
	EODlme6F7YdKgxQvnl7Vl4WM7rMlU2j8lNyKbzVjOsoRrrsQ9CzWVdJ5+NwJS3pmZrECiOzUEQYwE
	+Cj03bmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdEls-00000007lNF-0RiW;
	Wed, 29 Jan 2025 20:34:48 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taV3g-00000009as0-1HIp
	for linux-i3c@lists.infradead.org;
	Wed, 22 Jan 2025 07:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=pgxS
	Hx2ys9jK8Ypslvhf7Lhumz5BLoPe+309r5ajS6o=; b=WG879ojN90FOF0c5S2E8
	Cao8Tgp1oLe+2jzNJ9e9xd4vQ2cPr515e7EEzYyogYUHpMvqkmZpGSvkJdxD8sOT
	gUNKaWiIjCoRrYRs2PaTAT37Tds99My1dOKhd8vGVe5I4WISkfD8BUWlmZjy2BnZ
	YTdfmYKZ/1wDOElDYHcGluxVeX2q6Fz+ogffKnKJ27A6Zfxm0MZS1MwT0ke9VsLm
	DNKvKs+VAuv46oZCYM5mFQJl1/ozHZRuO7qjPAfdv2lemMTkHoAWe+15bT55+uPJ
	D1hMpggp6E+SfAQzVtMQokXdZADEJUYqDvn7vvuBCDSt68WX6cBUPT34Sw6Dp4DF
	1g==
Received: (qmail 2764966 invoked from network); 22 Jan 2025 08:21:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jan 2025 08:21:48 +0100
X-UD-Smtp-Session: l3s3148p1@lFi1WEYsuqcujnvm
Date: Wed, 22 Jan 2025 08:21:47 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>, alexandre.belloni@bootlin.com,
	pgaj@cadence.com, miquel.raynal@bootlin.com,
	conor.culhane@silvaco.com, aniketmaurya@google.com,
	Shyam-sundar.S-k@amd.com, jarkko.nikula@linux.intel.com,
	xiaopei01@kylinos.cn, Guruvendra.Punugupati@amd.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] i3c: Remove the const qualifier from i2c_msg
 pointer in i2c_xfers API
Message-ID: <Z5Cci6ixvu5ePdlR@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	alexandre.belloni@bootlin.com, pgaj@cadence.com,
	miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
	aniketmaurya@google.com, Shyam-sundar.S-k@amd.com,
	jarkko.nikula@linux.intel.com, xiaopei01@kylinos.cn,
	Guruvendra.Punugupati@amd.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
References: <20250121110756.214714-1-billy_tsai@aspeedtech.com>
 <b91a21ed-c57f-4b71-8232-a3cd7124a549@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <b91a21ed-c57f-4b71-8232-a3cd7124a549@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_232153_207999_EE8DDDBC 
X-CRM114-Status: UNSURE (   8.43  )
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
Content-Type: multipart/mixed; boundary="===============1701637033419635840=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============1701637033419635840==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WL/IGby9HHcM53NP"
Content-Disposition: inline


--WL/IGby9HHcM53NP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> what we need is only i2c_xfers->buf to be DMA-safe, not the *i2c_xfers.
> Right ?

Yes.

> Also I guess same change is required for all the vendor drivers. But Not
> sure if it's feasible with this patch ?

I also wondered if the I3C core should maybe provide this, but then I
saw that currently only the mipi-hci driver uses DMA and concluded that
per-driver is better. At least for now.


--WL/IGby9HHcM53NP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeQnIgACgkQFA3kzBSg
Kbaifg/7BJfV/+Bivwke0oMwsbIMcBPQcxD0wCNN/0ALq8jU41KIg68JXKdMePN3
79BALPSCiJKkWKxCkeWH1ODtc2JWkw+wKRBNx4fkyAjaC8P3klM9nRywqLbJ1w6i
qL3dt4RWxozyb3VV8wpNCEvcSTquZp6B8lON2waEt4J+Z9YfP/QCrZvzHiJtL0Yt
j8LJJcN0+e42Ia+NjYXbXl0D3CNkzl1Jd77iYZS6hKUfdnnBngR72KYU98lq0ufT
gtAK3OwOZ3NU6lVLmy6H4kWGtZLacPSdw8T2B9LfQytbL4a27P465AzsJMxFEYB5
ItqikJN1OFd1WmtJN/DM2tT3vLUil9LItu5stucp6R5tmqxKk+i/buWmYQtlcRSw
i2hwBMxbdSqTym921FzJ8kn9tX8jfZaJxdI6IN54w6+qdm8ejvTDyD/eKfoLqhXZ
G4HT2xJtjR3Ebd5X06cTW8ZBSbvlU/w8UBqiby2rRpc83DT+NnfHmPRc6zhvWpQe
lRpr1lX7MX8Wy3H8sq0dWj7BvE0uhU8OUtQXpHWvmhrW6NHqcKZ+h+e64iz35Y93
WKHnqYX1yEP6ZW+5zhIrILV58Iwvx68iPnl+MaImJZ34it0MW3YCKGGFw699GmVE
d5D0M/+l3MdUUU6egJii34qbWdcThw7H+ubozxSo+g6c0RCxYrQ=
=7O/J
-----END PGP SIGNATURE-----

--WL/IGby9HHcM53NP--


--===============1701637033419635840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============1701637033419635840==--

