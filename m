Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA00EFCE2A
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Mar 2026 18:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcxiZjkYpNjh1BCLIOVavycUrLIR+EchBEiGrXxYErw=; b=dvJoR+BsHTvey1
	H4brrUcduJOAAV0jLQo0X4usWI8w+KpY/k4d/K2rzCxWbpGXRMbsU+bf6F08O69Hjv32h+N9mCfwH
	kc93aaUGhoM7uKJ7/IY3ia06eD1+Ra+3JUN4JQx2XDzO8uLUsqMB/tNDdMhsq3tjiaCiqnZAQ+XQg
	WZqZQvFT6refYzXxqHDPTGyDBMbLDjlGcY7cJbtPQR+mkJnPefLnQO2gq0LT0ynCyXLnDq0GT3iTf
	p3teozrzc1RF4E07RtsfQ99O8hyB2NqFeCRc8SKvau6mCTETu8iwiO/V52GOc64FEdWiBQN14SW0j
	bGwc9ML2wjlWTWH5K6iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqn6-00000000KHV-3Agq;
	Wed, 04 Mar 2026 18:17:48 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqn4-00000000K1V-1k1P
	for linux-i3c@lists.infradead.org;
	Wed, 04 Mar 2026 18:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772648267; x=1804184267;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=klOqMnomoo0c8FRWhsbU4lF1+sEguOyNzwkkcwo2Bu8=;
  b=cIe13wYNXUtczylE/NNStizmsyiCgHDKfDPn21gMxT0zmXgNyR0Nkr45
   +lfJFqbBRNeI69QXqUHF6ydCeoPxZVzFo3eB6F5JMxvHJH4uOSihwBysx
   XfRUUVtsvsbIcU7iduxkIJAFBOG9cwEPSUkuO20STYwIGyCeAt7FT2GMR
   Oc0iJeMW7mvzQAwrc1dSSCl1MiPWBD5bhNy5lFkT7FyKQ0LfkTOlITrzi
   c7Z8GJyxvMRKphpqe0J+giM5s5vjP3lNNjmOSlfxjdRpCJbNBPpImF/l9
   USd+egyxUCckmR0fc4mpYpk4xe6ABn5D3o9XND5Fyi81DrYQraJhx9Aj4
   w==;
X-CSE-ConnectionGUID: wXgK0fFORnm5Luzn7stfYg==
X-CSE-MsgGUID: vniuShYpTrSWJgzUz5JNGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72745950"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72745950"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:17:46 -0800
X-CSE-ConnectionGUID: nFczpvveRO6p1BGLbLAogw==
X-CSE-MsgGUID: uzQqTU01Sb+JCpCWfOZ5Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="217656798"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.133])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:17:44 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 14/14] i3c: mipi-i3c-hci: Fallback to software reset when bus disable fails
Date: Wed,  4 Mar 2026 20:17:05 +0200
Message-ID: <20260304181706.143841-15-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304181706.143841-1-adrian.hunter@intel.com>
References: <20260304181706.143841-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_101746_467989_51D29491 
X-CRM114-Status: GOOD (  17.30  )
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

Disruption of the MIPI I3C HCI controller's internal state can cause
i3c_hci_bus_disable() to fail when attempting to shut down the bus.

In the code paths where bus disable is invoked - bus clean-up and runtime
suspend - the controller does not need to remain operational afterward, so
a full controller reset is a safe recovery mechanism.

Add a fallback to issue a software reset when disabling the bus fails.
This ensures the bus is reliably halted even if the controller's state
machine is stuck or unresponsive.

The fallback is used both during bus clean-up and in the runtime suspend
path.  In the latter case, ensure interrupts are quiesced after reset.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/core.c | 65 ++++++++++++++------------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index d5e91af7d569..284f3ed7af8c 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -181,6 +181,34 @@ static int i3c_hci_bus_disable(struct i3c_hci *hci)
 	return ret;
 }
 
+static int i3c_hci_software_reset(struct i3c_hci *hci)
+{
+	u32 regval;
+	int ret;
+
+	/*
+	 * SOFT_RST must be clear before we write to it.
+	 * Then we must wait until it clears again.
+	 */
+	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
+				 !(regval & SOFT_RST), 0, 10 * USEC_PER_MSEC);
+	if (ret) {
+		dev_err(&hci->master.dev, "%s: Software reset stuck\n", __func__);
+		return ret;
+	}
+
+	reg_write(RESET_CONTROL, SOFT_RST);
+
+	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
+				 !(regval & SOFT_RST), 0, 10 * USEC_PER_MSEC);
+	if (ret) {
+		dev_err(&hci->master.dev, "%s: Software reset failed\n", __func__);
+		return ret;
+	}
+
+	return 0;
+}
+
 void i3c_hci_sync_irq_inactive(struct i3c_hci *hci)
 {
 	struct platform_device *pdev = to_platform_device(hci->master.dev.parent);
@@ -196,7 +224,8 @@ static void i3c_hci_bus_cleanup(struct i3c_master_controller *m)
 {
 	struct i3c_hci *hci = to_i3c_hci(m);
 
-	i3c_hci_bus_disable(hci);
+	if (i3c_hci_bus_disable(hci))
+		i3c_hci_software_reset(hci);
 	hci->io->cleanup(hci);
 }
 
@@ -626,34 +655,6 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 	return result;
 }
 
-static int i3c_hci_software_reset(struct i3c_hci *hci)
-{
-	u32 regval;
-	int ret;
-
-	/*
-	 * SOFT_RST must be clear before we write to it.
-	 * Then we must wait until it clears again.
-	 */
-	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
-				 !(regval & SOFT_RST), 0, 10 * USEC_PER_MSEC);
-	if (ret) {
-		dev_err(&hci->master.dev, "%s: Software reset stuck\n", __func__);
-		return ret;
-	}
-
-	reg_write(RESET_CONTROL, SOFT_RST);
-
-	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
-				 !(regval & SOFT_RST), 0, 10 * USEC_PER_MSEC);
-	if (ret) {
-		dev_err(&hci->master.dev, "%s: Software reset failed\n", __func__);
-		return ret;
-	}
-
-	return 0;
-}
-
 static inline bool is_version_1_1_or_newer(struct i3c_hci *hci)
 {
 	return hci->version_major > 1 || (hci->version_major == 1 && hci->version_minor > 0);
@@ -764,8 +765,12 @@ static int i3c_hci_runtime_suspend(struct device *dev)
 	int ret;
 
 	ret = i3c_hci_bus_disable(hci);
-	if (ret)
+	if (ret) {
+		/* Fall back to software reset to disable the bus */
+		ret = i3c_hci_software_reset(hci);
+		i3c_hci_sync_irq_inactive(hci);
 		return ret;
+	}
 
 	hci->io->suspend(hci);
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
