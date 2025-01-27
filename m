Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C192C02188
	for <linux-i3c@archiver.kernel.org>; Mon, 27 Jan 2025 13:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y7mgbp6BO+Ty/XI2eeg54iRzNS10k5uhJr7sgruPoDA=; b=iWAXro3VXhWUSh
	YDYMFgdb7wSPHI5ogYRfIjOEBz/XaXghmYxPK6z+UQymkXh/GEf7D0cYuZpfPBoo80K42UCVkvjio
	gngGDEcfxSKysbTGHucqqEZdCW1mR/klFXavZGYXzR5HCVBUwv1DZwGclbVb7GfmE78kQXn+i5t1q
	ViKKD+CQ2qK4nT5VkrO/AmDcsiTFJz32PBPhBTz5+rmjmbOUH13YVDsJgC4Qf1oCzrfTQ4w25exfR
	auJGPTe3KHwq6yexMDnqadmylujYihwk5J8yz4xv0Qx/Huy/J3NvNuvmcdfagPQf+Nf7VYEnnqluR
	WpccuSbXPzl5eSdH6hbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcPEF-00000002NoK-0jHE;
	Mon, 27 Jan 2025 13:32:39 +0000
Received: from mail-vk1-f182.google.com ([209.85.221.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcPEC-00000002Nnx-0Iqr
	for linux-i3c@lists.infradead.org;
	Mon, 27 Jan 2025 13:32:37 +0000
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-518954032b2so1451967e0c.0
        for <linux-i3c@lists.infradead.org>; Mon, 27 Jan 2025 05:32:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737984754; x=1738589554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aeEn3KjNKPNz5fH4fvSEc7SugJm8AUvfxKbNAKX5Bh8=;
        b=nbDo75v1HBrUdOWKgkb/Chy2sN0T636AP+llJ9PYo1f2YxOS6zIP16PlwCftMTjaQw
         +rxrSUHcVRH+S0QAmHwVR2kaD4dilMP5qPl1rstaH9D20P3YQppSyqHH+XunmAhN7R3B
         fO9YF3aXnkW3X9xEt2zBtpe//bYgls99ysAAEmJ1y0L6NeZkEkObDN0nUj1d+0Oa4m2C
         fTXgjgUrmnTmdZGgecAkp6MxszT15mEAxRKGJPmWVdboW5+6YM9WXczeiuHei/pXLpM1
         RIK89ReNXSgNdcNTl/aVH50hhRekocqJFQ0363Ssx9Oa/pJ/xKYfCuYnbZ2mldLaVz5w
         bOEA==
X-Forwarded-Encrypted: i=1; AJvYcCVbQqq/cn9LI8YzcvBirG88Ku3qSA9g6/LhQO6O2lA61qWIG53koCq2h1A37tE97NKG6XTY2k9aRT0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1sv7TzUkMB55EEsXnExX0ClYvPrURwWtEaiKT1+Fe3kGfpOop
	BWP3UTmAAx4t/xzH4mY9rOcqETvL/kbiBD2n2i+CH3YBFt5+us1tSPtXhsjSum4=
X-Gm-Gg: ASbGnctqNmVaWDjBCdIqLDvV4xc9HCLf/q8RlHf4Z0vMk0dU5h1BCFgaWp6akuVamoI
	X8utaftEns2BnBD7HwtD8xlo6FzolGNk8rnz9WJmX2I6Th8xfZ3UZ1nqomee/pU0uMsVoc/ByOz
	d7k6a6k7EFwQ05oBK4QhoPRP2dfzsIZBM/BvDLkL1OWw3YXP1UmFw8UDOW2hx3HmetjitMyuqcW
	ysDSOtHh9Gbk62svpteX/u8x+iT7wu2X1WRXf7dAXEJpypEiMZfEQpCjS22dFekXy8wqJWiv8Iq
	AyXMpnRFETDIBDgVAfejmA0YLXBhUdz7iE8x+l03akU=
X-Google-Smtp-Source: AGHT+IHvwGBwDop3EEQ7yXNug9F8NCmGYGsPjbFMBJTRAysyxMfuzzNU7hdFpb+Ra/f0oGFRgEb3Ug==
X-Received: by 2002:a05:6122:9008:b0:51b:8949:c996 with SMTP id 71dfb90a1353d-51d5b351af7mr34027841e0c.9.1737984754155;
        Mon, 27 Jan 2025 05:32:34 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ea35b27sm1395938e0c.4.2025.01.27.05.32.33
        for <linux-i3c@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 05:32:33 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afd68271b6so1260417137.0
        for <linux-i3c@lists.infradead.org>; Mon, 27 Jan 2025 05:32:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWbJbYU7t8DwzdEhsQrJUO6kWHfeAJWWBpf+Wg95Y4iq9ZZy0RoiN81QRcOkK2VK6sPse8/bSMlc/g=@lists.infradead.org
X-Received: by 2002:a05:6102:38c9:b0:4b2:cc94:187e with SMTP id
 ada2fe7eead31-4b690c854eamr34380430137.18.1737984753735; Mon, 27 Jan 2025
 05:32:33 -0800 (PST)
MIME-Version: 1.0
References: <20250125130320.38232-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com> <Z5dpcZdHrn6XVlCI@ninjato>
In-Reply-To: <Z5dpcZdHrn6XVlCI@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jan 2025 14:32:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQSidTJfMCLcZQc=De4HdgmkYDXdaQ3Ch9smV2af=trQ@mail.gmail.com>
X-Gm-Features: AWEUYZmJaCHA2JBtmhcpfFKaRBpjbUofvuxb3Smzgf6C1Zw6z5L_tmsZs9aN-CE
Message-ID: <CAMuHMdVQSidTJfMCLcZQc=De4HdgmkYDXdaQ3Ch9smV2af=trQ@mail.gmail.com>
Subject: Re: [PATCH] bitops: use safer link explaining the algorithm
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kuan-Wei Chiu <visitorckw@gmail.com>, linus@ucla.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_053236_107069_A95B87DE 
X-CRM114-Status: GOOD (  17.57  )
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

Hi Wolfram,

On Mon, 27 Jan 2025 at 12:09, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Is the plan to replace all weblinks by webarchive links as a precaution?
>
> Dunno if there is a plan but 'git grep' showed at least a trend.

AFAIK most/all of these were added after the original links stopped
working...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
