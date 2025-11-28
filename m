Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DB4D116F5
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Nov 2025 06:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kBEbaEUTcFTA6WueG3CuomaY+65xT36HrjWxW41wChA=; b=JkR8qx6WHXNPw3
	dsiqkzDUw//gjEUD9VVi6YeMk8/wqIzJRe/0eIlIJcoNk2usdDRpfVDNEKm52X4kYujMW2cXzVVEh
	GkLy3brVUkH4B7+r4cULZwvcM+Fmdm/E5tpAAlSFIZp9zel/rT8O3CMmj1fQv+taV5vswYJS2bTUD
	R7PG3lIoirvmNWog0B/LAFgNCVwyfuHUFbscW15f62YnuXjSdFJbRcO9Ppq7sO0MWROgHwLL2Cp5V
	TR73d9W+N2y/w/eBjFZh+5kcWndIkVRv0zL1k7F+J6plHxOlyxUBVSBLYYRrv6UCib9VXY4N2K2Sp
	BODDorPj8d32E8+gNqxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsA8-000000003Qn-1WoN;
	Fri, 28 Nov 2025 06:41:00 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsA2-000000003P0-0Vjn
	for linux-i3c@lists.infradead.org;
	Fri, 28 Nov 2025 06:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764312054; x=1795848054;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZueJsRMZSizgmLwS5sUule2ICatpFHVfxRsP+GGv1ug=;
  b=iAwkuc3NPpv/EPPFgnGtE0zZFnqMnIqeo8/2+wvzP8G9Sm6A5z+/VK4v
   pZKRdPtyEV7aJL2tK4U6R4zSLN73qsrCGt585ooy+aFiDR+3XyKm2ouki
   zS4di16oJoPll81RQc/Yrf7AJmW6TUH9j8sFG96nrGKrcQPX0m3FHmUHc
   HHRoae79vFv8h35uLBuiwenNb1J1a5+Jj7R72nCm+mv6Fjt8RN0Em8Y0J
   5KPracV+hZOKC2n8UTcsvH6pQNhGVjIvPunMWcSd+ZJ/R+P28/fdmHP+m
   DVpzFHE+jSZQ6rNQyFSMHrapsJyUv5fIE2vfgTdgQ1v1ZQwfeFBGdeS3A
   A==;
X-CSE-ConnectionGUID: PZ0eaivgTcGJvSfQbHiPnA==
X-CSE-MsgGUID: RXP591CcTGaBodLWb40Scg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66059929"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66059929"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:40:54 -0800
X-CSE-ConnectionGUID: DaW2BlEIRAid5a6BPwQGKQ==
X-CSE-MsgGUID: dB7VNPg6TFeseOOP/fd3mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="198348059"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.155])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:40:52 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V5 02/12] i3c: mipi-i3c-hci-pci: Move all Intel-related definitions together
Date: Fri, 28 Nov 2025 08:40:28 +0200
Message-ID: <20251128064038.55158-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128064038.55158-1-adrian.hunter@intel.com>
References: <20251128064038.55158-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_224054_335160_9AB92932 
X-CRM114-Status: UNSURE (   8.07  )
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

Move all Intel-related definitions together, to tidy the code slightly.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V5:

	None

Changes in V4:

	Add Frank's Rev'd-by

Changes in V2 and V3:

	None


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 3cd15ca7d391..3d854cee05df 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -17,14 +17,14 @@ struct mipi_i3c_hci_pci_info {
 	int (*init)(struct pci_dev *pci);
 };
 
+static DEFINE_IDA(mipi_i3c_hci_pci_ida);
+
 #define INTEL_PRIV_OFFSET		0x2b0
 #define INTEL_PRIV_SIZE			0x28
 #define INTEL_PRIV_RESETS		0x04
 #define INTEL_PRIV_RESETS_RESET		BIT(0)
 #define INTEL_PRIV_RESETS_RESET_DONE	BIT(1)
 
-static DEFINE_IDA(mipi_i3c_hci_pci_ida);
-
 static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
 {
 	unsigned long timeout;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
