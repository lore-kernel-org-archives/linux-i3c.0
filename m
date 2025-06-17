Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B87CC7114A
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Jun 2025 07:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrQupaiBFWRqR8ik9poz6AkMqTIfG9nMsWCfoJbvurA=; b=QcJCeoKAFMfUWf
	gsyeTCqmze1r5awBCNMUCrHukD19pDGD6JwGzyiKS1LfuzXNKuG7DXlTgrfQVYsSU4QSx3cDJI/L4
	ASaVl0CLgp8bAXBv6rmGqznoN2G8gtujObz5A8qaF7nmQdYeIdD7iTSngZ12mho+vFy4j/4nEl34l
	UVqnYZUD6QkviWq52KVdGk7c8PS1iJcBbCPic41kVD6Mb5jstQ4Uce6GO/zznhhUsJFXbbLJgulrl
	b+TvKkSav0wvM3Ssyc5M0VEmQrzK/nlJwlUYgUfol+sUIRt7bs/3gA5Xcb10WgEcn6Kyda2zrKwsx
	js68Xe/0dYE3/YyWaSAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRQUt-00000006Qz4-0hbr;
	Tue, 17 Jun 2025 07:12:43 +0000
Received: from mail-vs1-f42.google.com ([209.85.217.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRQUq-00000006QyT-32cr
	for linux-i3c@lists.infradead.org;
	Tue, 17 Jun 2025 07:12:41 +0000
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e7efae1bfdso838546137.3
        for <linux-i3c@lists.infradead.org>; Tue, 17 Jun 2025 00:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750144358; x=1750749158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61Nmvul6W8ekOE7+MmxAVOB45wapNmCLHpMau5XL4H0=;
        b=XDSeIoTCafWEdYDUCeupbAYbkF6/DhIR3CJgVhemwEACn6poF+nCUU2uUG2qWAMYKe
         P+L/Pv5dNkauY45AjdlgErvbTSAgPQvm2f4XAuwxBW/RkWiN9aldfG1PYHaiiWtkU0s5
         X8QlONYyvXcWduZOk5Kq4rUMw1B8wQHkmZkvd/KB3k72tPZ6hW09nDG7qXIcCbo3m6EA
         kJyyP79i7Hzg3IRYFMPgsHpeVPRJYih9mqmaFK2SZl231Wp6x2UXpV0XSCzEauK0MKMD
         JNUyL3Oe7M197zliIizIdVzSC840nlTlRhCS2se1QCq4L/XrVyFV3eNzaG1WZo46lxcY
         nX0g==
X-Forwarded-Encrypted: i=1; AJvYcCWYB8J3LGla2ivErLUqHycZfdWsV5LERyA/Z2XZYk5kmom99NN1rF+dHcszfX7Ck8+dQljmav9h9bE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyvMOSKEAMvV7v91Y6e4DFzn0SSd0z9b5r24U81vIMNjN3xCZCv
	Kz5PYzf6DT8is3T1e57xQX989GUZJJKv3IbdlUVXhk7orRriCFg7/cHWUYyKWVja
X-Gm-Gg: ASbGncv2AXfydQg3Thjay0/c5Z8oxiUXyZrUHTQVL7aScaWrB/yhu21nls2X/4RIfei
	WXAv230odUPYT5v02ChpGgD3S4DEZyqfLkTtcJyMmv1EYEUYWvmsR0iWGfw3XhOavrxkBTGhQj0
	+hYSz2Quzvdzlo83cjRGnmBnmZUpyMV8fhSNJwwO75nIyhuqTRDUnKIMLOwLBYBRBE4CTi7XGc8
	6HrMjTUdJQ7PQdDhQK5A5BGvn7d6H0mgFaXqL1htHcwrx1JqkjL3MQnobGQ+kahgAErNySGzu3a
	o/R8p75NCrrtEpAmSCLiKSoEd5c+hGGTV6DaFwmWvs2NDbWJRBUEO4lc6PIsmwX+iZS4RnGrBNY
	5MFsW5fgFL7A2VCilvMRiNRkU
X-Google-Smtp-Source: AGHT+IFiQBMyWZzVSiUs3uwpBqNZQ6g28J7V5fpEAJ+94cDiRrapPsQ/yucag3LcP+0lm89ONOWSYQ==
X-Received: by 2002:a05:6102:5488:b0:4e6:f86c:43a8 with SMTP id ada2fe7eead31-4e7f621345emr6829051137.18.1750144358166;
        Tue, 17 Jun 2025 00:12:38 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7e6bf134dsm1597599137.3.2025.06.17.00.12.37
        for <linux-i3c@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 00:12:37 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4e79dde8511so1303977137.0
        for <linux-i3c@lists.infradead.org>; Tue, 17 Jun 2025 00:12:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXLhQuPD4e5tuKAurluOhOs5dvdCbTPII9h0tBhw1hS7aqrfY60VVbzAmdzr/GDq15W5orJpnnHkxY=@lists.infradead.org
X-Received: by 2002:a05:6102:c8f:b0:4e5:59ce:4717 with SMTP id
 ada2fe7eead31-4e7f614b8femr7832472137.9.1750144357283; Tue, 17 Jun 2025
 00:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-5-wsa+renesas@sang-engineering.com> <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
 <aErqY0QWMRdC7Pvg@shikoro> <aEsDj5Vcb4zFJFlo@lizhi-Precision-Tower-5810>
 <aEvyfM42WTKENbFO@shikoro> <CAMuHMdXW_4gHSTo0roNUpBrq2gLVBK=6zY_=rhh8OP85KJdqTg@mail.gmail.com>
 <aEwjU-uq4XsNzrOO@shikoro>
In-Reply-To: <aEwjU-uq4XsNzrOO@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 09:12:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOxBfwwXUpYpmB30Zpqdwgwa2d=hXQyYVsoAD0bN4seQ@mail.gmail.com>
X-Gm-Features: AX0GCFvUnS4t6z_q3W1IAT-fQyHXax5-N9-bx5_cemKOClJecGyaB9RpDeXkPO0
Message-ID: <CAMuHMdWOxBfwwXUpYpmB30Zpqdwgwa2d=hXQyYVsoAD0bN4seQ@mail.gmail.com>
Subject: Re: [PATCH RFC 4/7] i3c: add driver for Renesas I3C IP
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org, 
	linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_001240_760904_AD655030 
X-CRM114-Status: GOOD (  15.97  )
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

On Fri, 13 Jun 2025 at 17:15, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Perhaps your overly-long Mail-Followup-To:-header?
> > When replying to your emails, I always have to prune the To-recipients...
>
> Let's try if this comes through. I told mutt to not add it anymore...

Thanks, much better!

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
