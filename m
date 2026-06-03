Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E772ECD6E69
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Jun 2026 09:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0BES2Iq8iWeiyr8xdFdmUo5Gw0pyRrKv2jaW2eby7Ns=; b=jJbO2XL/M/2ZB1
	zGFcnT+xm4bmmlSKbz3nwI3yo1/dphMjd9YOOGjFdS7G3hMkdn4IakkGxEvI3GNX8s5DUAIDnJ8s0
	13XIoyRiL1cG403CK8UYJBmtIQUag07KwWVoDA7Qb7GgOos3Fsbn5Zl3GyMkrvqzp25SMXPAR1uma
	PeTrLKljTa6qmSK/zQQL6reFprL3A4I7nWW3dDKoDJY92/Os8sWoCYmG4qmDHYJobMt9IS/wdhhZ9
	oN+l8GTCWn+JwBYw9YZ7X8+C8c4bx8KP5jAr9fMjvktS7tE1+JvKU+B3wlbzVYTzllm8NoKhYQy7H
	lZQhFo4K9pjS5wFIxRpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaG-0000000EfiU-1FMn;
	Wed, 03 Jun 2026 09:08:20 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaE-0000000Effy-0rF4
	for linux-i3c@lists.infradead.org;
	Wed, 03 Jun 2026 09:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477698; x=1812013698;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JhTRzgvuDr+fmILVzQamg8P+l9Yg5YdsKrq0CzdfH0s=;
  b=ZGGPiD2Olp6dB7Edf6Os8+LxD48zDcx2C3Xjxs+43KlveZ4d951x2cTc
   1Bh2uyVTIxakFwUulGZAXxMta6Qu1UvAQsO/Z3pn1VXYUCd6J8Jkn6IVi
   TVB1juOOw0Klbak3mTOFYQGX9D8yn2iy+GJGflI0az/TkZ7QrSIZyLoAy
   +hge2bafTxTISHMyAsYtCt5036yQGudcrbPCPm18n7lLt5Re4pO7LK4pt
   yCIAZ+6q2XDwFP+ZzFUo/Dmvn0eKEI4j1ecABaCRzSj7Q07fw+q5OTjEm
   /aHUNL8czXpRF5TNZeKQCcgLpJZsToB6uDKF/NTmgUdOEAmG5g8bwxJYw
   g==;
X-CSE-ConnectionGUID: yhMyYsISTdeTHAO90RkDPA==
X-CSE-MsgGUID: S9PWqRT/QhGdVyRmpHsPBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91852608"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="91852608"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:18 -0700
X-CSE-ConnectionGUID: 0ar+zJXtT560extsMfAuFA==
X-CSE-MsgGUID: eek3QvmzQmWH0hkx36t/nA==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.137])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:16 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 04/17] i3c: mipi-i3c-hci: Wait for DMA ring restart to complete
Date: Wed,  3 Jun 2026 12:07:41 +0300
Message-ID: <20260603090754.16252-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260603090754.16252-1-adrian.hunter@intel.com>
References: <20260603090754.16252-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_020818_253713_FBE7A8B7 
X-CRM114-Status: UNSURE (   9.18  )
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

Although hci_dma_dequeue_xfer() is serialized against itself via
control_mutex, this does not guarantee that a DMA ring restart
triggered by a previous invocation has fully completed.

When the function is called again in rapid succession, the DMA ring may
still be transitioning back to the running state, which may confound or
disrupt further state changes.

Address this by waiting for the DMA ring restart to complete before
continuing.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V5:

	None

Changes in V4:

	Add Frank's Rev'd-by

Changes in V2 and V3:

	None


 drivers/i3c/master/mipi-i3c-hci/dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index c3da6eab8eae..3b14bc87bdf6 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -617,6 +617,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 	}
 
 	/* restart the ring */
+	reinit_completion(&rh->op_done);
 	mipi_i3c_hci_resume(hci);
 	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
 	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_RUN_STOP);
@@ -625,6 +626,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 
 	spin_unlock_irq(&hci->lock);
 
+	wait_for_completion_timeout(&rh->op_done, HZ);
+
 	return did_unqueue;
 }
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
