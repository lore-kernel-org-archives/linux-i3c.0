Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9739D73E83
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Jan 2026 18:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bAKrsYOESFy2c1cDpTWYutB2aSFzNRrygn1uPj6i5As=; b=sKKCVJGI5IAV9y
	zErRwEdeDqMJFo48x9AwLyyZxJ2Dbo8RkErKUrgdywSvY5OI03m+/ywvA6D/nlfd+QeX2kO8W9EEP
	DoXdNteDJwzTD6mKquKf2ciUGpvRo+iTANztlSA6dIsNN/Hc2FjcSJwgC/BqRbFu/EKoR9mLPLBui
	yy2Ai7Q7hoNqD8if2n/PGNtBl8KQ6gRzVY6ket3CiKcXMTqH3DX6OkzTb9pxsJfZiTqR7NYdevWYj
	wj6cBvTYIB+nXjlvFjxQKmrEbycSt1QnYGeXiiNmGWJBFd9PPPlKdjeoT17iyYTsvRcrIprY6EDIT
	hodkSjDGO0D4C/AzuEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWbd-00000000VUS-1xad;
	Thu, 29 Jan 2026 18:19:01 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWbZ-00000000VQW-2E9p
	for linux-i3c@lists.infradead.org;
	Thu, 29 Jan 2026 18:19:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769710738; x=1801246738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QGA7s2M35n/1FOK4su0sUXCzqna1KL1Zl+xDOLqoMB4=;
  b=NTy11+8bHTcsFEN6WNDyhHbSLE29tx7KJfYPtDaoPA/O/Ume8cbXv9zf
   vloT110BhUl93NFS/WaS34CKInLusHavlh9v8NOzRbVjL+0iMp+pLHlEX
   SSNiOhegQE9QcZzk8YUDtA5RqenLjN6zA9vTL3cMCwfwzCkJx/QmNYLuR
   vr6ceIfHWFgK0TzwUEQI+c2c+zCN6bPyHY4AtpSx9NjdcvGP/obM/Mj8U
   lU3qejKWD5J67O9ZnYLVry+VfNlyQDDS6v2Kq1f7NBAfdTkJ0lBwScYGD
   Zo7h5vVO+ywXz5y6efTxs9RiWZcSQN/lqG53cqkYzDSdPh2e1TqhSkmzr
   Q==;
X-CSE-ConnectionGUID: hpiXaATCQMe+spfSIYxaCQ==
X-CSE-MsgGUID: BFTC7BuQQO2D+wfvAweWHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70158277"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="70158277"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 10:18:57 -0800
X-CSE-ConnectionGUID: zEFqbPbfRa+kk3Nk8tUvvA==
X-CSE-MsgGUID: wf2kJr/yTf+2bXraxa8fpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="208255266"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.96])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 10:18:55 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 1/7] i3c: mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers
Date: Thu, 29 Jan 2026 20:18:35 +0200
Message-ID: <20260129181841.130864-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260129181841.130864-1-adrian.hunter@intel.com>
References: <20260129181841.130864-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_101857_582282_48363043 
X-CRM114-Status: UNSURE (   7.19  )
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

Set d3hot_delay to 0 for Intel controllers because a delay is not needed.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 0f05a15c14c7..bc83caad4197 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -164,6 +164,7 @@ static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
 	dma_set_mask_and_coherent(&hci->pci->dev, DMA_BIT_MASK(64));
 
 	hci->pci->d3cold_delay = 0;
+	hci->pci->d3hot_delay = 0;
 
 	hci->private = host;
 	host->priv = priv;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
