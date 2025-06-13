Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB337C71135
	for <linux-i3c@archiver.kernel.org>; Fri, 13 Jun 2025 12:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w96zgJYTA21T3dN4wxedELkpeWJaVSZQpdsXiRY7baU=; b=CO0QOWfFe4JWIn
	Qi2eZMV4rxUDpdClUQXbOzWI29AtkuDUJWXrFMzVlVBF6wd8BAOtx6JnDQlKkP9bhzop74uetlrdz
	2oE4GcIHbg7/Eec3cr9/PQtCtXHRyFD8poY/UoNv9Thni1qSqwinPXZQo+PDD0YmHnKcqg3Js7pLt
	aMhhjoGzfecE0Vh2PQttX7xMfkTksbVWjB/qOFykcHpfSO4F6ODBUanxisnYpKi+q6IoNk/SF5Bu5
	f6Ci2QFnBqhoicKCLd7wk49O8E1mhny3CMwJu8BoqpXAKHf8Sas9dCZNvqBUx69ua96+2xHn4Fpfn
	BXX4t+TYpjYtB4XWkMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ3S7-0000000GMEk-2AR4;
	Fri, 13 Jun 2025 12:24:11 +0000
Received: from mail-vs1-f48.google.com ([209.85.217.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ3S4-0000000GMEN-2dRh
	for linux-i3c@lists.infradead.org;
	Fri, 13 Jun 2025 12:24:09 +0000
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4e7ade16082so576522137.1
        for <linux-i3c@lists.infradead.org>; Fri, 13 Jun 2025 05:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749817447; x=1750422247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gnQwem1mwUuekrLA9IOnRJxUiNMrjqNgOKJoIX6WMc=;
        b=mXJVD+9L1Y/VLiNcnJMxFYOQGGEmk4bKlPjoeRPZKWpoiqlyoIwXnlrTRZTD0gogpR
         EmBW10ZL8/oIaSivNRTSbkeJ1d5YigDZytEov5fHQ8pjOu6F/YVfhy8xa1l+ox0TYZZO
         GNSYNnW9bQLbV4gTxBziwZOQI5pgMsWuJHFQLfbyBGiZWB0rJlSMorzWN7DljE77MP6/
         IQuYXIpwo4YVgZEjt5royka8O9p1nWjf6jeyE/1qSS2c37Xb4xy0VQUZwU4T5n5Bv5Fd
         w4Cj6Fv6+bO7SMrJ9n7/O+DPlbpYfcYPGLB1rev80MnrwYpdDj21xYlHo+3lymKlOhPe
         jztQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQTkbSbtyFYnRY46mLwDlf5zMWn1Kb3fSKt5fGIupnPwhq5YTCGr9Beu2lXlLri7y9scAKDVVZucM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdKP3oJiX+7L1RCnW/DqW7rPZIVwEfR/U5K95LJ6QdRQTpzH/y
	O1kf8q1b+jVYY29LLBMc3vKulIUzpDqinfeYaORgaYhn1J++1FH+0pnzx8EgumAt
X-Gm-Gg: ASbGncsNCo2Y36C6DK6hTgeP5GCkf6PDqtz2cWKKNLRasFiRCaIqvZo8X+mhr1wUdpw
	q2C9ob/OJ9x3TSpotlXfuhAtR2/wyneiC4TiPDE8bdet1zqFaBVkiRzHP0rKDTU/K57jUwW2Pie
	drTrbhxYJZg/NPfPye92EKm0xCHWBSaEoB6PKgwQ06wxqtQHMoJrJqEyhzBfACCTzCtEhRzV0oA
	K5YUcbpJ1wiJIQ8NM9rgzbUWm1NcqnoPrJModkDyVwWCexQFiiBDFrw/az7ZSFbJBQt+UaxsmHT
	HpfWQhQWy5z+n6IWA+e3H5smR9WWbDEet7vcf1/Y3F4tSCZV3kp1nXgw5y3aNOURtEs3Lc40pbO
	nZyX5YWFos9GSKnc8W6FN4B69G2KGpgwESGU=
X-Google-Smtp-Source: AGHT+IF+OFOfrXKbQjWoi+mqXqMqV9NE3kf6xXn29/PK8fdhe9/l5xblKey98gxx6YyRNi+JrM6MlA==
X-Received: by 2002:a05:6102:160d:b0:4e6:4e64:baeb with SMTP id ada2fe7eead31-4e7e3c47ed0mr1907505137.17.1749817447210;
        Fri, 13 Jun 2025 05:24:07 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f0fd936e3sm199275241.34.2025.06.13.05.24.07
        for <linux-i3c@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 05:24:07 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4e7ade16082so576517137.1
        for <linux-i3c@lists.infradead.org>; Fri, 13 Jun 2025 05:24:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXPQvR03MN3af4E+31xstuP3mRW9kr5U1U3W75YDDeCkKKuwmgWi2+dF1zAuIJZm2oMHPRC1q9Xm0=@lists.infradead.org
X-Received: by 2002:a05:6102:6a96:b0:4e5:a394:16cb with SMTP id
 ada2fe7eead31-4e7e3913affmr1776882137.7.1749817446838; Fri, 13 Jun 2025
 05:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-5-wsa+renesas@sang-engineering.com> <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
 <aErqY0QWMRdC7Pvg@shikoro> <aEsDj5Vcb4zFJFlo@lizhi-Precision-Tower-5810> <aEvyfM42WTKENbFO@shikoro>
In-Reply-To: <aEvyfM42WTKENbFO@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jun 2025 14:23:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXW_4gHSTo0roNUpBrq2gLVBK=6zY_=rhh8OP85KJdqTg@mail.gmail.com>
X-Gm-Features: AX0GCFud3FpU7j3L5lRkGCpi0azPf9mSlrHfr1677jlPzJNObQkb7btaZ7k73WA
Message-ID: <CAMuHMdXW_4gHSTo0roNUpBrq2gLVBK=6zY_=rhh8OP85KJdqTg@mail.gmail.com>
Subject: Re: [PATCH RFC 4/7] i3c: add driver for Renesas I3C IP
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-i3c@lists.infradead.org, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_052408_666766_3FC5E641 
X-CRM114-Status: GOOD (  19.03  )
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

On Fri, 13 Jun 2025 at 13:41, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Sorry, linux-i3c mail list always delay your post, did you register linux-i3c
> > mail list.
>
> I did subscribe. I receive mails and my patches using git-send-email go
> through directly. My responses to mails are always held back just saying
> "suspicious header". But I don't know what is "suspicious", so I can't
> work on it.

Perhaps your overly-long Mail-Followup-To:-header?
When replying to your emails, I always have to prune the To-recipients...

> I am going to the I3C Plugfest in Warszaw in 10 days. I could ask people
> there...

Amazing ;-)

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
