Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00800CD495B
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Sep 2023 05:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n1a70ogWgGJ+P6EW2XLeUKDkXRXgenxPllyXTVPfGC8=; b=JWBb0BTK4kFx1p
	cIiAygpNJq6mpmegEaCFNBROVQDtf/bSflzdiuZ4bRtacwcos1LsLXyvL0rHGsaNuxgZJ+mIKAnWK
	tRWvWsI3Dwe49+C4C83VUIJ9xjkCMvHLuyemCdd96tcfTYTGIusmTQQVV0G26uY+ilXUz5+PIzFkS
	IWBv+KVgM6HutS3WLidSGwng3wpROk/uLpf7afFk1Zby9aP0Uz0ARDGz87U0W2v+KetDUsi/EVApS
	Xbaidu/EoSOUYWeF0usV7eJs7mz7HZPztfpCgokXJgTBFL9QUAFCbfg2c9/HiPSfSByPiBiMZppDZ
	auJ5o522bz1o0bFk/Rkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjCha-005Dy0-2J;
	Thu, 21 Sep 2023 05:58:14 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChW-005Dq5-1Q
	for linux-i3c@lists.infradead.org;
	Thu, 21 Sep 2023 05:58:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695275890; x=1726811890;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uE0F/QzPBdoeXwMytzILI4JZgY7ooRtAK/SuixUsuL8=;
  b=l7IzpqJXmPedP9RLDLRERBpeorsnrf/4d8kpi3yhyzWhxFL06M4hrSJt
   vXqxFmNJyJVyS5QwFTRnknYO26G02/8OdGka6xGyAYGHGBvVQimvIlNJ7
   5GMNq+rLlvcNDY8nCwtjp1JUXHaYdBlJm9kOGCm0/47dkLdOk7npAUw7I
   vyF6fOZdG8I3Xi9Q4htLTcwdUjqrQenZckujcNF4ZrMtDXwfP6uw9R7Is
   0sPZeQmTfQIlQQ5Z/fGHiIPJSbtjKIUYs3EyCRrdbarLyVKGF+lSIbp5e
   mG+krRlpGTY9RzunIQGhNGA0MwobPboPKNi0lZA3w0fBU83+TbsVDx8Wi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360678502"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="360678502"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 22:58:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077771280"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="1077771280"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.152])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2023 22:58:05 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 09/12] i3c: mipi-i3c-hci: Do not unmap region not mapped for transfer
Date: Thu, 21 Sep 2023 08:57:01 +0300
Message-Id: <20230921055704.1087277-10-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
References: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_225810_521386_15E5C7C1 
X-CRM114-Status: GOOD (  10.20  )
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

Fix following warning (with CONFIG_DMA_API_DEBUG) which happens with a
transfer without a data buffer.

	DMA-API: i3c mipi-i3c-hci.0: device driver tries to free DMA memory it has not allocated [device address=0x0000000000000000] [size=0 bytes]

For those transfers the hci_dma_queue_xfer() doesn't create a mapping and
the DMA address pointer xfer->data_dma is not set.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 6c7eef17921a..00d20a020ffb 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -347,6 +347,8 @@ static void hci_dma_unmap_xfer(struct i3c_hci *hci,
 
 	for (i = 0; i < n; i++) {
 		xfer = xfer_list + i;
+		if (!xfer->data)
+			continue;
 		dma_unmap_single(&hci->master.dev,
 				 xfer->data_dma, xfer->data_len,
 				 xfer->rnw ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
-- 
2.40.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
