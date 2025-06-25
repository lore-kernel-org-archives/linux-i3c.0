Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7D7C77B7C
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Jun 2025 07:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ns172o1EcEeIU3gkF50gWXY0zHLBGb2YqE/NN17Izfo=; b=UtHGkumDZGzCft
	GpifbFVIg7PwXgMbSrx46v6Mn0B5Nd3itJ/jjjq9gkpIkTh1d550qJkGKx3xpXSNIKyWQ4j2fGNW0
	SOjfKklh7Pk1TaC6Lrr6UQgnA6SON4UDEw5ZptfR/5Kd55Ykl3vtFKOgJYh4MnuOPI9wURrhyFIdB
	Hy1RMQ0gbc45IPI5VssVHni50gziZVF05Ychu7rZEslzRU8CoZ2VxgP5OUzmkHrRR1dJ8dCmh7qwa
	3cgVE/Qptzr6D6G8P93BbloKHIrxtBHrBE7r47dwe4jvI2tf4tqgPfXP6NpGbS6GpGAosjvPogN+L
	ydHzfUp531w7gRw2F93A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUL2y-00000007tIg-2lcx;
	Wed, 25 Jun 2025 07:59:56 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKUp-00000007o4c-43u1
	for linux-i3c@lists.infradead.org;
	Wed, 25 Jun 2025 07:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=MLJl
	vS1NYlAualqI0oHpBIgHQbEqKXUY7ozSMzJTQbk=; b=VbmHt3idv9W79G89I1GB
	pf8XYyhneEZ1NZOQuidiP1CrV4mEZfwIsWeIEhidf6tO103Lny0+nqvPTt87Mf/e
	Bm5n9/94HCWMpLbtyAMM+ZNUGhomITrKXHJYYxtshJusEFsDJVP+gSGq/SrZ4DeU
	6tjptG3XUdtSrZPrsQcF0aihf86k2irlC1b2IoIgjhcDGZ0r37ApNWOn4zIR2W37
	h2RQDL+PTDgkh2vA0+laIaw2T3awp4rZSgQ+lYtNuButoqkHtJ23UG3C866Vw+Ig
	pVYFXXxEV79m4urlhyg/xEISrBxMTw/fW06nhtHBgobzC7HkE7UDQcR8+0avUyXq
	nw==
Received: (qmail 547131 invoked from network); 25 Jun 2025 09:24:37 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 09:24:37 +0200
X-UD-Smtp-Session: l3s3148p1@NZddVmA4gOFtKLNf
Date: Wed, 25 Jun 2025 09:24:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] i3c: master: Add inline i3c_readl_fifo() and
 i3c_writel_fifo()
Message-ID: <aFukNGMgZyKGlCvN@shikoro>
References: <20250624-i3c-writesl-readsl-v3-0-63ccf0870f01@analog.com>
 <20250624-i3c-writesl-readsl-v3-1-63ccf0870f01@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250624-i3c-writesl-readsl-v3-1-63ccf0870f01@analog.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_002440_295574_3BF86BA3 
X-CRM114-Status: UNSURE (   7.92  )
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

On Tue, Jun 24, 2025 at 11:06:04AM +0200, Jorge Marques wrote:
> The I3C abstraction expects u8 buffers, but some controllers operate with
> a 32-bit bus width FIFO and cannot flag valid bytes individually. To avoid
> reading or writing outside the buffer bounds, use 32-bit accesses where
> possible and apply memcpy for any remaining bytes
> 
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>

As per [1]:
Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

My concern is rejected, and the rest looks good to me, so:
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

It still works nicely with the Renesas driver:
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

[1] https://lore.kernel.org/r/20250611093934.4208-5-wsa+renesas@sang-engineering.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
