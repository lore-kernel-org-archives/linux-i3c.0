Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6925CC021AA
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2025 20:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IKmtnzBlYe9e7mXyQ037j8uvm5g/kXZw1CCK42MPn8=; b=jW+d3LDj5cQrubIFgi/WHx5zpE
	TaCeO0hPMA+nmCFrdqrnErk8sbt93bOeW/sSOW4L1O5C8gWgi51Sb0aDcfR97mUxb5s0hOpnA3Tw4
	EoS6VKE+WKiGl08Amc26fdFg0cD/g0dIVBRXsmWWVw47Kra5Banf46EymRImGixCOHzREBdbAZfX/
	/SVIpJo2KM98H6V2kzL8PWE4LcyRje1tw54ST5HsemVqt0g39cM2eczux94rpk+MljUw89DMa2Duh
	zAWnRJCyLsmaP/LOWqYTSgFJ7nPij7yXDP+9NQH6JxE1COn5BB6016bT0r9EN3VSHliUIespWjrHf
	E3gW42pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkqbV-0000000EreT-0mbx;
	Wed, 19 Feb 2025 20:23:33 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxsh-00000004159-2Ovd
	for linux-i3c@lists.infradead.org;
	Mon, 17 Feb 2025 09:57:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3Wl6
	jNtwrSVCHakEqmjvcU8HEauXByB/TvM8qyD6KDQ=; b=QePWrydqSsp0C4NhNnOO
	Hi3/WYWY/EKpmM8Ga8FlHmycRxxvNPXVfTAhptI7UOWJIV4dWRAJykVX/5o46FNT
	hzAjrB3+/d+bfpIvgdd1T9vuN57tTPzv0OvsbgWSySbpQ9RjZniK/h2TOMfCVdsI
	jXJSuAjl5tD4Jo9SVhKnt+sLy2aPbbAelOreQY/tNj5b8UWvDiHm7kVKIvZ5/+xF
	sG8VI4BQnlGzKpQiAYQxUkRoX63U3TWz/CRVFPOYjlZIe7/95pjqMlW+tMuhtBrZ
	tdx0rljl5tSezx/e7dczppIBZkmN0DTQZAkWgrphGobR7uoYWsOIjJ4emdpOPz5R
	sA==
Received: (qmail 3242575 invoked from network); 17 Feb 2025 10:57:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Feb 2025 10:57:37 +0100
X-UD-Smtp-Session: l3s3148p1@oi3bjVMuwtkujnvP
Date: Mon, 17 Feb 2025 10:57:37 +0100
From: "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	"pgaj@cadence.com" <pgaj@cadence.com>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"conor.culhane@silvaco.com" <conor.culhane@silvaco.com>,
	"aniketmaurya@google.com" <aniketmaurya@google.com>,
	"Shyam-sundar.S-k@amd.com" <Shyam-sundar.S-k@amd.com>,
	"jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
	"xiaopei01@kylinos.cn" <xiaopei01@kylinos.cn>,
	"Guruvendra.Punugupati@amd.com" <Guruvendra.Punugupati@amd.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v2 1/2] i3c: Remove the const qualifier from i2c_msg
 pointer in i2c_xfers API
Message-ID: <Z7MIEWbrK9bGUr4d@ninjato>
Mail-Followup-To: "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	"pgaj@cadence.com" <pgaj@cadence.com>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"conor.culhane@silvaco.com" <conor.culhane@silvaco.com>,
	"aniketmaurya@google.com" <aniketmaurya@google.com>,
	"Shyam-sundar.S-k@amd.com" <Shyam-sundar.S-k@amd.com>,
	"jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
	"xiaopei01@kylinos.cn" <xiaopei01@kylinos.cn>,
	"Guruvendra.Punugupati@amd.com" <Guruvendra.Punugupati@amd.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	BMC-SW <BMC-SW@aspeedtech.com>
References: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
 <f9f730b6-4620-49dd-9700-ee18f777045f@t-8ch.de>
 <OSQPR06MB725203E31EBAC2B71A7901E48BF42@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <f05fb969-0632-48a6-afcd-c526c8568d4b@t-8ch.de>
 <2025020416561726c9efa0@mail.local>
MIME-Version: 1.0
In-Reply-To: <2025020416561726c9efa0@mail.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_015739_883685_6F4E5D50 
X-CRM114-Status: UNSURE (   6.16  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 19 Feb 2025 12:22:31 -0800
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
Content-Type: multipart/mixed; boundary="===============0398272432250223253=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============0398272432250223253==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7En295CQNKdStu7i"
Content-Disposition: inline


--7En295CQNKdStu7i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I guess Wolfram will be the one have the preference, I'm fine using the
> existing API as-is.

Happy to take (tested) patches.


--7En295CQNKdStu7i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmezCBEACgkQFA3kzBSg
KbZVyA/+OGxQAvWCnRz6vlu52N3SURN0xynMNAZ+EdTwe0QrjDs4OVk+QQP90P/7
CkBut5jW38JF0AVuIXeE4Rwv8Vy2pQ1UNgG0hcmZxP/11urMQiQwGfiFBqYCPGuO
6uqe4nC+HmOb2k2aSLjX75VZ9skr4/illWkVmX52/exrtRWmrgdYnRjotR364ZsC
xlMQrWfYgDg14yMexjPRZJgputUpK4poeezw/NW+FhAzmqcFsi0U+bmcGaHbLvCE
QShc4LWX+0BCP9pC3e+GvEBHSp+ek7DH7zqkDVZuDmr+WYEh2eETUEfIY5GZv/Di
pUdXj0iODrM2Osq6zms29afTy+UQod926LBVHNp3C5wQEHb26ujgP4+Pr9/AegcC
BOVxAlivZAsOwd0iugQkJveq7bj8eelbwCTxp2Olbf4rm6ab8ZTrUkLzkKU4KBvv
4s1dPK89IGPCxaLmnfe5JCse3HnTyEy/mMO1OOlOKNnJelGsf5tbeF/SYHEyuPsc
Tk+2DmOYqfOLi3CaphyQx6tfjnJJYTitk2m8tlfX7FRpvKtbQC9iaOQeencbQ/fc
SZzgfi3dXOHJ9n2zLSIclXozO6niezvfnSlzUj3twr6XsiMNQ0wCLOE3rqCp+i1/
M2inE7EYxEJSISfO1Xz7IryARHqn85rvZjCmvh1TOMBDQHPSK9g=
=c+SX
-----END PGP SIGNATURE-----

--7En295CQNKdStu7i--


--===============0398272432250223253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============0398272432250223253==--

