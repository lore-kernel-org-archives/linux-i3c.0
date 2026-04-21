Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46488F94CA0
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Apr 2026 17:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzTPPTZak4wM0it4R2hZMZkqnZpU4n0M4DJBavRYFXI=; b=W6u6yksUYL5GH7
	G1EfpnFofcQBIxiUwQLmSys7HADW53Pw8Zv2NTarvyeUodbBAxaez16bkl3P2neYz6p7j4YyqZYjQ
	O+3GrPoXEP+/cA+UcYnh3E8wRTHEeJ+7ognjuHQO9WqYw3kqlk4p4X8mtHgFbwdkjcDyDYzAsLkpU
	TsFL+VXfkvfG/YvUgco8OHG5FfITX1eiQenTWr03F8WQ9NAJnkbF4beGhJYJk8hmjzhWxRxpj/r+M
	SuMAXkpwPZTiXjYfeQGXnD4UM5R0JdXXrITlvaneUsK3cLAOzKNZ1gyQ/pRRDJqAoxJ9tquoij9i0
	3bhhXoLUFsE41kOeJrKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJW-00000008zdo-01zI;
	Tue, 21 Apr 2026 17:55:10 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJT-00000008zV1-3a9g
	for linux-i3c@lists.infradead.org;
	Tue, 21 Apr 2026 17:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776794108; x=1808330108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GpXicQuAUwvk9bRUIWFNMDZTDiSM4cRz2I/RyILus2A=;
  b=L67pRYxfciFhoA+Rd4MCZtO/dp0PxuYTZPSKb6mRYE7weH8yfiRCYRSc
   JoLQo5gZy23kL6Xa55gZkZQwKHGvkUak8MmYMfxItZB2ECl2/FYRgU1Yn
   7SWG0Ae2qFnpmKG8y2uksuvbTngIbk0pboT2vLgpqWt+A4/4rbRTXMr1i
   cce0S9bomBwckAOSn8d0/xsdK1pRxeLaTHt/1a2aVh1bCb0AnDcED7cIV
   aPjBiHdrV84OjSSu8gT4u7T0VhsArNmVum6P0ZWW6YMoTaFhlsCP76q6k
   36XxzIt7bcmjUVK0HSYuw7f0drd0ErF1ockjLyxTwnuFn+tx1Qrg8NLWT
   A==;
X-CSE-ConnectionGUID: F39EhGkFTVONS+1b3fQRJQ==
X-CSE-MsgGUID: Vb0pHpwbRO+bdmiFfwXW6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77651404"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77651404"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:55:07 -0700
X-CSE-ConnectionGUID: mWJaT1fySSO2mXc5ZRxrxg==
X-CSE-MsgGUID: ogcOLL9kTDa0Tu5SQFimfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="227495000"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.242])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:55:06 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 11/16] i3c: mipi-i3c-hci: Factor out reset-and-restore helper
Date: Tue, 21 Apr 2026 20:54:30 +0300
Message-ID: <20260421175435.122094-12-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421175435.122094-1-adrian.hunter@intel.com>
References: <20260421175435.122094-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_105507_938093_A47D8272 
X-CRM114-Status: UNSURE (   9.58  )
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

Factor the reset-and-restore sequence out of i3c_hci_rpm_resume() into
a separate helper.

This allows the same logic to be reused for recovery paths in subsequent
changes without duplicating suspend/resume handling.

No functional change.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	Drop redundant i3c_hci_sync_irq_inactive(hci)
	from i3c_hci_reset_and_restore() because it is called by
	hci->io->suspend() anyway


 drivers/i3c/master/mipi-i3c-hci/core.c | 19 +++++++++++++++++--
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 8274c84b16be..12a0122fb709 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -798,9 +798,8 @@ int i3c_hci_rpm_suspend(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(i3c_hci_rpm_suspend);
 
-int i3c_hci_rpm_resume(struct device *dev)
+static int i3c_hci_do_reset_and_restore(struct i3c_hci *hci)
 {
-	struct i3c_hci *hci = dev_get_drvdata(dev);
 	int ret;
 
 	ret = i3c_hci_reset_and_init(hci);
@@ -821,6 +820,22 @@ int i3c_hci_rpm_resume(struct device *dev)
 
 	return 0;
 }
+
+int i3c_hci_reset_and_restore(struct i3c_hci *hci)
+{
+	i3c_hci_bus_disable(hci);
+
+	hci->io->suspend(hci);
+
+	return i3c_hci_do_reset_and_restore(hci);
+}
+
+int i3c_hci_rpm_resume(struct device *dev)
+{
+	struct i3c_hci *hci = dev_get_drvdata(dev);
+
+	return i3c_hci_do_reset_and_restore(hci);
+}
 EXPORT_SYMBOL_GPL(i3c_hci_rpm_resume);
 
 static int i3c_hci_runtime_suspend(struct device *dev)
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 97c31a315a6e..a3151c26827e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -175,4 +175,6 @@ int i3c_hci_process_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
 int i3c_hci_rpm_suspend(struct device *dev);
 int i3c_hci_rpm_resume(struct device *dev);
 
+int i3c_hci_reset_and_restore(struct i3c_hci *hci);
+
 #endif
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
