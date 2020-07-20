Return-Path: <SRS0=R3Fl=A7=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E531BC433E1
	for <linux-i3c@archiver.kernel.org>; Mon, 20 Jul 2020 22:23:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6B8A206E9
	for <linux-i3c@archiver.kernel.org>; Mon, 20 Jul 2020 22:23:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hXKXQyAD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6B8A206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eJ1Yjh4VCzycUcMaerilgEirALsg88gD7WYhJucple0=; b=hXKXQyADApwOfXCX7fwI4mWnA
	O3e2kZBdgz69Vl/MzFW/uHVFrojCEytr+qspkBrUa9o57DRi0vmJjZN5F8tIJg0TjplQsFMNm7aRi
	FKhYYy/GTS8YRrgeSZ95n4SC6P51BALj3y3WdS5aAe6CylOpZuu3yFqq1CKPJFWQ+tGT3QdIpJFra
	cXOkW+INeujJlwceHHFpS5jH123ZSc6/CqXFgqRD6cUlW5y2y4HNeXa+Lc/JNqqbZs1qK+gMiWeNl
	hkyu1t7rNu6Tjhf0CEJzcSA7KkS2U4ZDjcmAzbVGGhn4HhvkaUX7OnR+LaLigXK7O1bvtsMji5Esc
	1uBBXUQsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxeBn-0002Eg-6j
	for linux-i3c@archiver.kernel.org; Mon, 20 Jul 2020 22:23:15 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxeBi-0002Ce-LV
 for linux-i3c@lists.infradead.org; Mon, 20 Jul 2020 22:23:13 +0000
Received: by mail-io1-f67.google.com with SMTP id d18so19325021ion.0
 for <linux-i3c@lists.infradead.org>; Mon, 20 Jul 2020 15:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+CUr9tHT5PVLHwGkmwIOpkcnunWXimE18rjDQkGp1Yk=;
 b=Ht4rL/Wfw9nOaGB4cSLvJbJan3JZfSZO3aYfVhHWYDRWKcXZsDRkDt6xFaVYEVUlOV
 KTA0tqAottZck9ZCiWlhqBGnJOy2NF20eamFYQX4M5J15CB6+tZ6V8mLxpaJy/yPvlG9
 oCuya0dGsmT1w+5bf+Eo0rn7XZzLK14Nq5HfrDjAQVOLmnmbqWc5gOonSMpuHWzT/L+d
 GhSz0lu5byzKwBbUARBGyDDtiJblqaH4iui4tJDtCrHHakKg628rnjKl6cwRmhcWluLC
 pj4ofEdKM4b/3O9gl77Pc2Y5zw+WEjTtj1nyo2l1J+XxlQdelqGpil7FeY+hGpeoi91g
 VAHA==
X-Gm-Message-State: AOAM531/eO7lPoNA1V7Re2KpZO38uS/J1T5zeovw9c1BAB2+lHFZSp36
 i4i8rbwQmkgo+/kgs21LYQ==
X-Google-Smtp-Source: ABdhPJwllR6kKvpNlj5U5ToaaUpZ/6dIW7JrJ1q8wXwbwU6yDnrnrQ4MzKOwoZKQo+WbuWg/9TAoaw==
X-Received: by 2002:a05:6638:1495:: with SMTP id
 j21mr3018281jak.136.1595283790071; 
 Mon, 20 Jul 2020 15:23:10 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id b14sm9767511ilg.86.2020.07.20.15.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 15:23:09 -0700 (PDT)
Received: (nullmailer pid 3057835 invoked by uid 1000);
 Mon, 20 Jul 2020 22:23:07 -0000
Date: Mon, 20 Jul 2020 16:23:07 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/4] dt-bindings: Add vendor prefix for Silvaco
Message-ID: <20200720222307.GA3056749@bogus>
References: <20200709080159.2178-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709080159.2178-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_182310_776475_BB222B1B 
X-CRM114-Status: GOOD (  12.09  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 Rajeev Huralikoppi <rajeev.huralikoppi@silvaco.com>,
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-i3c@lists.infradead.org,
 Conor Culhane <conor.culhane@silvaco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, Jul 09, 2020 at 10:01:56AM +0200, Miquel Raynal wrote:
> Silvaco, Inc. is an EDA provider of software tools used for process
> and device development and for analog/mixed-signal, power IC and
> memory design [1].
> 
> [1] https://www.silvaco.com/company/profile/profile.html
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 9aeab66be85f..5933966db783 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1004,6 +1004,8 @@ patternProperties:
>      description: Shenzhen Sunchip Technology Co., Ltd
>    "^SUNW,.*":
>      description: Sun Microsystems, Inc
> +  "^svc,.*":

Why not 'silvaco'?

> +    description: Silvaco, Inc.
>    "^swir,.*":
>      description: Sierra Wireless
>    "^syna,.*":
> -- 
> 2.20.1
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
