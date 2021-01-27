Return-Path: <SRS0=hiEF=G6=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAAFDC4332B
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Jan 2021 15:28:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDD702076B
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Jan 2021 15:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDD702076B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xx6KLwoZpNTze469+ysp0l0vx3oebImfAILCs1kXaBw=; b=Ge/45EHl+vxHijqKEunUiPUDi
	w0kmID9z5k/bDVv8fcqd2d1kd+LBJN5gduebL7dBtPkGhcygj54mRjYtODGyXSsavVckeFb3xb8BK
	6FUjH+tu6nUCjKKjee/iwob4bzfq3BNL4Oj86dO4FOn/Ce1uihxEjlgdyIXDLu7RcAK7UCayiWZM8
	Ql9QOt1OcOoO4fitVVlcWwFR17amRhqZ936JHInwIROPm2tHnZYPV1ReeCUxEB8mtR38sL3zZZfD0
	qUoRTF1C959yBfKfA4Z2/LefPxDvXQ3NE9neKKSZn9/JloDl22esXde7Fz0bJuKZz2HOt1x0EBOb0
	et1AZtXjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4mju-0001LM-Sx; Wed, 27 Jan 2021 15:28:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4mjs-0003b1-3b
 for linux-i3c@merlin.infradead.org; Wed, 27 Jan 2021 15:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
 Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xgrneNriPGg5dEDkiPR8ZwISgtJKtfMcVRnE4vAzyu4=; b=UGLDMzFFaZPxdpo1lt707Njs5G
 Jt4fdm8PHGLkrhQDFj58isANB3QNylBLFaC3eAhiStekXhKEUIUwwnxqtJSE/yrQn4zt14KlljSfX
 XAqr60esJVxholIe30yefevuqlPwdhHfAuPXV2icel3D05Rt1MvC+Keyg6bwmaO9nW6316+4pMlyK
 wfvCu4q5PrSnje3D8Umx8u9OCg+jvK6kGr2dQ9+JZemsUjY6KoDKQMDbrPNcuy030/6550jTupIo5
 ViZLG+igRN10N7JSZnUSNB0dwEpBZ+wwYAe7tQaJuW2qyzNqu4cHhd1blUt1vt6uv2Iqr+Gi1pBqi
 7rPYEiQw==;
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1l4lfk-0076yP-Hb
 for linux-i3c@lists.infradead.org; Wed, 27 Jan 2021 14:20:05 +0000
Received: by mail-qk1-x732.google.com with SMTP id a7so1757037qkb.13
 for <linux-i3c@lists.infradead.org>; Wed, 27 Jan 2021 06:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=xgrneNriPGg5dEDkiPR8ZwISgtJKtfMcVRnE4vAzyu4=;
 b=wsQpJbJwrnFBoofLk8KXpG+FD0EsmUkaxc4Nylsr12F3MOSm6NxWF2XzSem3idA4uG
 HhT6VmYppovxpA87VSfZIlfh8PGpg2jxktYW5TYS7NAgWKYDXHHHvpl4qNB42RJZRarA
 XqPi1MtMU0c/mu1uPLcgZwLYNWXzNUmglZJF1wRjfVdZhAMVFXPDUjo+bLg94Q6/TA0o
 G+LDsA5iLu9u6TW5JhQok08pf+hMC93j6MhLG/7CxdCOgqy+hPX7AJLayW3630I7NtAj
 t5wfyEuneHNfWMcQw4Tm6BdKnv+pTNDdvI6ev3NZtE+m5372q1sWKiDvGLIYDjHo8bUX
 9ZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=xgrneNriPGg5dEDkiPR8ZwISgtJKtfMcVRnE4vAzyu4=;
 b=Qfw8h+bOfiyBTQMkm+lC/Kst6kwwgx5z8Fzh6E/mBXWXHl9jIBKTdEcy2qh5R2/LTM
 jfmxzARUoqE6W/FdljjJGK35raqXD0NysZIpHwlgn0DNN7bA87qno5C5X+uimA32TR45
 JyVcy/oM8pv+d3Ai2Axig4letGj/LM3hbm5/6w3yT1ucTUNK/ItSlB71LhzENQct0l0s
 T1zyLZDLn+VMNo3Miuz47FWWSt6SYkdh28XX+puROv3Rwqn8BiMS8vDjNy0OmvyEuplO
 /eaxYXpOAZ34CO0ytWkD4uMb73kimExHuUQKxrhav97qTBrNxudR8k7tV10kljIjoBg4
 8qcA==
X-Gm-Message-State: AOAM530m3OluWuu9sYJSsHqsEQ3nrM7rSvWjS9XD7nB0q80VTxS8P/w8
 QNkeha4dBvpat8Upwz1UONNFfw==
X-Google-Smtp-Source: ABdhPJzWsQ7wMz4QVnx1NG/c5ml7ukIOD1gcs+yReAwLA/kWnmTpR8wmdkxFMxE1HgVYM6/wzMexqg==
X-Received: by 2002:a37:59c5:: with SMTP id
 n188mr10787922qkb.170.1611757059133; 
 Wed, 27 Jan 2021 06:17:39 -0800 (PST)
Received: from xanadu.home (modemcable076.50-203-24.mc.videotron.ca.
 [24.203.50.76])
 by smtp.gmail.com with ESMTPSA id q25sm1262249qkq.32.2021.01.27.06.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 06:17:37 -0800 (PST)
Date: Wed, 27 Jan 2021 09:17:36 -0500 (EST)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Gow <davidgow@google.com>
Subject: Re: [PATCH] i3c/master/mipi-i3c-hci: Specify HAS_IOMEM dependency
In-Reply-To: <20210127040636.1535722-1-davidgow@google.com>
Message-ID: <r830819p-o571-4nqo-qr36-15863r4791q@onlyvoer.pbz>
References: <20210127040636.1535722-1-davidgow@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_142005_779872_7584EF10 
X-CRM114-Status: GOOD (  18.47  )
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

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
