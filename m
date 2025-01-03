Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7519E7719E
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6y22x1//k7HXkBhtyozMTdtcofh464CL/GdvHbDullw=; b=O5bqc845np7Y6Myh9trrGtf8HH
	16TlVh5ZCKIKLKUPZcuEmuq3mWy9UHEWX/vLA0nqwBLdPWN0OvAFhmT1TP1CTiedZX5rtUJ8Ty8hT
	Qv3B1eLT1/XbxowFVhyvYNFonFM1HlBSKj3wCD+KCFTGmgWDJRiytqvX6uv/DpESlgGe1QMI6uvlK
	2k7MaZ0cU5o0+N7nZ60IB6xizdF4itvX8ycK8d5wQJuqFvqyOl5aH36ZrCjh0owZVTajeCiQDrVKY
	B6bZ3cMMlO3EqRshUWgO0m1Ywz+GcH73x6XrnBGQBXjXjWxSJmMeH2PX7J0JB0BUKAkVKqbUjwVxg
	TMwqerZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD32-0000000F5Yg-23ok;
	Fri, 10 Jan 2025 11:19:28 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTpyA-0000000E6nF-0M93
	for linux-i3c@lists.infradead.org;
	Fri, 03 Jan 2025 22:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fQ36
	u4RBvl7vsyvt0Jy3P02z22WoejyNRPTjgjmI4A4=; b=dYzPcXUMa3zAaEA+FS07
	NduiAIrSefPkHSqfxN8ygpiAvmxCsnxRGRNlsJgANdk4dsaBd/800eEYI0yTGypS
	jDypMdbiCOU1cvTSuya6s1kH4iJp5egSnKSzILEMJBop18q4jhBdzO7GrnJHM5uW
	q2qrMbDVn4OqDbStWRlMgFBqgmDPOR222vI4taj5n76xt0wJWRnd8aeBlUqeD6eM
	bazoeMaZtK0ggFyY1VgnqdiEZblrCcLTONzDS1Xj6z47/WbSxXXTrBGVAHLYZDLw
	/FBtx95aW2Bu8xVnZrf8SUFWcERqyP1H0//Evta20NE/rI909DazUfLoX1xI3MVn
	2w==
Received: (qmail 1013832 invoked from network); 3 Jan 2025 23:16:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jan 2025 23:16:36 +0100
X-UD-Smtp-Session: l3s3148p1@sSPGodQqRp8ujntM
Date: Fri, 3 Jan 2025 23:16:35 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH RFT v2 0/5] i3c: introduce and use generic parity helper
Message-ID: <Z3hhw_pwFAicsEDi@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Yury Norov <yury.norov@gmail.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20250103221117bb066057@mail.local>
MIME-Version: 1.0
In-Reply-To: <20250103221117bb066057@mail.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_141638_408179_35C79220 
X-CRM114-Status: UNSURE (   6.76  )
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
Content-Type: multipart/mixed; boundary="===============1555866746196518609=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============1555866746196518609==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vWkKxqYQ0LzC93DX"
Content-Disposition: inline


--vWkKxqYQ0LzC93DX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'll apply the series once you get some agreement on the function name.

Thanks!

As said in that thread, the function name has already been changed in v2
to the liking of the bitmap.h maintainer (Rasmus) [1]. He has not
responded to this series yet, though.

[1] https://lore.kernel.org/r/CAKwiHFiamZ7FgS3wbyLHo6n6R136LrLVCsih0w+spG55BPxy8g@mail.gmail.com


--vWkKxqYQ0LzC93DX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd4Yb8ACgkQFA3kzBSg
KbZYjA//elZOLLgLgNAi1ekQ9sJ5IvZL47Vbkvlg8eOFGCNZ4q6JhUt/jZ0bW1Yr
Oz8+UY8leDLTJPHteFiy84/VDqihax6tge4EoEt87bSHu8UI90BWCGhaVf4ndpsa
pt6KdKGHIPbOjKdbeDfLKy7oP8UWe5jnFgmMGHr9iLcAYR+T6TW4NtI9jrD1kWCl
/hr1iIHZFAY10IxLd1HbX3T1RMBH+fLjoYvvStj7mFZMSUcl9ya8uvgrgpyIa9SL
SGDgCRR1CbQoY0zldNWTP9n5wFX7BMV/R+ITF1P5v3qHIdw0Q3i2L/CtAegNuaIp
0GZE5wyNn4GjAZuRlGbrqxB5ykEkPUketdkHkjWmk4sRRxuHoPSSNH+z1vHHR+CE
skyKlP+Z2DvwSosz8jVRnKU5YqymGyRaFPp3WijQlcMTa7D57gYyNXYpuEWAkPya
x5vakd+6UxlbWFWxxo/0MAzkaSH5Q0tfRGMhx9Cu0CLcSNKt09gVNN60RVMq4udz
Sbug0DEa53ubXFV+5X1VLI2+KljA/TlHsSDSL2HsyiZcaYhOaN9IbK9y4Ov4vMMZ
fW8Y4jFMU9tN8r3vsc/l63236r6jY8aTwWJVurTNP8zPxE+jEtqnoVHJIo+nOYZm
etaHLqqrP82WU/SfmPoOUxe4zV0zb3/238DEcyECUa0Hq1afSp8=
=XizP
-----END PGP SIGNATURE-----

--vWkKxqYQ0LzC93DX--


--===============1555866746196518609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============1555866746196518609==--

