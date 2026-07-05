Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADD7C43458
	for <linux-i3c@archiver.kernel.org>; Sun,  5 Jul 2026 21:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gM0n/qwiXyLTleZuGs6PxLIJmG72QGNSZlA3l2gz8LM=; b=37C3Mh+wZZwHzz
	T9DcAQAh7OqS1fMBVjVQ7mYoHQX8pvJU7uOhvSnv9iZDaK1czWTKEBnGpl2lrxm+yb60BwlscyBeh
	t5CETEkMKvM8cvpTEXQIO9tplUNfp8OwBR9l0i3ziAPJMlKtRmZlZUfP1uzOyHCJ7Szw/2OhVGXTb
	p7xMyrSntHqQco6COqBwTs0ppGi5cme1rUbB4CX4/LAWCLJs60tZl7qg/ws2AdLjJIqE5/e2kcNAQ
	cuxGLqcWXlJ12oJYPvSaS7cFhRiXJ5FntmxRqzZ8NwfUn5dJjCncTCU614wo5pm9jRdDOOVAt7y9l
	p8FgYoXAAZnn7atIuI0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgUUL-0000000A3kA-0rGK;
	Sun, 05 Jul 2026 21:34:57 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgUUI-0000000A3iI-0rCk
	for linux-i3c@lists.infradead.org;
	Sun, 05 Jul 2026 21:34:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 178C1C8EC43;
	Sun,  5 Jul 2026 21:35:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F766601A2;
	Sun,  5 Jul 2026 21:34:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B66E11BB8700;
	Sun,  5 Jul 2026 23:34:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783287290; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=TzeZ1KnGxHK+/UBVNPSOQq8AvBOdxRhN111n8ZoPZ4A=;
	b=sM2H1F82yauweHXUU17I9L8bSxYJfFOYTwwlFoypjEj4tREH5q+DcBeLdKsh8SaIHJ8/to
	lbWc0IflK02FBxfweCV03duT/abQP7g3xj4BY7x+YZv8ps6gE7wuYIH0on8frDu7Kd+bBY
	mXAjjNs4PIasFmuYb96kX9Ijmp4mtWsnX2tU+y0EL0CVG6kmZQmnTrqJBUJF+R71lcN/Q6
	RFnh0qM1e6FtpNwGo18MDmXfNB2SKWSeiJbJ9iTA/qe+9AzifDJz8s6iwm7wDDicLxMlbG
	JccMjZQP8A2dcQ1TIl29HpWw9/HaAoz8k8Pyym09qB9k0R4BI6TF1QBoLtzOyQ==
Date: Sun, 5 Jul 2026 23:34:47 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>
Cc: Frank.Li@nxp.com, adrianhoyin.ng@altera.com, ustc.gu@gmail.com,
	bbrezillon@kernel.org, vitor.soares@synopsys.com
Subject: Re: [PATCH v2] i3c: dw: avoid shift-out-of-bounds when DAA assigns
 no devices
Message-ID: <178328728112.59680.8356433709607736206.b4-ty@b4>
References: <20260630172904.2662160-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260630172904.2662160-1-kuba@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_143454_413473_9FFBC3B8 
X-CRM114-Status: UNSURE (   6.17  )
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

On Tue, 30 Jun 2026 10:29:04 -0700, Jakub Kicinski wrote:
> On an empty bus ENTDAA assigns nothing, so cmd->rx_len (the count
> of addresses left unassigned) equals master->maxdevs.
> 
> The GENMASK() index master->maxdevs - cmd->rx_len - 1 then becomes -1,
> which trips up UBSAN. This happens every time on boot on a Gigabyte/AMD
> server:
> 
> [...]

Applied, thanks!

[1/1] i3c: dw: avoid shift-out-of-bounds when DAA assigns no devices
      https://git.kernel.org/i3c/c/eeedacd0866e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
