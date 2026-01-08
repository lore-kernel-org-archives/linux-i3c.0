Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A657FCF6BE5
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 08:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hYdgbItaxilYlgOblSqGaeakQ0oNnB7P3GyMQ9RT1N8=; b=XCya/dxVifpVJL
	2dpCtjsctZzEfisvh3rsHP4D67Hb3yU/aBrGxX2qkgy3LS1E17tV9bHbrbpecIND8aJ6S0dNjouPL
	fpyKsm58xFx7rcyznfckDkEmpft640UyKZwqUFcMakXd+x0tthPOEDLtIw6BN51XmQetoCy2R2s1q
	BzcAr+lDi2WxB+c7EOmftNo6bggOCP1P12V8Br59gBpAhcwAscshlTF4vFauWKgw06cpI75+KIIuj
	mjVRPvtpA2d7K+Xx+ztV+ew8snSsQsEjx7dPUprPH03IRk90b6Qp/vppqZwh+svELtDtLvVX6acmb
	KM9iDJQIGQOwCtmkNzlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2J-0000000GD9e-1jlj;
	Thu, 08 Jan 2026 08:06:27 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2H-0000000GCzw-21om
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 08:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767859586; x=1799395586;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Knn0NsYYNvKBbzl82ELzo3uZGyhTmFy7hj3oOMlYXsw=;
  b=nE7KsjJ93+57W4g0bOEdgELwlznfpxskhZ/iP/FrXMOEheg9Bu+oCe5K
   lX/OIcGhlASwF/jjFhyCUN/+TBIutBc3p8XxVICeTG+GiXkM3WtaT1fyY
   NfUZPnJvdKUIzRrhU7w5k4xJSnckNAvK43KxaGaOO6L5/b4yE17oMP+e4
   AiHzW7ZK8nzl6w1KhWlOSPJRsXU/5C7ilERgVloqZHmAh203ay4Mgrp1q
   aD0lOyoplV8E2WLjE4L2GlhviE3CymEqdN9Lf1u3pDNxgFxI2cUNOaEbw
   Si2u+2tTClfQiLryUAJgEZbU0axGa2+Fw6uOic35iiZAYT1CnvpTgiS7X
   A==;
X-CSE-ConnectionGUID: OLaNc9FjR7W6kuGCAhk3Zg==
X-CSE-MsgGUID: HTKxacBHQo+GyUP9BnsSBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56792292"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="56792292"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:25 -0800
X-CSE-ConnectionGUID: bdEwuRuHSMGENz3pLSv2yQ==
X-CSE-MsgGUID: d7lCXdewTL2W29S8ThdC/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203413591"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.195])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:23 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 07/20] i3c: mipi-i3c-hci: Manage DMA deallocation via devres action
Date: Thu,  8 Jan 2026 10:05:45 +0200
Message-ID: <20260108080558.21767-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108080558.21767-1-adrian.hunter@intel.com>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_000625_535488_D03C89C1 
X-CRM114-Status: GOOD (  12.22  )
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

The driver already uses devres for resource management, but the standard
resource-managed DMA allocation helpers cannot be used because they assume
the DMA device matches the managed device.

To address this, factor out the deallocation logic from hci_dma_cleanup()
into a new helper, hci_dma_free(), and register it as a devres action.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	Move hci_dma_free() below hci_dma_cleanup() to make patch look
	better to review

	Frank suggested using devm_add_action_and_reset() but it doesn't
	work because the error path needs to call hci_dma_cleanup() before
	hci_dma_free


 drivers/i3c/master/mipi-i3c-hci/dma.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 54849aa98fad..4999cf3d9674 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -169,6 +169,22 @@ static void hci_dma_cleanup(struct i3c_hci *hci)
 
 		rh_reg_write(CR_SETUP, 0);
 		rh_reg_write(IBI_SETUP, 0);
+	}
+
+	rhs_reg_write(CONTROL, 0);
+}
+
+static void hci_dma_free(void *data)
+{
+	struct i3c_hci *hci = data;
+	struct hci_rings_data *rings = hci->io_data;
+	struct hci_rh_data *rh;
+
+	if (!rings)
+		return;
+
+	for (int i = 0; i < rings->total; i++) {
+		rh = &rings->headers[i];
 
 		if (rh->xfer)
 			dma_free_coherent(rings->sysdev,
@@ -190,8 +206,6 @@ static void hci_dma_cleanup(struct i3c_hci *hci)
 		kfree(rh->ibi_data);
 	}
 
-	rhs_reg_write(CONTROL, 0);
-
 	kfree(rings);
 	hci->io_data = NULL;
 }
@@ -359,10 +373,15 @@ static int hci_dma_init(struct i3c_hci *hci)
 					   RING_CTRL_RUN_STOP);
 	}
 
+	ret = devm_add_action(hci->master.dev.parent, hci_dma_free, hci);
+	if (ret)
+		goto err_out;
+
 	return 0;
 
 err_out:
 	hci_dma_cleanup(hci);
+	hci_dma_free(hci);
 	return ret;
 }
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
