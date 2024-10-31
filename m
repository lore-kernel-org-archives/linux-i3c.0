Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAE2E6748E
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Oct 2024 23:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pb16M8UzBsLec7ofaas1xCREFfR5L85L+IB3ga857dQ=; b=GdoyBwLVsADj9U
	lP5ontmkrt+F4H6yP877O3cOoVY+dJZ5EFvtT8C79cCzgFxzymyU72aCCnYg1XRT/wdsSpPxS76Ha
	Gn5+et1XH4BzyDvUD7RdMABNyT32H64edwSsOHcjCY0wLYTvocZyd0yr3elK3A4A/vElpiJVzrcRO
	EOppY9cftcZ18qyA76lxZB9wwKJbS3ieC4XCwl8k2Pci0iHdLPrN5WBgS/5/6SeYVTK2jWJ9ciOgb
	f33wTRFU72sxpfiRNuv4BFFGstnJM8mD82gXt8jHbEKKtPyIP3bZnUUaPe7OFZdrRqJHM1beelord
	+rc5J70nZjEVJ+ddjOvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6eA1-000000057WY-3JF4;
	Thu, 31 Oct 2024 23:01:05 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6e92-000000057LN-3mvt
	for linux-i3c@lists.infradead.org;
	Thu, 31 Oct 2024 23:00:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59A0DC0002;
	Thu, 31 Oct 2024 22:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730415599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E5tPbinO6XAzKN7l+PGk9W3OOrQy0kg3Os2oKPhdF8g=;
	b=Lx6hmWtyfWTSIZzKtpAKMOsfhOEFr+1x2NESEaV5slbt/rBu75yoNlJauf1EpezmaYCB36
	u4iNXVf5h4mX//1g0h9qmuDBHH5rWQivX+6ZNHmQD6AewqhmqK84UqDxsf036XKfwJIFeF
	qZd5Lv2H3Z/b9sncUsM1N4pUqcQ1MDuyKQ3KdxGIvsBH0thNkFreoNC6d2NAVcQx4sWOXA
	VabS2GuEvmHAWWxs37RezuLy9BFXGwvWFH3Uo1gN+l6KUWbMOAOdiRFz3hyYP9W2DrIXbo
	HWqW+hs/EqYZ2rVuvAF+da+ANpMNW0/qwvkr07rkYSSFGInEFIkRKzQSAftD9w==
Date: Thu, 31 Oct 2024 23:59:58 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, Frank Li <Frank.Li@nxp.com>
Cc: Frank.li@nxp.com, arnd@arndb.de, bbrezillon@kernel.org,
	boris.brezillon@collabora.com, conor.culhane@silvaco.com,
	gregkh@linuxfoundation.org, imx@lists.linux.dev,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	pthombar@cadence.com, ravindra.yashvant.shinde@nxp.com,
	stable@kernel.org
Subject: Re: [PATCH v5 1/1] i3c: master: Fix miss free init_dyn_addr at
 i3c_master_put_i3c_addrs()
Message-ID: <173041558586.2392356.14874053827219870416.b4-ty@bootlin.com>
References: <20241001162608.224039-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241001162608.224039-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_160001_092767_60FAE9B5 
X-CRM114-Status: UNSURE (   5.49  )
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

On Tue, 01 Oct 2024 12:26:08 -0400, Frank Li wrote:
> if (dev->boardinfo && dev->boardinfo->init_dyn_addr)
>                                       ^^^ here check "init_dyn_addr"
> 	i3c_bus_set_addr_slot_status(&master->bus, dev->info.dyn_addr, ...)
> 						             ^^^^
> 							free "dyn_addr"
> Fix copy/paste error "dyn_addr" by replacing it with "init_dyn_addr".
> 
> [...]

Applied, thanks!

[1/1] i3c: master: Fix miss free init_dyn_addr at i3c_master_put_i3c_addrs()
      https://git.kernel.org/abelloni/c/3082990592f7

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
