Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C1CCAC5AC
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Sep 2025 22:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NNiwTFiwHVF5iaqR+6+Nm7iTxHcSOPDynk2srnq+Ozw=; b=vmi4QrP+3VBL9U
	bv5RcOGhtS4XzKgH5T641H4wczx28xVklodbvd0BVHdeSXaEoLepPw1BkWTi06HZYtZzaIbBe/usA
	TDO1f0TlE7DX6+gOAtVALcr9noGgC9ALwdSGh8aZvf3r7HSYzMyvSheVgXPvHLQK1NTlzRWC+9zAe
	3XoKDP6sDjjuPis0K9T7j7slbjVsV1O2LVEXwXE9IGORQiENOLIeNqCPXPXpKQTTL9SAs7993DEpn
	lVvColN/qvNOBTZQVeHbKZhiol0/8hmj+Ic1s1ztCHCe8b3AuHmYK5x9LmIu/YioryKg3cj68w8/6
	1GeA7+nBYwa87+dTW2PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Bst-0000000F6xN-0B25;
	Tue, 23 Sep 2025 22:53:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Bsp-0000000F6ww-0UOo
	for linux-i3c@lists.infradead.org;
	Tue, 23 Sep 2025 22:53:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6306D4E40CDB
	for <linux-i3c@lists.infradead.org>; Tue, 23 Sep 2025 22:53:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 198A260690;
	Tue, 23 Sep 2025 22:53:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6BDC7102F18D0;
	Wed, 24 Sep 2025 00:53:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758667990; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=oQmr4Di+enux/eedyYTgIAwrnKr9S25f1mwcR+UOfPI=;
	b=EaYX6+7ipgKEjHDaUrYya4Aghoy1c6mya/3Ou+2fkmfjjgKHbUWEeADDYHi3VNkbkggB4J
	B+qVzE3qmQ7qSzEbAzZhPTmWMKcfLOHYkQAB6xpqVVtIRLMLmkTp1GhHpr0LxDGts+zlIN
	/DGj7CvGfOqSYbi9u4nt+iUzey3NUccJ5ClICvl5QzyWfJUkhHWKjZxzIecUbluu7hodDU
	hgUvBtz1xuJHS28/JykdFzhTmVCjYY0CSXRxI3+CYe6ebBGTey/H2ACvfC5AfCjx9Bg4RK
	H+B5klCPgp3BdUR4hT4hsUekxMoj5wAH8rVbQuPu4Efk9kQ79Z6grVtcU7vNSw==
Date: Wed, 24 Sep 2025 00:53:01 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: Remove superfluous FIXME
Message-ID: <175866771162.212158.11360718295007829847.b4-ty@bootlin.com>
References: <20250923203557.18298-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250923203557.18298-2-wsa+renesas@sang-engineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_155315_291479_03E1A08F 
X-CRM114-Status: UNSURE (   6.04  )
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

On Tue, 23 Sep 2025 22:35:58 +0200, Wolfram Sang wrote:
> I2C adapters can already change timeout and retry parameters via IOCTL.
> This allows for better tuning to workloads compared to per-adapter
> defaults. So, the FIXME is not needed.
> 
> 

Applied, thanks!

[1/1] i3c: Remove superfluous FIXME
      https://git.kernel.org/i3c/c/649764145b70

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
