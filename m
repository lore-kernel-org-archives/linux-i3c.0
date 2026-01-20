Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A508D262AD
	for <linux-i3c@archiver.kernel.org>; Tue, 20 Jan 2026 23:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fFC1EXOL+XzEJ64mUWmFlOcWGQHdpc16XRPu3XnKDT0=; b=znghb82L2XEqtr
	UGjPFX/wvhSBwGgpBCmnd0kNDV1YfycMeMJ0yBfad/I+RyBlflPmvUwV+05WuT/+HXpW44HZSR4xU
	1Q+pHGdzomyXqV33Dkb6QHRl1Lz7oU+dTNQEMwOAocUTClfGph8GpKqFIREDwLwMDuGyURkNv9D2o
	mv8HilLP/dU7bBhXa95n1syoXxAelRuBmSIhsySadRa8AWofFS1MnAOg9rxPD73YVMPpe4RLln2FJ
	jQvbfg/Mtl8WjsFDkrufEPjzbMjCVVhOT+xSDZvo5RKniBXb5s5YcMfa41mj6s9rKbcDicD2g/YHF
	VOdDGNHCE41piWYPUk9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viKiq-00000004bWS-1x8k;
	Tue, 20 Jan 2026 23:01:16 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viKim-00000004bVv-36hI
	for linux-i3c@lists.infradead.org;
	Tue, 20 Jan 2026 23:01:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4F7294E421BA;
	Tue, 20 Jan 2026 23:01:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19121606AB;
	Tue, 20 Jan 2026 23:01:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 356A7119B01E4;
	Wed, 21 Jan 2026 00:01:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768950066; h=from:subject:date:message-id:to:cc:mime-version:content-type;
	bh=VsQPitWuerWVz6IF/HuASV4pkgarVQyLiMgWqJrjbSw=;
	b=qYivXisxpDAyIpShHQ/vP/qFLUIGtA/gj6HuYxkJBi0QTUJCWLYUcKI5MQq9UwygekF2Zf
	WzUN+MOvCVJurETWJqmNdMJRikTNj1dBUwWNsWHU6Kzy0kHb3T1iFKv6CnKkYcMCKX6eRz
	3DbUXmqF7EE0AVR9Tw2U33TpLKXCNimp8mReEbRfRNCZsUGSeTvXxUUGpK53VMSewYs2TM
	ZgX71o+vBYfiP+gNlFJEL1QaYJ4Kqjm/08IzzzvzyJytaEBi6tVkgsEl+CJ+J3ZjYxnzbF
	DsAbyb5DjnB6nz86vlJrKf78VGuZ9ZHUmbKtxcG78GcpfNbb55Ga+Zmudho9hA==
Date: Wed, 21 Jan 2026 00:01:03 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Immutable branch between I3C and IIO due for the v6.20
 merge window
Message-ID: <20260120230103acd007e1@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_150113_292446_3088EC11 
X-CRM114-Status: UNSURE (   7.20  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/ib-i3c-iio-v6.20

for you to fetch changes up to 8564f88df2020357430280e3e1d8e8da5d1b19e1:

  i3c: Add stub functions when I3C support is disabled (2026-01-14 15:53:16 +0100)

----------------------------------------------------------------
Immutable branch between I3C and IIO due for the v6.20 merge window

----------------------------------------------------------------
Adrian Ng Ho Yin (4):
      i3c: add sysfs entry and attribute for Device NACK Retry count
      i3c: dw: Add support for Device NACK Retry configuration
      i3c: dw: use FIELD_PREP for device address table macros
      i3c: dw: Preserve DAT entry bits when restoring addresses

Frank Li (3):
      i3c: drop i3c_priv_xfer and i3c_device_do_priv_xfers()
      i3c: master: svc: Initialize 'dev' to NULL in svc_i3c_master_ibi_isr()
      i3c: Add stub functions when I3C support is disabled

Krzysztof Kozlowski (1):
      i3c: master: Simplify with scoped for each OF child loop

 Documentation/ABI/testing/sysfs-bus-i3c | 11 ++++++
 drivers/i3c/master.c                    | 46 ++++++++++++++++++++++---
 drivers/i3c/master/dw-i3c-master.c      | 59 +++++++++++++++++++++++++++++----
 drivers/i3c/master/svc-i3c-master.c     |  4 +--
 include/linux/i3c/device.h              | 24 ++++++++------
 include/linux/i3c/master.h              |  6 ++++
 6 files changed, 127 insertions(+), 23 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
