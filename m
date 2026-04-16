Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76C8F8D762
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2026 17:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nC/+DgsU2eeWHPP+uGYPop0PN7x92PYsRt+gDhw9X/A=; b=cM877L+N0AduLo
	s8boMsQKhiRxq+H09VWxp1arHUKrZqOX0l63LxBAs/Zgjm59LoYdbDoYmupkU01FgAHPhkYGu5oFx
	GykViemS5gQSXWI94I86a0Z7fMPBX/yy8nGpxrqe8XSMK4vsQsLiCavillSQw2mvfKiFTkWbDcy0N
	v9tfz2ufHLS6x7WRJ+bS2X4UBvfbHmKpW1aFrwuSdUgmgRMxY0p02CQXsJeWmO6sPZJWYBo5lnobv
	2xUyMb3X5uGxtZUWWGRgw4WbK8nfvYQIn03eFAkxXRUwur0jGhzjqMLA7jT2zOUGQL+u5nJEXgiud
	2ASB4gbDqprU4vGyhxyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQyB-00000002jmi-2iqU;
	Thu, 16 Apr 2026 17:57:39 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQy9-00000002jix-3Wz0
	for linux-i3c@lists.infradead.org;
	Thu, 16 Apr 2026 17:57:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776362257; x=1807898257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZFdqz5IoKK1voI4yjxLde1NwfDM/o7n7SibMeAqhd6k=;
  b=isvQQvkp+0T9wMI8AFF0ltRAxDU8DTw8Uv7qcd7Oz4lvXexqkMmNUYsu
   75kpGLLemDsSujeXSd69Lxz2QaIm6TVtQ6q0lRh+DwbcrZRYPJkcp365q
   GJmI/DTfsaBqAu1+68ivzaFeDfUIK82b8tJGojV0RT/Qvz+B9by0zOatI
   Kk3BvNwxC3ltoixh6HnySoPvypsoP5UMH4A6YlUkweBQLQ/RCQw4rz6rT
   EZJj3MumgPe3H990m5Wpf75qZTsK8PfPRCTHVnrYfssN+FnX/5efVN9a7
   nqKrgeL/V8527uL0mvZmaTri++GKDqaedOmlOcZFEkzmcEqTpH1rkg5dw
   Q==;
X-CSE-ConnectionGUID: Xwyu04StRySlhgW5vHV7vA==
X-CSE-MsgGUID: NlgXcD5WR22d5ygVhC95CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94778407"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94778407"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:37 -0700
X-CSE-ConnectionGUID: JjOGkli6Tf6l5m46O3bXUA==
X-CSE-MsgGUID: JFzLzr1QQ1e6ltUDC9o55Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="235784631"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.222])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:36 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/16] i3c: mipi-i3c-hci: Factor out reset-and-restore helper
Date: Thu, 16 Apr 2026 20:56:59 +0300
Message-ID: <20260416175704.41217-12-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416175704.41217-1-adrian.hunter@intel.com>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_105737_933320_DD3FB1A5 
X-CRM114-Status: UNSURE (   9.03  )
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
 drivers/i3c/master/mipi-i3c-hci/core.c | 21 +++++++++++++++++++--
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 4c4e87a9b352..f745805d3c99 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -801,9 +801,8 @@ int i3c_hci_rpm_suspend(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(i3c_hci_rpm_suspend);
 
-int i3c_hci_rpm_resume(struct device *dev)
+static int i3c_hci_do_reset_and_restore(struct i3c_hci *hci)
 {
-	struct i3c_hci *hci = dev_get_drvdata(dev);
 	int ret;
 
 	ret = i3c_hci_reset_and_init(hci);
@@ -824,6 +823,24 @@ int i3c_hci_rpm_resume(struct device *dev)
 
 	return 0;
 }
+
+int i3c_hci_reset_and_restore(struct i3c_hci *hci)
+{
+	i3c_hci_bus_disable(hci);
+
+	hci->io->suspend(hci);
+
+	i3c_hci_sync_irq_inactive(hci);
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
index d542d03dc629..9b46453d6d4b 100644
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
