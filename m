Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA54D78785
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 14:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8y1t0jPfphzuukQWAf56LniawRjd0ko6LdG0K/Oi4Gg=; b=UetWfX6ILA6E5y
	RmKqqysNJlVwbN4Q7xcVVbpcHJaetrMHx8xDmu0zR4sLmQ81CNcP8f0kqojGd6XtWz9cfZQFftb8v
	Z/fy9SnEziUoKCUGaSp7s8WnyXkpT3+nNV/f5114a6OEUbRP2LEKpZs7KnFxvwdqxe0Wt0VqZy6rI
	Bl4OzqLdMHGGdrTEhvLcZJQeDrh3L4tzTfcCcpFWJ1Nqvd0n1ipfqV+ICAU8CY/mZd0ZAAzTeYVAA
	0cgouSZpZAa9XkqcbZsWYOSfvyCbucHdxZ6nPhOK7b8ULV2+bfywPFqwoJprDel0lFbKdXMNaczV1
	WGe6cDY5G7sP/yyQki3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbkF-0000000ARaR-0YEN;
	Fri, 19 Dec 2025 14:46:15 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbkD-0000000ARZJ-0nuk
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 14:46:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155573; x=1797691573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1dXszqbajBLoL0dp+faqeWrOkLWDwD+yg2lL+fF1oQc=;
  b=ddalg/BpqRG5/gOMZGySxNc7sqKS4HuiqMFSIwgYf1x2tUckxL88IL3l
   bm2pPTS4B/Puh+Xw+Z+fLZGbPRmw9ANxhk8wsEF43EO4KSNQGA7Akx5DM
   DxMMY28/Eh2PobT9gNO+xEteHqkuCJy/hXGRODNKDNZ/vyzik8whDmo4u
   8zoksY6U1tLZjf19vcxa1jGx7E62sWvEnzciy/Oax2y+gqp+wniwicuGE
   ir4+AsrvqDD0yH0eVnqc9q45Kxp3bpndKxCgeJeW5sVQc1jiTp/PWUXBa
   kvd+wxKKhB98DwilsTJKNjOJpoSYJtTNCbZsBarB1b01C/tZaTImb+MoW
   Q==;
X-CSE-ConnectionGUID: 0RrUQ4mqQdKaxjHGg76Pmg==
X-CSE-MsgGUID: wL05KBETQNuxCZhMjHKuJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93588972"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="93588972"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:13 -0800
X-CSE-ConnectionGUID: dZGGiWP9QJCitteElWK+Ag==
X-CSE-MsgGUID: auYF1t4vQRWb45g0R0qXaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="229564058"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:10 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 11/17] i3c: mipi-i3c-hci: Add DMA suspend and resume support
Date: Fri, 19 Dec 2025 16:45:28 +0200
Message-ID: <20251219144534.84391-12-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219144534.84391-1-adrian.hunter@intel.com>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064613_247464_812DA4C2 
X-CRM114-Status: GOOD (  10.72  )
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

Introduce helper functions to suspend and resume DMA operations.  These
are required to prepare for upcoming Runtime PM support, ensuring that
DMA state is properly managed during power transitions.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 25 +++++++++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index d0fc245f8e8f..6be97f0782d8 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -275,6 +275,29 @@ static void hci_dma_init_rings(struct i3c_hci *hci)
 		hci_dma_init_rh(hci, &rings->headers[i], i);
 }
 
+static void hci_dma_suspend(struct i3c_hci *hci)
+{
+	struct hci_rings_data *rings = hci->io_data;
+	int n = rings ? rings->total : 0;
+
+	for (int i = 0; i < n; i++) {
+		struct hci_rh_data *rh = &rings->headers[i];
+
+		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
+		rh_reg_write(RING_CONTROL, 0);
+	}
+
+	i3c_hci_sync_irq_inactive(hci);
+}
+
+static void hci_dma_resume(struct i3c_hci *hci)
+{
+	struct hci_rings_data *rings = hci->io_data;
+
+	if (rings)
+		hci_dma_init_rings(hci);
+}
+
 static int hci_dma_init(struct i3c_hci *hci)
 {
 	struct hci_rings_data *rings;
@@ -865,4 +888,6 @@ const struct hci_io_ops mipi_i3c_hci_dma = {
 	.request_ibi		= hci_dma_request_ibi,
 	.free_ibi		= hci_dma_free_ibi,
 	.recycle_ibi_slot	= hci_dma_recycle_ibi_slot,
+	.suspend		= hci_dma_suspend,
+	.resume			= hci_dma_resume,
 };
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index aa8a03594e64..38f927685d3b 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -125,6 +125,8 @@ struct hci_io_ops {
 				struct i3c_ibi_slot *slot);
 	int (*init)(struct i3c_hci *hci);
 	void (*cleanup)(struct i3c_hci *hci);
+	void (*suspend)(struct i3c_hci *hci);
+	void (*resume)(struct i3c_hci *hci);
 };
 
 extern const struct hci_io_ops mipi_i3c_hci_pio;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
