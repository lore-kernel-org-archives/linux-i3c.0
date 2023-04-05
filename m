Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2761FC76196
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Apr 2023 10:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OyKDcfXrMVTn5BwU1Eq0naNh87buELFM3UcLrz/U6lk=; b=L+TQBkyFtrU7gV
	Ui1gcrOUIVRm9/XrdwUE51IzZwXLQ1k/Odw94B0K95yfgOzXU1rclO3VpH9Hr8/vulclw2fWAiGmY
	DjC6yDHGa66rC58whJHEr3sSHEqsyT5oRhAwORTV0XOu7YPt7SumPvoIflvx96bI8/lPSW7RAUweN
	nwitV+KSFqwaf+Naw1yFZ7cOyoRGOmBu8jK5IbXkLzH7ERnqL2HFgjm7CQKM+PEgxUSq66jsO7Pl1
	IyQ4zEgJ6j6xapwFz0yTiLkWHyHHgVPaBp46dfkok2qfFJS8vQ9EFsN/2a0mgA5ZvUeIpYgIx3mhF
	yx1DgCYrfgV0DI8qfHWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkMc8-006yfb-29;
	Thu, 06 Apr 2023 10:13:08 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjsrt-003A8u-3D
	for linux-i3c@lists.infradead.org;
	Wed, 05 Apr 2023 02:27:27 +0000
Received: by mail-ed1-x532.google.com with SMTP id r11so137546456edd.5
        for <linux-i3c@lists.infradead.org>; Tue, 04 Apr 2023 19:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1680661643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ekLRONAV3iu188UdAUqO684iVj3t3gHxe82eFtPINe8=;
        b=SbHN9G0zkyzcxvxQTyyAp590Jl7BPZOt9M3EIVTSn9ZzPvNpAIBmLkDNGO4pZuyOBf
         RF6kWD4D54wt+ADRbSoJUCgzIzMAgBRXkwJ0m4zkIehgSw2ILCeVEaSiP+AR16Cc0/Zk
         iWzgzKxJRbdR2qEqoe2xuQKh2w+9MCIAjnAz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680661643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekLRONAV3iu188UdAUqO684iVj3t3gHxe82eFtPINe8=;
        b=v9UpPXuXKEiPzKt4FnGt6ybSbITMNVDNOtS0h058xh8glway/eRE/acstfQlBD0HwK
         uinFYuYQQrPP3aQ38YPzwHFO8+BrkJPL2DV9trdB1A3/YxzAvQ0Usmaf9Ka2p1HBn/bB
         OBQzNcTCV6NeUcAf6EQnk6Il65O6IqK+9ew8Qik3os48+ECuZocPo+gXxDgFWn4nW8bE
         ZNGD7V2N1Mq2yAL3OLzOJ7BVcgp1b5W4WP/5NN2VUKOloPYsFz2uiUqf/3PFfJTKqe7v
         rHTV+T+Z9TJMDFuuv9uE6p+3cZMuM/TiTSyfH4CZOOZpDiWc4AFJaDKnR/34qmCErLmq
         AISw==
X-Gm-Message-State: AAQBX9fIkViixMWKfGMh6aMX8OD1DgxxYj4IVbDxkk2NPpswN7K+PPcg
	2AFwxLwlWO8j1xXd6o8RXvlnG6vli64Ds5YUv+E=
X-Google-Smtp-Source: AKy350a/KKqRBHmNHc83g8awwbyBsyTHSAE9Qf6wAX3sCGKmumBmKvIKhJU8lcB6bcbt6NzzKGagXeaxogHAr1HSI7w=
X-Received: by 2002:a17:906:3393:b0:933:7658:8b44 with SMTP id
 v19-20020a170906339300b0093376588b44mr740870eja.15.1680661643386; Tue, 04 Apr
 2023 19:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680161823.git.jk@codeconstruct.com.au>
In-Reply-To: <cover.1680161823.git.jk@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 5 Apr 2023 02:27:11 +0000
Message-ID: <CACPK8Xf1xcOU57xsKbDSvgud-Z2i78RppffiyN78K6rrvrNmbw@mail.gmail.com>
Subject: Re: [PATCH 0/5] i3c: dw,ast2600: Add In-Band Interrupt support
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org, Matt Johnston <matt@codeconstruct.com.au>, 
	Vitor Soares <ivitro@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jack Chen <zenghuchen@google.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Dylan Hung <dylan_hung@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_192726_033871_81FCEEFD 
X-CRM114-Status: GOOD (  12.43  )
X-Mailman-Approved-At: Thu, 06 Apr 2023 03:13:07 -0700
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

On Thu, 30 Mar 2023 at 07:50, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> This series implements In-Band Interrupt (IBI) support for the ast2600
> i3c driver, by adding the required generic code in the dw driver, then
> enabling that (with a required hardware workaround) in the ast2600
> driver.
>
> As always: comments, queries etc. are most welcome.

I am not fluent in i3c but the changes look okay to me.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

>
> Cheers,
>
>
> Jeremy
>
> Jeremy Kerr (5):
>   i3c: dw: Create a generic fifo read function
>   i3c: dw: Turn DAT array entry into a struct
>   i3c: dw: Add support for in-band interrupts
>   i3c: dw: Add a platform facility for IBI PEC workarounds
>   i3c: ast2600: enable IBI support
>
>  drivers/i3c/master/ast2600-i3c-master.c |  21 ++
>  drivers/i3c/master/dw-i3c-master.c      | 336 ++++++++++++++++++++++--
>  drivers/i3c/master/dw-i3c-master.h      |  32 ++-
>  3 files changed, 370 insertions(+), 19 deletions(-)
>
> --
> 2.39.2
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
