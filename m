Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFD6C982D0
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Sep 2026 19:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h6V4l5TnvY61/xuBDZ8eRHTZzHEPpGnn2VdunG5m8TQ=; b=Ohucn2xjJwi03n
	rT/er+S8WVy+aI8y2lYg3xoyYuUPHBSH9t9oHE+KrGTxKU636beTPaahKq90blSIE1sciFXm/QuOz
	heHciyjwHuMXn1P01WDXpeUxvjkZ94cAd1pKnartJMVLVGXCNHnPue7mFTYJiIgV32Olr6+ds3BRM
	S2M5uS15/qb1KRDiCnSgBnkl1aD0xKQ5J4C/H34NGz0zMJREeopnTX4uH6BJgUeqDlA+44J97bDfD
	TP6pgvJ08N7EfeFUZCSYPXOXB2EWnusM4Pae6HwKXP1RSGXK7jRO3PUQHGqZnA686Y8RQrk29EKUW
	zV+NUe9ukQx7sCSHgqjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HYv-0000000CJOj-0o8U;
	Thu, 17 Sep 2026 19:14:25 +0000
Received: from mgamail.intel.com ([192.198.163.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HYs-0000000CJFz-20o6
	for linux-i3c@lists.infradead.org;
	Thu, 17 Sep 2026 19:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672462; x=1821208462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9OC4wHyes00kB1Ezel5PAxtxJjd1M4GJEQsek6FAH7Y=;
  b=N7PbJ0HiDu1wGzM8+ajnZ6tvEvcJ5zZoVtA4KESUC4cEJjmangt/PVio
   oNR8FO7FTvOd7NG+rL4g6lSHaxEiJhjIyDKm/qkRms6ZYdUo+LGU6iHOD
   gzh2IORnUPSQ4YSepDepC8wrlBPxedDG2N3KYimqKRjzbzmQ9ZcqOsbJo
   ikgfgHHHN3L4KuJXxbE9N+14Nm6eKsdQdmV2XjQp80MMtcxaoL+ij0GJ5
   ZrcMEPUq24zSTU/EM9Zlst37goPJooA5ZIr5zd5jut+3lQqD2dUHoRJfJ
   BSCHYxuZ9XfoUk24moyPex2gYjhDLrfiO237Mgkq/wSToJyc3QRaFs/w2
   g==;
X-CSE-ConnectionGUID: GHEBwrS8R3ylkl0c/U3CnA==
X-CSE-MsgGUID: I1XCrU2kQUuIFvxnfaIL5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639929"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639929"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:22 -0700
X-CSE-ConnectionGUID: JW4DR9DjSyirA07xeWJz+Q==
X-CSE-MsgGUID: psCcIYUWTAKCIzzOOl7Glw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270271981"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:20 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 08/17] i3c: mipi-i3c-hci: Fix runtime PM violation in i3c_hci_free_ibi()
Date: Thu, 17 Sep 2026 22:13:47 +0300
Message-ID: <20260917191356.133242-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917191356.133242-1-adrian.hunter@intel.com>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_121422_526622_484AED1F 
X-CRM114-Status: GOOD (  12.15  )
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

i3c_hci_free_ibi() calls __i3c_hci_disable_ibi(), but the latter
requires runtime PM to be resumed.  The ->free_ibi() callback does not
guarantee that condition.

The cases where ->free_ibi() may be called without a preceding
->disable_ibi() do not require re-enabling runtime PM handling:

- runtime resume failed in i3c_dev_free_ibi_locked(), so it skips the
  IBI disable but still proceeds to call ->free_ibi()
- the device has been re-enumerated under a new dynamic address in
  __i3c_master_add_i3c_dev_locked(), which tears down the old device
  descriptor and deliberately clears olddev->ibi->enabled (to avoid
  sending a DISEC to the stale old address) before calling
  i3c_dev_free_ibi_locked().  As a result ->free_ibi() is reached with
  neither a hardware IBI disable nor runtime PM resumed.

In both cases the important requirement is to prevent further IBI
processing for the device.  That can be done without accessing hardware
by removing the device from the ibi_devs[] table.

Replace the call to __i3c_hci_disable_ibi() with clearing the
corresponding ibi_devs[] entry under the controller lock.

Fixes: 650716f23eac4 ("i3c: mipi-i3c-hci: Fix race in i3c_hci_addr_to_dev()")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	None


 drivers/i3c/master/mipi-i3c-hci/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index f6a34ce7a295..b9b20797d045 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -675,11 +675,13 @@ static void __i3c_hci_disable_ibi(struct i3c_hci *hci, struct i3c_dev_desc *dev)
 
 static void i3c_hci_free_ibi(struct i3c_dev_desc *dev)
 {
+	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct i3c_hci *hci = to_i3c_hci(m);
 
-	/* Must ensure the IBI has been disabled */
-	__i3c_hci_disable_ibi(hci, dev);
+	/* Must ensure IBIs for this device will no longer be processed */
+	scoped_guard(spinlock_irqsave, &hci->lock)
+		hci->ibi_devs[dev_data->dat_idx] = NULL;
 	hci->io->free_ibi(hci, dev);
 }
 
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
