Return-Path: <SRS0=CA3g=N4=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A9CC433F5
	for <linux-i3c@archiver.kernel.org>; Mon,  6 Sep 2021 04:30:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6139560EE1
	for <linux-i3c@archiver.kernel.org>; Mon,  6 Sep 2021 04:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6139560EE1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HnO1ETN53ddkA5i5h3nNTq0Y9+8TXwbWzD1g80nVTUg=; b=gG9MDcDSxgTW5f
	hOplCXkqyccSqW2SOBJrRE+NMvlapCm5gp+7PR2EGrT37BvdBFiHyYc/MfePV7YkVBcpff4RbA0bd
	zVFqgEQxtCRxnScZTTqM+oxn1cQVk09Xt5YhI1eStgNlyR3tKROcs58Pw3FLaVQ6hDf+TL0wxPzRl
	IiSXY62WCKPO58Wr0k4ysqGkmY3V35G0rmHIVPRDga3sm18aRbeh7sb7GtxUZkv/sCygsxD794LQx
	nw0+IngQ5yrG7ICUwEP0pC2dkASGt7zWxVXTFmCt16D9qAWoBFkPXmndWLqz6D8A80HS+2VbfAn+0
	7OVCV1Khps5tX9SdSkvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mN6H2-00HGBM-Gx; Mon, 06 Sep 2021 04:30:24 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mN6Gy-00HGAs-94
 for linux-i3c@lists.infradead.org; Mon, 06 Sep 2021 04:30:22 +0000
Received: by mail-qk1-x734.google.com with SMTP id m21so5746521qkm.13
 for <linux-i3c@lists.infradead.org>; Sun, 05 Sep 2021 21:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=vvzWX1VxxcUHUOP9/2aXTP+rW0zKame8C1AO3Rx+r/w=;
 b=rX0Ig+wxQ0/f+2fWW0QRafOX5QSukEZf7//CW++9MwHwR86AbsTnsIlIkTRtzNiDMw
 akc9m/xzr1AhQAzP7yp8tR89YwhFbOlUK4+ndREPhcYv5YLVrbo1SMPXKTEQdEILm0qc
 stC2AkixomaestdTIUTHLUxgUNHBBJlH0hOdYE3q9DSkGBHMbiZrU36aki1WJzzXtN8A
 FZ2/L8YLQ0LrAoJuHxVTnfSwkNpIA/mu6SGmF+rrh+31a4n/P6WvO0+W4U3AihCN2xrI
 117fdYDKmtGvuhdbIw3ueWCd9aJ9L/jQ6dbEBcRBVXi7Z0x44y9KmS1nKcQS86e0atns
 eAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=vvzWX1VxxcUHUOP9/2aXTP+rW0zKame8C1AO3Rx+r/w=;
 b=Y++tADcGG3IxnAx9nlL77FCEmg9qlUT70zAaGHrPfCXjmgmfg1opTYDHPpu4Sl7AM1
 aTv/Wdy03HqXAGKBmk8BJQ/cXUUd0si6IeXk2sDoDPqO3c3ZLsejJ9U8xEUYmyRrAIhU
 zgmX3vYMqK8bDrI5R3LP/Ng94BHeZ7UI8Y8JOD+GarlrCZtvBtBkJu/YythH4k6EiSZh
 xLYb2qQzbtS7aRH3ySgYTJsoY2L8uUeH6Ri5cOY4p9/BVO+2ju3pyAPRpKYKPP3Wb2Nh
 CSf2IEWfIS4SDBqvQIsg0hZWeIZaAXJR7xdF682HYtalmBw/nKd57zt0W09I3yUredAM
 5a5w==
X-Gm-Message-State: AOAM530XVCjT1pYvLm5+ROTRXs2fkZFCohEU/IeJq1Jf2dkczsdMYn9A
 yQZJOmpTi8DimarxiHu4ljQKNlbYfX6ePw==
X-Google-Smtp-Source: ABdhPJyjPDFmglS6I6kGROXHnrT+IRxprFjndS3w+nZ8O1VQ2ufB7xV4g3s87MHqaFdAJd1qHlx25w==
X-Received: by 2002:a37:6253:: with SMTP id w80mr9632856qkb.237.1630902618264; 
 Sun, 05 Sep 2021 21:30:18 -0700 (PDT)
Received: from xanadu.home (modemcable108.170-21-96.mc.videotron.ca.
 [96.21.170.108])
 by smtp.gmail.com with ESMTPSA id v24sm4587011qtq.17.2021.09.05.21.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 21:30:17 -0700 (PDT)
Date: Mon, 6 Sep 2021 00:30:16 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Len Baker <len.baker@gmx.com>
cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Kees Cook <keescook@chromium.org>, linux-i3c@lists.infradead.org, 
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c/master/mipi-i3c-hci: Prefer struct_size over open
 coded arithmetic
In-Reply-To: <20210905144054.5124-1-len.baker@gmx.com>
Message-ID: <65q16p1-7o22-pq77-38s8-9rr27p56s16n@onlyvoer.pbz>
References: <20210905144054.5124-1-len.baker@gmx.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210905_213020_429031_40291182 
X-CRM114-Status: GOOD (  18.66  )
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

On Sun, 5 Sep 2021, Len Baker wrote:

> As noted in the "Deprecated Interfaces, Language Features, Attributes,
> and Conventions" documentation [1], size calculations (especially
> multiplication) should not be performed in memory allocator (or similar)
> function arguments due to the risk of them overflowing. This could lead
> to values wrapping around and a smaller allocation being made than the
> caller was expecting. Using those allocations could lead to linear
> overflows of heap memory and other misbehaviors.
> 
> So, use the struct_size() helper to do the arithmetic instead of the
> argument "size + count * size" in the kzalloc() function.
> 
> [1] https://www.kernel.org/doc/html/v5.14/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments
> 
> Signed-off-by: Len Baker <len.baker@gmx.com>

Acked-by: Nicolas Pitre <npitre@baylibre.com>


> ---
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index af873a9be050..2990ac9eaade 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -223,7 +223,7 @@ static int hci_dma_init(struct i3c_hci *hci)
>  	}
>  	if (nr_rings > XFER_RINGS)
>  		nr_rings = XFER_RINGS;
> -	rings = kzalloc(sizeof(*rings) + nr_rings * sizeof(*rh), GFP_KERNEL);
> +	rings = kzalloc(struct_size(rings, headers, nr_rings), GFP_KERNEL);
>  	if (!rings)
>  		return -ENOMEM;
>  	hci->io_data = rings;
> --
> 2.25.1
> 
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
