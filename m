Return-Path: <SRS0=ua2+=ZH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC2AC432C3
	for <linux-i3c@archiver.kernel.org>; Fri, 15 Nov 2019 08:40:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33F5120733
	for <linux-i3c@archiver.kernel.org>; Fri, 15 Nov 2019 08:40:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XZ1wyuV1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33F5120733
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SymjIBQe2p5V1UVqsBJtsyySjxyJF2I0MUEOxAcAkGQ=; b=XZ1wyuV1SVVrpc
	1WuTzRrpb315I0yAyPmlTrZ5EDSecqde8uw0C66Eh7NKuG1PXNIfKvwUSN26FKNtSpI69DBRZYXKp
	rUWYhBssLNlaFFmPxjjj2asHyQA6pO5czwks4wVQsNy/U0yylieDak6voNXVI3VYWCiNT8TUBCe+U
	uKeQYXDCIccK0lnz81EL+LPVKAsuFfT9cY1VcgGw4nDklapitih8tX882PRjOH7/RofjM7wjwnLDp
	iDPswMS9PnTRkQk17ENwOv4A1OG4Vs1Pd+KBuStYjMsXh2RkEdb7JDlJ21FmBQKdhedKmy0+sJev2
	hu9A1wYNRDL8gF1GTw4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVX9R-0006mZ-Qt; Fri, 15 Nov 2019 08:40:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVX9O-0006lh-3g
 for linux-i3c@lists.infradead.org; Fri, 15 Nov 2019 08:40:19 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3439B291B74;
 Fri, 15 Nov 2019 08:40:14 +0000 (GMT)
Date: Fri, 15 Nov 2019 09:40:10 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] MAINTAINERS: Mark linux-i3c mailing list moderated
Message-ID: <20191115094010.31acadf6@collabora.com>
In-Reply-To: <CAMuHMdWO=8sHn9wrEiuBGes0x_L2=Qkou=aPcHM7Mr9oDS74Qw@mail.gmail.com>
References: <20191024153756.31861-1-geert+renesas@glider.be>
 <20191115061554.532d29e9@collabora.com>
 <CAMuHMdWO=8sHn9wrEiuBGes0x_L2=Qkou=aPcHM7Mr9oDS74Qw@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191115_004018_286595_C6890FD5 
X-CRM114-Status: GOOD (  18.47  )
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

On Fri, 15 Nov 2019 09:10:02 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Boris,
> 
> On Fri, Nov 15, 2019 at 6:16 AM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> > On Thu, 24 Oct 2019 17:37:56 +0200
> > Geert Uytterhoeven <geert+renesas@glider.be> wrote:  
> > > The linux-i3c mailing list is moderated for non-subscribers.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>  
> >
> > Queued to i3c/next. It was actually queued 2 weeks ago but the
> > patchwork bot didn't send a notification for that one (one was sent for
> > your other patch) and I don't know why.  
> 
> It did:

Ok, perfect then. Looks like sometimes it doesn't work, but for this
patch I did receive a notification too (it was one notification for both
of your patches and I thought I was receiving one per patch).

> 
> -----8<-----------------------------------------------------------------------------------------
> Subject: Re: [PATCH] MAINTAINERS: Mark linux-i3c mailing list moderated
> From: patchwork-bot+linux-i3c@kernel.org
> Message-Id: <157251967150.27046.1691850610457130750.git-patchwork-notify@kernel.org>
> Date: Thu, 31 Oct 2019 11:01:11 +0000
> References: <20191024153756.31861-1-geert+renesas@glider.be>
> In-Reply-To: <20191024153756.31861-1-geert+renesas@glider.be>
> To: Geert Uytterhoeven <geert+renesas@glider.be>
> X-GND-Status: LEGIT
> Received-SPF: pass (spool2: domain of kernel.org designates
> 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
> envelope-from=patchwork-bot+linux-i3c@kernel.org;
> helo=mail.kernel.org;
> 
> Hello:
> 
> This patch was applied to i3c/linux.git (refs/heads/i3c/next).
> 
> On Thu, 24 Oct 2019 17:37:56 +0200 you wrote:
> > The linux-i3c mailing list is moderated for non-subscribers.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  MAINTAINERS | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)  
> 
> 
> Here is a summary with links:
>   - MAINTAINERS: Mark linux-i3c mailing list moderated
>     https://git.kernel.org/i3c/c/469191c7fcd069a500c2a26c49c9baef9dabf66d
> 
> You are awesome, thank you!
> 


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
