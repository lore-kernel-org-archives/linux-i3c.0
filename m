Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20321C02185
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OuOf2V5+KHYbItwU0suFujEN68VQRX1dx+bslau0L0g=; b=ujEjFPymDKar+u
	3Z4tw6T/+KXx13Wz8VmqskGHViJ55J683A9fFYQi0PjoGALvZ5j1SZSV545jmO7c5B3K+U/1oloLq
	yMamUl/SaMcF+EKTQdBO03aPIH/YGySIJRR0ol+KygE9Jw4R5rQ74J0ckA41ar+nxd94Rczg3GfDB
	iknIo85u0aSUhqe5Wmea4TIGJETH5Y6G9jD0tDPcGB86qYHOEovuADtG7R0+XOG2TaM2xo2YotIRs
	ST7S0s9YzNtcr53kldwxjN9REHCmyQQXcE6zPMMc5NtgJEK4eK1DhYdYLUh9DRcGMU81H3LIQUwP9
	+DZPpLftT1kuFtwl8JbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD2z-0000000F5Um-3TU6;
	Fri, 10 Jan 2025 11:19:25 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQHp-0000000BCX4-3VUK
	for linux-i3c@lists.infradead.org;
	Thu, 02 Jan 2025 18:51:15 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-385e2880606so8561016f8f.3
        for <linux-i3c@lists.infradead.org>; Thu, 02 Jan 2025 10:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735843871; x=1736448671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57a1MiEtbo8S4K088lbZisrAhLcKykomSGmLmki4Hs8=;
        b=im4VkhjIeI2vAOqOS8ESWvXR4HdfAa9CZDIJ1pY5YoAZObB/Tbf+ZpBQaZ1FBszugs
         LOkNX7oGrvN3VJknth8IuWICkJqtMInY4aHr55x6QZq/D75XJPfLnbxF1L3CLCYrE5Wq
         1bZkcej64E1Qgzt0cYqek/n4Xq7pVdM935S0rTsMQfiLF/DMTZy+aHE/EIFzzfuE3/9d
         LKPDvF0UWZyYRHsri7hHW+RaE+DZ3hjfBU7l4RMY11GuvEhys/ELw8blt0x8IJAGLMbl
         VYI+yZMdFdOY4/H0jrXmweiuyxR5Pg4fckEPwM9kkJrdHVrjsgUBEPkRAz1qUhvrhC2x
         SCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735843871; x=1736448671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57a1MiEtbo8S4K088lbZisrAhLcKykomSGmLmki4Hs8=;
        b=HZ747aM0H4+i1pPuWXmlhTAnYGrdct0xpKvAoYCZTIjK4yaUtYuMStsNNOlVDQ9qe3
         jEpUE3gzOvGxODPL46wArftKJMXPl5RLSOLGzMWgebvuuIAxVmZWZhYDgdwsJLOybFEd
         GlLnkPePseXlB5iHRPmw6YfzI6ovAxTurvbCCsN9I/qslSsZg8g/xG2yWgscR0FnB7HG
         wPrBdhnrbM9OlvLrlPVZQj9KwXkTnND90TOzzy/Iuuf9XWjrhlsnhdA95hui/FS0+iRs
         6ryUm9HwEJYXK3W4DOIhMSCFLcysVDQyXO3JI5UIQU6JH8RReJNepqGNHTknnWtyBmSJ
         rv7Q==
X-Gm-Message-State: AOJu0YystHr6ZUPrCfTz/nzXFkSuqwtjwVtlAHe7oOw3/tTbPwwQ9RwP
	14hZOr9fleBc+/yaUjaiLi4LRAYBBtaJT1IAh80SbVxBq5jfijJP
X-Gm-Gg: ASbGncuZtC+p9FXAaURefWfuoCPdFGb5eoAsXzYZ74qU7C8/DZM0jGiDbeZU3ZBpPrQ
	j555tJciM8SavBay29iKKtNuxdaAaLb2jDxhGE/mnMaDNyGfrX84wGtkGRQ9YctNp1W+57v9XH3
	oq1F5Pf57nrqk7utWAHMlC5y23jWfsyEELE4D+bzwwKktcgM4+BP4lYlczL2F1q1UlEU+xHQF4B
	gs3hbA5PGXyJE1581JYbVNgrciF+UZVAS13Mk8lGilVM2SHqkECijLi2oiW2cGDd3EfsNrTxkme
	4M/SNh3eHG6LkXZtyM6ON98=
X-Google-Smtp-Source: AGHT+IE2RkxHp877sm0DcGHXQgRYmP0kbp9aKFcV/65MDXSCqdsC+6SWJDQ8gzU2tDrAYedaFvqTUQ==
X-Received: by 2002:a5d:47c8:0:b0:386:33e3:853c with SMTP id ffacd0b85a97d-38a221e2394mr38117867f8f.12.1735843871215;
        Thu, 02 Jan 2025 10:51:11 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acb17sm38266690f8f.97.2025.01.02.10.51.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jan 2025 10:51:10 -0800 (PST)
Date: Thu, 2 Jan 2025 18:51:09 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RFT v2 4/5] i3c: mipi-i3c-hci: use get_parity8 helper
 instead of open coding it
Message-ID: <20250102185109.0862cae6@dsl-u17-10>
In-Reply-To: <Z3ZV_D5AIUxFR1Bw@shikoro>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
	<20241229101234.2896-5-wsa+renesas@sang-engineering.com>
	<20250101121431.05d831c7@dsl-u17-10>
	<Z3ZV_D5AIUxFR1Bw@shikoro>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_105113_882248_1E6FCC14 
X-CRM114-Status: GOOD (  16.61  )
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

On Thu, 2 Jan 2025 10:01:48 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> > > @@ -123,7 +114,7 @@ static void hci_dat_v1_set_dynamic_addr(struct i3c_hci *hci,
> > >  	dat_w0 = dat_w0_read(dat_idx);
> > >  	dat_w0 &= ~(DAT_0_DYNAMIC_ADDRESS | DAT_0_DYNADDR_PARITY);
> > >  	dat_w0 |= FIELD_PREP(DAT_0_DYNAMIC_ADDRESS, address) |
> > > -		  (dynaddr_parity(address) ? DAT_0_DYNADDR_PARITY : 0);
> > > +		  (parity8(address) ? 0 : DAT_0_DYNADDR_PARITY);  
> > 
> > NAK - that isn't the same code at all.  
> 
> But the same algorithm? Please elaborate where you think the new code
> will fail compared to the old one. And frankly, are you aware of
> different parity calculations? Have you read the link which was in the
> kdocs of my new function?
> 

The old code is:
> -static inline bool dynaddr_parity(unsigned int addr)
> -{
> -	addr |= 1 << 7;
> -	addr += addr >> 4;
> -	addr += addr >> 2;
> -	addr += addr >> 1;
> -	return (addr & 1);
> -}

So:
1) it always sets 0x80.
2) it uses addition not exclusive or.

So just not the same definition of 'parity'.

	David

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
