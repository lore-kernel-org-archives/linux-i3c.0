Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C94EC02185
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnJW7PETAdMA6oc1QR3F19sO6zPBCmevZutMmebaScM=; b=sCMpKkPnQHahoQa0XL7HGU6G1/
	ig6omyUGZVuYl95nZo4lJdS5ftZDgDD4OCN1gsbmj4kj7A6BwgLW5z/C77EqLdjlJ43MmP1c5ZYxr
	MHjq5DQWahf1p+ukX6UMsVbo4BI3jnlpuIXDRIhwPARBjbHDKJOVEd7ru8OVZqPzudRBp1b7PGqhV
	/RNeaHIy+gPM9iG3hXPzrzdPiCVEt8j7OIJ8FDKGN+9OXxvVchQzb5ZikyXHvf94HK/RkUKsBqOdM
	gDCLzxIK246rqDzFebTTQYA2AJqVvGHb2KfE+K7cLAIfjU0ycsfzA8TLRAmuPDaBJHkqYrV1LvAWB
	soP1ze4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD35-0000000F5dL-0cN0;
	Fri, 10 Jan 2025 11:19:31 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVnCT-0000000B4sW-0cay
	for linux-i3c@lists.infradead.org;
	Thu, 09 Jan 2025 07:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=AujP
	O41+pvB1tomJV777Px8OTr25nzkE1wIQmICTRJE=; b=BePfcLIn4IrZAAS5tCo/
	hDYoIDd9VmOD+b08gXsBBL9sWQIggG1+/hDk91d6l9b7XqGFS0Nzw3AO4mByhHKQ
	Xi0UaZ8WQgrDbNzIPQUYYxvSiUIwZmJeVRQr7fWIzfsvdvcWeiPO2u5j96PSg42D
	b60JubSJKzkwxgZVh+1ITYU38vu9ePJ4E8LAHvz4zZl4r2kzkBrI55UrWhoKk7QM
	T4au+2HUpHb9I6H9YQ+FgeydQdP7UM5saiyxqE8JM28O1rZDeT21m5DYaDO3JjDm
	YUGe0eToaVA6/2bMm5EGhDAicNRW11ttIboIhflqsq+D6Og2OqmTaGUFTOzHc32j
	tQ==
Received: (qmail 2820930 invoked from network); 9 Jan 2025 08:43:25 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2025 08:43:25 +0100
X-UD-Smtp-Session: l3s3148p1@ucoRIkErIs0gAwDPXw20AOMQ2KO98fSH
Date: Thu, 9 Jan 2025 08:43:24 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Carlos Song <carlos.song@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"moderated list:I3C SUBSYSTEM" <linux-i3c@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: Fix missing 'ret' assignment in
 set_speed()
Message-ID: <Z39-HEG6AaAFvDk6@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Carlos Song <carlos.song@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"moderated list:I3C SUBSYSTEM" <linux-i3c@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
References: <20250108225533.915334-1-Frank.Li@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20250108225533.915334-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_234330_060283_13871281 
X-CRM114-Status: GOOD (  11.64  )
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
Content-Type: multipart/mixed; boundary="===============6401419244262635565=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============6401419244262635565==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GJgCYyWEeZ2zf4nQ"
Content-Disposition: inline


--GJgCYyWEeZ2zf4nQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2025 at 05:55:33PM -0500, Frank Li wrote:
> Fix a probe failure in the i3c master driver that occurs when no i3c
> devices are connected to the bus.
>=20
> The issue arises in `i3c_master_bus_init()` where the `ret` value is not
> updated after calling `master->ops->set_speed()`. If no devices are
> present, `ret` remains set to `I3C_ERROR_M2`, causing the code to
> incorrectly proceed to `err_bus_cleanup`.
>=20
> Cc: stable@vger.kernel.org
> Fixes: aef79e189ba2 ("i3c: master: support to adjust first broadcast addr=
ess speed")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Precisely.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Tested with a Renesas RZ/G3S-SMARC board with some test code added to
the still under-development controller driver:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--GJgCYyWEeZ2zf4nQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd/fhwACgkQFA3kzBSg
KbakZxAArGY+//Z1bYxaZ81h2Z2Hd4yIU7OPjrtwT+JboeOO3tUXG9nkNWUr8+y5
JS4vJPJNZJggTvZgz6xwY5IG4UwHxxwPpaDm7dv3SJZ1eu7YuRLzvCpYlNCsRDu3
ysgtx0u6gTkbrEAQ82m/1XVhIs/TtwGOUpgkgAlP1VIb5U/fT6/FPi/Sd94oPYu0
QeG5AqsFyXtRVtHgJi1HS0zdBuHdteaXmp6qKhJ+lPEyNnEaBSFFBXrw1qANUqJv
0USsr7O8XlbINBm7ivQ+JmvWqti1e+eW6FuJFMPbyE37GLSM4CU2KpvBMoTZ4eYf
uTHoZIuDpK9I57AbC5UQZs9+VJIEjel6H2sHxzCOnTZjrLrHPugyzZzzCqd+PKvK
l3SYoVmgaXP8NwZal5IvNGpxmXQ94yR/rtbhzGHvIIdRZ6TNJjd6prYcEfducTWV
NbLxT8393G+OPlbcknUmkI67udrAl7JwQ+/T9uyt7wKUaEZKXOddqeZCXTsogfoo
ucpue1T0ZWShkcP8C0obanBzEFL8NCo2JvwNg2gveYeYnFkv6STqCMf+VXEh0LKC
KUuhiQ69UmT6VoLFEYsTJ+Q2xsyzWI5dS6oVYf93KgTzMlbqn+JvhBEbbPYczJnf
Xn4cGw8hGUQZoeipKWE/qHMqVkLIt+Tm7u4WzdWg2HMZ1D0nsEk=
=ibUC
-----END PGP SIGNATURE-----

--GJgCYyWEeZ2zf4nQ--


--===============6401419244262635565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============6401419244262635565==--

