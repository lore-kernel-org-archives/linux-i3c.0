Return-Path: <SRS0=Xn1S=HD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913D1C433E0
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Feb 2021 16:18:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80ED464E9B
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Feb 2021 16:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80ED464E9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z07xV+G4mJTAWUBXWXUfPJP+2nzb9ifFt+GvPkRE1SY=; b=HvFaYYmfvrKWkojwWeqREHXTp
	04n83p/izGOaFWBzOooJuhQJUbCfGS6nik8Z9bIUCAEPfqWpGNPL4Nmp+A5tYtiH6DxMYtoJcyJ1r
	dAnr/0i3OOVti8J9MI18CmpxqTmd+G2om8G4CUg5fCwBfjmV8Ql0ZlczBG4fz/58BpuiVj6RYc3L7
	gYbmJNLCT1kW2gBSkVx4zH2d4QVCRGQx8IpCpVbqT0it/H/fg+MflZyQhuzFJwdGrqgdKAavADcCQ
	dEb/b0S7B2NqfaUFx+KbA15pEiv7o8aKcmKwM3ZlkneYQ7x0eh4RqDd2YNJjvqPdAAoQnLt1aFz3V
	EoltDvMoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6buW-00006t-Hq; Mon, 01 Feb 2021 16:18:44 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6buT-000066-7z
 for linux-i3c@lists.infradead.org; Mon, 01 Feb 2021 16:18:42 +0000
Received: by mail-qk1-x72c.google.com with SMTP id l27so16748881qki.9
 for <linux-i3c@lists.infradead.org>; Mon, 01 Feb 2021 08:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=PZPy7UuU1m89CqE6Ujqo89pfGymoz3TNkAhBIsQ4ftk=;
 b=b50IC0A7+YwOShtI3lVdvYnTMyg/RIdFTJK6qX5h/7VICPpSxnO+EJoYFvMopauEti
 bOlUJTMuYE6lPDWe9klcC8QwL//wXYTJsnwCGEihqAK2qw6MpHnF2brWJEMtI44vcP3I
 mqGjFf/+l5lhj1+NmhhG8roIrx1WbchEbLM3nwpTJqQCu7wna6sYziJ2FQ3SWN+EhvOT
 8/nEQLcsl34JXeRUGI2MhSUZnlGEmtobJm58ugBZfG+dq1GhgJfu9pLpbmwEXsdos7ju
 3Z5FVm+IXMNBs1pVlzyvmZdRK1ja8SNZJPA8HzjlJwIkPWSZ1/ExOdEC3jSBcID5BKlW
 iXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=PZPy7UuU1m89CqE6Ujqo89pfGymoz3TNkAhBIsQ4ftk=;
 b=ff+f+CXyMre8j+4EU8OLsGuDJ2ZYaRQQ3HC63uMxLBuWuLaMwlMjn2PbaDTqcjQfFu
 xmkhoqBsY29X7t2d6GecRM/iN56ZxnQ3GePtUeRbBqjbjigLCby13jTJ2ac5UBwplLoX
 iyvbsAGEO1ZB04NXSUi7YiPOi6vY4pzGmnFePm0j5E3stqxdRUeXP1hh8oLctUP7HqYt
 r2KAElIDUQ9XBKhHFMspoPowJeZbcq5jkAQ4u4YJAhVTm1uwG23XVltRpYNpwgp+y4gd
 RVbB7OlZwB7iEXaVSerMqvd45g3foXdP5RC1agfSQ/jWDf2DSeMeti18K3udQ5qN8NW9
 N3LQ==
X-Gm-Message-State: AOAM531bQU2RegLHEaYc8QEQ8lQjB//Z/dxJIqAqzb5fjKUcXxOI5LEd
 1YKctwLLO64l+zo9hmDXZaZJaw==
X-Google-Smtp-Source: ABdhPJxCgBtVnjR4SVBuGufGMJ+u1XFal/gdEYmXcjkC/kITEPyeUp1hs6S3ABt09dQ2cxSGKo84BA==
X-Received: by 2002:a37:458c:: with SMTP id
 s134mr17213587qka.142.1612196318177; 
 Mon, 01 Feb 2021 08:18:38 -0800 (PST)
Received: from xanadu.home (modemcable076.50-203-24.mc.videotron.ca.
 [24.203.50.76])
 by smtp.gmail.com with ESMTPSA id e5sm14189013qtp.86.2021.02.01.08.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 08:18:37 -0800 (PST)
Date: Mon, 1 Feb 2021 11:18:37 -0500 (EST)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Gow <davidgow@google.com>
Subject: Re: [PATCH] i3c/master/mipi-i3c-hci: Specify HAS_IOMEM dependency
In-Reply-To: <20210127040636.1535722-1-davidgow@google.com>
Message-ID: <9s6n963q-poro-6qnq-q510-83rr59785on@onlyvoer.pbz>
References: <20210127040636.1535722-1-davidgow@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_111841_345045_78DA951C 
X-CRM114-Status: GOOD (  20.84  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, 26 Jan 2021, David Gow wrote:

> The MIPI i3c HCI driver makes use of IOMEM functions like
> devm_platform_ioremap_resource(), which are only available if
> CONFIG_HAS_IOMEM is defined.
> 
> This causes the driver to be enabled under make ARCH=um allyesconfig,
> even though it won't build.
> 
> By adding a dependency on HAS_IOMEM, the driver will not be enabled on
> architectures which don't support it.
> 
> Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
> Signed-off-by: David Gow <davidgow@google.com>

Acked-by: Nicolas Pitre <npitre@baylibre.com>


> ---
>  drivers/i3c/master/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> index e68f15f4b4d0..afff0e2320f7 100644
> --- a/drivers/i3c/master/Kconfig
> +++ b/drivers/i3c/master/Kconfig
> @@ -25,6 +25,7 @@ config DW_I3C_MASTER
>  config MIPI_I3C_HCI
>  	tristate "MIPI I3C Host Controller Interface driver (EXPERIMENTAL)"
>  	depends on I3C
> +	depends on HAS_IOMEM
>  	help
>  	  Support for hardware following the MIPI Aliance's I3C Host Controller
>  	  Interface specification.
> -- 
> 2.30.0.280.ga3ce27912f-goog
> 
> 
> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
