Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AC6CEBF91
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 13:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UTad9ouApfI1xpV/utXIQ+6hc56gSc6lTl37U3VR0sk=; b=F4NJwVGGrYlXg8
	Urjt+iYOTQdb4ULQ7VhPlXq4suOkcZToWzr2gd7nEWuWXPXL+76wbudovvMM2IhI7JS5g1x1WRqsC
	YFtMGgfrV/vckiCOJ3zA640KOkyb+A0g/bZBtr7nWI9q0mYft8MParDaE243A0XMfX2+nS5GvC+Uv
	/Fr7aD1SvGB70x43KiX1QQljvQ5B7j1PmXvQbn4V2uppBM9fdECVC3uey7Nbg2YJZRjHl8x30v9sD
	MztybmXH+ySq+7qfl1OihZ1GRU9j3UAiuFMUmcVlWmBOtiAKG3y3RBzUMzI+AygG6p+0gVbjWbicw
	P3OxLobfnUooXpzVdGgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5n-0000000GA6R-22gB;
	Mon, 17 Nov 2025 13:16:27 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5j-0000000GA4a-472h
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 13:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763385384; x=1794921384;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nJ/hYMHgM0MeVz/J6nOO36wIT1Vpu9akEqDX1sOsMe8=;
  b=Y12O8Vvsh9I0vGRULDaRLOOKBI20P+uKrUWhKiozi/s37P0Nsb8OPE7B
   q4LIeIEkmjPyTiP5hFCrqRxfPWjxogoJqt66ajA4ld9mIuUn0DfljoMvc
   PzZmD2eZIUsWTTLrzm/vp0JDYD5udgs5WBBb/vh2EM/H5Zsqm8QfwsyZE
   KO25z267Y1hHgIEKwmWOlin29KqT2bgQnbWq13/+jpFiy+SZA7gvq44/y
   Agux+RlcEdGNIbLcETtQu4/ntkVEmps4uE3qLulv4M5PDlvj0C1yuYw/6
   UX4IjCJ/Ej4zWRVOiMMW0TPCsJwSQssiPWa/q8vDMCIaLReVOc9ZezQaZ
   Q==;
X-CSE-ConnectionGUID: 9sQ1lIFqSlm0WsqK5Vm3cg==
X-CSE-MsgGUID: Ubr2+aIzT5SJNmF9Ok44fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="83009057"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="83009057"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:24 -0800
X-CSE-ConnectionGUID: qd49nC1iQ6Gl6chk1DmJHw==
X-CSE-MsgGUID: f5jEGLOaRICQd/rmLc/o9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="194549286"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.191])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:22 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 02/12] i3c: mipi-i3c-hci-pci: Move all Intel-related definitions together
Date: Mon, 17 Nov 2025 15:15:58 +0200
Message-ID: <20251117131609.65988-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117131609.65988-1-adrian.hunter@intel.com>
References: <20251117131609.65988-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_051624_028352_BD0D6AFC 
X-CRM114-Status: UNSURE (   8.58  )
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
---


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
