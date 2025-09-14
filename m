Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52190CA0EE8
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nWYbrDj1wyOflALkSXoDk5hCXzzNqIVB0DaBievABdA=; b=oVcmiyIpCzn+jL
	0VugWLYPDy/JeqZlEKQoBsJTsnPFrqEzpkW/vXuGOGXz16dUds8bTMvxq8nnf35sENMswIwvapLPS
	Mc6doJNJ4uvAWd0sr2IHPzHuoKQSCCf9kk9n21OzcxeEwH4b0XIQFNAAU95/FG5DsNYqmYsuItGyk
	mNs1IMFCr5x4TGuaJKmnSnOLcn9si1fz500Ebk5JeD6zw9JkQReFMwikNuubYoS66c8/f/RRQ6s33
	kjXBvDq5K3gNxQhB7mI9AcScOQXB/1YmExrLuq2nQCB7VUM2JULcBwpjAW183jpd/HmlCcYmq1Wrn
	tVfaXbEseOTmNCo/28Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtNx-000000029ao-0PuM;
	Sun, 14 Sep 2025 20:31:45 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtNu-000000029ZG-1gDD
	for linux-i3c@lists.infradead.org;
	Sun, 14 Sep 2025 20:31:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7B6AEC8EC7C
	for <linux-i3c@lists.infradead.org>; Sun, 14 Sep 2025 20:31:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B2E066063F;
	Sun, 14 Sep 2025 20:31:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E15A0102F29EC;
	Sun, 14 Sep 2025 22:31:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757881898; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=IjeRLBUuN8vZVgNTzEg96X4OLopSNi3AXMraeQOZ5kw=;
	b=dkUPRVQyXNT8qZWiahiF3atZsNt7JeNK9lnrukbvnVVJ6ZyZYunER1chv4Gupj8DD31HSQ
	No9Y22xpBPcFi2MOfvWIqTgje/z3q0c8nWTucQtWyng6ZCYAjz+PgyEuoRG8UECFZesVzD
	Vpn31Gn11cNzgSjApthWGTmIkujJ/KdZDfjqISoddOWAfn3LW21HUrVVhXP+yxHz+EO+Y4
	fA4pHv3rFm2fOoo+sXkgm5hjSXGCyq8VvXHe06bK1+t9szPGqgsyqIHIckl6R7ymWEEelw
	ySBv8UVVuwmSAPtxctW9Kkv1jWPvdfr/5dPItpuQTU2bzwL2VnZDnSY4/CqHTA==
Date: Sun, 14 Sep 2025 22:31:37 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 0/4] mipi-i3c-hci: Make able to work with IOMMU enabled
Message-ID: <175788160627.376561.17599151969358473070.b4-ty@bootlin.com>
References: <20250822105630.2820009-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250822105630.2820009-1-jarkko.nikula@linux.intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_133142_634924_0CD2A094 
X-CRM114-Status: UNSURE (   7.04  )
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

On Fri, 22 Aug 2025 13:56:26 +0300, Jarkko Nikula wrote:
> Here's the 4th version of common I3C core DMA mapping and bounce buffering
> handling and making the MIPI I3C HCI able to work with IOMMU enabled.
> 
> Changes to the v3:
> - patch 1/4: Renamed variable "need_bounce" to "force_bounce" and document
>   both true and false argument values.
> - patch 3/4: Added Reviewed-by tag.
> 
> [...]

Applied, thanks!

[1/4] i3c: master: Add helpers for DMA mapping and bounce buffer handling
      https://git.kernel.org/i3c/c/f339a80c9622
[2/4] i3c: mipi-i3c-hci: Use core helpers for DMA mapping and bounce buffering
      https://git.kernel.org/i3c/c/ed85e2816399
[3/4] i3c: mipi-i3c-hci: Use physical device pointer with DMA API
      https://git.kernel.org/i3c/c/7216d8d38563
[4/4] i3c: mipi-i3c-hci: Use own DMA bounce buffer management for I2C transfers
      https://git.kernel.org/i3c/c/f49ffbdcc689

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
