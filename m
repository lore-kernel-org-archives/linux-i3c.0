Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D496C197A0
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Nov 2023 22:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOQMef5frJxy/up2YzE++nvjO7Sajq2J42qcWN8g9wI=; b=na0NX31X9o1Ehb
	J0CXeB+tEGSjMdEWe5VdgfByVOaF3nfKiqcLCVIEIR2Wz+rZ34v0mYEVQe4nqhsInt0yCiwb5cNK/
	OV7eO8i4OrL/v8l2JM7tBNkwhFNdMbbZ3XaOed3AHVVV3cd2ioz90aHWxF3HiiUU/nuIB6k2HeqCb
	ObMEVYWt5KorNH3mVHy9HFY6Yp711Z9FcA2YcTlZfCB6ksaYqUJCv+JgYGuXnx0b4gZntIu1iP42a
	jvzgxHGkuGRmXOD98QgCFU39CFV/AE2dHxnBs0zmhe/5ZN3B/dqUvM0P0+MwH7+1SykSq3zRIGBB8
	ghzS2om4u8d6XswAsdEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3l1s-0055ki-2c;
	Thu, 16 Nov 2023 22:40:08 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3l1o-0055j2-37
	for linux-i3c@lists.infradead.org;
	Thu, 16 Nov 2023 22:40:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 921DFC0002;
	Thu, 16 Nov 2023 22:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700174398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xl5Q1jYMWPaXubGq4PgACl4K19LrIBvSYWEFLibK6rk=;
	b=DtpBjnpGcOJYrBbth/XlT69jgO/WJWhW5SCtIFzHyfeLmrzhRW1iyCtjhYZ1M8cF9biypS
	xQ+Cmu4drOvzgHbio2W4xWmzQ1eE6J+WKagn/iZbJZg+2HHZnEsDLy0oNMtxYwCeaplcZQ
	O+sc45EbT30sN2GnynkBNX0I1wbYH0YLjXZygyZ090H++/srJbNpmqhS265EagmCqUEvaS
	d92rqukEvf5JMu1C/y2m3v7g/94lwuq1O1z+7fDK7jiUZ5tSPP+zcXld7FiLgped6gxhJd
	tcwWmCunPYL0VaVIK3lFaMIOtb4SYhUdgCgFqV/ny9P/tX4rKC5nIMGvct3XUw==
Date: Thu, 16 Nov 2023 23:39:56 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH 0/4] i3c: mipi-i3c-hci: Functional update
Message-ID: <170017437281.331655.11512540104528789088.b4-ty@bootlin.com>
References: <20231109133708.653950-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231109133708.653950-1-jarkko.nikula@linux.intel.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_144005_298136_88EA98FC 
X-CRM114-Status: UNSURE (   9.90  )
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


On Thu, 09 Nov 2023 15:37:04 +0200, Jarkko Nikula wrote:
> These are v6.8-rc1 material and not for current cycle.
> 
> With these and handful of local patches [1] I'm able probe this driver
> successfully with an I3C device on the bus and without.
> 
> Also able to communicate with I3C and I2C device from their corresponding
> device drivers. I'm using in my test setup an LSM6DSO sensor (forced to
> I3C mode) and at24c02 I2C EEPROM instantiated from userspace.
> 
> [...]

Applied, thanks!

[1/4] i3c: mipi-i3c-hci: Report NACK response from CCC command to core
      commit: 9e0e9e85e74e4893dc5a2c5a6da54f64cf45290e
[2/4] i3c: mipi-i3c-hci: Do not overallocate transfers in hci_cmd_v1_daa()
      commit: 0be1a06c66c9522abc264bd9cb4df7e676b13ae3
[3/4] i3c: mipi-i3c-hci: Handle I3C address header error in hci_cmd_v1_daa()
      commit: f83f86e506e6b776ba5dd70f919f7e2856f9e061
[4/4] i3c: mipi-i3c-hci: Add DMA bounce buffer for private transfers
      commit: 4afd72876942f2ab1e97e79082464a46ab40a485

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
