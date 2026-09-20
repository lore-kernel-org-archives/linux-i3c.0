Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6B4C982DA
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Sep 2026 15:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nUZmoHjd87uYE+npg6yaZuTRxR2QBOlHgaltuMptKKs=; b=X1Ie2MbqY3viZz
	VpwbfgKwyxdHZUsUp5PnJc+jvSKUcvFsF55i6NoAOEc/o3f1pmcScllZQ1EekZtSfFH/aO7WEJKs+
	8u8+dAzfCNkbsdnDt3JK+WBIvL8zvZKf+Fv55+sv8/4nViFubkqugzdz1+xeXlTNuCSeh11QljLjN
	A4fL2IqJylpJOzZ7e1lkHuLVZ6X0Wg1wdk5hknm4yy8SMeu9TLDVgXd69IgVPXQU9YuG/RKL70lp3
	oMPcDIci/JsudbmDgHiA2cpi8Ksqhz5Wap/yDYN8yjogI3Co/hMYvcXI/6YAzZzB+XD7q1ITHi9B9
	I4P6O8yAvgJpTglt1S4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JEE-000000002XW-2Llk;
	Sun, 20 Sep 2026 15:13:18 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JEB-000000002Vr-453U
	for linux-i3c@lists.infradead.org;
	Sun, 20 Sep 2026 15:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917196; x=1821453196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tsbhW08RnMhR983N7W+oT0nzxoyR6/vrAI0hdff9dBo=;
  b=n5JbIyky1ipYgxC19njbmy2EI/BOvU1dmfPhZAbPVDnO1hM8TZ/78pGO
   TF3IHIYALLm4ngdbcuEscDLYUp2z7RpAYpLxIF0Ek0D+ZLbTJUH05pTIW
   ugGvm55WK3sK8P3/xhUnXfxN6IdllJd0bsR5lkYUgvRZeG6uPVMNgspmK
   0HUVwQ9Z2iQD2LvDohgayn+1+N9rI5TqqlrDPhHSCwKyIzm6mAeekgCNu
   lARBY/RtAJLqInu3+kFmU3X8bQLaL0A+TCHVVWBqGwaRD+X2H7y0wjBLx
   elk+9dk7BzeE7SxVq55GJwpLJIDBD9vYhqzfHLgV573z8Hz8oUz6j7sin
   w==;
X-CSE-ConnectionGUID: jVLFEoOtSPixVHTme8aYXg==
X-CSE-MsgGUID: G+PHBVJsT6WKZOm5Amf32Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548447"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548447"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:16 -0700
X-CSE-ConnectionGUID: 93HTLn2EToKSfCUKP5q4LQ==
X-CSE-MsgGUID: cj77OfaFTtKEd7ZQmoGKqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352416"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:15 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 08/17] i3c: mipi-i3c-hci: Fix runtime PM violation in i3c_hci_free_ibi()
Date: Sun, 20 Sep 2026 18:12:38 +0300
Message-ID: <20260920151248.46936-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920151248.46936-1-adrian.hunter@intel.com>
References: <20260920151248.46936-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_081316_020920_4523C5A9 
X-CRM114-Status: GOOD (  12.21  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Added Frank Li's Reviewed-by tag.

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
