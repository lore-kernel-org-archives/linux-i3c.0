Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC9F60A2602
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Oct 2026 11:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xpG1uf5M;
	dkim=permerror header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha1 header.s=google header.b=grJHHh3L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NTJNYPykRHPRAXe1obYeihUh+qCCtej81Jim/ieC1lg=; b=xpG1uf5MRmNUMhCgviHbhxmt29
	yMP5iWaZPVntdrrKikZgLMvy67k0Nh/jXSCaohuVcLW+O7tBTe84eDqUfm7rBjkIzvmtqxPHuBw8t
	3EtYJE83TJ/ONjHBmuZL/tN/LnKnIk4/HFHVGXmaFTkTefh//RtgwBS/g2QmihZ8DVOkhUb6PsWc0
	bu+/a8ST72xo+qBC1R39EbjAscUDu/MhtWbhqM9TMjVFWN+3fgvbiS3tRlLiADoJVqEkXR4KB3PyE
	Km00II7lTfqcUo1K3sBc4zcrkHyez3oby0uBFCi2d3UAe23RjDV3R9zWf27lthYXFkT+WEGn0LdED
	QwQ/xB7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLevI-00000004NMP-1JsW;
	Tue, 27 Oct 2026 11:00:56 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhFM-00000006jN2-1YLJ
	for linux-i3c@lists.infradead.org;
	Mon, 19 Oct 2026 06:53:26 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so11806815e9.3
        for <linux-i3c@lists.infradead.org>; Sun, 18 Oct 2026 23:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792392802; x=1792997602; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XM0c64kJ5bkM6se9bFb6y1Q22QsXGV+KHZXfSxRlDPY=;
        b=grJHHh3LHMTZPdPF1JyDbXpdtS+19wu6ADDiAUcURYenIjCgmjFgvHhFoWwyCCIkbs
         piz6GJxRGsRJ53Bh/TinFi3ygkQuqmgBey66FICGgctbo53Bjd0eT1/ZVmeMEQ9Rw38F
         uyxyESPaan1kaBFcNl9w55WgSKTE/iGNXwxQ0i5PZuPKNiDe4yhge/WvtXBMRMW08jMg
         H3myUZOHk+cDEVX07iJNXxVMhI1cldso+kHCAF4UO8NDnRXUfGoeAg49s8RoJf2uzj1V
         /sw1i+5VSoUvJVC54r2YpJwzDaJc/N/W6nbrVVqAjDzlSCznlaeDZRp0SK+ap2stwd2y
         bwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392802; x=1792997602;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XM0c64kJ5bkM6se9bFb6y1Q22QsXGV+KHZXfSxRlDPY=;
        b=ow9IYTtGasXpGikA7ZRzSmGCpBaz8Z9MSn+JYG8Wpr/LQuEMTVEQ3F6WduQqlo2gjK
         O5/I2ZEGjGBKkJpHDcWmvKUrb3J+ho4+3S/eETWdHM97yQG6Xw7CaQw+LLVy4Umr6Z6m
         AalxhVJXj7YYfbUax25B16whIhZKeRoIY8jejnjSc/CqZQUkZFQL3t7pnAIqYSZ43q70
         Y81piqoqowbPFKzWex235wJBtnvGNJVfhKX0H92qOZa8I/c5H0F7en0BCVICEaoIvP7N
         Z1umCnieSzrXC4glj/pWRG2NSopoGphqJj+467YF7+GrIe9HjsbWtey3fKpfciMvdy3z
         oc8A==
X-Forwarded-Encrypted: i=1; AKwUvBxVZ2iH1HpWUJa+h2eLKAW2uDBIv3+IZr83kkwsC8DPk/xtdn8oTH8HPRplsUrI55rO8B9MRWzRF/M=@lists.infradead.org
X-Gm-Message-State: AFq9FYLEMkpn77ZxG09o3mllyOkHfcqrJxAqL5csxe9uwZDo3/tUaH+0
	YZga728EmfrTprF58hEEq2LTV6+4BYhju/xZpwc9ZmZ2aGwBrZUW9QPhKa2l//CUdlY=
X-Gm-Gg: AYBFou3iZR5Ldz764l7rKw2bAsTiMX3n0yvrqpX/U9A2Saij43QyFTqtaM8YxXoi2h0
	ZBnFF3oB0aewq7KhGkl5Zk08yorkO1/q8nrhlHzp/aSmHX+f9+PIgHHp1LJttBuOyGpeuq7QGrg
	kJ/JYX9T3NLINOfp1yKmXmZI8O6Kv94ggGFEKG3iKd7ZU8kpe0Vj4t2+XoLjbvkag/8L/0Ta6Db
	lThX3u6cdBmcryYE3Y/u3sl5rroH7IxwLgBlZ2cp/SvJbdz9BOYMdWTXDcHUTIMCCjYkueyGZU0
	RLPfsoWpib5+EuO1KgEqV/cQha7HR7KkorfwCflrOWEF1arXhO1oai4iqbmP7HJ4z4ocv3cbmXD
	J4cEIthGS4UTQ4b4z0MuvNGXt85lyT/AopW4feQF817NDNPcfH9K0zoR3XCpavXu46yI58fIHrS
	veiiWwEmfcgM8Khem1ggg7/xyG53JcJVteH+ev+bGFrQRaIGHPa9+0EPdLqASg7L0Uxfbmmg2ZA
	L92Eap45ndboUgx0ydiPEnVYLz+O1JrBQxBNdtxNDR36kk0EXA2f/aSCCKUsfFi+4Uus81r
X-Received: by 2002:a05:600c:c0c7:b0:4a1:d743:77f1 with SMTP id 5b1f17b1804b1-4a1d7bc2e33mr89073635e9.24.1792392800952;
        Sun, 18 Oct 2026 23:53:20 -0700 (PDT)
Received: from localhost (p200300f65f19a9041674bacf58593a35.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1674:bacf:5859:3a35])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1c8de7230sm246009675e9.14.2026.10.18.23.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:53:19 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:53:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org, 
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, broonie@kernel.org, mfd@lists.linux.dev, lee@kernel.org, 
	Frank.Li@nxp.com, lgirdwood@gmail.com, linux-gpio@vger.kernel.org, 
	linusw@kernel.org, brgl@kernel.org, vikash.bansal@nxp.com, priyanka.jain@nxp.com, 
	aman.kumarpandey@nxp.com
Subject: Re: [RFC PATCH 7/7] gpio: p3h2x4x: add GPIO expander for the NXP
 P3H2x4x I3C hub
Message-ID: <atW-DIGEbPMW4vY_@monoceros>
References: <20261016164625.3166779-1-lakshay.piplani@nxp.com>
 <20261016164625.3166779-8-lakshay.piplani@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261016164625.3166779-8-lakshay.piplani@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_235324_717799_68D6B775 
X-CRM114-Status: UNSURE (   7.44  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============1158303055567808513=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============1158303055567808513==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rb2hybyhnj2upzg7"
Content-Disposition: inline


--rb2hybyhnj2upzg7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [RFC PATCH 7/7] gpio: p3h2x4x: add GPIO expander for the NXP
 P3H2x4x I3C hub
MIME-Version: 1.0

On Fri, Oct 16, 2026 at 10:16:25PM +0530, Lakshay Piplani wrote:
> +#include <linux/mod_devicetable.h>

Please drop this header, <linux/platform_device.h> is enough to provide
platform_device_id without pulling in a plethora of unneeded
dependencies.

Best regards
Uwe

--rb2hybyhnj2upzg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrVvlsACgkQj4D7WH0S
/k7KdAf/Ymzfd5nUPGqul10/xb4Cdg8JZlVZwryGIATK15e0B7YEMqJyc+hQaVMu
eVcZr42PEqPgIQlp1aDk2O+1SmuueV/EGkusU0B9jbFL4MYGYDMMX3UXgF93KsHG
L5AztXgy413yo0IWCUZnXqXMjtPSAAOAoJu+9N7VxfWfo4fHLGbZ3AlVffRgev+8
xFFzFPpPNgKNtO2wVYNE3H6K4gKwRMAU3asXySiV/XcnJWZxXoUndsDMpTVn79Wi
kj+JHMF5D/GsSqgsCzVzMNmX4GaziZzgo8BjgIwrbg9TqDEp3zH6reKg55CGXpeD
b49quyvlvKA2UBjz28ZWXDZ7/kEYSA==
=X5cp
-----END PGP SIGNATURE-----

--rb2hybyhnj2upzg7--


--===============1158303055567808513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============1158303055567808513==--

