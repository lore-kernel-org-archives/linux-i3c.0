Return-Path: <SRS0=LJxM=F2=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29856C433DB
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Dec 2020 03:13:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4799A22B2D
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Dec 2020 03:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4799A22B2D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o+opc97swd9bV5UPNCPFO9qYSZniIDAvft2gB4rU9gM=; b=ZJaCkV/crLUuDQH7pWq6M+Ti7
	kp5Iq7SQdSAd9A2AzARR7FMM/t+5dnQPS7w8torfLk1ck1ypos9O7HO4Wvl+NfdXd/wzCEVLw0jsx
	orFO/+gWZ0Usiylzk5/hyfujiNekxjRT6i5dL4y5x6Rj9Jq5at4eVXYu/Wh2nqQWDBAaRpdpWfnUi
	B+QBEeOZmCbayoXdLZ5VhS8oTOKx8ARVqVMXB7VFM/JZZL34kragzNR1I+kqzhl3YEa7cl7wvsAgD
	sM8LcGwKoefnAZ9SBmg/qiB7IaN/ivS7AmPQgqrxHvXS9f9xmTXKN2mdzlrTwQoa4J2mqVUKqQb8F
	lLWoVDh+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krY6o-0001ch-0X; Tue, 22 Dec 2020 03:13:10 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krY6k-0001bt-Vh
 for linux-i3c@lists.infradead.org; Tue, 22 Dec 2020 03:13:08 +0000
Received: by mail-qk1-x72d.google.com with SMTP id 143so10810296qke.10
 for <linux-i3c@lists.infradead.org>; Mon, 21 Dec 2020 19:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=m05zgiVp7vEyQC1XJrHfLcHgUliHm1rlFtZRMu57ZTY=;
 b=DrCYH2SJ9+T/fq+owxPY5/xY7kbiAWDSFkNPzFhLDl9xtPVRGE2JqP9thJKJ1L0V1r
 Jd+HZ7Oaq8KegpckZov+nPsI2Bqrf+pfrZ+9yjBOLHt+Y5qwHRYTinkQdVd8OSAqZRUF
 zpZTZLa+/mlR9xrRSxPbn09yOLixGRMHwNVIfYjIzKmu7uF8UehWjMTs1MgQbLbpAmR9
 3t15F6SzGy6EBcKI/PBgeo4jEUuRit/FImgzQVx5Ah3QzbQ/yX3faHVxA+J+R14sTLcn
 8GEMqTSnGxjqH60VjFhQhmgU5XJI6shJKCuQMn+fgJME16av5n60ixH5wpo9/v7u5ktD
 9WhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=m05zgiVp7vEyQC1XJrHfLcHgUliHm1rlFtZRMu57ZTY=;
 b=K50D85lqJ8/LLk0PWIguMRQuRktHx3WrAIkNrUOLMhqspSe/04MYz209vh9d3EIDwH
 ejt/f7QIER8jEl9umz8O74hkAzut6bmSb9KY87RCcuiqmf7DrNL8ScxssWmZ3VPKKERb
 6ytoa2VIi2xbNfzhq3svWPuY/b7nYzKWLMwP7bUScdTyDoX+uH7L9BNTDbjTrxJVhbO3
 o2s/2VMojv/fqM1AQuT3S2lpTTyuNvaoPcyGBWRe0ttQVpLFMxoidZBzJxuKd7FGAuMN
 QATF0S9YaTX7X7brg0aVCjSGGCfdi8b2B6aDT8teLHD4yHfYR7aRBk55xY7ySI6jM2vN
 T7eg==
X-Gm-Message-State: AOAM531m5MavkUBGBUsdKfzNEyWJw7nY/X2O49150w5Wl//XHemMNryI
 dOOh+M24d7ZmjDMTpLHcQDzq9g==
X-Google-Smtp-Source: ABdhPJxWptLxMFAJyPVKQHaofZKNgOqncOvoZhhaGhBgI+xsVtgSCXpubml5l6bSl97/zbU5tTt6Ig==
X-Received: by 2002:a37:a950:: with SMTP id s77mr20614114qke.122.1608606784306; 
 Mon, 21 Dec 2020 19:13:04 -0800 (PST)
Received: from xanadu.home (modemcable076.50-203-24.mc.videotron.ca.
 [24.203.50.76])
 by smtp.gmail.com with ESMTPSA id d84sm3976584qke.47.2020.12.21.19.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 19:13:03 -0800 (PST)
Date: Mon, 21 Dec 2020 22:13:02 -0500 (EST)
From: Nicolas Pitre <npitre@baylibre.com>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] i3c/master/mipi-i3c-hci: Fix position of __maybe_unused
 in i3c_hci_of_match
In-Reply-To: <20201222025931.3043480-1-natechancellor@gmail.com>
Message-ID: <4q7rono-ssrr-r53-2796-o6924496p0qo@onlyvoer.pbz>
References: <20201222025931.3043480-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_221307_132032_79C69175 
X-CRM114-Status: GOOD (  18.31  )
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
Cc: clang-built-linux@googlegroups.com,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 21 Dec 2020, Nathan Chancellor wrote:

> Clang warns:
> 
>  ../drivers/i3c/master/mipi-i3c-hci/core.c:780:21: warning: attribute
>  declaration must precede definition [-Wignored-attributes]
>  static const struct __maybe_unused of_device_id i3c_hci_of_match[] = {
>                      ^
>  ../include/linux/compiler_attributes.h:267:56: note: expanded from macro
>  '__maybe_unused'
>  #define __maybe_unused                  __attribute__((__unused__))
>                                                         ^
>  ../include/linux/mod_devicetable.h:262:8: note: previous definition is
>  here
>  struct of_device_id {
>         ^
> 1 warning generated.
> 
> 'struct of_device_id' should not be split, as it is a type. Move the
> __maybe_unused attribute after the static and const qualifiers so that
> there are no warnings about this variable, period.
> 
> Fixes: 95393f3e07ab ("i3c/master/mipi-i3c-hci: quiet maybe-unused variable warning")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1221
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Acked-by: Nicolas Pitre <npitre@baylibre.com>

> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 500abd27fb22..1b73647cc3b1 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -777,7 +777,7 @@ static int i3c_hci_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static const struct __maybe_unused of_device_id i3c_hci_of_match[] = {
> +static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
>  	{ .compatible = "mipi-i3c-hci", },
>  	{},
>  };
> 
> base-commit: 95393f3e07ab53855b91881692a4a5b52dcdc03c
> -- 
> 2.30.0.rc1
> 
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
