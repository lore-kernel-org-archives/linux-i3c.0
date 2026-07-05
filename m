Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF541C43458
	for <linux-i3c@archiver.kernel.org>; Sun,  5 Jul 2026 21:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HVn4CTSb/07B0YPLsH44laRBpKeimR2+xaYSM27y34=; b=0Jn6PHuqMpZa29
	msQz07LiTEcIEgaKtO1wTG1yfoFltHrH3KQaA+5kBtBUBlDRets1Huu32GkkgUKopnCPno/WTi0Rr
	Tpxlx9aeHDUjXs5w/fg0jtn0lMBPBxon/oqYUnVHZLC+ceovGKx8+OpwRPfmLq3ps0nvXiW2iY9yZ
	5vAVFbRx9caf3hpbUnhtq1k2kcemWonzCby5UEdNthf8GJ87t+h7jjf678Kl4kzj/+ZZ77YAE27Jm
	uei8QTLmLxwdDM29DoBaj1DConZhlXSxAFrgXOxbVFzOucggQ78dn6SUU65rCdP4BUgRFySId+wsJ
	si2NVGFVycafUWm1XpKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgUOv-0000000A23Q-2csK;
	Sun, 05 Jul 2026 21:29:21 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgUOt-0000000A21Z-2hnX
	for linux-i3c@lists.infradead.org;
	Sun, 05 Jul 2026 21:29:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B86FDC8EC43;
	Sun,  5 Jul 2026 21:29:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAC67601A2;
	Sun,  5 Jul 2026 21:29:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1B4311BB9580;
	Sun,  5 Jul 2026 23:29:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783286957;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=+lEZYk68llCYxz5k33z4dXZCH+pqFVSGDQWFkklMakc=;
	b=X8hiZRTaimBTbj3SbIddaflS70kalPEWPlfgOBOlZKn9ZKa4jek79nEeRS5cokwZFALckH
	6DQN6IAvoYn9xcOicF+CU4FUW6EZOfPrrXQDX7XTdywX9ZMkrMGVPQuS/pba8Yd+9RBID3
	p/p34vibaREy+LTODRBXhMF82rnoZmDdzwIsrU0anvyqrnRg4vwuHODfG32ZDzWZMjOow+
	Z8G52wvn7MneMLtjscH4ZK39TG39Jw2oU4d+og5jSxxXwtNw160qcfseiv6uXOQ5NwhrCx
	7o9hyicmW3GwXwr8rNQDQsCDqI51Bkrvg7JxW8N/EnCae1NhxKmU5lTfCJCCnA==
Date: Sun, 5 Jul 2026 23:29:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] i3c: master: svc: report timeout waiting for STOP idle
Message-ID: <178328692974.58266.14923284567218561047.b4-ty@b4>
References: <20260623060821.23238-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260623060821.23238-1-pengpeng@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_142919_868914_FE6BD94E 
X-CRM114-Status: UNSURE (   7.80  )
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

On Tue, 23 Jun 2026 14:08:21 +0800, Pengpeng Hou wrote:
> svc_i3c_master_xfer() emits STOP or force-exit for the final transfer
> and then waits for the controller state to become idle, but ignores
> readl_poll_timeout(). The function can therefore return success while
> the controller is still not idle.
> 
> Return the idle-wait error through the existing warning/FIFO cleanup
> path so the caller observes the failed transfer without emitting a
> second STOP after the final STOP or force-exit has already been sent.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: svc: report timeout waiting for STOP idle
      https://git.kernel.org/i3c/c/90ae03e37e26

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
