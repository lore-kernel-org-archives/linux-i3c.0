Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AB9C28B28
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Mar 2025 11:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sjrovud1Zbz9PFvxR9tcrZplE/CV7nFnxDLlIB4NaBc=; b=zS+m6J7ynJb+aD
	5Fcq2qDunr/ypMCRsJMXXLBNFGvpZSdItxHJnM0LtGbLuEZoxkroxn8AWkIq4/NBCnN9Vifk7y4VW
	guukTwUrLTtEKUj9je3RLJvmVUgpHf89vxzO/k3q/g7ObUwD8TVrxmELyMgR4o9PZSw7xDVzXwR42
	Y3uTHXOTyk4T2Ub5X7NupQjOeGY4s98AWfxW53K4uCCZ8G8wF8B9m4kTpDn0knaPg3Svch2+/ZBxi
	FJP1ZwHpl8+B7gknNJnnY3Depl6I4QfYEiwcQLDboO3u3XFxrMCUA91ax1btY3MV/Hxj+ydLWJ917
	sCQLREetPoHL28l1pvHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK7q-00000008EdR-0fUF;
	Wed, 12 Mar 2025 11:19:50 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJzE-00000008DVQ-2Mi0
	for linux-i3c@lists.infradead.org;
	Wed, 12 Mar 2025 11:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741777857; x=1773313857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PR9x/EnXUCNH4rosATTLiFNtLG+fgATAlLH3DW7HcWw=;
  b=JV4kdBWZneldaYYRyvZauV8kMwtcJ9dxwaMRQmF6eBkKqO61MRrRxCLc
   g8VbVVEnzI67fIGQlcsIoMnD3QXo05w1rpk87/jU5g9zEKQCN4Hs47RuT
   nBhvFgvQ79+r9WvW4an8c3prJTFChNaMyuIdvcL2AvkxFm6oJeejX5Gya
   5Lxrgo4y5uQZtVyf0nUjRDrA544EyefPnYYqPJijod37A+y6PLgEBfouh
   Uo/dDlNYU1+8WiFDInbShDDEVBPA3eLMIYFbm86WehqRnD2WQSOQpeGVJ
   91g5piDdoUVBo2LvAZ9gl3HMyayd2qaUTdGZuKXiDOUVEWNcy+Z1/IBkz
   A==;
X-CSE-ConnectionGUID: COBI7szoSUKEMMyeN3XJAQ==
X-CSE-MsgGUID: QIWU9sIRT1qGjA+UPX0K2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42983455"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="42983455"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 04:10:54 -0700
X-CSE-ConnectionGUID: U6s7gWlnTIyygluKmY9tPg==
X-CSE-MsgGUID: Qv2Ic3RGRkCHBt+3dWEpaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="120310865"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP; 12 Mar 2025 04:10:53 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 2/4] i3c: mipi-i3c-hci: Fix handling status of i3c_hci_irq_handler()
Date: Wed, 12 Mar 2025 13:10:47 +0200
Message-ID: <20250312111049.197855-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250312111049.197855-1-jarkko.nikula@linux.intel.com>
References: <20250312111049.197855-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_041056_627906_CE6405B6 
X-CRM114-Status: GOOD (  11.70  )
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

Return IRQ_HANDLED from the i3c_hci_irq_handler() only if some
INTR_STATUS bit was set or if DMA/PIO handler handled it.

Currently it returns IRQ_HANDLED in case INTR_STATUS is zero and IO
handler returns false. Which could be the case if interrupt comes from
other device or is spurious.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index e139d7e4d252..e5593b6e897e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -594,6 +594,7 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 
 	if (val) {
 		reg_write(INTR_STATUS, val);
+		result = IRQ_HANDLED;
 	}
 
 	if (val & INTR_HC_RESET_CANCEL) {
@@ -605,12 +606,11 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 		val &= ~INTR_HC_INTERNAL_ERR;
 	}
 
-	hci->io->irq_handler(hci);
+	if (hci->io->irq_handler(hci))
+		result = IRQ_HANDLED;
 
 	if (val)
 		dev_err(&hci->master.dev, "unexpected INTR_STATUS %#x\n", val);
-	else
-		result = IRQ_HANDLED;
 
 	return result;
 }
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
