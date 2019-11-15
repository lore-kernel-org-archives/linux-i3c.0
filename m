Return-Path: <SRS0=ua2+=ZH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB769C432C3
	for <linux-i3c@archiver.kernel.org>; Fri, 15 Nov 2019 10:48:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80E122075E
	for <linux-i3c@archiver.kernel.org>; Fri, 15 Nov 2019 10:48:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LxFZguAH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80E122075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YIMpcueRLQE8tOgwOL92ujVzP5uwveOwDPEbC9Q69aY=; b=LxFZguAHC7Ht+q
	Uq2oFODQRrsD+QeW78TaIKMixY3NYD7eYG5nX8rnfRAQrNspWv+fiBFeHq57GbtzHegPEOPYd5C1b
	Z4oAff6o9JVztz3EFBZVRm7zwlbyyLwyh3M+KAfuLIQhpF5//tr2cmknVIvYzAzbXsDws2QWxVSCN
	fFhkqU8q0yfT57+MPf+YGKAG9UY6wxdrL0X5qTeVLl0iZSAHgnEgNxWmpcvo7wqp7t9/FwTdnRMTy
	A7ym/dDuGFyIIilIgf52zj3Eiz3EojGyvUv9JoriS5VTFTBM46b6uPxt3rwdV7re9wM0YjFVu/gFr
	zFQmnWg5ewKsc44OESDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVZ9j-0004yO-8Q; Fri, 15 Nov 2019 10:48:47 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVXN6-0002xw-26
 for linux-i3c@lists.infradead.org; Fri, 15 Nov 2019 08:54:29 +0000
Received: by mail-ot1-f67.google.com with SMTP id d5so7409948otp.4
 for <linux-i3c@lists.infradead.org>; Fri, 15 Nov 2019 00:54:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xXAIHX2Tl2rPR9tSIWbBGJFZ8rTfCs0FskSAJ4Ev+rs=;
 b=g+doAohJvfXP6pcoGZEJvqbwZlnlVy/6mNzauwLi/70l3rildWsLGsrdumtIHLs0tC
 8d4ZNcxPPhbf2w88syXXpEIpBMHb/fRb7kVfG+gvVl4WNuIz8Y4eoYQ9XrgYqKsrpDA0
 lW38zUkjEsrdnnf9p6Lq8zq6VAE/XmRoUEroxOqZmLVg7h9PUWH5AAdoEVGaYoXKGPgJ
 rdITXZuVp0YO2A3CD4zsKpMsmMpvXywYOp4T+fwZtaSCG5HZ0HMWDc6tCTaOGLccbNIG
 ThdeCL9SIzlZmhSnAhLdIYIQMrI3HIutYwZ5PCWFZaBIw2CY9skiu8AYdXc2f3nrcy9Q
 bCgg==
X-Gm-Message-State: APjAAAXRSK8Fp9CtMt1ycoA+sA1gU9X/mch1B9CDMdZJ4t/RuoB9ODpy
 A22fjAQ3MLzjFcPLx2lV3CZHDObDGqQon/GLJLs=
X-Google-Smtp-Source: APXvYqyrQa5IxPsi3G7rS21hAK95+jhiYLA+S1aXs4vPX3QHlvXrVWf1Du1CX8vCc3Xf7tA+IQXdPThfCc6L3uJSoDg=
X-Received: by 2002:a9d:5511:: with SMTP id l17mr2306903oth.145.1573808066972; 
 Fri, 15 Nov 2019 00:54:26 -0800 (PST)
MIME-Version: 1.0
References: <20191024153756.31861-1-geert+renesas@glider.be>
 <20191115061554.532d29e9@collabora.com>
 <CAMuHMdWO=8sHn9wrEiuBGes0x_L2=Qkou=aPcHM7Mr9oDS74Qw@mail.gmail.com>
 <20191115094010.31acadf6@collabora.com>
In-Reply-To: <20191115094010.31acadf6@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Nov 2019 09:54:15 +0100
Message-ID: <CAMuHMdVvycHZv6g-vem7Mu4fqVc9FBx2xrdER85Sjb+vVW0=sA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Mark linux-i3c mailing list moderated
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191115_005428_100394_A3E5D05A 
X-CRM114-Status: GOOD (  13.00  )
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

On Fri, Nov 15, 2019 at 9:40 AM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
> On Fri, 15 Nov 2019 09:10:02 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> > Hi Boris,
> >
> > On Fri, Nov 15, 2019 at 6:16 AM Boris Brezillon
> > <boris.brezillon@collabora.com> wrote:
> > > On Thu, 24 Oct 2019 17:37:56 +0200
> > > Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > > > The linux-i3c mailing list is moderated for non-subscribers.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > Queued to i3c/next. It was actually queued 2 weeks ago but the
> > > patchwork bot didn't send a notification for that one (one was sent for
> > > your other patch) and I don't know why.
> >
> > It did:
>
> Ok, perfect then. Looks like sometimes it doesn't work, but for this
> patch I did receive a notification too (it was one notification for both
> of your patches and I thought I was receiving one per patch).

It is one per patch, I did receive the other one, too:

Subject: Re: [PATCH trivial] i3c: Spelling s/dicovered/discovered/
From: patchwork-bot+linux-i3c@kernel.org
Message-Id: <157251967168.27046.5733392327207757366.git-patchwork-notify@kernel.org>

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
