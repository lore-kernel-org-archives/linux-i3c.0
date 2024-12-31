Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1479AE77188
	for <linux-i3c@archiver.kernel.org>; Tue, 31 Dec 2024 11:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UJAwpCdua8L5JZnzgQsPfl7paZzy+5mhfy6YE1Adew8=; b=p8RpQRHDM8H5l4
	/otb8JfXQdMPzmbFCWns4kBlG/zZt8gbOlIaxaEmI2ZBsB0HG/DpD7qBrN7cAYbALByB6KGWs6arv
	gnYFfv4pgF+eGBM9+7ywI2HRicfw9nN6+4wd3BupUDewKrjnxtknwhDDdVPPLC4IpUo8HGVWfpFeM
	rU7fuF2cmonkKLadag5nJQbgw/0KaSs82ogmNYhyw5sGYs76lHkURQabnpvg5y3ewTAXoiv2lMJVI
	nZ9NetwSafRF3X17xHl6N/h+c9KyN5vNw9DfNYe2vWxOntPy/q2asozlxIVQ0pNU5piVG/jVPiJ0Z
	uJqE6xnlJDKAqhwrzDmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSau2-000000078Rz-3BOB;
	Tue, 31 Dec 2024 11:59:14 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSau0-000000078RF-2Bm9
	for linux-i3c@lists.infradead.org;
	Tue, 31 Dec 2024 11:59:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735646353; x=1767182353;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pGkOPnyBVSEKxWP0oEgNCZPd8BrUwQqU6vIqLGhaGe8=;
  b=m5nHCwzZYdRRoHpFfCa4gaDsRHQDM3HSRhmFtVPnokn26JQVWS42Dyjb
   O9I/AMeKPIBsU6YDs3IZ6cq5AeoFhXhYDj1pXlOm7yXV4mj2Rhmebistm
   42n3j7HcNHimwyLBCUVtOwd41D42yqMEA2DwpkX+YYVDLL9panp4476Js
   Y9J4SUi6ao/lg9yF1i7Cwimn1Edaw2Lp8cuqylyESnsENUR7ICbZcqxEG
   ahuLcGmRMRR0Mpve2bF1oMx6XD8cj5YiDe2aPP0HH91a4Ap6br1ZkmYcl
   ju1XU9V2Ra9dg4muY0f6E/pZaJT7RTLEr3eCzxkjSzPSqCP/QxMxYdjlT
   w==;
X-CSE-ConnectionGUID: NeAs0wlDQxSfMfr4LrdY/g==
X-CSE-MsgGUID: X6UgkJJrSOuFHJUf1Y/Ffw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="47344702"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="47344702"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 03:59:09 -0800
X-CSE-ConnectionGUID: Gm6z3hW0SPezjz+tSboTFg==
X-CSE-MsgGUID: 1KEt+ekwTpmTAljlV1puCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100857121"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP; 31 Dec 2024 03:59:07 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 1/2] i3c: mipi-i3c-hci: Add Intel specific quirk to ring resuming
Date: Tue, 31 Dec 2024 13:59:03 +0200
Message-ID: <20241231115904.620052-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_035912_646579_AE58C96D 
X-CRM114-Status: GOOD (  11.67  )
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

MIPI I3C HCI on Intel hardware requires a quirk where ring needs to stop
and set to run again after resuming the halted controller. This is not
expected from the MIPI I3C HCI specification and is Intel specific.

Add this quirk to generic aborted transfer handling and execute it only
when ring is not in running state after a transfer error and attempted
controller resume. This is the case on Intel hardware.

It is not fully clear to me what is the ring running state in generic
hardware in such case. I would expect if ring is not running, then stop
request is a no-op and run request is either required or does the same
what controller resume would do.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index e8e56a8d2057..491dfe70b660 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -758,9 +758,26 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
 			complete(&rh->op_done);
 
 		if (status & INTR_TRANSFER_ABORT) {
+			u32 ring_status;
+
 			dev_notice_ratelimited(&hci->master.dev,
 				"ring %d: Transfer Aborted\n", i);
 			mipi_i3c_hci_resume(hci);
+			ring_status = rh_reg_read(RING_STATUS);
+			if (!(ring_status & RING_STATUS_RUNNING) &&
+			    status & INTR_TRANSFER_COMPLETION &&
+			    status & INTR_TRANSFER_ERR) {
+				/*
+				 * Ring stop followed by run is an Intel
+				 * specific required quirk after resuming the
+				 * halted controller. Do it only when the ring
+				 * is not in running state after a transfer
+				 * error.
+				 */
+				rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
+				rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE |
+							   RING_CTRL_RUN_STOP);
+			}
 		}
 		if (status & INTR_WARN_INS_STOP_MODE)
 			dev_warn_ratelimited(&hci->master.dev,
-- 
2.45.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
