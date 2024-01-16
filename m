Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362D5C47DA7
	for <linux-i3c@archiver.kernel.org>; Wed, 17 Jan 2024 08:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nLCG09Bk5p2dOm4+oow51Vyq6zPdiGTFY9mNG3K6vw=; b=oVVQMQsTh3GC0iklMuLdf+frvW
	n+8Jt5FLonhIPstc10ViDK9XCazBZbZAhl0C1cPKu8Jvls9YsCyW9aSTH4FCeGaon3lKyCXraFCNi
	wi0cUcjRhzHDinPiRMKNGOrwlwNYeUsC9MHWfibTRuxWnAF3LwDnt17Mf6I5HSl//C+ap1gtfx2Iz
	TvBNdf28x23KvY0GumVcYvyZxbM8cnwnPavkrVejrikUAT3DhqeW1F4zuW0oI/uiQSTBwF1Zm3nSv
	cGaO5kBoMapY/a2U+9UsGMRDMOAHg2eVq3A+gaMTRKIYghMSkGx7W4mKoc9PGYtBEWUBraU8OGAVI
	YxzGmcRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ1St-00Eubo-1n;
	Wed, 17 Jan 2024 08:40:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPfn4-00BXXY-1p
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jan 2024 09:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1705397486; x=1736933486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+e6Ln558idTWadRn1DXntGL0wDIyCZpJMPP2MxyNkHo=;
  b=gth/SAgbbXmm+KDF6NUykP0ZpyUJZsM3KbeZvImvJqTzYa6P87VI55ix
   ynePmH4bHxmQS58qI5RAauG2z/r3XQLrn2kzWsfOPrEswUVNQdfmS7NEQ
   mE7iICjGLvsgRxE59mJxr/8kqUZe7b8oEapnpp0X9j+D/FNKsVhuY0ucH
   6qTBMRTtmYE65cKuQ8JXD9QFgr7IY5cyhLzKw/gtIgceqwtLnLuLqdGeF
   qU4zER2UzdfXQJ+9lMwZcFAYDDqmB1CzRePF3B776WxIuOOuJJRYBsgCT
   SBCwk8NuQuKaEuupy0IUAVQ3DgkhN2kOn6UsfbXEg2QnxZxdNZPIeb/V5
   A==;
X-CSE-ConnectionGUID: WayHWkw8Q7O2gJ+Gskrx3A==
X-CSE-MsgGUID: 0aICPRxpQsWlKp7G71Bc1A==
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="asc'?scan'208";a="15990500"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Jan 2024 02:31:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 02:31:04 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 16 Jan 2024 02:31:01 -0700
Date: Tue, 16 Jan 2024 09:30:25 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Frank Li <Frank.li@nxp.com>, <robh@kernel.org>,
	<alexandre.belloni@bootlin.com>, <conor.culhane@silvaco.com>,
	<gregkh@linuxfoundation.org>, <imx@lists.linux.dev>, <jirislaby@kernel.org>,
	<joe@perches.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<miquel.raynal@bootlin.com>, <zbigniew.lukwinski@linux.intel.com>,
	<devicetree@vger.kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: i3c: svc: add compatible string i3c:
 silvaco,i3c-target-v1
Message-ID: <20240116-bleach-herbicide-48d636967134@wendy>
References: <20240110175221.2335480-1-Frank.Li@nxp.com>
 <20240110175221.2335480-3-Frank.Li@nxp.com>
 <3c0be658-e7a6-4231-b206-86ffb47e0cb2@linaro.org>
 <ZaFbbeQrC7o2dchO@lizhi-Precision-Tower-5810>
 <e3b9aa63-25a5-41cc-9eb7-6e7d1eacb136@linaro.org>
 <ZaFjaWCA6k+tiCSJ@lizhi-Precision-Tower-5810>
 <ZaWLCrWJEMtFx8cR@lizhi-Precision-Tower-5810>
 <1b628901-7f71-4c97-9a16-723912988417@linaro.org>
 <ZaXqCoCHPWER94Hh@lizhi-Precision-Tower-5810>
 <d45e31c4-914e-4cea-a145-9775b6f516ab@linaro.org>
MIME-Version: 1.0
In-Reply-To: <d45e31c4-914e-4cea-a145-9775b6f516ab@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_013126_764026_CF5F076D 
X-CRM114-Status: GOOD (  14.42  )
X-Mailman-Approved-At: Wed, 17 Jan 2024 00:40:01 -0800
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
Content-Type: multipart/mixed; boundary="===============2723445890753965360=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

--===============2723445890753965360==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tU9usgt5JDc4MslD"
Content-Disposition: inline

--tU9usgt5JDc4MslD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 08:24:20AM +0100, Krzysztof Kozlowski wrote:
> On 16/01/2024 03:29, Frank Li wrote:
> >>> 	Patches were accepted after discussion, what you ponit to. So I
> >>> think everyone agree on the name 'silvaco,i3c-master-v1'.
> >>> 	I plan send next version to fix auto build error. Any additional
> >>> comments about this?
> >>
> >> I still do not see how did you address Rob's comment and his point is
> >> valid. You just did not reply to it.
> >=20
> > See https://lore.kernel.org/imx/ZXCiaKfMYYShoiXK@lizhi-Precision-Tower-=
5810/
>=20
> First of all, that's not the answer to Rob's email, but some other
> thread which is 99% ignored by Rob (unless he has filters for
> "@Rob"...). Therefore no, it does not count as valid answer.
>=20
> Second, explanation does not make sense. There is no argument granting
> you exception from SoC specific compatibles.

The patch could have been applied two months ago had Frank done as
was requested (multiple times). I don't understand the resistance
towards doing so given the process has taken way way longer as a result.

--tU9usgt5JDc4MslD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaZMsQAKCRB4tDGHoIJi
0oXjAQD+n2/ohO6suxsrwD5Ou5eVTuKiCJW4yn6SzYminXj4UQEA5Z7Y5G8MfUrU
u49KfI9asa8Tjp9X2y7YIiNSAtP1Qg0=
=nQni
-----END PGP SIGNATURE-----

--tU9usgt5JDc4MslD--


--===============2723445890753965360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============2723445890753965360==--

