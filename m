Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7F8FF8873
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Apr 2026 10:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1dvdyNaq65+eSpKdDCY7Ct6n/CthILT5HLORqpHHBhU=; b=UqtAArha6GDesz
	xYZdj9OtvSoVYAGHkbTA9OacznflgGKQf3Jqsz/PWOXkQRZ4hbqbJTzNJF/FqYMMQ0rrEJ2gpuD9U
	mwj+7c7VRU314FlSo7dyyZEBcseNqtZwaNR2KOxXJyxnE5oVqLg8x9A6F5303IHtRB6FHNvoUevyf
	vARJRjXsXIdPT3SoRONlQqF0XUQpuLnW7AXZ5c+sqg/n2+xpqMKPlMUwjQvf3JEQMQfxKvSUtlaxx
	TOx2jtfmnRHk6i078H3Jvux8PZfLm4XNhMdyXI4ixXCEqFQaNhwxj7Hf+gVLD1HIdzrEofsNDCJfh
	77jpGXvDMDNZ4EfaineQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOPB-00000005B13-2vf8;
	Thu, 30 Apr 2026 10:14:01 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOP8-00000005B0K-2Ucf
	for linux-i3c@lists.infradead.org;
	Thu, 30 Apr 2026 10:14:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 820294E42B75;
	Thu, 30 Apr 2026 10:13:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FA7060495;
	Thu, 30 Apr 2026 10:13:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A91D910728045;
	Thu, 30 Apr 2026 12:13:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777544035; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=lnuQGViz1O8cftzEX7g8Pn+xmQoTDs0eyWNJaBUwF2E=;
	b=TFU0kYvEg8S8rc4JAr1OoNWYfh1HOEThomhFhzOg8Iq1acgv9zxT6TQod3ZfJySW8JaZeQ
	+JaMFLNcWl/rI3uonoR7hLSMA386JfwczR8P1Ca3creM+OH3R0khwqBTZwBNl+veK66Lsz
	Zbs/TkqdoOVkHSfbH+hXcFKvqqMOPgOJdG2ddUjoH23fy8a3AgMDxEqa3ZSucdccFU1vaB
	obC2Q0VTKiiPcMGOFGESXIKaC3/F9Rhull6LyxDb2srRdz4u1CAO78eFNEaef5hHna/jUI
	Mu68WLdEFQBnfEaM5zgbFl06dIahDTi/Cx93diXod8jqM3T32JTn9GzJgTye/A==
Date: Thu, 30 Apr 2026 12:13:52 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: git@amd.com, Frank Li <Frank.Li@nxp.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH v2] i3c: dw-i3c-master: Fix IBI count register selection
 for versalnet
Message-ID: <177754402455.578753.14323332077437134923.b4-ty@b4>
References: <20260401084430.436059-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260401084430.436059-1-shubhrajyoti.datta@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_031358_788073_00636FA9 
X-CRM114-Status: UNSURE (   7.77  )
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

On Wed, 01 Apr 2026 14:14:30 +0530, Shubhrajyoti Datta wrote:
> On DesignWare I3C controllers where IC_HAS_IBI_DATA=0 (such as versalnet),
> the IBI_STS_CNT field (bits [28:24] of QUEUE_STATUS_LEVEL) is hardwired
> to 0. The IBI status entry count is instead reported via IBI_BUF_BLR
> (bits [23:16] of the same register).
> 
> irq_handle_ibis() was unconditionally reading IBI_STS_CNT, causing it to
> always see 0 pending IBIs on versalnet and return early without draining
> the IBI buffer. Since INTR_IBI_THLD_STAT is level-triggered against the
> buffer fill level, this left the interrupt permanently asserted.
> 
> [...]

Applied, thanks!

[1/1] i3c: dw-i3c-master: Fix IBI count register selection for versalnet
      https://git.kernel.org/i3c/c/1d78a8fc97c1

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
