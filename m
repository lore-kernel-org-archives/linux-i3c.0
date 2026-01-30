Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6AEE6BF3C
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jan 2026 23:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q70bj2Mz4tYBC2lFtb4C3G5B5M+kdCfTnyslet3rPDg=; b=d2LBBbGACzVBnx
	rafueFp/m6839qvInR3W2waXph9Jh/ZHv1l4e/f63fThBXz3tzfPyj14/R9CZ9nqj39q/z/qg4HJC
	C4NDJVSEyc2wKcb3rVZQk29meE4E9WWfqoDdrDGrsXR9cmHi4qREYF6qkyGhnESE7Mc73hks9bmQM
	0V5cU6C73H3CNv1v/aTKAmf5TadQh2kPrqqhQkq5FIUTaa4jPW7MQ24CKTG76ir67Cr2GoeF3a+o+
	8/rdLgu7VESOqa8xbPjgdhDtyssibiOdnkxlTztV/MHemMKZlw10QGQh7Gh2H9u7DvL5LZ43/cEWO
	MNYHTLUTATb6wNYpI4ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxau-000000025LS-1a3J;
	Fri, 30 Jan 2026 23:08:04 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxar-000000025L7-3FlZ
	for linux-i3c@lists.infradead.org;
	Fri, 30 Jan 2026 23:08:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8554F1A2B4A;
	Fri, 30 Jan 2026 23:07:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45C2F6075A;
	Fri, 30 Jan 2026 23:07:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3443119A88BC;
	Sat, 31 Jan 2026 00:07:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769814478;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=PjlmyckFW0D6zxCV+EL4zSVsoHYa9fPttNSQDkRBMZg=;
	b=UwvmrNzTsx25KBd/m3MyN1W7ZbaCkTeGO60GxyoJXXE+tn9bJmKzuxPvzliiGzUUjbiAfJ
	DCWY5hj1gQFarysofvsnU6J81fY5mKM5JC2JtF5Kmakj1qWw9iEUsSHuVl7KVt4u9EPLjR
	6Ix0CbO82+yabs/w6haLweZIeW44OqUTqOowrkmXghTr4UJSuWW4b+0JadVYfMlMj00A7j
	cCGcig3eqRTsEPSkxmXkvfkeGRZIdMNbJ/SiUPoAMRrjYtgNMLgcDFqq3VRMHQrNF/cb2N
	3eihpA7SdbGgCh1G0tblpvDZB1g6X7aSs6FFcPUojwfFvCERyOTvHFEvg9BsNA==
Date: Sat, 31 Jan 2026 00:07:57 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank.Li@nxp.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, adrianhoyin.ng@altera.com
Subject: Re: [PATCH v4 0/2] i3c: dw-i3c-master: scoped spinlock guards and
 SIR reject fix
Message-ID: <176981440899.2224815.18209671162401912394.b4-ty@bootlin.com>
References: <cover.1769479330.git.adrianhoyin.ng@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1769479330.git.adrianhoyin.ng@altera.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_150801_986615_C3DDE6FB 
X-CRM114-Status: GOOD (  10.58  )
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

On Tue, 27 Jan 2026 10:05:05 +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> 
> This patchset replaces open-coded spin_lock_irqsave()/spin_unlock_irqrestore()
> pairs with scoped spinlock guards to reduce boilerplate and ensure correct
> lock release on scope exit.
> 
> In a subsequent patch it fixes the SIR reject bit mapping used for IBI
> handling. The IBI_SIR_REQ_REJECT register is indexed by a folded form of
> the 7-bit dynamic address, but the driver currently uses the device table
> index. This can result in IBIs being rejected or accepted for the wrong
> device. The patch derives the bit index directly from the dynamic address
> as defined by the controller.
> 
> [...]

Applied, thanks!

[1/2] i3c: dw-i3c-master: convert spinlock usage to scoped guards
      https://git.kernel.org/i3c/c/c7311aa4a71e
[2/2] i3c: dw-i3c-master: fix SIR reject bit mapping for dynamic addresses
      https://git.kernel.org/i3c/c/ed318b3fb4ab

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
