Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778CBC02181
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLcVSb+KfGqvMBovfYMLEE3d9TfFmDeOO35422qKB1E=; b=vV0YxnwQB7wKsO/nJpUXO5mLrx
	OJGuoCzu38X8CDeN7jGAMhK4cT9hQkGGUyqs9EmYGZ5PitEF5urr+vW/kkQM08EhweXlNyYMtiMzW
	BsRX1JC32D4PjikCeevXn32F9J7uDDmQgt/BLTuKZuNedXJQoFDGQdS1o6LxwfNUm/DNnxiD89qzA
	5k8ul64cjf0p7h2TrruJRjLbfRQN96yUhFFducdJCzmXVQh+l+Zk0jfrLSVHG6AvPv7o8ZMRhafJR
	1RyC5LK1zwrPJ0J98OXZIrMWa8dgrruT/ErkpPHcRmKA8YK440Vq7TPxH6xFf72sNK2MtLvAvGLQc
	aKk0Ob/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD2y-0000000F5SV-0n2H;
	Fri, 10 Jan 2025 11:19:24 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTH5W-00000009zjj-3iyu
	for linux-i3c@lists.infradead.org;
	Thu, 02 Jan 2025 09:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=idVy
	9nflDildKn3Cz7/1Fj/okAWdKkzQab36qGM2gPw=; b=L4tV58ICByLgm2+jK6Mr
	Hvsrfsd1RBqOSlIu74pHM2p33mDNXzuR/6o663EEPCE9zwgHD7zYYhc4uiJSl18S
	0ICP0IqMNRJHzImLvByzwivfUciRO0lP8SGXvIEIOxXTum1OEJKoxOUhOAgGFP7d
	Uifr2IwltB/QWDjoEIPVxjfL2gXkTelxoU4+FPWeCvF0PZ8865zOpq8CBYpDI7nz
	nc18zQ9MDQb/QC/GMV3E2JRktBNIiKXdMEhbNj7wQ0Vj2udMEc+V1SIJkONn4gKN
	NowUsOv4NTVRgplNsd20AjNjedq7Jc6fsVnVI2RzDFaO2u06+cfH5ql1Wf5X8RHA
	Sw==
Received: (qmail 566898 invoked from network); 2 Jan 2025 10:01:52 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jan 2025 10:01:52 +0100
X-UD-Smtp-Session: l3s3148p1@V87LabUqluwujnsY
Date: Thu, 2 Jan 2025 10:01:48 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RFT v2 4/5] i3c: mipi-i3c-hci: use get_parity8 helper
 instead of open coding it
Message-ID: <Z3ZV_D5AIUxFR1Bw@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	David Laight <david.laight.linux@gmail.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20241229101234.2896-5-wsa+renesas@sang-engineering.com>
 <20250101121431.05d831c7@dsl-u17-10>
MIME-Version: 1.0
In-Reply-To: <20250101121431.05d831c7@dsl-u17-10>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_010155_211346_1B4237D2 
X-CRM114-Status: GOOD (  10.49  )
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
Content-Type: multipart/mixed; boundary="===============8405215833899919875=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============8405215833899919875==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dXJvEpTHZBt+iica"
Content-Disposition: inline


--dXJvEpTHZBt+iica
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > @@ -123,7 +114,7 @@ static void hci_dat_v1_set_dynamic_addr(struct i3c_=
hci *hci,
> >  	dat_w0 =3D dat_w0_read(dat_idx);
> >  	dat_w0 &=3D ~(DAT_0_DYNAMIC_ADDRESS | DAT_0_DYNADDR_PARITY);
> >  	dat_w0 |=3D FIELD_PREP(DAT_0_DYNAMIC_ADDRESS, address) |
> > -		  (dynaddr_parity(address) ? DAT_0_DYNADDR_PARITY : 0);
> > +		  (parity8(address) ? 0 : DAT_0_DYNADDR_PARITY);
>=20
> NAK - that isn't the same code at all.

But the same algorithm? Please elaborate where you think the new code
will fail compared to the old one. And frankly, are you aware of
different parity calculations? Have you read the link which was in the
kdocs of my new function?


--dXJvEpTHZBt+iica
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd2VfwACgkQFA3kzBSg
KbZ5zhAAob7Y0sqPuY/wfQbTgch2x+PU58hHwjvNs0QZ/hmPo/h4l2g8Klied6or
g0QlBPpSRZ1hZSotK2rwlbNtC9aRyGOi8kn39EjiN+8utI0G4JOkXxOuwn+x+mom
rmy7Nh2d03nNcYCk/EIB3WCEMMSlvJyoGYEJ/EK6N7voYTOjPrIzTpKg2nc2EmXl
jtN4SkjBtE8OnzNAfz8OpcdJlYlKvL2AL+4okn52I+LbwV95AXxd2JsQmIwWR9HW
qkQjKiR/vEaMEvWw5iwFZ8PYdFpaZ2R5QZwJRC7r+Bs7cq4mSQ3Q7ga1YLDtCbwM
64bzm+qj5X8hVTvCL5yVRGF1YYIHNnSymagIyb7/1JHdeteQqSjCu0/8xRSEcrZa
VhuyrtZzE2n15WcbQv7377vXilSnFF0K3OoZ3XLXyABN4XeqWTmrCeCQug1f6UQ+
pQnq89Xy+I1cMSgDVFUa10khxzClWSjepZdOIeDLpQXjFlxDFUcDp6/KaARzhvpC
oa5xPCYOOX1uTmBnJZlHYI0rQieteJ4FZCtar5Z7D0D7GuWiFHQ3DJQUlHP+2eTw
ZM3p/XvgSRqXFVRCdD6ZlPJggn9cBmiWFNxc2VHgi5JJ4sgQXhsZYVfdeilfGYSo
evpYXwUCFlHGheZQLrYebDddJTQIm6UdcExJZCFqpESmx5wOGcs=
=6+IL
-----END PGP SIGNATURE-----

--dXJvEpTHZBt+iica--


--===============8405215833899919875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============8405215833899919875==--

