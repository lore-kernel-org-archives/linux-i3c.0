Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D180C83010
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Jun 2025 00:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcopeeJy8L8et1eUhUtdkZ5aGndup/ncaG8xwftmGls=; b=uyYBK0qGiT29J0Q4tlROlmdyQ/
	3DWLmCGNbitJsjV+jmYs8EEvg/SN8JvUQqo4yRxTwWWjHyfR2VsIRVqq/lq9dJOMWMNBPQLGbQ0rW
	Exf4KPIuQ2J+7Ueg1xVMp/PzMm+0PmUdApL9u/xhI5Ce+rPeekiiyfEA8Uu69dFF39immbfOU9T4j
	4h+srTDyI9rG4wXN89X4w8RYr4LcuzcwFAHdyJtjJHGRKjXD6jfEQq9/RA2HN1DLgnA3VDDhrgAMa
	F/zb6mmS3wMAh7golSYaKRnpL3+sDU1SgkvEDgJuYStxqmcBeH+X16IeJajK1otAXzjtnfpSpZ6tH
	upRIkECw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrYs-00000004Ekd-12yD;
	Tue, 24 Jun 2025 00:30:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0vf-0000000FwXP-44tg
	for linux-i3c@bombadil.infradead.org;
	Fri, 13 Jun 2025 09:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nZy38NmYICe8Mu3Mjf0MKMXMdi41KhsE9KdB9TPXbwo=; b=IRicuB05I3x76GHyQo6EulayB1
	Hk9dUsIpk4I7OOSH9VXB0vme273FEyebh5kOYyS2UT8ZZCJ1bzg728wrA1i+hdLdiFX7MoLNhc+T1
	bSv/jpDKKNHqDbXQv/7EdcfuVmWtI3xDacGnAbElDtoih9JETbfWc74dA4AQvUL0KsjsI8xG2ogxc
	nrEBqi8EtzYCwvR0ucNbjRWi4KeJxFBhcMzdEBqiE+dcX5KAGev+hAlvK3N37Pbzy2gIs/8i/dGrB
	fLqPQStLPT5pCFzGayl8oE4506ECq2MA6DaVeBiUq0vdsWfs9DLXbTRCZdSdMfzP8CGCQ0mJRDr3W
	zoU8RBvA==;
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0vc-00000002xS2-2fBi
	for linux-i3c@lists.infradead.org;
	Fri, 13 Jun 2025 09:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=nZy3
	8NmYICe8Mu3Mjf0MKMXMdi41KhsE9KdB9TPXbwo=; b=R/FyAZcluhMz+xilJAeX
	AjuZC66tdPKDOWPqHfc55pWuX1hKenjxDjbiNOlSEtvAeTK+JRrq2CsPizBCDmxF
	Pqx2h976CSHwMUbpNXeLPRCL3IvKrbwU6DUes2Lkv9G9L11zL/TyHvlPJFLJ3GiE
	+efyepQVVJqaWErYYfnK+OI/fQUPNBJ2kddB57jzDyAdWvEkioEUYFUvyc5YH0Yk
	fau42RxrxDfr0uJFKJ0JW0KwOF3M5eR7PHuElpYo83effjkSrnNUlgAMmr1CU0+T
	vWdeMwfO40Bq9Cwww0x8DUl+AaAOChIZfJyMqzXZsAd1y3RAX0edRkGTq1tiRDNN
	FQ==
Received: (qmail 166897 invoked from network); 13 Jun 2025 11:42:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jun 2025 11:42:21 +0200
X-UD-Smtp-Session: l3s3148p1@bEzU3HA3pOEgAwDPXy2/ACpZfVCNKldR
Date: Fri, 13 Jun 2025 11:42:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 4/7] i3c: add driver for Renesas I3C IP
Message-ID: <aEvyfM42WTKENbFO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.li@nxp.com>, linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-5-wsa+renesas@sang-engineering.com>
 <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
 <aErqY0QWMRdC7Pvg@shikoro>
 <aEsDj5Vcb4zFJFlo@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
In-Reply-To: <aEsDj5Vcb4zFJFlo@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_104228_905723_3572F70A 
X-CRM114-Status: GOOD (  17.82  )
X-Mailman-Approved-At: Mon, 23 Jun 2025 15:46:42 -0700
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
Content-Type: multipart/mixed; boundary="===============4619518502977841665=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============4619518502977841665==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K40i87jX3QkMmMc9"
Content-Disposition: inline


--K40i87jX3QkMmMc9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > And there are only 8 of these registers. So, there is a maximum of 8 for
> > this controller. We could hardcode 8. But we could leave the handling as
> > is, just in case a future controller has more or less of these
> > registers.
>=20
> Okay, can you point me spec link.

Overview of the SoC:
https://www.renesas.com/en/products/microcontrollers-microprocessors/rz-mpu=
s/rzg3s-general-purpose-microprocessors-single-core-arm-cortex-a55-11ghz-cp=
u-and-dual-core-cortex-m33-250mhz#documents

Datasheet:
https://www.renesas.com/en/document/mah/rzg3s-group-users-manual-hardware?r=
=3D25458591

> > Sure thing. I think I didn't get feedback on my original suggestion so
> > far. If I now know you are positive about it, I will give it a try.
>=20
> Sorry, linux-i3c mail list always delay your post, did you register linux=
-i3c
> mail list.

I did subscribe. I receive mails and my patches using git-send-email go
through directly. My responses to mails are always held back just saying
"suspicious header". But I don't know what is "suspicious", so I can't
work on it.

> > There is a specified timeout? I couldn't find one in the specs, can you
> > kindly point me to it? So, the solution is to use 100us as timeout?
>=20
> See: 5.1.2.5 Controller Clock Stalling

Ah, I missed this one so far. Thanks!

> The spec have not defined what exactly happen if stall clock more than
> 100us.

I am going to the I3C Plugfest in Warszaw in 10 days. I could ask people
there...

Happy hacking,

   Wolfram


--K40i87jX3QkMmMc9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhL8nwACgkQFA3kzBSg
KbbuVA/+I4VgOS79AXzpTRA0k72Re819xTv12Dq7qqQyCvfvXCSQWsGPY/bHSW7G
w0mdyHeWX668BlMnSJ0tG16z3aOERAYb84wNXH4hobO2IN5pTAi532QkA/4GOniQ
gKgep4L26X5/tE1OcO0fb6wUiezfzKRr0FRvgiv34rdK7lnK3zrNij+DjH+t9Osf
iazabHh+KZGOe0IqqU14ePC3W23edCu6HgluAXscThJSLl+aucuS53XEoO9oPBto
Lpt694NxL5Cu61OKYEzRmcbh0UdHx8CtH98QgKNifMVR60kd8yByfefcpcMfZDQV
aKcS5fRiH0qBbxRGO2nvgHYQR8B0N3EPFDs3tRtpGLq74rr2q8Yyf5JEdlBBitQe
d6JZvrSJGo3P+rL4OFlYeYvCkc0hu3BvPAqEfVzup6qBes3YvClh9j7kEGDU2ySj
NTx9t1hrFqFFSccOtzAVvRtuXXLOfowYgK9+n/xqzOjINWT4S8PM//pDcrEjrr1/
r6UJ3PgVCnTaIImNh1LTx87bYOLC+D+h/yQfW7YWJn0IQ8c5gSaoPRdH5txhJo4M
Z9hD+awjQveg5jIA/B5ghu2CVGxK+u/Lixh07uywkjfefoiKLiPLFbmweSMQLQHk
RsQtvyJ3wz/jbiHo8RFWauThZa0iiU40L3VW1xogTk3SFfjc1XU=
=wf2Y
-----END PGP SIGNATURE-----

--K40i87jX3QkMmMc9--


--===============4619518502977841665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============4619518502977841665==--

