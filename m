Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6602EC48BF6
	for <linux-i3c@archiver.kernel.org>; Mon,  4 Mar 2024 19:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UnBUYKz3PTUZnrZfDilCbW8FceGJ9GrHkdmZrM5Stk=; b=e5hF+yd1akSaljrcsucvID8JEz
	xfXDMpvm8d2IX+6qQIExXRus63XQf8Yw4zRwBnxfMIF17fCTjP/SSndxigPrS6xY9gfzZwBbNQHPS
	ha9tVg3l44jskdYQ8HszM0ZgGSrIDxiYeTzl7JY/HgHqUi7rl7NUx6bjYVRpn9nFWigNeRRyhZc+O
	IpAHRQB0w1DmG3HL+KeTepIROkPBnb+9q4tGT9mdB8BfaalhBDpTkGoKmN5+sVVON8mgeHk9G4RQC
	+7hnrRJmtE5w9oQBqbFZyQHjiTrEMVf8uAXvj0w5mEgSQTPFbh4BnqjjbXbrNBxcHAx4S5YLz3cZD
	ZDRp4xhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhEAn-0000000ATFm-1vol;
	Mon, 04 Mar 2024 19:40:29 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rde7i-0000000BShk-0aEB
	for linux-i3c@lists.infradead.org;
	Fri, 23 Feb 2024 22:34:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2Wfh
	FQ80HGIyU4EysZndPKnOpYN/Nd/vyMAbdv2H1oE=; b=WNubgYoWQFi11xP0oDRe
	z/4cvJH7rLAtEdS7XwEDVqmGY3B/gf0rxuPUCi8SUmKE5NbqOBWwE3iLQxBm9z/Y
	GEhlSWf36eGtjPd7KjFexqs64aymQbsRPCwOZcBC/7+QRUd4K/1mIjQ6nEUMx9JP
	AeZM/fNoXKdT96q0u3GhKaPjI1i7SzrnuBKBsjMY7PuqTkzMIFucYW2sTxJNgjBh
	kSBN6dzu658AL9eQEIOvM/8tXMt79XIyRdZtZrZXHw1xf+F5Z9tYhCEkfE1IKoFx
	RAyhlfXSm1iJv2YG1wkKEE87gA9pf/lj9V9PaSZ4GoezXe+222K7unYyAizoWy0i
	lg==
Received: (qmail 380856 invoked from network); 23 Feb 2024 23:34:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Feb 2024 23:34:20 +0100
X-UD-Smtp-Session: l3s3148p1@CUgsKRQS0JEujnsZ
Date: Fri, 23 Feb 2024 23:34:19 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: Remove obsolete i2c.txt
Message-ID: <Zdkda5jf072mENvK@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-sound@vger.kernel.org
References: <20240222174343.3482354-2-robh@kernel.org>
 <ZdemsdGQE0RtilCd@shikoro>
 <CAL_JsqKpn6jqktRLQUx7HMrJG0PZeiOZ=hQnHpZK6AHcM22CLQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKpn6jqktRLQUx7HMrJG0PZeiOZ=hQnHpZK6AHcM22CLQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_143431_163861_B22BE188 
X-CRM114-Status: GOOD (  17.57  )
X-Mailman-Approved-At: Mon, 04 Mar 2024 11:40:27 -0800
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
Content-Type: multipart/mixed; boundary="===============2355878161110182550=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============2355878161110182550==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fF2R2D/X283ptnYJ"
Content-Disposition: inline


--fF2R2D/X283ptnYJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

> > * In the schema, "clock-frequency" has a minimum of 1kHz and a maximum
> >   of 3MHz. Why? The specs do not say anything about a minimum freq and
> >   fastest speed mentioned in the docs is 5Mhz (Ultra fast mode).
>=20
> IIRC, the high speed mode originally topped out at 3MHz. I guess
> that's been revised.

Hs-mode has a max of 3.4MHz...

>=20
> We can drop the minimum.

=2E.. but I see you changed min/max now to 1/5000000. That's what I would
have suggested as well.


> > * new binding "i2c-scl-clk-low-timeout-us" has a description which I do
> >   not understand. What is a waiting state?
>=20
> Shrug. May have to look at the MPC h/w that uses the property.

I will also have another look. My gut feeling is that the binding is
okay, only the description might need an update.

> >
> > * new binding "no-detect" is broken. At the least, it should be named
> >   something like "bus-fully-described" and then the OS can decide to
> >   leave out auto-detection mechanisms. If you are interested in the
> >   latter, you can simply disable class based instantiation on the host
> >   controller. No need to describe this in DT.
>=20
> I've reverted the property now.

Cool, thanks!

Kind regards,

   Wolfram


--fF2R2D/X283ptnYJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXZHWcACgkQFA3kzBSg
KbYzig//S6LN1IJcbov4tQYqc0ld204PZ2cFEc0wE9p1z2ACiq71IoYiaESHLfjF
8BndHnuZnCc4LsHNTnDVquUsM54mxypBiXdnBvmmKCrJUlnpDrwlVmRi1yQ0VuFP
V2/zW4mOesb56puXSfua8Hsyp9M2qEGyjwJSdMMEozyQcBkLausobHQKbphvFhc6
OAjp1HJvGb9kjrYRGpH6dbDPrk6efXcwKy3n63//ILBcmSloVfFbWgn8n3j7nk1I
0EDdgRx4MDdz0leMRTlROjl7VtF+EdWeZ0OqIuZPGNxTuk5xXa3XII0bT9+tOBCA
/c4eLMLua8keQnLJanHxIpcVYv982KNjJMfOaIOI6u0F7UsV6ZRLEQbmzuYE9QpG
2mK37DgB4b8V85n6HwpXzZaiqOnzEFIJ70ZEDPkVhtEfcNjz5etDvwWomgiotfKO
QajwbDm9F3R4FcO3EA8WgDR/dDv8cqCXjOfgFyUV9jjbbeDO5rVUMBGLoLSlv1+D
ysOnVR1JSK6d4wtN6gbCMnzK6aAQPmgdZWq09P5sarNEfGJ3tv6ztUdcfDkoKsiJ
xfRUrch+VMkrIMbshoICqlRyjtOPMSNpme1eClzMQgd6CDi0mBXJC6fWPmLYV6kS
Spc1IA87hY7oYQH5LXdd0PwZs/2ulfzTdJ/m90bdPzfIifiVxn4=
=ITPf
-----END PGP SIGNATURE-----

--fF2R2D/X283ptnYJ--


--===============2355878161110182550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============2355878161110182550==--

