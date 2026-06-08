Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A0FCD8C9D
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 05:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y7HBZDI3gk7PpM1Sf9Gecu6UuX+feCCXpGNebQ7Lz1Y=; b=mned9zwztf/cvY
	u3wDn1EV2kRRzrWKm9O6hCICJ95DePCP8dIjWPVyfUYiwHUMgfKaDupXZ3QtwGE+192ZYyFq4vPGt
	q2nVzCAWe6Rl4hwunD1+mFCmFbQ/oWKivuA81NHn9UxtA6OXcQ4NbhQ5/rwAI7ikYndYm/dIulhdz
	kTAM7YY/o1xQPqc69g8/qwAzEJ/tY6DzvsxXz7PGr+hV98sr9jr871ghLgywHZgASZ+ne3/0fg6tx
	MiOwvS79bJe8+g1WewiWmosuX0WXW+4O+uqaE4oRvjw1Za3nNvtzlgSskX0eQ/ObTp5Z1uda3RnGm
	Eh4ErbQA+/emfzFJYwYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSlx-00000002qx3-3Qpb;
	Mon, 08 Jun 2026 05:43:41 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSlv-00000002qr4-2aFa
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 05:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780897420; x=1812433420;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZHhcFRx/e/JU5St9q86h3eeBmtOe78TIgKSxoGCto2Q=;
  b=TevsdO704r6jEDBsM6wVHKZrf5ZSTgLCbxVTsWm/O71d6ITvSRB3JMrq
   YAEMPwm1E93AFtWqTc+tD+brweWXR/Tl7O8mi9sGlj8x0jS6bnW4DWlgC
   G9bZALRA8wzX4evhzM8r8o9ZITMIWq+DyZh8AZeVXwPWLjRmltDgPy/1C
   xOCMtMyaEQQH5yEnmLLpnl5ODSrK6FzGgJ2wcDHmBX/Pzj8jCs09rIlJs
   WqnL/pfaQl6MjrAYzkRghy6BiUVBgBov3r6F5Mhdo64DsllF9qDfbs+IB
   4KmLFSZ6megJAIEQC0PtGhb5m23UaHDgLSOlDPw5UWfYgxAFP/CuSCP+L
   w==;
X-CSE-ConnectionGUID: hu6YxVGbRQi9f/IYGgC6Ow==
X-CSE-MsgGUID: A7nIbIWXQU+dEVEDRE8qdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="104284066"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="104284066"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 22:43:40 -0700
X-CSE-ConnectionGUID: +mxgecrVSauQQMpdLcNk/w==
X-CSE-MsgGUID: N90m7ovHSBGPwYgaU1ofuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="245505702"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.114])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 22:43:37 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 7/8] i3c: master: Export i3c_master_enec_disec_locked()
Date: Mon,  8 Jun 2026 08:43:11 +0300
Message-ID: <20260608054312.10604-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260608054312.10604-1-adrian.hunter@intel.com>
References: <20260608054312.10604-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_224339_691011_EE2EB8A7 
X-CRM114-Status: GOOD (  15.06  )
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

The existing i3c_master_enec_locked() wrapper always treats a NACKed
ENEC CCC as a failure (M2 error).  However, broadcasting ENEC to enable
Hot-Join is legitimately useful even when no I3C devices are currently
present on the bus, in which case the broadcast will be NACKed and
should not be reported as an error.

The underlying helper i3c_master_enec_disec_locked() already accepts a
suppress_m2 flag that lets callers ignore such NACKs.  Expose it so that
a subsequent patch enabling Hot-Join events can issue ENEC with M2
suppression.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Add Frank's Rev'd by


 drivers/i3c/master.c       | 27 ++++++++++++++++++++++++---
 include/linux/i3c/master.h |  2 ++
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index c9685379e868..f87bf0099d3c 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1121,9 +1121,29 @@ int i3c_master_entdaa_locked(struct i3c_master_controller *master)
 }
 EXPORT_SYMBOL_GPL(i3c_master_entdaa_locked);
 
-static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
-					u8 addr, bool enable, u8 evts,
-					bool suppress_m2)
+/**
+ * i3c_master_enec_disec_locked() - send an ENEC or DISEC CCC command
+ * @master: master used to send frames on the bus
+ * @addr: a valid I3C slave address or %I3C_BROADCAST_ADDR
+ * @enable: true to send ENEC, false to send DISEC
+ * @evts: events to enable or disable
+ * @suppress_m2: if true, treat an M2 (NACK) error from the CCC as success
+ *
+ * Send an ENEC or DISEC CCC command to enable or disable some or all events
+ * coming from a specific slave, or all devices if @addr is
+ * %I3C_BROADCAST_ADDR.
+ *
+ * When @suppress_m2 is true, a NACK of the broadcast (which can happen when
+ * no devices are present on the bus) is not reported as an error. This is
+ * useful for callers that want to configure event reporting unconditionally,
+ * regardless of whether any devices are currently on the bus.
+ *
+ * This function must be called with the bus lock held in write mode.
+ *
+ * Return: 0 in case of success, or a negative error code otherwise.
+ */
+int i3c_master_enec_disec_locked(struct i3c_master_controller *master, u8 addr,
+				 bool enable, u8 evts, bool suppress_m2)
 {
 	struct i3c_ccc_events *events;
 	struct i3c_ccc_cmd_dest dest;
@@ -1148,6 +1168,7 @@ static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(i3c_master_enec_disec_locked);
 
 /**
  * i3c_master_disec_locked() - send a DISEC CCC command
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 8cdd7be505d3..e2c831fb5354 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -607,6 +607,8 @@ int i3c_master_disec_locked(struct i3c_master_controller *master, u8 addr,
 			    u8 evts);
 int i3c_master_enec_locked(struct i3c_master_controller *master, u8 addr,
 			   u8 evts);
+int i3c_master_enec_disec_locked(struct i3c_master_controller *master, u8 addr,
+				 bool enable, u8 evts, bool suppress_m2);
 int i3c_master_entdaa_locked(struct i3c_master_controller *master);
 int i3c_master_defslvs_locked(struct i3c_master_controller *master);
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
