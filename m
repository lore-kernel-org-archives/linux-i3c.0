Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952AEC07D5A
	for <linux-i3c@archiver.kernel.org>; Mon, 27 Nov 2023 19:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzAGf+WAwiJ5G9zeKxotlVuBa5MfZPFbbxi3u4oppdY=; b=jxAI8+hPeL5QteOD/8Ec0Ybb0U
	q2PxSKNSvx0L2Bhh8Q44FcSiQznHBEqnDl0EJ97N/xM3OWwbvA33cMMlOqzJ+VOUZSI59s8R+TmWB
	GSC2RFswS/N6YZrJNu/IxJcCic4o0abePmm5YoUE2oB/HxlPRlWFImYuzG76EVOxIj1jVd6JzgaXT
	qwOohHOPubRMOBwZExLjcWqCM1j4LE/6jXQfEagLZNJ8X/+Lc3HggdspX/DX8G4z6dw1or2g8ggZK
	rjhQuhfSxUsBAUP1vmK9NUQFt1McnqZZqgXm3E+eWc2mxcqfFqWyCABYVIacTVZOr7USH6OaKO1n5
	aNS2RAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7hig-003Oeo-2Z;
	Mon, 27 Nov 2023 19:56:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Y2r-001zKl-1B;
	Mon, 27 Nov 2023 09:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701077809; x=1732613809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wbYc5Mi0mkxvIgJBVWC8WKPY+n3fl5ePEg7lSS5YolQ=;
  b=aDPw+k638wxk1fKuY4deT8v5iHA3v2I60Faah4G4wQ4QQTlacBnMQwRO
   hqjcj88k6fg99V5ri8VpC/rldZjheG8PT7RTQmr4Elzzhrkod5G8F0tMe
   NT85kSq6y9H1tNZeHmgaK+Y6hmO9c+6IDlKnHvp9qrIeE7uCwWL+AjeFl
   bHGIzmeja0tpS7379LUo1iPwzA71LYkRD1UCJPoiZeVkkntvd8jjC94Cw
   gQasLdVGBut0K4MDqxGzqwSRtWLdwxMnr5y2Q6FjgexWwFu92Ej4j7jUp
   hsGjkjEVk9b4aLCtaXuef/mqZkFL4ydv/B0HYk47OGgxsDD90vOGaQi4x
   Q==;
X-CSE-ConnectionGUID: jcaihvjJQZmUBLk5lTFEhQ==
X-CSE-MsgGUID: XSNrlY2nTJy6E+xCTC4UsA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="asc'?scan'208";a="12595217"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Nov 2023 02:36:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Nov 2023 02:36:12 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 27 Nov 2023 02:36:08 -0700
Date: Mon, 27 Nov 2023 09:35:39 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Shawn Guo <shawnguo@kernel.org>
CC: Frank Li <Frank.li@nxp.com>, <alexander.stein@ew.tq-group.com>,
	<alexandre.belloni@bootlin.com>, <conor+dt@kernel.org>,
	<conor.culhane@silvaco.com>, <conor@kernel.org>,
	<devicetree@vger.kernel.org>, <festevam@gmail.com>, <haibo.chen@nxp.com>,
	<imx@lists.linux.dev>, <joe@perches.com>, <kernel@pengutronix.de>,
	<krzysztof.kozlowski+dt@linaro.org>, <krzysztof.kozlowski@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i3c@lists.infradead.org>,
	<linux-imx@nxp.com>, <linux-kernel@vger.kernel.org>, <peng.fan@nxp.com>,
	<ping.bai@nxp.com>, <robh+dt@kernel.org>, <s.hauer@pengutronix.de>,
	<sherry.sun@nxp.com>, <xiaoning.wang@nxp.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: imx93: add i3c1 and i3c2
Message-ID: <20231127-cherisher-falsify-8193656e8872@wendy>
References: <20231017194657.3199749-1-Frank.Li@nxp.com>
 <20231017194657.3199749-2-Frank.Li@nxp.com>
 <ZUz/8fBWtnwdSW9w@lizhi-Precision-Tower-5810>
 <20231127022140.GJ87953@dragon>
MIME-Version: 1.0
In-Reply-To: <20231127022140.GJ87953@dragon>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_013649_469903_04A1141F 
X-CRM114-Status: GOOD (  12.88  )
X-Mailman-Approved-At: Mon, 27 Nov 2023 11:56:34 -0800
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
Content-Type: multipart/mixed; boundary="===============1784800808002622016=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

--===============1784800808002622016==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RBuY3wpHZRfr7ruc"
Content-Disposition: inline

--RBuY3wpHZRfr7ruc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 10:21:40AM +0800, Shawn Guo wrote:
> On Thu, Nov 09, 2023 at 10:51:13AM -0500, Frank Li wrote:
> > On Tue, Oct 17, 2023 at 03:46:57PM -0400, Frank Li wrote:
> > > Add I3C1 and I3C2.
> > >=20
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> >=20
> > @Guo Shawn:
> >=20
> > Driver part already merged.=20
> >=20
> > Please pick up dts part
>=20
> Rob had a comment [1] about SoC specific compatible.  That's not what we
> want?
>=20
> Shawn
>=20
> [1] https://lkml.iu.edu/hypermail/linux/kernel/2310.2/03035.html

Yeah, Rob's request here looks valid to me. Should just be a bindings
change Frank & fall back to the "silvaco,i3c-master-v1" compatible.

Cheers,
Conor.

--RBuY3wpHZRfr7ruc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWRi6wAKCRB4tDGHoIJi
0nspAP9lVMYJ86MSdG5h+V1vbfIvJIfnVFsNNAu0e5dCZZ8xXQD8CpX4tfnJEZWp
2021AvHbHZl6OuVBbSpSQ5Kdq+dTjQY=
=yohp
-----END PGP SIGNATURE-----

--RBuY3wpHZRfr7ruc--


--===============1784800808002622016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============1784800808002622016==--

