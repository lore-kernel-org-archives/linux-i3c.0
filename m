Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7E8CD4F54
	for <linux-i3c@archiver.kernel.org>; Wed, 27 May 2026 19:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HHsJVjyn2YhtOsIIl9gckI8Sm9vTm7jRDGLIIUNVV8Q=; b=DJHcXdgrrVmMv4
	815v693n+JGyww5yxGxCDrxQq3g99jWtWtAzPWtRhsasFAwT0BbYHHKD3+Mp3TnkRgf1KbUGHVlkg
	0VXciUoTebBb8JllvKXGHsywtsUBYw/8t8+QuAo5OE57RVW74q7B2b6489N7aEnRa2hHugTITsQsZ
	choCeeps7acIwEEnDsJngG39t2wRPXIK8oHrtWRoihK9gO9K8PPUoJWkYyH/lgJ68vMeK60Jxj11n
	gdNRMBT2Bq2vcMEz2LactKFOHbCdZkfvUHc/XzCo/V2RrGEDe7SsAfg6idqKemwC2+8MRgDJDJ4Nn
	ZcjBBtw9kTuQPIsuqB2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKG3-00000004giV-1rGT;
	Wed, 27 May 2026 19:49:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKG2-00000004ghy-16Nz
	for linux-i3c@lists.infradead.org;
	Wed, 27 May 2026 19:49:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B3BC4605AC;
	Wed, 27 May 2026 19:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B5D1F00A3D;
	Wed, 27 May 2026 19:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779911377;
	bh=AAui/35BdXAduW1BLpfpXGcfFy5asK/kJ+Fe6tFyXWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eg7Yu50CLmeomDkgpi6/9HXsOwbQwhVMdCa46yIB3jB8UsteWD7HCyCk937fZlV/v
	 QPo6BuRLt181aC6tvyRk8rxdhMQziK+rtTh7WKjC9+33AJY7meYCRz+tPhdWev2kIQ
	 m2hgpzQyRdBckkyBJQV7Yc0Ltx7MnVyEMitIW0cP690IGR0rFd3xuennFgSqioMvnM
	 snTl6GfAkn6yQtWWJOQEgsrs1E8xTexclHp/ciXsQnXwenEiKXTa3+Q9DVgNLWhBfp
	 BhjcdMzY2W4l4rcdls12opOq8R9rJzqkSBU7bheJAU0vjTKbb41Z1JISoRW1cFdgdH
	 WiSZVrRE/tr1A==
From: Sasha Levin <sashal@kernel.org>
To: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	adrian.hunter@intel.com
Cc: Sasha Levin <sashal@kernel.org>,
	patches@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	npitre@baylibre.com,
	boris.brezillon@collabora.com,
	linux-i3c@lists.infradead.org,
	Jianqiang kang <jianqkang@sina.cn>
Subject: Re: [PATCH 6.12.y] i3c: mipi-i3c-hci: Correct RING_CTRL_ABORT handling in DMA dequeue
Date: Wed, 27 May 2026 15:49:10 -0400
Message-ID: <20260527-agent5-item018-i3c@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527061933.3612126-1-jianqkang@sina.cn>
References: <20260527061933.3612126-1-jianqkang@sina.cn>
MIME-Version: 1.0
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

> [ Upstream commit b795e68bf3073d67bebbb5a44d93f49efc5b8cc7 ]

Queued for 6.12.y, 6.6.y, 6.1.y and 5.15.y, thanks. The 6.12 backport
required dropping the upstream guard(mutex) usage (control_mutex doesn't
exist on these branches); the rest of the change applied cleanly.

--
Thanks,
Sasha

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
