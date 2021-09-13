Return-Path: <SRS0=JVui=OD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7C6C433F5
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Sep 2021 01:54:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C0A760FDA
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Sep 2021 01:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C0A760FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ybm+QJ3qheOdhAKnAF8FeewuykWSA8+svUNat2u8Wnw=; b=XWrrU5XQbmEwIq
	nL4sByKC1f0WKsIpPwpuXBGeFM1DE2HR4w+1E2a4n3E4j3+PTbIrQafVm8BY6lUP0kfgvzI4AToC/
	K4mgPgxH+ZDo0VrqKXRCfsrAZ46ooMH0vgA01XC/2J6zKgk1baeH3WFlxp0ZdI4RwQNAxzWpn7p/o
	4CoFR/HF0BP2xAnNFhBY6UMDgfIJXVBDBFh/bkm+qwhxjQYJLBqEhzZBKCdBYH/q+KNObYF/G3FIc
	yi8bYTI95nOTrYTLFtzMBMs6nSNQgLV3HMZHqWzUBoHO4UBUy8goHcwg1rO04IeMOmZxW2TvQ8pIJ
	59Ztt+VIPGNDopa5mUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPbAd-00081u-12; Mon, 13 Sep 2021 01:54:07 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPbAZ-00081X-3l
 for linux-i3c@lists.infradead.org; Mon, 13 Sep 2021 01:54:05 +0000
Received: by mail-qk1-x72d.google.com with SMTP id p4so8913197qki.3
 for <linux-i3c@lists.infradead.org>; Sun, 12 Sep 2021 18:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=+PfhPG9W/lVy5ramZlbvodr40rH8UAo/+DD6H/rYHgU=;
 b=RRw5BTtqAvrwS9+emiwJjMqd2O39pRgO3Zd3l5FJNxz3o2Hrm6wuIgWuEvYJeGLuiS
 NZDi+GQt2jNdsAoTzmoVu+FBqU1KrxU5cPyzWnCm0p3waCNglVKYCvf4rVZLr5V5Inzu
 CBRk4OaF1GT+b4FFidVfQieGY21560FxDis9VeeXvFJ+WhBxzwqxGl6FoqVbBt0ADvwz
 7KPF2QRTlOjt5dXmG9xPG4IgtGnumwCKO9Kz1I5k17CNhBmAjXFV+EkN+Z9FDDQNtE2y
 RJOFMketDAz/+GIDL4v7ZhxBm2Firm1lrroKJ98UiuVsq/mTQe2/+jsZY7EY79PBW5fi
 ucwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=+PfhPG9W/lVy5ramZlbvodr40rH8UAo/+DD6H/rYHgU=;
 b=SW1amwOj6UB/9HeHKj60pU+ZWMTL05Fsm0Qn4piqKhzjegpBfTpxkhqvUwGLAHy84+
 p434HALFyLsIkEb1RJOHqJSyMeLP1A2Soi+/YBKLjXnE9Iaj/uCsi4o9SNkMBY29W9O9
 ZWe/IdUXRh3MDAxmEgjdIsDrVg16ySuh9NIY/PrAHT9JTE7aFTIIeUrVgcu5gpDQJQVy
 otnn4ExOcCssMJ8cRCv0jRkll1eHMAaRvKwqgu7WfeHbk0RMKYteQkHXHT6m1QL8wNvr
 OA6ok/AUG1T13DZ2wX7OW8Aacfd7Q9w56iHWRuzlzfyAJF4phjfyht8mTYbrCbygb3ON
 qhtQ==
X-Gm-Message-State: AOAM530Ct4bidV/M4I3++QnikiRsKb2Ff6PrJpfND+FQoKRpQwWzMexR
 /C81fcVChNkodXZ4txDahsIC2w==
X-Google-Smtp-Source: ABdhPJz1tPyRLt5iDx3vqQcqvJmS7pHTx2yQurIdV5JfgES/R1rDULM39SqHER96PakPtfNvMl/11w==
X-Received: by 2002:a05:620a:1403:: with SMTP id
 d3mr7747441qkj.67.1631498041280; 
 Sun, 12 Sep 2021 18:54:01 -0700 (PDT)
Received: from xanadu.home (modemcable108.170-21-96.mc.videotron.ca.
 [96.21.170.108])
 by smtp.gmail.com with ESMTPSA id t188sm4412807qkf.22.2021.09.12.18.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 18:54:01 -0700 (PDT)
Date: Sun, 12 Sep 2021 21:54:00 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Len Baker <len.baker@gmx.com>
cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Kees Cook <keescook@chromium.org>, linux-i3c@lists.infradead.org, 
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c/master/mipi-i3c-hci: Prefer kcalloc over open coded
 arithmetic
In-Reply-To: <20210912155135.7541-1-len.baker@gmx.com>
Message-ID: <0611r11-rsq7-2n9-n834-9o31rq8qo737@onlyvoer.pbz>
References: <20210912155135.7541-1-len.baker@gmx.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_185403_241330_7EF571BF 
X-CRM114-Status: GOOD (  19.46  )
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

On Sun, 12 Sep 2021, Len Baker wrote:

> As noted in the "Deprecated Interfaces, Language Features, Attributes,
> and Conventions" documentation [1], size calculations (especially
> multiplication) should not be performed in memory allocator (or similar)
> function arguments due to the risk of them overflowing. This could lead
> to values wrapping around and a smaller allocation being made than the
> caller was expecting. Using those allocations could lead to linear
> overflows of heap memory and other misbehaviors.
> 
> So, use the purpose specific kcalloc() function instead of the argument
> size * count in the kzalloc() function.
> 
> [1] https://www.kernel.org/doc/html/v5.14/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments
> 
> Signed-off-by: Len Baker <len.baker@gmx.com>

Acked-by: Nicolas Pitre <npitre@baylibre.com>

> ---
>  drivers/i3c/master/mipi-i3c-hci/hci.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 80beb1d5be8f..f109923f6c3f 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -98,7 +98,7 @@ struct hci_xfer {
> 
>  static inline struct hci_xfer *hci_alloc_xfer(unsigned int n)
>  {
> -	return kzalloc(sizeof(struct hci_xfer) * n, GFP_KERNEL);
> +	return kcalloc(n, sizeof(struct hci_xfer), GFP_KERNEL);
>  }
> 
>  static inline void hci_free_xfer(struct hci_xfer *xfer, unsigned int n)
> --
> 2.25.1
> 
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
