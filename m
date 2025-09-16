Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E546CAC599
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Sep 2025 10:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OoJtCfp6ADAGFQelnZR/HQfgzjiqz7XKsnpT7L67DJ0=; b=QmhnT4vyi3z91I
	kL+y3fK618ayhFmSrShYtqR7pBJvEs1eXwkrpkZ3eEaDhAZOViTYCEjn1Pk2tbDFiuHpEVPn7+OqQ
	z2txwyFqWuhbGBETmgo25E5EFwKVZKyC6SebbzQxMvddxG1QcXBYg5J49KF3aT5oGQXv91WKqczpZ
	zWsP+wbE0xm9CP31cQ2Aad5xHnV7MNjIJ3KFAgOI+88RAoTQ3jPET6O2O6h0BTVhFltwPV5zxV3pr
	kdUmxXPNSuyfuSONwmcd863U7DmSk3Hub239uX8zRb2ZASWjPe03YvNO54DXDRoOcXlzmsfqhMv3O
	oC8Bd6+3xqBXHkghtSAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyTCH-00000007ZgI-02pv;
	Tue, 16 Sep 2025 10:46:05 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyTCE-00000007Zff-1Jpa
	for linux-i3c@lists.infradead.org;
	Tue, 16 Sep 2025 10:46:03 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3ea7af25f8aso818868f8f.0
        for <linux-i3c@lists.infradead.org>; Tue, 16 Sep 2025 03:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758019560; x=1758624360; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yjrnXJtaUGoRrY4sA/QAMhII82BWLUeC+DqFsB4u81E=;
        b=FYl8WQGjfA8y4mf/ZIzrvWOjsm6h0x+FhAeIE66jbLiSVzqsx3c7FO+lYekWmfvM/m
         flZKrx+c7R3rqWJI+/8hCuMCOkyZxwP5lAs2HNeM9n0/ymlTNGVUyQx+OZcTx70mYwU6
         EM8kUXGrGJhPoE/yQSdYOjhoA+GxzsRYk3PcmLtsO0zDSrmn58qd113shSAoAe8X6POk
         K4alAj51HZHNegCYghsuK96nFRgeBeYD4+o1oqg7UONutQZU6KFXljoMNvxTzWMVKQYB
         aKH35IVd2FML8sJrxOi70Rklc6kQPQEFGlZH6eKS02jtd18i2VEXWQl/eeihzBQafrRv
         A0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758019560; x=1758624360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjrnXJtaUGoRrY4sA/QAMhII82BWLUeC+DqFsB4u81E=;
        b=aIQZ5msRH7v5LqB7WayEj8v3pvc4keaEnsESlUTK92fwbJ7zpnS34XYeU4312ICUDw
         2St1g97xLp9w2EDqspOEVVP7U66QzaOy8rT5fqgDWyAxgdecDQippXtBGhiFlHOI8XPj
         wFoh6zHcde0TTjjAllEvsNdFav6Ls2dTIQCexkfxkYCn0hQ5VumjT9RnabG2F0ybThbe
         pRoTNecmXCBNQrJL/LSMLWRAR/NFzP+faO1qymBdbQ0kWXam3LoMF9/46hm0jHla8Jh+
         tRj/0/fCViTERCL2Fei5MAWS18qO4l5GLveg4n8m45KMTFKpaRmwko2Ce77BGLx56UeK
         uY3A==
X-Forwarded-Encrypted: i=1; AJvYcCXMBxxlfqnq52z7Id8vkayGLot0OAcSuk4BjnZ8eW7YVllMz2YvuDUN3caETL7jbIeKAwhQFTKxMCk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSEATMM0xuY3nxdQsMho7iIfOu9J8feNnOKJUaVwfveDO2mvhR
	kut/vq+mXr9urZVCVwF2TPs91U4981T+m+NgKqYOJf7zLwTGojJE/jZC
X-Gm-Gg: ASbGnctea2ZmuQGeWwLrgdmgajjQ3NW2cRCKMY2f1kgXIOhjYiKQWa7K03Cn0OAFkki
	1RiqB6hr7ztmJGDUbvWTlNIbaReNf3EA0xLGBK3kdJbBw8oNeyV37FJ9lvHk8w/TrH9rgz+/g5c
	Hm5ZU+Jur/+9bkFmmvCoeLxl9Ia3og5nvH/dawOgc4oMekEeEg//mpzkCTXjbslRWvZ+vABPQig
	SNLD/bG/8xppSkXjDvyxbYDSf/Z9/KS7U05u3sCWBxD0OolXm9X6Yhacrmx3xqBffu8TS0H0L/p
	OFgJBiNt9/z/NRslDkfU9Drx1bEjKsqEi1dBvMvvSpLSQpWnF5rgkKZrqnW+KzmLyUEPn4RCHdt
	znjv64lyCfR3FggCj2JgyL1RX7hwhGp0LjAWEXDsjVY0=
X-Google-Smtp-Source: AGHT+IGoDQJoZxFXsWv5pRY0VZmVoe0AQ5fhDiO8AIYZ/RsJtBii1vkvo1eebaDW9L15Dm5Mh8rJ+w==
X-Received: by 2002:a05:6000:2282:b0:3d4:15a2:11e9 with SMTP id ffacd0b85a97d-3e765a35ee5mr12529163f8f.61.1758019559841;
        Tue, 16 Sep 2025 03:45:59 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e84de17f9bsm14647160f8f.49.2025.09.16.03.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:45:59 -0700 (PDT)
Date: Tue, 16 Sep 2025 12:45:57 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: Jorge Marques <jorge.marques@analog.com>, Frank Li <Frank.Li@nxp.com>, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: adi: fix header location
Message-ID: <jmfzuymhxvxnjwk73nmsfaaadnmy5uy4uanh4jegwgdvgfr22e@2iqtifbsgxmu>
References: <20250916091252.39265-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250916091252.39265-1-alexandre.belloni@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_034602_363478_72608C7D 
X-CRM114-Status: GOOD (  14.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, Sep 16, 2025 at 11:12:51AM +0200, alexandre.belloni@bootlin.com wrote:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> The adi-axi-common header has been moved to the upper directory.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Jorge Marques <jorge.marques@analog.com>

  Commit: 2ad26b7bedcd4941e6dafa1851e2054b369b9d25
  Link: https://lore.kernel.org/r/20250519-dev-axi-clkgen-limits-v6-3-bc4b3b61d1d4@analog.com

> ---
>  drivers/i3c/master/adi-i3c-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> index 162f9eed39aa..18597ba1f1c3 100644
> --- a/drivers/i3c/master/adi-i3c-master.c
> +++ b/drivers/i3c/master/adi-i3c-master.c
> @@ -10,7 +10,7 @@
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/errno.h>
> -#include <linux/fpga/adi-axi-common.h>
> +#include <linux/adi-axi-common.h>
>  #include <linux/i3c/master.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> -- 
> 2.51.0
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
