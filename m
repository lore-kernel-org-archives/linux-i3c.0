Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F763CD98C5
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Jun 2026 20:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2kj5K6cvNka3BHHtSW4XPAK7eyVjNCMSj5qFicGcDI=; b=GYPR/+AzmPLjle
	SfzhXoyXLKV0Pxi8R2eqypO02mbgZIsfciRkjAYdlqxm/ZzCIZG4HdGA+KCRW5dpU7j1OBAdMUOSt
	0eEg8RI31WNXfDxLWsErcP4O4T/az6Z2LL3oefEFM6F83cFgnf8Lo9L0ZRN2I35gwCUeQo4AI/a6A
	JyBUoM/fNU6mfCON5Zze2z8hz3I68dXWkeVOjMTfoXRpxkWv7emSDek2izuW5deNkdc5yAe5pfuWZ
	d4i0jw6fy4wq9z2IMHFKj1FFFax1c8rk8iP0P1jOOmRVvX0Jd+cympmwWMIBtAVWw8qk2CImeWk8Q
	uRjfh/X4qYG61vbVrVFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYrJx-0000000DH9h-3Y4l;
	Sun, 14 Jun 2026 20:20:41 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYrJu-0000000DH8Y-1oSM
	for linux-i3c@lists.infradead.org;
	Sun, 14 Jun 2026 20:20:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 801D9C4FED9;
	Sun, 14 Jun 2026 20:20:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AFF0460014;
	Sun, 14 Jun 2026 20:20:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C264A106C86BD;
	Sun, 14 Jun 2026 22:20:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781468436; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=t5rkqzwLsD3bKFXtbZTJbHxws5txCJyZfb0YLb4+41U=;
	b=w87Pta5dNRONr2gafZtXBGN6oG0EOyM3k+3knYNTPgiV9co9f3G/CmCp6+S1ZTXu6BJu3n
	EWRY3yoYSq3cdom0BxruKDbAfezsIHak0hZtjMDFi5Vb45phFt3xLDwI+Uan5Js4VTMYOj
	V2gZr/fNC4XP6GlykdpP9mnGQJnyjc+mXZ0Weh/t+UQ67dfnKt6wXR5tjMk+GiZjdIlQhl
	EbQi2PVTfAyMDsmMxsMHsGxnYgQfznb/gjHaos0QJ8xUjZnAu98n3ZArtG5SEvyYSKDOGc
	m+aFTqiAgcS7ECkzdworTAtuTVu3ExJUxFgqhKaIh8tPqH84dxkZqBoF2Ayz8Q==
Date: Sun, 14 Jun 2026 22:20:35 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank.Li@nxp.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5 00/17] i3c: mipi-i3c-hci: DMA abort, recovery and
 related improvements
Message-ID: <178146821206.334162.2724920522818466536.b4-ty@b4>
References: <20260603090754.16252-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260603090754.16252-1-adrian.hunter@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_132038_628783_2FF8449A 
X-CRM114-Status: UNSURE (   6.26  )
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

On Wed, 03 Jun 2026 12:07:37 +0300, Adrian Hunter wrote:
> This series improves the robustness of the MIPI I3C HCI DMA mode driver,
> addressing issues observed during error handling and recovery.
> 
> 
> 	Note all patches have now been reviewed by Frank.
> 
> 
> [...]

Applied, thanks!

[01/17] i3c: mipi-i3c-hci: Fix suspend behavior when bus disable falls back to software reset
        https://git.kernel.org/i3c/c/57e181af13de
[02/17] i3c: mipi-i3c-hci: Preserve RUN bit when aborting DMA ring
        https://git.kernel.org/i3c/c/093eb8e73c90
[03/17] i3c: mipi-i3c-hci: Prevent DMA enqueue while ring is aborting or in error
        https://git.kernel.org/i3c/c/c9b57ad97872
[04/17] i3c: mipi-i3c-hci: Wait for DMA ring restart to complete
        https://git.kernel.org/i3c/c/e251e7c9fd30
[05/17] i3c: mipi-i3c-hci: Move hci_dma_xfer_done() definition
        https://git.kernel.org/i3c/c/dc8691bf4fc4
[06/17] i3c: mipi-i3c-hci: Call hci_dma_xfer_done() from dequeue path
        https://git.kernel.org/i3c/c/2dbe7832ae9c
[07/17] i3c: mipi-i3c-hci: Complete transfer lists immediately on error
        https://git.kernel.org/i3c/c/f00deffd9a5d
[08/17] i3c: mipi-i3c-hci: Avoid restarting DMA ring after aborting wrong transfer
        https://git.kernel.org/i3c/c/a53891532acd
[09/17] i3c: mipi-i3c-hci: Add DMA ring abort/reset quirk for Intel controllers
        https://git.kernel.org/i3c/c/29ca24fbd2ef
[10/17] i3c: mipi-i3c-hci: Factor out hci_dma_abort()
        https://git.kernel.org/i3c/c/5d3855504912
[11/17] i3c: mipi-i3c-hci: Add DMA ring abort quirk for Intel controllers
        https://git.kernel.org/i3c/c/352d89067f78
[12/17] i3c: mipi-i3c-hci: Factor out reset-and-restore helper
        https://git.kernel.org/i3c/c/3cfb40ba9501
[13/17] i3c: mipi-i3c-hci: Add DMA-mode recovery for internal controller errors
        https://git.kernel.org/i3c/c/5738043bade4
[14/17] i3c: mipi-i3c-hci: Wait for NoOp commands to complete
        https://git.kernel.org/i3c/c/c14e53de8dd4
[15/17] i3c: mipi-i3c-hci: Base timeouts on actual transfer start time
        https://git.kernel.org/i3c/c/9b34c4e4c849
[16/17] i3c: mipi-i3c-hci: Consolidate DMA ring allocation
        https://git.kernel.org/i3c/c/1a7c9c143a20
[17/17] i3c: mipi-i3c-hci: Increase DMA transfer ring size to maximum
        https://git.kernel.org/i3c/c/e62fe9f26771

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
