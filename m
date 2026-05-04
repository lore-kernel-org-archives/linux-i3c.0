Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C02BCD343B
	for <linux-i3c@archiver.kernel.org>; Mon,  4 May 2026 11:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJiJTcfDdDJEGXjpEZ1MwyHmFCIRXH8HuawRKPmLnGY=; b=tDHWXkYXJX+w6v
	BiAAy08si1ZtQ9YqDYPbTiMIUv99M8DI0R+Szy7jqjn0qrifn111pYbSPOR7zw1BXoaf/qxJ+Afio
	r1uYoy80HwXnB5o3x6O0LQdlwXgPNxWZP/qj5wCDQ9zPNcdJnAVWDAPRCklq2npXa8L4u1dAWDsCm
	PbmP90QxDEFbGs2h4ZdGuXrLsTFHV5w2mtCXoGtQ2AzYupg7xttU/PasvD5O64itjZXzlxzSIzzDF
	n+kN4QgV4uYFezfEIxTSO9Mz4mkHxEPUPtkjP+oyK/m7wtbm3w3cY10Yi20qYKuYqe795qZOtUPHa
	V2pzLTOnMy5Is1mhkowQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrYx-0000000D3JW-3VLR;
	Mon, 04 May 2026 11:34:11 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrYw-0000000D3HH-20fO
	for linux-i3c@lists.infradead.org;
	Mon, 04 May 2026 11:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777894450; x=1809430450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rOnIi5Au/er0JAR2gXsjbHXOLsZxgafGwGrpu94iBhA=;
  b=a8NqoYSycbp4ug1oogQaANCri0uqzj+5LRFr7Q7W9S+YVGc5qr1eR6pW
   VOhxR1rXnW2MNDJ4yiPMT7qsPXsmbIi9vuUWc0gzkNx1cfJhQoqi+GFSD
   7RTfU6hITeYruaItBFt/wGyfZbonPVwqiTpRzC4fiDPNucpv6nk0UyU/k
   eJnGAYJvBGEVUb3hp/GguKrOfhX/XKEGKv2QhZti+THnDffaa5oqRpXd4
   z2DP4S0Rn5j/qdQyMRm+IE0kC9Y0pyFEX6FfidXUQmXGaKauHs511BNfJ
   zf7nGuRrlzVBkxQbZL9dwRwQL+dC6oTrZvrY60PeLn917xGubTRR/IwVg
   A==;
X-CSE-ConnectionGUID: F4T51PcqRJmCvtSF2rxAFQ==
X-CSE-MsgGUID: SRPrC71YSrONl6jgmyheAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="81315155"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="81315155"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:10 -0700
X-CSE-ConnectionGUID: hkqgU0VLSiGFTF+qCKBpGg==
X-CSE-MsgGUID: ty15N4aNQCKe3IojAWGpWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240478211"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.92])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:09 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 04/16] i3c: mipi-i3c-hci: Wait for DMA ring restart to complete
Date: Mon,  4 May 2026 14:33:40 +0300
Message-ID: <20260504113352.38490-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504113352.38490-1-adrian.hunter@intel.com>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_043410_525847_5092B702 
X-CRM114-Status: UNSURE (   9.37  )
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


Changes in V2 and V3:

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
