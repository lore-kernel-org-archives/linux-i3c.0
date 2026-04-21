Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E90CF94CA4
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Apr 2026 17:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Q2YvZtpmKH9yOVvchmE3I5lvS8CU+SbEqkxUyf2bck=; b=1KWJFJ/EJ14+uG
	pGzGM7fwfIGuxKrlTGMHj7Wb1Xt065vbRvkGsEYEhmyMneVE4Dtul3q+s0TdMlzAOz+b/22bzM10z
	s257RABAomxyarakSiZgT/PM1WUzIDs0NU6sZWJBEZ9GTog6SP4jQtccXku0ysGsWnkn/rQteU7wi
	3lVhqHkdLQ13bT8b2yNJI4lvRLT3jfwoG9Vx2m37ini3K1agmZJ7F2i0/COGZTxBewQ+LJSv9CRlD
	t9+iSJsIdL4N+QRP4VHxDeROlBXtCy2+f/7pAG9SnHnMmbpdCAfy7h6hi3irWSPuW53w03Fcsvnwu
	XeQ0tXFyY8D/rsymkbrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJK-00000008zWD-35At;
	Tue, 21 Apr 2026 17:54:58 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJH-00000008zSH-1OpE
	for linux-i3c@lists.infradead.org;
	Tue, 21 Apr 2026 17:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776794095; x=1808330095;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UJnrAVRsnqnjwVIhz3L/WQih01nN54R0x5ENyDFj2iE=;
  b=QRV4sN84aw7BkQ9NmSY3fREVfQcIppn92S1qwYxaupGFaGOSpQqSrBqs
   bAbdzkBX/soGQavWCZNSSRFQ8g5kKn3t6WqRG+W+b0M+bGCbQKCABURL9
   6nMO34DZkRlb8pCPENCueGLe5FXpNOsKqvJ4PcVc0icHO7lbKvCTI1hVb
   KhEjtXLxYKbGg1oFZwHrhDY5LeZ7Pw1cXh38KzIcW5xZ8tygiuzB9iO5K
   K7zrKbIuzPd/FLVasqmRD/ebTe2CS2IdHxDOwMPt2dtT94WfQ5pc9ApqB
   XfcpZ+3VXe5iZnWXBtqSNF0eKA8Nx7bWB/L+a3S+H0esiPk0waD2Tlvf8
   Q==;
X-CSE-ConnectionGUID: W82h0w6dTzaJ7xfeXzf3bA==
X-CSE-MsgGUID: DTYAUhwPSfClIhqHoZdFsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77651366"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77651366"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:54:55 -0700
X-CSE-ConnectionGUID: aWyPJQApQ6KjbTAYUVVcpg==
X-CSE-MsgGUID: FpWEjuEjQu+DJnbVTh9ohg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="227494888"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.242])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:54:53 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 04/16] i3c: mipi-i3c-hci: Wait for DMA ring restart to complete
Date: Tue, 21 Apr 2026 20:54:23 +0300
Message-ID: <20260421175435.122094-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421175435.122094-1-adrian.hunter@intel.com>
References: <20260421175435.122094-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_105455_409334_79C2F234 
X-CRM114-Status: UNSURE (   9.65  )
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
---


Changes in V2:

	None


 drivers/i3c/master/mipi-i3c-hci/dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 314635e6e190..28614fdbf558 100644
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
