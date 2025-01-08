Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4A4C02184
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EI2w0ayn3q3/poK6mUnlvS2UvpntmaCNOKDtE64pqg=; b=gNoeAPnNB1aYcQLmhcg6s5UqvR
	3Zu5MbzHgxigpU94WF/gpmXOmjSbBVoJ2Kq6iuGnib7MACLAcFohUnbAW2l72HNkqXJ6vpxFmg1zz
	hZ5YIr/CwWu9TZc03ZXSEoFTHcJO9wLkVmAStQgs7uUOgUnfUomi4YXlnT4U9U202r7zJrjFOu2Ui
	hvDYPJ42E8RvyoXXQFUagf6kXBO7gozZTuYKBha/aywG/8imR89w4h8R25n5SH/LNCSGoh3q/lEHW
	YKJBXHTttD3U/7OGF3at+Ru20TqVt05LMHOqVRP9ngMaExr1nbsDADKZ/brRB7DvV2xnwO3YpgUeu
	HgEl9psQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD34-0000000F5c0-1gNw;
	Fri, 10 Jan 2025 11:19:30 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQPy-00000007Q4I-3Qvy
	for linux-i3c@lists.infradead.org;
	Wed, 08 Jan 2025 07:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6joc
	AxatsJ0SrTGjfAKKJL3B2gDniLv9c+THC51JLak=; b=iS03Qn1GSGDly5gUIrdP
	RSmbq4k8G71yQH+2rqPHoP8Eqd16y3QMCN4dQNA2yxL/uNmO7XQza3/2plhCfoBV
	wYKIf4y5iP5saMn7afwmsw02G19MIO7i0GxOq9qD0eWx1BNKuKArDdoCFJ0bJ7OC
	RaPe6Yy5x6GigMg71DOG8nSTe8vTxa6SHzddeHC+Cm5rApT47xrr2CJFIS2Lmfsv
	CNHP2SwF5dXrpQOH34txIr4XheEAhnkn0k4DtYLEFHHk1yAt4hX5GppDF6bxJV7n
	dZvBBZmWG1KJPeS7ooY1VWsCTExoxAfK6dFd5rbHmSOT6J1Fr6wyf97h/vlCfXRr
	4g==
Received: (qmail 2471148 invoked from network); 8 Jan 2025 08:23:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Jan 2025 08:23:51 +0100
X-UD-Smtp-Session: l3s3148p1@8NtFviwr6rAgAwDPXw20AOMQ2KO98fSH
Date: Wed, 8 Jan 2025 08:23:50 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH v4 0/5] i3c: introduce and use generic parity helper
Message-ID: <Z34oBoS0KL4Uz2Jn@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yury Norov <yury.norov@gmail.com>
References: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
In-Reply-To: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_232355_721548_D26EAF77 
X-CRM114-Status: UNSURE (   5.64  )
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
Content-Type: multipart/mixed; boundary="===============5772774027181009566=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============5772774027181009566==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gQCqiv636RgPLUc8"
Content-Disposition: inline


--gQCqiv636RgPLUc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> A build-tested branch is here:

That was locally built. Now, build bot said it is happy, too.


--gQCqiv636RgPLUc8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd+KAIACgkQFA3kzBSg
KbZUwQ//cNA+Jq4G+tNxrRgij4GTKhU92VoCTEFy1Z3KZUj86bOqqdA8CkzyTSjh
QYdPeTp4HKr7x8suKiD491rfzETb2V5yzVk7g8bqg85PEPb8Cm0KigGZXK0E4Ko/
M6k9plqnxHDWr86GXB3c3n2Ko1KCpGzZ/g+igiPSBlEweUXsCNTJamv5slBT4FOr
lhurV8N9dLRD++daOnaxedhHrubX0P74+Xwnk7jYmT/c8ljpGZT/W2l6YKBR3ixc
fdJAN0HtXSdbaTFDezc68/eQUmWYbJJA3+7r6HbhfjmvnttCYOs1eCzD2kbt70zu
t1fh6G8lmkC9bjI/4c6jYMxy9ZLy6MCgrrI3X0ebGspx3f8LfCVStTu9Vt6xy1sP
g/pVHBi1WgebVgDeBZN9kijXXV1A5Qcw09T109nr6c8bIK2T+1ZX9dGCMm/hwbW1
LfOyLKQ4UIEDBF4Qq7AhjblJJaKYOX0d4GVvhsEpaLP0heFYsVmVXf1GDjsBXhVO
RHpoUx5QolDlRSHO4vNfRbjh17pJcEKCHtq1Q4zdxkw7BxIHPurMU4bJo0kwholJ
UJUU6D+YmWF2DEAWiaeRRBllT3nbKKBXP3kP4C7xcGvAmjqJocMib563V5AZ+igB
MbHFOErQS8KbjGZIS5P4D4rLFPnqNEvwck25ddQbfFBO9wdkgg4=
=IhfP
-----END PGP SIGNATURE-----

--gQCqiv636RgPLUc8--


--===============5772774027181009566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============5772774027181009566==--

