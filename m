Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2523A606A32C
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Oct 2026 11:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c+OKF+N+;
	dkim=permerror header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha1 header.s=google header.b=hd7gNXgx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zSXkOoy9uY4vg9OTyOGpwiAUJZA4gclQ6Rat9Sb9z88=; b=c+OKF+N+vEqRZkR9oIPOp81HUW
	arKhfWtiRBkH3BSiNO2DmntXVkJb3yeqtcD31l9PT0uMV9hl8cyHT4ypb/wYsjEKiYmrwerwx6Xw6
	j/EA66xCCsVB5ix547QeO8cj6zvK7YoxUIE3rDMNsGdiuKATCi5j/Nz5Ql7SrYZ0vYI2CQATJoVUi
	58CZ/VambT1Ep3FEoS6dRX5f6MKq23BCmrX/PnV78T9YG1DdxlGesNTKPvwf/kmyNNHPJBjh4MEKk
	isoIl5Szihtvk4s6ly3RGVVAei2p+YDbwsths7WsdFrzUPlEaI369VzuxHhuFq2bKRlBphTrl+T96
	VOKOVyCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLevF-00000004NH2-2b2L;
	Tue, 27 Oct 2026 11:00:53 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZr6-00000003wpO-2RH9
	for linux-i3c@lists.infradead.org;
	Tue, 29 Sep 2026 15:34:58 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49fff72474fso16889185e9.3
        for <linux-i3c@lists.infradead.org>; Tue, 29 Sep 2026 08:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790696094; x=1791300894; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bK1kRsPsOXdZFtj24JVUR5GYlNpzvwaq05tohnScRrQ=;
        b=hd7gNXgxuw8C4BCeP/pYEdK5RfZTmrBALhwC2gidfJCRJg0bsUduUvV5T+bhpSs+TN
         hh419ABlIRcxAp92syhxOyidc79yABIyT+i6hW3CP5tfpK7WBbN2GKP60JLlJeN6gKRl
         8IlTyN7sf61TTQR3OeO3g9OJVL1ZzStno2Cn+UJ1/5Sal9NNUuhY1qFxMSgg5u4JOhdM
         I2i1Uao21CYTtHefrSzD/e3F4eUeZH0hODl1Qhu0coJ9z1H10IBpoq1hDqWsuhU4jnFD
         kLJLIcQN5nBT3G55srQsR9cd7VtssqpHLoQEE54GPoBTi6Bt2N1NN2jPw4olktodcXoO
         5D3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790696094; x=1791300894;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bK1kRsPsOXdZFtj24JVUR5GYlNpzvwaq05tohnScRrQ=;
        b=DhoE+PdudSRf3Vf1YSwUH2G796t58On4X7fO4TRtFztC87bYkOVjmXkMeZLlX8+Ohi
         9NLCSohMghj+SAJOKPG6VzpomCaIDeHipbx+kqra+bSWUMvRHewtTy3bis2XnvvgbRVj
         HS7BNE7Hdq8D5a0ny+6S3ARIsA4NDiHGPs8idAfbFMbduXnF7h+iGOloseDhaRoreHyp
         OvqGQeiH3T+r8S9eA3MkNSuB2jGHEF7Tc3vLO6pZk+wJGTUwQurqYlTOOxoZtW2QoSu1
         OH9/Ig+8AKdVAMKMDbvM7hY61BXX60jDCJijCW4GZGpDDTjr77qcLba4AuMA2h/khWlF
         HcCA==
X-Forwarded-Encrypted: i=1; AKwUvByKkSnWHIm3KKKR+QDh4Og3GfmacIF7YOfAz9vh8WsC2d3XGuuOYLDBw/FjlQk09J9Ni15T+UOpl20=@lists.infradead.org
X-Gm-Message-State: AFuF++mEZgALV7v/hW8AijyWDLKEtwVWux/DRARe0nbiskpCzjZr79ov
	ptk4ghrbMWetgb6Yy1bNFzm/hwNS8u6Mf68SGVU+YKh2TrKjdcKhFJmAB3joHzgMjcM=
X-Gm-Gg: AYBFou07Do5pgtySSakHxTlS59J0vbb70wkvD41kKjqnvYykVX/trxqQ8PWrSJKIDOI
	2sT1uQzzctv+OLe8IMayL+/1zqfAn/v5Skp7dklzx6wFCGMD58LcFSRSWcnxBem7+KmKYjf52Ao
	r7xcmo3ePlaDAhUCnhg1vczn5aIYvkgE9FgnzoeDCaTTXNSvJqJAIgQEqNxAaGWZL6bgB/no804
	Buf7Ja9mpKOOI21/o3spvhNe2FvsU6/vVwng1bHfzXRMI9arhaRjb4QHcDsdeO7Q4v0d4da601q
	o8x8OTKDRUw/RHdewxhOmvcN2mQv/M+KrTyHPxtTZHh03AwFPRce+HxOY7l3yL/y8appmRpUyY2
	qsaAMGNAxTyuYaIqapK459KdVOjWeoEHrX296xvM6akW8LgpcIZIjloarBE6cJ4W790XM9VL3RH
	XS2FZ7ec1Rc6WdcGs8drnRdqHrT7fHcHYG9CBYZI+knkDJhjVqox4ZM+HSYOixZ6Kp8Wah+RTdW
	4FY/YzNl4Rl7d9twm3do4wmNU4iwjNF+tWSc0pG8pcXnp1dwIBK7Pyxb6+3ViublJjIA80D
X-Received: by 2002:a05:600c:8b6c:b0:49f:ffd0:9a9a with SMTP id 5b1f17b1804b1-49fffd09b09mr145822235e9.25.1790696094266;
        Tue, 29 Sep 2026 08:34:54 -0700 (PDT)
Received: from localhost (p200300f65f19a904123cb16e9a8bb736.dip0.t-ipconnect.de. [2003:f6:5f19:a904:123c:b16e:9a8b:b736])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a00d0f442dsm81897025e9.13.2026.09.29.08.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:34:53 -0700 (PDT)
Date: Tue, 29 Sep 2026 17:34:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org, 
	mfd@lists.linux.dev, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 14/20] pinctrl: berlin: support Synaptics SL261X SoCs
Message-ID: <arvZnEsAdJ5R9mBi@monoceros>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-15-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260929061417.20733-15-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_083456_638108_D95BEAD6 
X-CRM114-Status: GOOD (  17.47  )
X-Spam-Score: -2.1 (--)
X-Mailman-Approved-At: Tue, 27 Oct 2026 04:00:47 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8427230120052820185=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============8427230120052820185==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qdr5pu2vmyb2k4sk"
Content-Disposition: inline


--qdr5pu2vmyb2k4sk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 14/20] pinctrl: berlin: support Synaptics SL261X SoCs
MIME-Version: 1.0

Hello,

On Tue, Sep 29, 2026 at 02:14:11PM +0800, Jisheng Zhang wrote:
> +#include <linux/mod_devicetable.h>

Please rely on <linux/platform_device.h> to pull in the definition of
of_device_id and drop the inclusion of <linux/mod_devicetable.h>.=20

Including <linux/mod_devicetable.h> creates a bunch of unneeded
dependencies on subsystems you will never need in this driver.

> [...]
> +static const struct of_device_id sl261x_pinctrl_match[] =3D {
> +	{
> +		.compatible =3D "syna,sl261x-soc-pinctrl",
> +		.data =3D &sl261x_soc_pinctrl_data,
> +	},
> +	{
> +		.compatible =3D "syna,sl261x-system-pinctrl",
> +		.data =3D &sl261x_sysmgr_pinctrl_data,
> +	},
> +	{}

Please use { } (with a space) to match the most common style for these
arrays.

> +};
> +MODULE_DEVICE_TABLE(of, sl261x_pinctrl_match);
> +
> +static int sl261x_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return berlin_pinctrl_probe(pdev, device_get_match_data(&pdev->dev));
> +}
> +
> +static struct platform_driver sl261x_pinctrl_driver =3D {
> +	.probe	=3D sl261x_pinctrl_probe,

Not a fan on aligning the =3D, still more if it's done inconsistently in a
single struct. If you ask me, just use a single space before the =3D.

> +	.driver	=3D {
> +		.name =3D "sl261x-pinctrl",
> +		.of_match_table =3D sl261x_pinctrl_match,
> +	},
> +};
> +module_platform_driver(sl261x_pinctrl_driver);

Best regards
Uwe

--qdr5pu2vmyb2k4sk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq72pkACgkQj4D7WH0S
/k6pzAf+PhNU58V7LTtOu13Q7FpXZuGYfITE5o06ZTODsXEE48OgW8ZdwP7VY1Rr
OASvkk8I0b2igulZlmDQF6y/Uo8vr7BFFtBnDNLOlskSrwtGlRdlA+OxtblggT3/
ZtDs4aXeswkygIA/WvR5ypgSrpFZbf3ulmLpJxoG7wyWd2z20AE0RMgHMxWnRRRK
u1HPQWxqFS3vW0NsDLIGQ8yxAhuvL3DkQrfMVQONTNlqb9YbbJ5Ei9pHPDcYiggC
2NvAR0+Iczq3x7p1plWpq1ism4qNBPatzP3vOw+KMQXMHzNrOEICQ0lR54jlGDtd
U3aErEDsuZZpCY/HwikxQiabfzr3uA==
=ieOW
-----END PGP SIGNATURE-----

--qdr5pu2vmyb2k4sk--


--===============8427230120052820185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============8427230120052820185==--

