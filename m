Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D58D37E3B
	for <linux-i3c@archiver.kernel.org>; Wed, 14 Jan 2026 15:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cMHHIJUns/AJsA+M0C/3f2xJ+/zwe8gMTT7GtvyL2ig=; b=cjyF30RwYeApje
	fQPBYwLUuoe9J5/gOf5Sx2kaExe0dqGDbf/ocHPUyyZ4NaLq4dnQDzBODiYSgwGJIqC3yHKkeYwWj
	wnY9oBK2KxjKAyWlWrpDBCrEn0qSkdfCAl2o0bzMrgIsyGXM8oglv1+jRhyJb9vbp4nLMQoHbv4WT
	P/wLQiv9URvY01tVoI91B0/q2Sqgq3oh3ZNwXQaq/3Jc0x7Am7i5gy2AeNVBRWBXjhrBv7YCf7SKj
	CVmckqlf3lzBz+k9GBvXpJ3H+ax44cysjIAezdH/+EE6PKlRXm5oTSSfuWrl0dxZ//COHhwtrcEup
	ozahFQAa0VTKPMMSDtFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2O7-00000009bpb-0l3V;
	Wed, 14 Jan 2026 15:02:23 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2O4-00000009boJ-1TAG
	for linux-i3c@lists.infradead.org;
	Wed, 14 Jan 2026 15:02:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0EC3A1A2852
	for <linux-i3c@lists.infradead.org>; Wed, 14 Jan 2026 15:02:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D61D86074A;
	Wed, 14 Jan 2026 15:02:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C36BF10B6826E;
	Wed, 14 Jan 2026 16:02:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768402937; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=0DFs2Rg3lXB0cEBk2s5kxFKlNKHYbbCyQP7ha4dj3/8=;
	b=xUmDNh9cP4fG4Fy9i54/gnrazVh7GmKyj6kZhVrI90p5VhIP4IDU6WRFbdPSF6zGn4qnEx
	YN8gqY0t2afFEPHkKhcAgYzbiWtr7xWQ5VZAqDEUV9m2NmMbBFwZBdB0jXNsE10X2Odf+q
	862EgtQA/QDjLY80t8z635OdLOWQ5gp4GYXIXe6BYiiqdAoswWdrNeOq+F0mMTIiJHQbRQ
	cJZwkRwZOczxRy1zNTwSVuB697dNTxEQELoK6Zm/LOTGeePvFqXJABuQHMhz6iQhUaVayi
	B/Be1RRjEKt7Xroh17YuwO/BKAocRC0AiP5qw0Q76u1sAh1gMMoIKFcSzz8oYA==
Date: Wed, 14 Jan 2026 16:02:16 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: svc: Initialize 'dev' to NULL in
 svc_i3c_master_ibi_isr()
Message-ID: <176840281752.1259180.2305157652667385666.b4-ty@bootlin.com>
References: <20251215200852.3079073-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251215200852.3079073-1-Frank.Li@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_070220_526661_AC15A533 
X-CRM114-Status: UNSURE (   6.42  )
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

On Mon, 15 Dec 2025 15:08:51 -0500, Frank Li wrote:
> Initialize the 'dev' pointer to NULL in svc_i3c_master_ibi_isr() and add
> a NULL check in the error path.
> 
> 

Applied, thanks!

[1/1] i3c: master: svc: Initialize 'dev' to NULL in svc_i3c_master_ibi_isr()
      https://git.kernel.org/i3c/c/3c9ffb4db787

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
