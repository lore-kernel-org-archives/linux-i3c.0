Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70999CD4F24
	for <linux-i3c@archiver.kernel.org>; Wed, 13 May 2026 10:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhdxCDvUBg1MF/H0W84M00plTp0PsyZw5+fcXaZb2IQ=; b=Mhqg1079Dsf1T97thujRg90EnU
	M6ir2pw0dh4NgzLp3y/P1UvWgyWsdv+sWV2uDs0bmReszrpsY7iMdtjPiaeCwdkbk83rp9N33kyJc
	VeGpr1HGhZs7/xHPTNExYrmjoYbEwkv/NCfWR8HCRI+CDBGqz86tpWx2vcgafm/uzKfVtY78wj9NJ
	bGlYU/3RYSIX6LdFDwUktopjgiyniTv/15RK8at7rKB4f60ErENe+ESARDUrb/PTQUQka/aTy4RNz
	mzroVaAwqtPz6QNyWN79CGR3zdaKSUdDVb6C4JOswFxcJW3KkWFxxG02t42QmuRmecsOrCqz8ivoj
	fa0zR/cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6Ro-000000025ip-0OxG;
	Wed, 13 May 2026 10:04:12 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK8fm-0000000FE5b-2Zv1
	for linux-i3c@lists.infradead.org;
	Tue, 05 May 2026 05:50:25 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-67b6a6bd7b8so2254818a12.0
        for <linux-i3c@lists.infradead.org>; Mon, 04 May 2026 22:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777960220; x=1778565020; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YSIwPUlXrh+GDSDYQrzlL8vhBa2M1GIP++a3LvbYsq8=;
        b=y/CJhi3AXFPEEm/MIwLUHJZgs1s1+yTC/HYnJ4P+D3mgHp7qlIMwyxunft9N3cAjTq
         n82ZZl+RBbL+2HGSJUOduhBSSoj8PJVHVr36a3cji05lcEUW/lRdxGY5YTVV/lK/0Jfn
         IKWa6fAM3wE0SQZ8sZNKR+LfIevE/iE0saUygSKgXD+4fFXJT+bMErNuHw/uYyQrkrHn
         /liMXiAy4kNsktY+EyYdE2eN+KvfJ2xw8WxXP79SMT2NZZeyYyHDxMk0KGVrEoX999fn
         Twnxqp6jW49HRVRDxqQN04D9XIDH8FDHORjenNwokr+aKIMpgXaOUlJ6WTZ6290wLhNK
         eFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777960220; x=1778565020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YSIwPUlXrh+GDSDYQrzlL8vhBa2M1GIP++a3LvbYsq8=;
        b=kRg3NYmR5mG+VqWxjpvx9FwztAmUUGR9R6aC8B4MBiuFymPe+yDVH5BM68vrR8tecm
         nPts8UXSa9b6G0pu+pEQ03Nizv6pEdmI0lrWRbcYWsrTdxO+WdobvtR51xsMpBQMQH6y
         req11sR4gKoV4ex1TwoDZlYXeMEeJv2ywt0pbnNeRHKMn8ZXYK3P4vOpQ8bfbiAxs1Fp
         7kXXP5WoHxmXgGfgLbjA0wW+x7V/54uLl0GlxsUvusiqxRxUa7TJcWQTPnc5OUNfzg7q
         QdsE+fm2aPHgi4wUqpnEho9cMny0Msfz2sSi1Sw1XIMb9yTCI1FMi2xExQxUA36R2rxz
         Ln5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8YPTMWh0ataynUYDK1P6RIxtat7bDz7qEf83nkOw2COdCcReWBapcTFHF5CTq3OF6TCq1PZrzq+jc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLcR9KnwudyKAA3KUgvaTmWk6LtYh5FCTb8sYRKZpr5bwld0Zo
	2wUVV3EMRkBndnkRkgnvg0DXuDpe+80gDLAHaEKM8jSYRhpKU2mxGeZwZgJlDPJi0UQ=
X-Gm-Gg: AeBDietMxNytpItcwirJPjxkL7j0K0jNSkWY4MTaUlPYUyVg6oLYvfPWxspxsNJ0iyw
	5Lhe5+Mp3oe60tc4HK55DlKNMkjqWSRU/5BV1XIXYwMGbzqMQJ7V/2L8eCTgTkWqYEyE00BjyiL
	JBjPsvymucc59t/5Xjf8AlUq5JK9w+A8Z+N3eN+cA9is7z0rXlELCS/mJndIEX++8QVIDSduNtm
	iiWZRMkwe1WYQmRdmuafOJVYwi3wvlDGa3Yvh6iTDVgrah9MKjxLr5rNrGnECQjkn0jVKz32Qah
	u+2H5bPZI9x/hXmDQY2aP0j9+e6FNqrZxS4bgiePDh9LYO0GvQQX2U4PPAumooakRnNCd0lkIVZ
	Rk4357Ax5HJVoj7E62Xofj0tSMgPQA/6fe4kh+YEafBRcHStySJKbFMjMeum5TXxKaWp/gpG2NF
	lcJOzqPpzqOxU7h7liZnYe2H+fLx97BJDyvCIK6R0=
X-Received: by 2002:a17:907:c70f:b0:bbf:bab5:ecd9 with SMTP id a640c23a62f3a-bc3d1662488mr116346966b.15.1777960219676;
        Mon, 04 May 2026 22:50:19 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-bc421629cd6sm27128166b.38.2026.05.04.22.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 22:50:18 -0700 (PDT)
Date: Tue, 5 May 2026 07:50:16 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: Consistently define pci_device_ids using named
 initializers
Message-ID: <afmEo54iWgk54M3Y@monoceros>
References: <20260504143324.2122737-2-u.kleine-koenig@baylibre.com>
 <afkEsk9Faf8wizWd@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
In-Reply-To: <afkEsk9Faf8wizWd@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_225022_943400_E231F6B4 
X-CRM114-Status: GOOD (  19.54  )
X-Mailman-Approved-At: Wed, 13 May 2026 03:04:08 -0700
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
Content-Type: multipart/mixed; boundary="===============3441802499994004398=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============3441802499994004398==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kwrj645nikwsrwf7"
Content-Disposition: inline


--kwrj645nikwsrwf7
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] i3c: Consistently define pci_device_ids using named
 initializers
MIME-Version: 1.0

On Mon, May 04, 2026 at 04:42:26PM -0400, Frank Li wrote:
> On Mon, May 04, 2026 at 04:33:15PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > The .driver_data member of the various struct pci_device_id arrays were
> > initialized by list expressions. This isn't easily readable if you're
> > not into PCI. Using named initializers is more explicit and thus easier
> > to parse.
> >
> > This change doesn't introduce changes to the compiled pci_device_id
> > arrays. Tested on x86 and arm64.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@ba=
ylibre.com>
> > ---
> > Hello,
> >
> > The secret plan is to make struct pci_device_id::driver_data an
> > anonymous union (similar to
> > https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylib=
re.com/)
> > and that requires named initializers. But IMHO it's also a nice cleanup
> > on its own.
> >
> > The anonymous union will allow changes like the following:
> >
> > -	{ PCI_VDEVICE(INTEL, 0x4d7c), .driver_data =3D (kernel_ulong_t)&intel=
_mi_1_info },
> > +	{ PCI_VDEVICE(INTEL, 0x4d7c), .driver_data_ptr =3D &intel_mi_1_info },
>=20
> I think it is good. Can you directly change to to
> 	{ PCI_VDEVICE(INTEL, 0x4d7c), .driver_data_ptr =3D &intel_mi_1_info }
>=20
> I think use anonymous union {.driver_data; .driver_data_ptr} don't impact
> the current drivers.

I cannot because pci_device_id with the union cannot be initialized
using

	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_mi_1_info },

That's why all drivers must be adapted first to use named initializers.

Best regards
Uwe

--kwrj645nikwsrwf7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmn5hRYACgkQj4D7WH0S
/k54SAf/YUfmS/bahkAtbcQF2rt1c0OO5xZkAuZchAlANs04rLI+WiOk9KmOd/Sw
RvKZp+2C+eQAPnbzkR7IRnfJ8jz9/zIaKHYCeIZGGHhF8vJmospejGIiyp2ak5RO
y9t+oHnWOcZw5AWYkcotZXEimXIam0P6mrR2nUx0ru/0whmiocKct09gW3GW9YRd
K0jeQ9K9YpCFTcTRNCpTGP6tZ4yq3zR2VF+8lhUnuXigm53WE3tuJtKHmqM0zM5p
gkwFJ0RtbBO4bf1ulrrMKgDqz2ehlN8nwUyBfnVvGcrLXCva46c4aH29oVF6tuDz
LmjiguzDbbq2aDpktzBgzfor1eeO7Q==
=hAGU
-----END PGP SIGNATURE-----

--kwrj645nikwsrwf7--


--===============3441802499994004398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============3441802499994004398==--

