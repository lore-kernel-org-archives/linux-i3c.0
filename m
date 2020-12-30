Return-Path: <SRS0=m2/A=GC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83789C433E0
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Dec 2020 21:24:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90687206D5
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Dec 2020 21:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90687206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CN1+3QQEZfh4FzBIPscbn4eF9jyHyU3zLiE5VC2fLVA=; b=LQt4VadoXCUpaMgXhJF2AH7EE
	KVC2rr9FSZo2NEkBoCE4K5bDRRq+m0o5hJR0hIzRBHePBzPNjRAWteRPQlONfUdsx6AkIcH+MD5sQ
	eKzcjpQ/+7XBATPEUooih9nEwAmh9ttlpI7ofB4E0wyNAoWEKfliwvcgS0XZGJlaxBNChLsPuTBeX
	BJZiTBfzaevKFPextdSwTo+QXdAIOSgstNl6vHLRyWRYxn4e8qL8rRG2gXOGvh7lyKWVsP0etm/Is
	itji2ZchQ2Q0yANTw+831lMU8hib5qkqNPgKiN3XPCMb/31SfPvkO88D39+bJvc+Bm0HYH1KbpJ/G
	CZ4krp+nA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuiww-00037Y-Nr; Wed, 30 Dec 2020 21:24:06 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuiwu-00037A-5n
 for linux-i3c@lists.infradead.org; Wed, 30 Dec 2020 21:24:05 +0000
Received: by mail-qt1-x835.google.com with SMTP id z20so11798928qtq.3
 for <linux-i3c@lists.infradead.org>; Wed, 30 Dec 2020 13:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=3JIH2KfcSRonErtkZqTRpOudCvLIbGBt7ERBPB2Wmk8=;
 b=gKH9KAv4kTyRe1sQX4bdLJ7yjd61FUJfS3pYh6ATPN93cHdzh1gMAL8KZ6QGgPp/aO
 DY7C+keOpVMkkmBEkejPsOhzrvEShk0WbqoppjFzfcHbKjjsjnnUBFu3KzKBLYK78E3U
 ELRYE1pv/Uzeiw621HlppDSoUj9IKg0A1Z/U/GhkCpsrcBryoOXvnMKKKHZwrycDzK9J
 no6uvbxY5aOgXdUf+6CFQ4hNsUgniTRYhIHlUUnmwtSpNQ5dwG75Odo2jnuL5JSve8q/
 orQogFYTOzFw8WrJpZ9NRKLY2XUptCfNaHYfQ9uN6LE0pub5GvpraCbIcDDMBhVk90p5
 AUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=3JIH2KfcSRonErtkZqTRpOudCvLIbGBt7ERBPB2Wmk8=;
 b=dJUF/ttO/JTByJ3fEe2gG0VlYZSogdIRiwvCVvaw0VqnstQr//Ne/6Yj1zZGhdmfR5
 tuIHhKWAaV7ArOlNejVZAXmtN1V1krfPLAgZtG9QCjHbrVG1vwiBaPAu+SaYOxEAUX1j
 aVtm2BV/JWLH4xHVm3dbywz1tKag5ZmOQdpAqDp2VD1GYhs/pVuyNVA4IShHHxB+O/6R
 46f7ZJLu3NzMKmgrlKAXoA4K663vC3tsoEfEQNT5mLVhNy52MEx84LneZbI/jl0saFtd
 LV9If6xS/nfndzS8ECGQ8AeG2/Lf2jnR5dhMrL1eqAbMkdWxaAqS2outxrkXhSJ5a+lY
 oC4Q==
X-Gm-Message-State: AOAM5320X7ZhDAwM7ivTrtHW8L+/7oVwhLIu04gmg67kq/RHLY2C5iOg
 gaD88YOtSA2MmRNNT256jY0otw==
X-Google-Smtp-Source: ABdhPJynsmqHlAfiV8grdxXDmiM3GLqmENngmdB/r58gJRmAD6YxfPcRFo6pthzPvBPTcASpnu76Gg==
X-Received: by 2002:aed:2827:: with SMTP id r36mr54058903qtd.337.1609363438447; 
 Wed, 30 Dec 2020 13:23:58 -0800 (PST)
Received: from xanadu.home (modemcable076.50-203-24.mc.videotron.ca.
 [24.203.50.76])
 by smtp.gmail.com with ESMTPSA id u4sm27590039qtv.49.2020.12.30.13.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Dec 2020 13:23:57 -0800 (PST)
Date: Wed, 30 Dec 2020 16:23:56 -0500 (EST)
From: Nicolas Pitre <npitre@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] i3c/master/mipi-i3c-hci: re-fix __maybe_unused attribute
In-Reply-To: <20201230154304.598900-1-arnd@kernel.org>
Message-ID: <orno9ppp-no44-4rp5-s6-58n46rsps045@onlyvoer.pbz>
References: <20201230154304.598900-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_162404_337893_109E89A3 
X-CRM114-Status: GOOD (  18.67  )
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
 Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-i3c@lists.infradead.org,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, 30 Dec 2020, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang warns because the added __maybe_unused attribute is in
> the wrong place:
> 
> drivers/i3c/master/mipi-i3c-hci/core.c:780:21: error: attribute declaration must precede definition [-Werror,-Wignored-attributes]
> static const struct __maybe_unused of_device_id i3c_hci_of_match[] = {
>                     ^
> include/linux/compiler_attributes.h:267:56: note: expanded
> 
> Fixes: 95393f3e07ab ("i3c/master/mipi-i3c-hci: quiet maybe-unused variable warning")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Nicolas Pitre <npitre@baylibre.com>

This might be the 3rd patch from 3 different people fixing the same 
thing. Looks like I3C maintainer is on vacation. Please feel free to 
send this trivial fix upstream some other way.

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
> -- 
> 2.29.2
> 
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
