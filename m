Return-Path: <SRS0=ua2+=ZH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F01C43141
	for <linux-i3c@archiver.kernel.org>; Fri, 15 Nov 2019 10:48:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5B30207DD
	for <linux-i3c@archiver.kernel.org>; Fri, 15 Nov 2019 10:48:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e3z9J3aa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5B30207DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ckTaMeAgXDhW3tw2dHcMEy5PSwPsOy14FJO0xInQTI=; b=e3z9J3aaQsmOHr
	wdcTUulcjCZ7BYZLsQmzNocu4AoGk9CzoPUqCcRqRIittbrt6aECfbjjlqV/GTL4N/cqVuvraX9Xl
	f/TRYlhRVgr6yaCgs2ih0dNNmuAddWqHamQD1PBMdPIMG5Xgc4JaIDSoZvckK5VSI3m8PFvwP1B88
	bOp+DX2N4nX7FtQgTbPArklNhmoqZVLTwX+kbCpzLyuKPpAoyjEzATz7FxQ18891I+mFfVIy37c5O
	7GvkJ1cv60uIDd2St/cr2W+7wJSr0YM7FtchvrbaF1iCWf2N0EnhDTUKMjHXshpMTiEEY11Bq408u
	vALlDOF06AS2oL/vTQ+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVZ9j-0004yH-5q; Fri, 15 Nov 2019 10:48:47 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVWgJ-0003WE-Hc
 for linux-i3c@lists.infradead.org; Fri, 15 Nov 2019 08:10:17 +0000
Received: by mail-oi1-f195.google.com with SMTP id j7so7908706oib.3
 for <linux-i3c@lists.infradead.org>; Fri, 15 Nov 2019 00:10:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZSr7cTGfOdXAXx7Uwdhh3Oh8e5ZfUnggvdAXALwWrL0=;
 b=uoZrhQf6fYUBjGKOkG+nuXpCYU60NKYXkUXbN10VtXZfUk5dDe7eF2uu0h6uwqyV/F
 g1heDka0Ny3A0wIT0uZWUT0xYyiR+8ZVWCcj44lG6jXToGeOII1x42usxkMOzi+znm3N
 x3xjUb8XpVOPBPtVvgMnBmk1NoEYOddkEdU7kOwtqoqHufTG+wC/tUzgDyTHiZPTBt8p
 DrH2gYE6f2vltO4tqWpwZ4mJDMplzlkpnddwSYrLPSTN9q0zbwD9sx0JyTFZrbxYJl1F
 q+/kkEw+mHPwG3ux1eqfv1j7asLvaJV1w67sWBh3x6cDa9eWpiBjAYXdbOMTLfK0LuQF
 in5g==
X-Gm-Message-State: APjAAAXVYuBXDo3flKuu56qnwA27gfSRE8P1i2eHRM5jJqY+Ra/xVPNw
 2k12jQ8yCOeIG92kLJoiTs3ZFIfwT2xLdDQ8BB0=
X-Google-Smtp-Source: APXvYqxCv94tNtW9fCNSuBgOTtlmJbNbNkU+GuiFOtEtRh3Ty+uWOrYwRpYJHN4jbhP3ZGDBhhh998rC43Zbc/QVybo=
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr6635783oia.148.1573805414147; 
 Fri, 15 Nov 2019 00:10:14 -0800 (PST)
MIME-Version: 1.0
References: <20191024153756.31861-1-geert+renesas@glider.be>
 <20191115061554.532d29e9@collabora.com>
In-Reply-To: <20191115061554.532d29e9@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Nov 2019 09:10:02 +0100
Message-ID: <CAMuHMdWO=8sHn9wrEiuBGes0x_L2=Qkou=aPcHM7Mr9oDS74Qw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Mark linux-i3c mailing list moderated
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191115_001015_584412_54469E52 
X-CRM114-Status: GOOD (  12.67  )
X-Mailman-Approved-At: Fri, 15 Nov 2019 02:48:45 -0800
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Boris,

On Fri, Nov 15, 2019 at 6:16 AM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
> On Thu, 24 Oct 2019 17:37:56 +0200
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > The linux-i3c mailing list is moderated for non-subscribers.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Queued to i3c/next. It was actually queued 2 weeks ago but the
> patchwork bot didn't send a notification for that one (one was sent for
> your other patch) and I don't know why.

It did:

-----8<-----------------------------------------------------------------------------------------
Subject: Re: [PATCH] MAINTAINERS: Mark linux-i3c mailing list moderated
From: patchwork-bot+linux-i3c@kernel.org
Message-Id: <157251967150.27046.1691850610457130750.git-patchwork-notify@kernel.org>
Date: Thu, 31 Oct 2019 11:01:11 +0000
References: <20191024153756.31861-1-geert+renesas@glider.be>
In-Reply-To: <20191024153756.31861-1-geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
X-GND-Status: LEGIT
Received-SPF: pass (spool2: domain of kernel.org designates
198.145.29.99 as permitted sender) client-ip=198.145.29.99;
envelope-from=patchwork-bot+linux-i3c@kernel.org;
helo=mail.kernel.org;

Hello:

This patch was applied to i3c/linux.git (refs/heads/i3c/next).

On Thu, 24 Oct 2019 17:37:56 +0200 you wrote:
> The linux-i3c mailing list is moderated for non-subscribers.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Here is a summary with links:
  - MAINTAINERS: Mark linux-i3c mailing list moderated
    https://git.kernel.org/i3c/c/469191c7fcd069a500c2a26c49c9baef9dabf66d

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
----------------------------------------------------------------------------------------->8-----

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
