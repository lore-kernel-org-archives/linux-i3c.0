Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EEFCA0EE8
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uajCJs7njUwhoo6+uT5ROQvU4/f6+vrAr1p2kT0rYe4=; b=noOYT4f5oFSGzy
	5VTRfSOq3rvP8wjNimI2Rv2KCrjZvJ6QvahnruVabr4573hxq93bdn31sYx0cOeJ7k10/vIwCEUMy
	RG+RNdlUvS6e49XJz1cF2NJzMTu10TqMm+CPgKt1oLeTe6NQvHTEFhBLg0BYgnQ7wPkouF9VwBQxP
	7rwqyFEq2VI6N2eJDy2XXfOwp/ViXA80Jrcu6pS8lXNQ22aEZDeNWROUywa1c9JGj0DKlXaGSGMcA
	Yravfv53P6SxP7KnQTkeWALXHm4UNZcTO62cJ13p7r+QZSfhGdlqYlf/OYpSthlZ9j9PeFm9XzQ68
	d8bP+vxHgLAN7q+4sd6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtNk-000000029Xe-3WMV;
	Sun, 14 Sep 2025 20:31:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtNi-000000029WC-0IKG
	for linux-i3c@lists.infradead.org;
	Sun, 14 Sep 2025 20:31:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ADE9E1A0DC1;
	Sun, 14 Sep 2025 20:31:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 833AB6063F;
	Sun, 14 Sep 2025 20:31:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D350102F29EC;
	Sun, 14 Sep 2025 22:31:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757881887; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=1Qcyn4NnyhNNIw4hqoYXQ807lVMNnOD7WkvqhmoR/SY=;
	b=AlV/4yJOgyZZlnkhqFPM4cBMZodZy/bdV/FMfrVtE7Yj1/5PmgjBgLdLLXcslsk6g4BV9O
	mb2M87cDO/t1nqD0SSgNRn5ZCkLfekzvLD5n8oO7p/BAN5+p1Hi2B4tFY8JzFwO1J34H9j
	gFORJlGSIXDfhcIDK5S72QhZfyb03kVaJXbocA9Skolu9/JmJcagejFhpKfzIFKmlh58UT
	xlUnlrZ8xdkVjFyo6mmraU3QUVT0GafXysQAy4naezXofizKMHOKwTkBKs7lwgTQXoDWaO
	UP1V7uB5Q6j0rNdBvU8hOZwhjxxeaA0riXERcjBUUikOvgO0u1fwJfxzjphaHA==
Date: Sun, 14 Sep 2025 22:31:25 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>,
	stable@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] i3c: Fix default I2C adapter timeout value
Message-ID: <175788160628.376561.12355074762741116990.b4-ty@bootlin.com>
References: <20250905100320.954536-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250905100320.954536-1-jarkko.nikula@linux.intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_133130_238997_4C1443FC 
X-CRM114-Status: UNSURE (   6.16  )
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

On Fri, 05 Sep 2025 13:03:20 +0300, Jarkko Nikula wrote:
> Commit 3a379bbcea0a ("i3c: Add core I3C infrastructure") set the default
> adapter timeout for I2C transfers as 1000 (ms). However that parameter
> is defined in jiffies not in milliseconds.
> 
> With mipi-i3c-hci driver this wasn't visible until commit c0a90eb55a69
> ("i3c: mipi-i3c-hci: use adapter timeout value for I2C transfers").
> 
> [...]

Applied, thanks!

[1/1] i3c: Fix default I2C adapter timeout value
      https://git.kernel.org/i3c/c/f6fecd2759be

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
