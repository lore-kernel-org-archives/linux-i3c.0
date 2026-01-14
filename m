Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1518D38FE8
	for <linux-i3c@archiver.kernel.org>; Wed, 14 Jan 2026 16:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w+rHD479h+3yxoJwcbEO80G8OwAZJsL0qKVt3O/1At0=; b=GAyhmxXQM+V+Cs
	VFfKHu7YIqlQOAmCSnsSFCkyOHkV0L6eAzxzdE7/NTSo0QpJFgk6XtoJ9IGuqtcP8RJyB21PwuJVV
	oiyA9PJlxa0pHkAzS4KT0WKxLtg9qD/rr2vHJ/1olbYhXWRAnaDKOwZp9ZQDou0WJ4DfILQRXH87Y
	yBNXCDNeiy/yIBeVcgUN0czBGjaiMIWmRNEjP1EUXXDX07RGaDSUJYtpIe60xY3Lok/EEce6LbA0I
	fC/+LZDunLkD6O9QvqriPwA0GrCY96x/KgE0cocav3HpwqfIr8NibCH9ERgQhnvT/cu2sOFBk+nnD
	+IKFlZ/i1rJcARuEMwaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3zV-00000009yGu-2Hcn;
	Wed, 14 Jan 2026 16:45:05 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3zS-00000009yFO-07So
	for linux-i3c@lists.infradead.org;
	Wed, 14 Jan 2026 16:45:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1B46EC1F6DB;
	Wed, 14 Jan 2026 16:44:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8BF1B6074A;
	Wed, 14 Jan 2026 16:44:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1829E10B682A8;
	Wed, 14 Jan 2026 17:44:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768409098; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=fB4bkbCydl0J5MhYbvVByNo5tJtxG8ScBXGtmK/nEiU=;
	b=WOty27G18Gnr0b241mCKtiOAKtyBsceyh1WJoW3EnDBk/TRCkBA/4FbC9yqor6rthtKOPU
	6rWF1JIsPuqsbArk0I/fmUEdeEL3FkXCIi0NpN4z059vrsitOwN9MXq02id4XSHpqD+LzT
	8RssyNba3OGacV4Id6T9xE08s9/wlB3JXJrGY+PLSp1UGT5zgZTQywPwWWzeiLPKFMCqFZ
	tygdVRlQ9RSzkEFj93xjcQi6DLP9OkODvfzJ7qncNTlMcco/0mTyLnggR9ctlN5xPCDNn5
	FB5McIY5uGH/Tovf6feRO+pQP3PkMFRlYEKri3ubU6WWj1oyXxWqL8CkuTe+IA==
Date: Wed, 14 Jan 2026 17:44:55 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank.Li@nxp.com, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V3 00/21] i3c: mipi-i3c-hci-pci: Add Runtime PM support
Message-ID: <176840902682.1305594.13987931108275156748.b4-ty@bootlin.com>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113072702.16268-1-adrian.hunter@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_084502_209518_3C22882D 
X-CRM114-Status: UNSURE (   6.18  )
X-CRM114-Notice: Please train this message.
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

On Tue, 13 Jan 2026 09:26:41 +0200, Adrian Hunter wrote:
> Changes in V3:
> 
>     i3c: master: Update hot-join flag only on success
>     i3c: mipi-i3c-hci: Manage DMA deallocation via devres action
>     i3c: mipi-i3c-hci: Factor out software reset into helper
>     i3c: mipi-i3c-hci: Factor out IO mode setting into helper
>     i3c: mipi-i3c-hci: Factor out master dynamic address setting into helper
>     i3c: master: Introduce optional Runtime PM support
>     i3c: mipi-i3c-hci: Add optional Runtime PM support
>     i3c: mipi-i3c-hci-pci: Add Runtime PM support
> 	Add Frank's Rev'd-by
> 
> [...]

Applied, thanks!

[01/21] i3c: mipi-i3c-hci: Reset RING_OPERATION1 fields during init
        https://git.kernel.org/i3c/c/78f63ae4a82d
[02/21] i3c: mipi-i3c-hci: Ensure proper bus clean-up
        https://git.kernel.org/i3c/c/8bb96575883d
[03/21] i3c: master: Update hot-join flag only on success
        https://git.kernel.org/i3c/c/f0775157b9f9
[04/21] i3c: master: Replace WARN_ON() with dev_err() in i3c_dev_free_ibi_locked()
        https://git.kernel.org/i3c/c/471895799c2f
[05/21] i3c: mipi-i3c-hci: Switch DAT bitmap allocation to devm_bitmap_zalloc()
        https://git.kernel.org/i3c/c/f64c1a46ea7c
[06/21] i3c: mipi-i3c-hci: Switch PIO data allocation to devm_kzalloc()
        https://git.kernel.org/i3c/c/11d17c2855bf
[07/21] i3c: mipi-i3c-hci: Manage DMA deallocation via devres action
        https://git.kernel.org/i3c/c/29bf98a6346a
[08/21] i3c: mipi-i3c-hci: Cache DAT in memory for Runtime PM restore
        https://git.kernel.org/i3c/c/a372cfac056a
[09/21] i3c: mipi-i3c-hci: Introduce helper to restore DAT
        https://git.kernel.org/i3c/c/f180524a4877
[10/21] i3c: mipi-i3c-hci: Extract ring initialization from hci_dma_init()
        https://git.kernel.org/i3c/c/f5401c973e7f
[11/21] i3c: mipi-i3c-hci: Add DMA suspend and resume support
        https://git.kernel.org/i3c/c/816958720443
[12/21] i3c: mipi-i3c-hci: Refactor PIO register initialization
        https://git.kernel.org/i3c/c/ca4d4682d353
[13/21] i3c: mipi-i3c-hci: Add PIO suspend and resume support
        https://git.kernel.org/i3c/c/8afa0dd83b60
[14/21] i3c: mipi-i3c-hci: Factor out software reset into helper
        https://git.kernel.org/i3c/c/57a2f976ac18
[15/21] i3c: mipi-i3c-hci: Factor out IO mode setting into helper
        https://git.kernel.org/i3c/c/e4269df518d6
[16/21] i3c: mipi-i3c-hci: Factor out core initialization into helper
        https://git.kernel.org/i3c/c/7f91e0e6aa3f
[17/21] i3c: mipi-i3c-hci: Allow core re-initialization for Runtime PM support
        https://git.kernel.org/i3c/c/f2b5d43c93e0
[18/21] i3c: mipi-i3c-hci: Factor out master dynamic address setting into helper
        https://git.kernel.org/i3c/c/3c3de6803a7d
[19/21] i3c: master: Introduce optional Runtime PM support
        https://git.kernel.org/i3c/c/990c149c61ee
[20/21] i3c: mipi-i3c-hci: Add optional Runtime PM support
        https://git.kernel.org/i3c/c/b9a15012a145
[21/21] i3c: mipi-i3c-hci-pci: Add Runtime PM support
        https://git.kernel.org/i3c/c/95cb1935168a

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
