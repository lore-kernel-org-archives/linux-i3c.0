Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C7AC0219C
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Feb 2025 09:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQz0FFYUDqv8OddsyL5E5PXFTjOi5CHf7l9OqtiAqQ0=; b=J90kfIdnk3ARJMjpyJ682dTHN0
	bdAuQXTuqTKHxb4vMITKL8PP0GQj3ieUmfT7qpFswDsNxd0B0gWtPp0jP+foEuhwTThfPf2byt8LH
	hkUp5aenij8ibSK3O3Rx8I0P+Z0+JEYs2qP1iJsnFm5Edd0iN5R1IH/QwyM+yMr38+cnIivTTia+N
	3gBpFGQ8CJWF/OznEhfG40xEbybJOMSw2EPm1peURxHbrvfRQ2WHUytqNvovGK1mqacGrQRQlUDaI
	MpuWmnL334yYA80KMGTxoHdfqeLE8R9HxUrEbJBZC0GD/2w30pxIX8qd+Y1aENEbIdT/SoNGK2TKM
	oet0TGQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgL7P-000000097pz-2GP6;
	Fri, 07 Feb 2025 09:57:51 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfiBT-00000003xsB-11Cx
	for linux-i3c@lists.infradead.org;
	Wed, 05 Feb 2025 16:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gIXd
	Y1mLEJOad0UDgvl1N4/XnFtkdtWs5lWVPm8r1H4=; b=IzYfjndprupblbyLdsOG
	55ti7uOx8bocr8l1yXzZcSe1S/YAEW41K+WQrlXNeDvz6vGhjBccb9Cpw/NmP2+V
	J+Et+6sbsZq5pHAobkaqiTg5HyuUrisxVhNnTkcaKEPPpEZzlXyFZFanb8w34GfM
	p6Fc85Lbj3H3Nqi5ICP54NKb2PhEH1KyQ1mGlIblMX7NB0XfcF2Z0sL13aZFdiwD
	uVsaLvwsU+IciUftrQVqDTNrL0i3vMG+8vcgDCH0MjiDRKVkOXbsgywd2mU74Zxj
	+CKIfhKEL+4Pu56SZn7yFMZ6PmsSdTCjaggaUFUXSr66AuVi/axmbtbvf4Yx4SqX
	8A==
Received: (qmail 3454112 invoked from network); 5 Feb 2025 17:23:22 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Feb 2025 17:23:22 +0100
X-UD-Smtp-Session: l3s3148p1@ULROi2ct9pi5aIo9
Date: Wed, 5 Feb 2025 17:23:11 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
	linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] Add Qualcomm i3c master controller driver support
Message-ID: <Z6OQb29Ca2tmQs2Q@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
	linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_082328_134225_309B6EE1 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 07 Feb 2025 01:57:50 -0800
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
Content-Type: multipart/mixed; boundary="===============4234135602570288782=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============4234135602570288782==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yzsO1nsGHdcZDS3F"
Content-Disposition: inline


--yzsO1nsGHdcZDS3F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This patchset was tested on Kailua SM8550 MTP device and data transfer
> has been tested in I3C SDR mode with i2c and i3c target devices.

Can you share with which I3C targets you tested this driver?


--yzsO1nsGHdcZDS3F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmejkGsACgkQFA3kzBSg
KbZQ2xAAgEwgaTMhHELob/ZfmcCI38cbMP/TafPOaNf307oz1I1GFRRSCWOuriMH
brOL5Xtu+1hOCqrgDud1VJE89os5nNYPr1Nv4NFgLgv1H6G4O6jouZSZd80yldef
SV5BH1b1QQWvO1d6wjUVIJ94/d41G8J5Pty1M7VchX/z24fa59ZNq4bw2iiV3BTJ
FrNwZEVcaDFK4OIpERN82fB5yaa5wTbuj/OH/eKTnL2aBIq4a26WQD6lFxpvB9g/
OwANtW+GjMbJNu1QlwuAV6saIJbs8DOmYFLMkIeMe41BVjjjnoirkuG7FfISICZh
KCcecac9ZUmcYKE6WKMQQP16TotI95q3x5V2IYEPw7DtHIIUWeCrKqpADl0H4nyk
aOzkR33UTVceA5e7ZTTGuYo1hyGxNRsrlWzy2kdXjTp3IeDDZbNA6uKPLGvkLV2T
1YUmzZjD44sWSIf6WEVdretg4D9JZniLqtb4LbiSEOPJErEjlgB88wz4vlF1os59
BtZfc+m04LyioTPbe3qtzpWKbNbOgX7VLjSoiUeIR66zwYRpUz9lMFk01GzfKXr9
q3y9gj80Cglug1Cz2yDuF7r9lbknE74m8oZwBc4V7UNNRhCm3Bd93XCfyUmMP61m
MKPsEQSKEbQTc+zv7Je1WMm+2j3we4Md3++FvhZNblryGLfGWmY=
=dz0m
-----END PGP SIGNATURE-----

--yzsO1nsGHdcZDS3F--


--===============4234135602570288782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============4234135602570288782==--

