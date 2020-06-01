Return-Path: <SRS0=c5gR=7O=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD341C433DF
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Jun 2020 18:52:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E70020679
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Jun 2020 18:52:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YIcfOe5s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E70020679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/7IkOvtWj0HxSoojLR+1O0X7QsbSYS2WW8ys3sV4UY=; b=YIcfOe5snh8W5D
	uMopYZhloU1Rrj0Bv3OVPKAIYFg6V5i+vLAF51P0+ar9si0T2R9RXZ4jOJsj3q7CHlJVjj9xmMFSd
	8z8DOnpNRzdL6Wcr3awdZ+k4Jju35Bxtrcyaqf3fYn2ZFKz9ijbulw3c8n4+8UuT5knWTjVLuz5Gk
	S7LI9BNr3mV1JpZm/Nj1rrRv2zpVe0sRC6MxcejYOtSl6msLnWiMEXvYH37ApG0Y+y2w31LAQfMWx
	hGklE8pHHRGB8mp2CrDea6rR6b/EbCN1P6wSBgdnV+bwS/9g7t/m9Vdg7KHfFp9LBF/LGkclEG79z
	dEZh5qhOC3YdF2bKngcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfpXg-0003dF-Aq; Mon, 01 Jun 2020 18:52:12 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfpXd-0003cn-F7
 for linux-i3c@lists.infradead.org; Mon, 01 Jun 2020 18:52:10 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C5C332A2313;
 Mon,  1 Jun 2020 19:52:05 +0100 (BST)
Date: Mon, 1 Jun 2020 20:52:03 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] i3c: Changes for 5.8
Message-ID: <20200601205203.7677efc1@collabora.com>
In-Reply-To: <CAHk-=whW82ewxKJjaFq=96eEpCMN0=DtaZxX9ZGBH7BTgTkEfQ@mail.gmail.com>
References: <20200601095423.00ffb5e1@collabora.com>
 <CAHk-=whW82ewxKJjaFq=96eEpCMN0=DtaZxX9ZGBH7BTgTkEfQ@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_115209_639316_752BC005 
X-CRM114-Status: GOOD (  11.53  )
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
Cc: linux-i3c <linux-i3c@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Linus,

On Mon, 1 Jun 2020 11:39:05 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, Jun 1, 2020 at 12:54 AM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/for-5.8  
> 
> Hmm. No such ref..
> 
> I see the "i3c/next" branch that has that top commit, but I don't see
> the signed tag.

Oops, should be here now.

> 
> Forgot to push?

I pushed it, but maybe not to the right repo.

> "git request-pull" _should_ have warned about the
> remote side missing..

Yes, it warned me about that but there used to be a slight delay
between the time I push at tag to the repo and the time it actually
appears there in the past (maybe it's no longer the case), so I didn't
pay attention to that one. I'll try to be more careful next time. Sorry
for the inconvenience.

Regards,

Boris

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
