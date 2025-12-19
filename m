Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B7BD78785
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 14:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8xORtA+ZRH1Y688B/NLyMpW3Fh3THrFRzQIqpfHCRI=; b=UtJkkMGiy0hBXg
	ufHmml+ARP7LQcjiGWIt2H0cTH75LLFL9To/Ggx+EJGjCbH55ywBayA4ek894Bta17gMy49zYtCy4
	2H9mufLdH/WIqCG+bplcSsB9SeOk5m58onEdfVuEKWdMRta9qcy+tKykqVAtpY+f2MVkxecKK2HqP
	Bi9l24Pi3PMXczLA5Z5zUNvjrHemX6tJp6cKJ2MgOfUPYI42tB6TiTZgQeCHpkUcfDxPV6bHNNRJ+
	ArCsW+SvJO+d3A/AOedg07tOOUzff4bJUdKmcXMTKDUFe2svgqbFyug2mOEixmX8wyiIw4mqix57n
	R0W7fa00VBpvfdNkX2kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbkL-0000000AReb-387B;
	Fri, 19 Dec 2025 14:46:21 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbkH-0000000ARaX-1ZTB
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 14:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155577; x=1797691577;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RqxZwIbhuwNlC7H0DBdAOfqBuP04akm4UD2iW+S9ldg=;
  b=AIukw6SsO31oh6wrxZ9B/42CfDeGHcyDw+eDgASy906oBhXydUP5V3uH
   dyL41yN1PJv1wWXuc/i43ADEkqOYVl9Kv3UfOIbAh3V9WAbJKCYO3eWXb
   6LfF7v0gwNJOUE6PXn1f9QZZ7RIzeLTWy7fnPEhbbXDlYXJndD2GNfJtL
   Dy9oV3TNkB3bbSAO9UhOSRCt2QHFG/kUS6Lg4dszh9QcNSxzERGwWTf1M
   78vd6VYtGU/JXUFdVkKbtAmJCjup5qeeOnx7ZlVcNsLLEiTWqevp3Bql/
   aKDfQa8i3s+l7HrhBFoBOcKeAPJvvvkUX8aUExL/2ci6m5nXew+6s8Yq0
   Q==;
X-CSE-ConnectionGUID: EAL4JS8UQ62mV1RWV99WRg==
X-CSE-MsgGUID: RxFhbZZVQvCBpiG+hLVMxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93588983"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="93588983"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:17 -0800
X-CSE-ConnectionGUID: HZybLjCDSlSjmTaf6UaAoQ==
X-CSE-MsgGUID: t1hafm3SQQal+ukM+jwc/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="229564079"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:15 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 13/17] i3c: mipi-i3c-hci: Add PIO suspend and resume support
Date: Fri, 19 Dec 2025 16:45:30 +0200
Message-ID: <20251219144534.84391-14-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219144534.84391-1-adrian.hunter@intel.com>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064617_445049_79D72A85 
X-CRM114-Status: UNSURE (   7.89  )
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

Introduce helper functions to suspend and resume PIO operations.  These
are required to prepare for upcoming Runtime PM support, ensuring that
PIO state is properly managed during power transitions.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/pio.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index 52d9f01d9ca9..8e868e81acda 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -190,6 +190,18 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
 	pio->enabled_irqs = STAT_ALL_ERRORS;
 }
 
+static void hci_pio_suspend(struct i3c_hci *hci)
+{
+	pio_reg_write(INTR_SIGNAL_ENABLE, 0);
+
+	i3c_hci_sync_irq_inactive(hci);
+}
+
+static void hci_pio_resume(struct i3c_hci *hci)
+{
+	__hci_pio_init(hci, NULL);
+}
+
 static int hci_pio_init(struct i3c_hci *hci)
 {
 	struct hci_pio_data *pio;
@@ -1059,4 +1071,6 @@ const struct hci_io_ops mipi_i3c_hci_pio = {
 	.request_ibi		= hci_pio_request_ibi,
 	.free_ibi		= hci_pio_free_ibi,
 	.recycle_ibi_slot	= hci_pio_recycle_ibi_slot,
+	.suspend		= hci_pio_suspend,
+	.resume			= hci_pio_resume,
 };
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
