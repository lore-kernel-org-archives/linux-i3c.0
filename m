Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8722CC02188
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tABC9+Oph1z3eJyvl/DJQNh9A0foZ3+XDEVbT5GHKvM=; b=c4Pu9dKESSemaZ
	+cnlN4XVVIItI7ChVBSgmhFZ8YpSPGuuQIt90u0sTCs6jqzgDxq2k/eVqqA4xbCBxMxVmuJDrdPB0
	KUGUH9PebeVURfd8x46Z+xVZu/JLGGZM28eiE+jI43rGsWC73JEI2UWaVurJelYIdX2fB1eQBLzl1
	fAqcrAZgT8hZwHjLAgwQ6YFO52lMmxQ9hPGrmUm1XVLnsDNxHkGSqmszS/j/5uulDiV4HYxKXksBw
	0IoS3C57yWS5AKDIEWrdtzXJvYF2GG4PAREBkdQvMjzS/zk+2SSqghHsmvudF8nYRVXPhNPlRXzUq
	ivdUGVnX1P420vY1rNPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD30-0000000F5Wg-3vQ7;
	Fri, 10 Jan 2025 11:19:27 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTi3X-0000000D20I-2Rvp
	for linux-i3c@lists.infradead.org;
	Fri, 03 Jan 2025 13:49:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso74410665e9.1
        for <linux-i3c@lists.infradead.org>; Fri, 03 Jan 2025 05:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735912177; x=1736516977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWlo2tx3RQuY5NiWKrciw+TDEi2b8UAJjPattwWp+t4=;
        b=WiAyaY75NV9RmUWUiU6dqE6xZ8COcYtskc9noB4+2Z3P36TfxUGZv3xSAoQslg46ea
         b3EjXCIi1yGp8Ol+HI4Z8+F/DONT17Ly831P38M+DGysrXLxHhsKAp4GD37nQSi0WdQM
         CTlkHpR9x5i1qAJYwL1Suq8Bd/MTokAq2naSnmnBP2zMYOOMK/XG7qbg0b/ZJGHiS37g
         8cz7UyEbIt9x/Nunl3kK3sOCPl74fzt7M+gPkBLHAixaAvo/Kf4iUXXAICDvLab2dXHd
         TDywIZJJfOnbyPcZAdzg06lyUSC2Ci3+Wq3P6d4ssKSOSs6w8hHROi2IVo8D28LE+ZaS
         Px1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735912177; x=1736516977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWlo2tx3RQuY5NiWKrciw+TDEi2b8UAJjPattwWp+t4=;
        b=rkB9RKJMpW64KK9MvREiWK/7fdm6Kg19lqobHTzcyDqROBn5nPjnRxmMfNA5oTL8AW
         tu2RX9P0KPPJ34JAGHioRaz3Dy5uJ2sXwi6TTXt3Wros0MUz2Yh/eJmlNPAw1ZQIM2iD
         dhqz4TNQdJjClhrbiFx/NbCZeWAPl54onmde/iy9ofd3jb1eGe3W3S7uIP+V8pHXcLgi
         cU2yxP1YFHvs25y2TSnFLEzsQjeABb0X0PbmZF09vldw4wuk7HNXkFCHZuJWMqYYnl7O
         KG9dP5/rdTijdr+ZAhWLcKBO+p6cCCtEYvfbG3lwnFe5+1gbgTGH5zOSV2cIF3Uxy1ai
         o9/A==
X-Gm-Message-State: AOJu0YyJJtWDYbBEh3GNoURYm6hcZcDjrVJyOc5CPod6LW3uA4SfWcDQ
	Ea71pu79D396TBaOxA0GDz349+c2uTqq8PV/sNuKn2V70LgYbZb9FMXKCw==
X-Gm-Gg: ASbGncvjgRU+2iXfPziB8jcbw+bep9VSRpkl7XnjiFKQGJzBQG0X7vAeBZhkuARQDCo
	yS25MSYpAhsua30D/74Tt/0b9HLhrtTl1+FLNqWqYSreXc93YXcS2+JqXAn7/sfWp9bppfOftaT
	J0kwUoamh/7Xop8PFVNUmRd6OsIM5/ELnOIXOVymm+rul7sOjClppTCJiwff0jzPcj5/SfL0Hiq
	VYJFJL9NB2udUeNeMsepq1XJroJeLAGrBev1TK050du4B2XDeRcCi7BmjrVVN+0vKWWfktoDO0B
	8Uu5HZ4xnJ03Uyao4zU=
X-Google-Smtp-Source: AGHT+IGQoPUjVc425O0ZTEfBoKZJu+kwBbdbuw98rAoUNrTeffve2qyhaYQgtHvhqh/LwU5H41Ctaw==
X-Received: by 2002:a05:600c:1d12:b0:434:f9ad:7222 with SMTP id 5b1f17b1804b1-436699ffa31mr429281475e9.7.1735912177281;
        Fri, 03 Jan 2025 05:49:37 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ac97fsm40220961f8f.92.2025.01.03.05.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 05:49:36 -0800 (PST)
Date: Fri, 3 Jan 2025 13:49:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RFT v2 4/5] i3c: mipi-i3c-hci: use get_parity8 helper
 instead of open coding it
Message-ID: <20250103134935.2a341ce0@pumpkin>
In-Reply-To: <Z3e1tuAR5GsEhYLz@shikoro>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
	<20241229101234.2896-5-wsa+renesas@sang-engineering.com>
	<20250101121431.05d831c7@dsl-u17-10>
	<Z3ZV_D5AIUxFR1Bw@shikoro>
	<20250102185109.0862cae6@dsl-u17-10>
	<Z3e1tuAR5GsEhYLz@shikoro>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_054939_625724_FB047992 
X-CRM114-Status: GOOD (  16.06  )
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

On Fri, 3 Jan 2025 11:02:30 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> > > > > -		  (dynaddr_parity(address) ? DAT_0_DYNADDR_PARITY : 0);
> > > > > +		  (parity8(address) ? 0 : DAT_0_DYNADDR_PARITY);    
> 
> ...
> 
> > The old code is:  
> > > -static inline bool dynaddr_parity(unsigned int addr)
> > > -{
> > > -	addr |= 1 << 7;
> > > -	addr += addr >> 4;
> > > -	addr += addr >> 2;
> > > -	addr += addr >> 1;
> > > -	return (addr & 1);
> > > -}  
> > 
> > So:
> > 1) it always sets 0x80.  
> 
> Right, this is why the arguments of the ternary operator above are
> exchanged. The old function was basically 'is_odd'.

Provided the high bit isn't already set - which it may not be.

> > 2) it uses addition not exclusive or.  
> 
> True, but it will work nonetheless because we are only interested in bit
> 0 of the result. For one bit, XOR and addition are interchangable. The
> overflow to other bits is not important.

add: 00010001 => xxxx0010 => xx10 => x1
xor: 00010001 => xxxx0000 => 00xx => x0

> 
> > So just not the same definition of 'parity'.  
> 
> I think it is. I mean, I3C wants odd parity, otherwise it will not work.
> And Jarkko kindly confirmed it still works.

I bet the target isn't checking...

So you might be fixing a bug.

	David



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
