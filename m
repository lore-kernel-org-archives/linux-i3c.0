Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EF9C41513
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Jun 2024 13:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pF6qyRzw+V6njkwCTZiylR/wM1L1cTjKycIHMF9+NX0=; b=tzQC04+zOsBqQC
	KIKNN9di+DYdZdA/mpMd6RFBQ/VuiQB/I6SwqDZ0B+ZrrKHzZ06pSXDoqVje2PiqGzPguctA/28iM
	NKSXjEYSsbU7Hskkp66oplQoI4AeXseaak2r2U4YHu/lGPpi323cKL0HCk6qlwUmOprWwlO7JXcAj
	Z8b8jcnm1Qd4yIYiPqw9OY0a1bKenSMb6anJN+/qkAV2UQPV5jUOCVuwZ7RFDcYLzhAxtDhXnTVEP
	aRpHMPEf+Okhk8ghFldK77zVyPtp0PF05XS5he5a4ZExQUh+26Mw9eHyygYeC2Juhj8TavNtvXy7I
	RcLcMr5zExe7EIexs9HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNBTG-0000000DnS1-2VtX;
	Fri, 28 Jun 2024 13:16:58 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNBTB-0000000DnPK-474o
	for linux-i3c@lists.infradead.org;
	Fri, 28 Jun 2024 13:16:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719580614; x=1751116614;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=irzIus5OI2eTQAhpmhykVb27sR0xfzW3UdLILIUlgx0=;
  b=fv9Nl+MAPx4pkJ0kf2uSngXLIfe/Yq1gMIaCKF47EZAC6jHGBosiA0Gq
   PDF868lRWZ5aLYnRxAEh1f4hCUZ9tu2RX1u/Gj5vrH8iXUd4wQktVwrpR
   17jMOIcC+vyCx7G4NO7AwMbHaRnMT69jxyA9t/1tEibxLtyMwAD0OoktM
   vrKJRMIOYsCkFQoCgof9CQVctyKwwGELSRjcJNLJPUTO3TvaVEXo3C9pk
   QJKQRZhPwhvjkYyf+PzzSShd5weUzNGv29uwTlyXHXzE9IeHFbJ1L6RVW
   4pZJfCRe67ip4kKbXncJe1NK5ZZGT25YJGqChm0nvMj21sh41nuJ5z1st
   Q==;
X-CSE-ConnectionGUID: wULrZcMBRdWQUty4g8h5mg==
X-CSE-MsgGUID: 3nnCU2zWSJmC8qM0qwL+Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="34300181"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="34300181"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 06:16:49 -0700
X-CSE-ConnectionGUID: qbYYc+9+QamUcRt+/37yyw==
X-CSE-MsgGUID: fHFvrv9fTPGAbzSFdAHoMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="49213803"
Received: from ehlflashnuc2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.57])
  by fmviesa005.fm.intel.com with ESMTP; 28 Jun 2024 06:16:48 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 1/4] i3c: mipi-i3c-hci: Switch to lower_32_bits()/upper_32_bits() helpers
Date: Fri, 28 Jun 2024 16:15:56 +0300
Message-ID: <20240628131559.502822-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_061654_082075_BCBD1D44 
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

Rather than having own lo32()/hi32() helpers for dealing with 32-bit and
64-bit build targets switch to generic lower_32_bits()/upper_32_bits()
helpers.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 4e01a95cc4d0..6c5964e727b3 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -147,21 +147,6 @@ struct hci_dma_dev_ibi_data {
 	unsigned int max_len;
 };
 
-static inline u32 lo32(dma_addr_t physaddr)
-{
-	return physaddr;
-}
-
-static inline u32 hi32(dma_addr_t physaddr)
-{
-	/* trickery to avoid compiler warnings on 32-bit build targets */
-	if (sizeof(dma_addr_t) > 4) {
-		u64 hi = physaddr;
-		return hi >> 32;
-	}
-	return 0;
-}
-
 static void hci_dma_cleanup(struct i3c_hci *hci)
 {
 	struct hci_rings_data *rings = hci->io_data;
@@ -265,10 +250,10 @@ static int hci_dma_init(struct i3c_hci *hci)
 		if (!rh->xfer || !rh->resp || !rh->src_xfers)
 			goto err_out;
 
-		rh_reg_write(CMD_RING_BASE_LO, lo32(rh->xfer_dma));
-		rh_reg_write(CMD_RING_BASE_HI, hi32(rh->xfer_dma));
-		rh_reg_write(RESP_RING_BASE_LO, lo32(rh->resp_dma));
-		rh_reg_write(RESP_RING_BASE_HI, hi32(rh->resp_dma));
+		rh_reg_write(CMD_RING_BASE_LO, lower_32_bits(rh->xfer_dma));
+		rh_reg_write(CMD_RING_BASE_HI, upper_32_bits(rh->xfer_dma));
+		rh_reg_write(RESP_RING_BASE_LO, lower_32_bits(rh->resp_dma));
+		rh_reg_write(RESP_RING_BASE_HI, upper_32_bits(rh->resp_dma));
 
 		regval = FIELD_PREP(CR_RING_SIZE, rh->xfer_entries);
 		rh_reg_write(CR_SETUP, regval);
@@ -404,8 +389,8 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 				hci_dma_unmap_xfer(hci, xfer_list, i);
 				return -ENOMEM;
 			}
-			*ring_data++ = lo32(xfer->data_dma);
-			*ring_data++ = hi32(xfer->data_dma);
+			*ring_data++ = lower_32_bits(xfer->data_dma);
+			*ring_data++ = upper_32_bits(xfer->data_dma);
 		} else {
 			*ring_data++ = 0;
 			*ring_data++ = 0;
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
