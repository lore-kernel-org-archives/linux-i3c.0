Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8419EC04A92
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Nov 2023 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOuRAv2IeZwQW4ASMk1/75kM22+Kxwk6UG5G0sWlsAU=; b=2sj+WAxyOTSuV2
	flI0EJygfUozvhEln+taFj10GnzQsamJNimP52yLA1Ts6b8S+8AyXoTSDYF5gewAcrKyQrm8+NHUk
	ao9ieLT3q2/Si2AnmOXlG9dON/Y+g3YBnmaqyEtWltJWtfp42y8OSLoPVESfadmMeafQmK5i3njTM
	sZr24mZulk8TIZK2QZ5NHOxfPXAc4OAUUaDWXDzP6jDxASovwJygExWkYB5HXdMzXd6iRYA3FFITP
	xNMf3sWxAHUH6KOH+uLreO2UP5YNmuc3sE3c3lA0sed0HyVoh+37rHAoI+mK3zb+FXU59y61THegb
	CSuj9G7fE/SBDpu8KrEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r15Ev-006OvB-0s;
	Thu, 09 Nov 2023 13:38:33 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r15Es-006OsE-1m
	for linux-i3c@lists.infradead.org;
	Thu, 09 Nov 2023 13:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699537110; x=1731073110;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E8QBdLq/wWB6tcm1H21keeUBmqGI2K83omwnqarsYbc=;
  b=kxe1cRXVtKsY/Pe12CfQjcFnj/4HpbrSHWce38hQqJfz6ydsOT7FKzPC
   qskFsBCsKasKObi+VSrfVX9unkU9f0o2r24SSq2L066sp/Acj/ENKRRN6
   ILVbRTqW7qNJnPSyukfJFOGk3E7V6iwAFv3u4a20MN8aLYkXhxnM5hexR
   zBPJWazi3TLdU9yarAdlT3t+629wHKlB+aTT+DbpNBIqhQg3OGp8ZoU0l
   DTelchM82ikVQTtGWoF9gqi3gv0fPKqmINB4EhPMrBrNOByDB9aCal5qm
   PheZnRTVPew6cVevU2fiWCOZWbdbmkWi4df8N5g5MQJWSZQv09lAoNHYX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="2949367"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="2949367"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 05:38:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="907127740"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="907127740"
Received: from display-mtlp-1.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.68])
  by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2023 05:38:26 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 4/4] i3c: mipi-i3c-hci: Add DMA bounce buffer for private transfers
Date: Thu,  9 Nov 2023 15:37:08 +0200
Message-ID: <20231109133708.653950-5-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109133708.653950-1-jarkko.nikula@linux.intel.com>
References: <20231109133708.653950-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_053830_606371_4E903D88 
X-CRM114-Status: GOOD (  21.10  )
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

Implement a local bounce buffer for private I3C SDR and I2C transfers
when using DMA and the buffer attached to the transfer is not DMA safe.

Otherwise the DMA transfer will fail and with following warning:

[   11.411059] i3c mipi-i3c-hci.0: rejecting DMA map of vmalloc memory
[   11.417313] WARNING: CPU: 3 PID: 357 at include/linux/dma-mapping.h:332 hci_dma_queue_xfer+0x2e2/0x300 [mipi_i3c_hci]

Strictly speaking private I3C SDR transfers are expected to pass a
DMA-able buffer. However I fear this requirement may easily be slipped
or go unnoticed when I3C interface support is added into a existing
device driver that use regmap API to read/write stack variables.

For example this is the case with the commit 2660b0080bb2 ("iio: imu:
st_lsm6dsx: add i3c basic support for LSM6DSO and LSM6DSR").

Buffer of an I2C message is not required to be DMA safe and the I2C core
provides i2c_(get|put)_dma_safe_msg_buf() helpers for the host
controllers that do DMA and that is also recommendation for the
i2c_xfers() callback from the I3C core.

However due to above I3C private transfers reason I decided to implement
a bounce buffer for them and reuse the same code for the I2C transfers
too. Since this driver is currently the only I3C host controller driver
that can do DMA the implementation is done here and not in I3C core.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 40 ++++++++++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/dma.c  |  4 ++-
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 8471a1fe1dad..d7e966a25583 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -276,6 +276,34 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
 	return hci->cmd->perform_daa(hci);
 }
 
+static int i3c_hci_alloc_safe_xfer_buf(struct i3c_hci *hci,
+				       struct hci_xfer *xfer)
+{
+	if (hci->io != &mipi_i3c_hci_dma ||
+	    xfer->data == NULL || !is_vmalloc_addr(xfer->data))
+		return 0;
+
+	if (xfer->rnw)
+		xfer->bounce_buf = kzalloc(xfer->data_len, GFP_KERNEL);
+	else
+		xfer->bounce_buf = kmemdup(xfer->data,
+					   xfer->data_len, GFP_KERNEL);
+
+	return xfer->bounce_buf == NULL ? -ENOMEM : 0;
+}
+
+static void i3c_hci_free_safe_xfer_buf(struct i3c_hci *hci,
+				       struct hci_xfer *xfer)
+{
+	if (hci->io != &mipi_i3c_hci_dma || xfer->bounce_buf == NULL)
+		return;
+
+	if (xfer->rnw)
+		memcpy(xfer->data, xfer->bounce_buf, xfer->data_len);
+
+	kfree(xfer->bounce_buf);
+}
+
 static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
 			      struct i3c_priv_xfer *i3c_xfers,
 			      int nxfers)
@@ -309,6 +337,9 @@ static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
 		}
 		hci->cmd->prep_i3c_xfer(hci, dev, &xfer[i]);
 		xfer[i].cmd_desc[0] |= CMD_0_ROC;
+		ret = i3c_hci_alloc_safe_xfer_buf(hci, &xfer[i]);
+		if (ret)
+			goto out;
 	}
 	last = i - 1;
 	xfer[last].cmd_desc[0] |= CMD_0_TOC;
@@ -332,6 +363,9 @@ static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
 	}
 
 out:
+	for (i = 0; i < nxfers; i++)
+		i3c_hci_free_safe_xfer_buf(hci, &xfer[i]);
+
 	hci_free_xfer(xfer, nxfers);
 	return ret;
 }
@@ -357,6 +391,9 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
 		xfer[i].rnw = i2c_xfers[i].flags & I2C_M_RD;
 		hci->cmd->prep_i2c_xfer(hci, dev, &xfer[i]);
 		xfer[i].cmd_desc[0] |= CMD_0_ROC;
+		ret = i3c_hci_alloc_safe_xfer_buf(hci, &xfer[i]);
+		if (ret)
+			goto out;
 	}
 	last = i - 1;
 	xfer[last].cmd_desc[0] |= CMD_0_TOC;
@@ -378,6 +415,9 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
 	}
 
 out:
+	for (i = 0; i < nxfers; i++)
+		i3c_hci_free_safe_xfer_buf(hci, &xfer[i]);
+
 	hci_free_xfer(xfer, nxfers);
 	return ret;
 }
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index c805a8497319..4e01a95cc4d0 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -362,6 +362,7 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 	struct hci_rh_data *rh;
 	unsigned int i, ring, enqueue_ptr;
 	u32 op1_val, op2_val;
+	void *buf;
 
 	/* For now we only use ring 0 */
 	ring = 0;
@@ -390,9 +391,10 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 
 		/* 2nd and 3rd words of Data Buffer Descriptor Structure */
 		if (xfer->data) {
+			buf = xfer->bounce_buf ? xfer->bounce_buf : xfer->data;
 			xfer->data_dma =
 				dma_map_single(&hci->master.dev,
-					       xfer->data,
+					       buf,
 					       xfer->data_len,
 					       xfer->rnw ?
 						  DMA_FROM_DEVICE :
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index f109923f6c3f..f94d95e024be 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -90,6 +90,7 @@ struct hci_xfer {
 		struct {
 			/* DMA specific */
 			dma_addr_t data_dma;
+			void *bounce_buf;
 			int ring_number;
 			int ring_entry;
 		};
-- 
2.42.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
