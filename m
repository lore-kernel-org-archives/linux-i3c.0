Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949F6D29DE0
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 07:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xz5GwWCFbscUIcLeTn+ULVs694MmDEMin/2cpdL0/Mw=; b=MzX2ajAnsoQvtD
	SLkCLY3Qu3hSZ9QrpF6E4dezg1UshVg1tbMepgFmMT6QzABrecACMQ4DGaGzKj+JWRPjvVyeo3a5m
	SRTYP4ES9tRqYG7brTLmtGG/kWyWKEWofpf1wNEc+yJhmVcTqQ8eqaH80TDg6klaTWROao2xXzhTS
	3utA+3UpDBzz3BScQMKvOY/Z1DboGWiIpnBOfmNn8Mg5YMO15Yr/vrnaP+OjQhQkcYpvWcvZtLERx
	4NmrNkDmyzC3SSx3cs6Vtf99F7sRzv+AYS3MThWkDGw2s1QSFYFSbg0k1SKj3eCNUteYuJwuVldTQ
	phkiao57CZWG9kaLMAvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYor-00000006elM-1Klu;
	Tue, 13 Jan 2026 07:28:01 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYom-00000006ean-2XI7
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 07:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289277; x=1799825277;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fPGSFLuA43byl4WEmQTeG+8/8q1q18UNtwhFDdPRzlI=;
  b=mlBIyUummbkF7Tzwn3Xd1/sPjUfn0SWiijAGuaInSgBYovKl6llHCYLP
   LXzDAQrE0hw1pbh2LP5YqiQdsjxOslA25ej+GRzLUcZ3KuThGGsz7Kakb
   Ypq/qQ+W/19J+ShzdBtIap4EgRvyR+s8cwoFTK2XDF61pz9Kk18BghIez
   qgET/TvWNvMZgMmaVBI2iKHILOjcFsRPBVUQM4SKEEjpD4tIarkmOeEgj
   8RqrVlcOGMi1kdhUqMhIL0H+UTvCnmLM1KJ/aGSU8f1c2CBkPXrF2y7tE
   M2/36/cY69VsywR6u5L4k+85GDrj7LxGFo2GArHn7wOTDvrA+pKZ8di8u
   w==;
X-CSE-ConnectionGUID: zER+Qj48R06xFS6Zg0P8ng==
X-CSE-MsgGUID: rsVw8O1bRgG6NQzykERfmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625529"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69625529"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:57 -0800
X-CSE-ConnectionGUID: KOukynIFRz68/wIALVJY7A==
X-CSE-MsgGUID: c/QRSDmHSzKW7VMKNLf9dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235021379"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.167])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:55 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 18/21] i3c: mipi-i3c-hci: Factor out master dynamic address setting into helper
Date: Tue, 13 Jan 2026 09:26:59 +0200
Message-ID: <20260113072702.16268-19-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113072702.16268-1-adrian.hunter@intel.com>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232756_684055_F8EE0C01 
X-CRM114-Status: GOOD (  10.25  )
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

Prepare for future reuse.  Move master dynamic address setting logic from
i3c_hci_bus_init() into a dedicated helper function,
i3c_hci_set_master_dyn_addr().

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	New patch


 drivers/i3c/master/mipi-i3c-hci/core.c | 12 +++++++++---
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index fc0a47a36961..ec5425f07635 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -114,6 +114,12 @@ static inline struct i3c_hci *to_i3c_hci(struct i3c_master_controller *m)
 	return container_of(m, struct i3c_hci, master);
 }
 
+static void i3c_hci_set_master_dyn_addr(struct i3c_hci *hci)
+{
+	reg_write(MASTER_DEVICE_ADDR,
+		  MASTER_DYNAMIC_ADDR(hci->dyn_addr) | MASTER_DYNAMIC_ADDR_VALID);
+}
+
 static int i3c_hci_bus_init(struct i3c_master_controller *m)
 {
 	struct i3c_hci *hci = to_i3c_hci(m);
@@ -129,10 +135,10 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
 	ret = i3c_master_get_free_addr(m, 0);
 	if (ret < 0)
 		return ret;
-	reg_write(MASTER_DEVICE_ADDR,
-		  MASTER_DYNAMIC_ADDR(ret) | MASTER_DYNAMIC_ADDR_VALID);
+	hci->dyn_addr = ret;
+	i3c_hci_set_master_dyn_addr(hci);
 	memset(&info, 0, sizeof(info));
-	info.dyn_addr = ret;
+	info.dyn_addr = hci->dyn_addr;
 	ret = i3c_master_set_info(m, &info);
 	if (ret)
 		return ret;
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 38f927685d3b..ed89228ea971 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -62,6 +62,7 @@ struct i3c_hci {
 	u8 version_major;
 	u8 version_minor;
 	u8 revision;
+	u8 dyn_addr;
 	u32 vendor_mipi_id;
 	u32 vendor_version_id;
 	u32 vendor_product_id;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
