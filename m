Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F37E7719E
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vXBBS0TrOff1AnLS5lD9B5rTragGgVD33FVnOr+lP7w=; b=v36SPmIM3DHhE+
	5wjb/zIfsMSPrkiLuR6cmPD0JoDS/ZB9MNYbDG+tD32MuU4Qoef2J4IL0+sIvVPCt0GpLj6WnydSi
	byVg+JjPRBnpCYBMlGs3l6+enktVwsJcH1AlFztPBh4JNN6NN1kFwBtV/Baiho+G5wIEpiTontNCW
	0sjpR6GcNachAaMsCsIHCUhWVFqJxaOWwMT3h4uy/S3+mi+zjRor4JbkCO6Q5A5vVeUSHzsBA6rus
	oqAz/FiW35V1WptXwD1HHOUDVWNWEojEkMmxupfO+YK6IvZCi40XKeIIUlukHZ8CI+4PSywH5brn4
	R9KySHF49sGCp6XjQWJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD2x-0000000F5Rm-28uj;
	Fri, 10 Jan 2025 11:19:23 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSxcQ-00000008bFS-3ygd
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jan 2025 12:14:36 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-436345cc17bso77328615e9.0
        for <linux-i3c@lists.infradead.org>; Wed, 01 Jan 2025 04:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735733672; x=1736338472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NckL+WNrluzGcUG/VFfOwqvmRvEaEEtyaw7AvBaHHi0=;
        b=Ry9ZjFp8LRxxwJsQg1oFIqLuuOx5RLCGUVu0cOqcj2OjksQnL/OEtWNfUgz88Y2O8x
         n10VQUmcnUdrzof2Zi8jGlsHsHXQf1oSrk+gcn9aSjGD9C1vAqXFwcukgzaMxSekmPPl
         q8pxkU2kcFycxD5zlCjBTePJakkr15M0D1Tu2iagiD4VjeZw8DKyjv/eAW87bxtzHZJI
         B9UvrqkY00ZsipCmP7ey6dtoq/6BzbubOSdYxNK7ptJ+QSGciv2eaYu7F2oXtqTYkBLq
         C6LTd942FDiiseuFYioynMuNfg5SlaU3kS+Z4JsoBU8COzfZiN6hbVtAPqAo3ovL13Hn
         8PCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735733672; x=1736338472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NckL+WNrluzGcUG/VFfOwqvmRvEaEEtyaw7AvBaHHi0=;
        b=oknaK46lbbg9mSa3aoX6e72ddaaC+b3cbrGJquGXtbbm0DKRQSW/X4vK6q+PmHpoJ5
         AZ9So5l7+5lXmAQjJogHvjCxxu9MXG6+y36OixFT4kSsc40E6vBC7bzKgok/w20bUvUT
         mD/pDr9oddPYzwdUF8X+2OG/v+6fcqlBYB/a0tMtDdC3cutorJBopIIs81SUqpN90ngk
         7P1R1dQFSDrZejKt/8n9iM3uw6k33d3W68/Zpy2IBPiJQnRMyKIdwCuoyBhKjQlKkZPe
         H2RoaKgbC/VBguWkK15MUky7gsBO3pg2tScguzquuiREdPSgTAJ2YsFXrrXmyCl5d+EE
         CxGQ==
X-Gm-Message-State: AOJu0YzUgvd/z35QWlgKB33qVB10kozUYW2yyN5sgZAFnOW9Z/vgRZG5
	4nEQuV7m2aG4OjMhAzVm9dXA0K2VXzYQI4mfg4jsSQ6Eff4CRZab
X-Gm-Gg: ASbGncu8cFLOjYtZZd2o1Z4yrV6OHZRZY4wq/ODDQV2kUwCAj18wYzjBtIsHnyBBGWS
	wuD6RQlabFiI27us5ZTcJatQ3AgwKeSBSvex0nA+mXAuR9t16CZzmu9Hjubv80kCAENBRRnYs7d
	RXbx8Kazqf2WRF2LMInJOISU2QkWQW4S+e20/Cr+qiIYjnwZ1RZoxOl+OQvxCvvyUviKlNjRzrg
	M2+gJS7BBpKthktJOX0nOYBGWTsprao+z4R8RR0dZ8VJUJqxoiTHgOBUSWhWdraClgBEuduUHyx
	SPD4Yc/uz+5DZ2C1RZIYJ6I=
X-Google-Smtp-Source: AGHT+IGfWjMYz1WvX4+BwJc8WyMd+k+9TXT4DGwNpNyApIAmqLHN1gK2fLzkAPC94lgoHZDfFuVLCg==
X-Received: by 2002:a05:600c:1ca7:b0:434:fe3c:c67c with SMTP id 5b1f17b1804b1-43668b5e201mr327201715e9.26.1735733672407;
        Wed, 01 Jan 2025 04:14:32 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8a6ab1sm36187403f8f.87.2025.01.01.04.14.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jan 2025 04:14:31 -0800 (PST)
Date: Wed, 1 Jan 2025 12:14:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RFT v2 4/5] i3c: mipi-i3c-hci: use get_parity8 helper
 instead of open coding it
Message-ID: <20250101121431.05d831c7@dsl-u17-10>
In-Reply-To: <20241229101234.2896-5-wsa+renesas@sang-engineering.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
	<20241229101234.2896-5-wsa+renesas@sang-engineering.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_041435_046655_2785AD35 
X-CRM114-Status: GOOD (  18.75  )
X-Mailman-Approved-At: Fri, 10 Jan 2025 03:19:21 -0800
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

On Sun, 29 Dec 2024 11:12:32 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> The kernel has now a generic helper for getting parity with easier to
> understand semantics. Make use of it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since v1:
> 
> * renamed from 'get_parity8' to 'parity8'
> * rebased to 6.13-rc4
> 
>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> index 47b9b4d4ed3f..85c4916972e4 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> @@ -40,15 +40,6 @@
>  #define dat_w0_write(i, v)	writel(v, hci->DAT_regs + (i) * 8)
>  #define dat_w1_write(i, v)	writel(v, hci->DAT_regs + (i) * 8 + 4)
>  
> -static inline bool dynaddr_parity(unsigned int addr)
> -{
> -	addr |= 1 << 7;
> -	addr += addr >> 4;
> -	addr += addr >> 2;
> -	addr += addr >> 1;
> -	return (addr & 1);
> -}
> -
>  static int hci_dat_v1_init(struct i3c_hci *hci)
>  {
>  	unsigned int dat_idx;
> @@ -123,7 +114,7 @@ static void hci_dat_v1_set_dynamic_addr(struct i3c_hci *hci,
>  	dat_w0 = dat_w0_read(dat_idx);
>  	dat_w0 &= ~(DAT_0_DYNAMIC_ADDRESS | DAT_0_DYNADDR_PARITY);
>  	dat_w0 |= FIELD_PREP(DAT_0_DYNAMIC_ADDRESS, address) |
> -		  (dynaddr_parity(address) ? DAT_0_DYNADDR_PARITY : 0);
> +		  (parity8(address) ? 0 : DAT_0_DYNADDR_PARITY);

NAK - that isn't the same code at all.

	David

>  	dat_w0_write(dat_idx, dat_w0);
>  }
>  


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
