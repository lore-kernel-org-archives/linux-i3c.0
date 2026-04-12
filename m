Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFE1E93804
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Apr 2026 20:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4gqyvQfOxoT1AorzWeVWKmHExuCLV9S94Vm3NgDCaH0=; b=nxn3nx6Ab3Y8fy
	n8/zVDpifJ1sO3nkIxNMLQZ3hme1AEF33LV7KSiCYuLuEOCe+K5a3XxdC493iddsNyeyQQJSj4HX3
	wTud+kJLfOF/oe+XM8BH8TVP+tXy3YsydWGkKDeInuOGJoN39zzJ1vV1ztOoJo2Dl2V+JlW4qaBV8
	TgWE/6hg6xsafNoh5OOzhR54gXc/uTPftIqEXP3VDtTIjSgPmCX477DQc2bQkUpPeOmRtSyKVT1+o
	UMCo5iJyOq4i2TQXUXagCFg0woxBu+AIYQUJQdUpiconi7WpqWT7YOvue6YdAIxfmo7z9qc6HbDWx
	/YNfRGJXG239wYgZzuLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC15h-0000000Eevl-1ssV;
	Sun, 12 Apr 2026 20:07:33 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC15e-0000000Eeus-0ztV
	for linux-i3c@lists.infradead.org;
	Sun, 12 Apr 2026 20:07:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 69E6B4E429D5
	for <linux-i3c@lists.infradead.org>; Sun, 12 Apr 2026 20:07:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D66B5FFB9;
	Sun, 12 Apr 2026 20:07:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A78BB104500EE;
	Sun, 12 Apr 2026 22:07:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776024445; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=oOTxpheUEF8ksp9JzNSInbOvg/aaZV83AB70CBz0LwM=;
	b=ZGxwedvwGglzy7dyOoylaAahlHjEfzPL6VNy3OM4iu+kjFLMGg3g0+QTOXidXbL0k4N/Xo
	ZSBHBvnRKnfwCT7nVzMJZ4nljL2AjkHHv2edxyBfnqmSAErNWm0epbt5BLmsk5RGNe6VXe
	pPDY0FGTsghHjr47wTlx7jQ9i10ZG2589781uVjjDa4cNQggC/yw9bmcsLCwGFhQSKYlC2
	P4sTXwNllIBP1FQnszNLHfR/VwelR4thAsrvvzqr68kFA/BIqTjr4n0W0YvTwwvahA1xY1
	OHpLGvKMvvl1U5a2RfCWkN8B2hEa9jOqb6QVoj8tTP9EMTzbFPFrl3Q7ScoZgA==
Date: Sun, 12 Apr 2026 22:07:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Nicolas Pitre <npitre@baylibre.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i3c: mipi-i3c-hci: fix IBI payload length calculation
 for final status
Message-ID: <177602443411.2831575.14896131514235713722.b4-ty@b4>
References: <20260407-i3c-hci-dma-v2-1-a583187b9d22@aspeedtech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260407-i3c-hci-dma-v2-1-a583187b9d22@aspeedtech.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_130730_722644_AF07DD5F 
X-CRM114-Status: UNSURE (   6.74  )
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

On Tue, 07 Apr 2026 16:53:23 +0800, Billy Tsai wrote:
> In DMA mode, the IBI status descriptor encodes the payload using
> CHUNKS (number of chunks) and DATA_LENGTH (valid bytes in the last
> chunk). All preceding chunks are implicitly full-sized.
> 
> The current code accumulates full chunk sizes for non-final status
> descriptors, but for the final status descriptor it only adds
> DATA_LENGTH. This ignores the contribution of the preceding full
> chunks described by the same final status entry.
> 
> [...]

Applied, thanks!

[1/1] i3c: mipi-i3c-hci: fix IBI payload length calculation for final status
      https://git.kernel.org/i3c/c/d35a6db887ee

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
