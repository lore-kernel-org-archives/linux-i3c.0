Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5911CA5FCB
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Sep 2026 14:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5g0XSErmq5+EAgSrHv0566lTkyelkkPMw8mPv6jbE4=; b=o3lqYe73UvxmXj
	c49dw+JLX8YbjuniqQFC/GxDc0WfrW/GVNqKxKjYfsycudoFu9PduPMX/eQYg6MlfvZmoTTCbqkwa
	Ec8IijrXW9XEA8L+xpVHgj3n/OiruE/0CjJGLt3fgqT1F7B+AS6+r9RVnIucjhp4SDzAfrRU73Cfw
	IEDTBBzHrBsFZYRWCHp4f1NICEoTQ/UWiKeoUL2UYAfzvN4IzQHkkPg6DUmp8k8nIach+SdMZg5Y3
	rEedFS/tqP4+oSv4Ggj/te6a4FLg3Vh0VtKFpPo0u2REalOAED5f+m5ysaqBjPyZ98SodAJFjPQT/
	x2pi+fWXaOHXVFE81B2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvBQ-00000006IVe-05fG;
	Wed, 30 Sep 2026 14:21:20 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvB9-00000006IMv-3CHj
	for linux-i3c@lists.infradead.org;
	Wed, 30 Sep 2026 14:21:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 308004E410D9;
	Wed, 30 Sep 2026 14:21:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFD9E60749;
	Wed, 30 Sep 2026 14:20:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D10D5103283FC;
	Wed, 30 Sep 2026 16:20:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790778059; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Cp+D07WurpbWSMpKPIKSwnGgyFLxPSz7Sc7naukKSWg=;
	b=aL+o4JaoBIzNiZWSzVmZJCG7egwzH8W98aDqnjHQhKcZqlO08OmZwVowGNlXsJHXckHUZt
	ITV52l1zpOZ5QsiHZ37nAMv2Bmz7pmfGbcEGnbbcQPwn2HVShx4AkRzBH6g8ywF1FvcRAr
	4mjXL1s4237TBSeOF08WSgU3+dzHbwKxuVHN8Q+6/zn3BWyagSkEbFROk/QJnQf3I/u5bo
	NFVN/G6MRe2PSYZgt9ngEU/whfqYwI2BMGkM+fy9adM1CZwrH4NKIiYXquKhoMXCM5rgYK
	Pemx2v6e0KFM7v7eVgagOGgRa0pk8BbJtH2Bwfqu+X2KIAiTeth+psp2J4EU2A==
Date: Wed, 30 Sep 2026 16:20:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Song Li <songl@zju.edu.cn>
Subject: Re: [PATCH] i3c: master: adi: free the IRQ before unregistering the
 master
Message-ID: <179077804631.406255.4420583421827208390.b4-ty@b4>
References: <20260923085340.490776-1-fanwu01@zju.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260923085340.490776-1-fanwu01@zju.edu.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_072105_072812_47C33709 
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

On Wed, 23 Sep 2026 08:53:40 +0000, Fan Wu wrote:
> adi_i3c_master_irq() is requested with devm_request_irq(), so it stays
> registered when adi_i3c_master_remove() runs, and the writes masking the
> controller IRQ sources do not synchronize with a handler that is already
> running on another CPU. i3c_master_unregister() then frees the
> struct i3c_dev_desc objects that master->ibi.slots[] still point to, so
> the IBI path in adi_i3c_master_handle_ibi() can dereference freed memory.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: adi: free the IRQ before unregistering the master
      https://git.kernel.org/i3c/c/1c1e2d90aa45

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
