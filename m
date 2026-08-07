Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC49C5ACD1
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 14:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ziXBMSI9N03R5LBmnK1hBakOE0xIuT2pfdAFFS2i6E=; b=IIv9v+FQLP+3Ln
	14UbN0+k0TkBmbpBZUaIQ3ZVrUwMWzGjJm+mzZvFv4VNVWrisfpFM/daLxEmDxheOj6LZ8fm1sTXI
	gori68ZY1BWzISutYdT7tpGsPSjYClMuWctuyX5kaf1dxt/sjHypEFtu0nuXD1UfysZJIeWdBcAjI
	poqiNhnFFjdl/z4CPyJ8a7guGiRPZ/i+6qMZ9ipPocuo02usKRB4x7RkCEla/+jl20uV41ehpUMMG
	evdgCPaqCYEVEimiePxGt7WLNm6PLBL/DxH0nmKpb/KWPI7VkyY8BHgtQ3nRuj9qmfn+/hZ8Az5He
	i8wzXUSgtCwwyIk/0pNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM10-00000008InN-0aHV;
	Fri, 07 Aug 2026 14:57:42 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM0y-00000008Ilk-17GT
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 14:57:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786114660; x=1817650660;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3YumbivJ97gedr33UQLGzZZ9HmKGhUq7z+4nWTxukeo=;
  b=VO3YoW5DtORaAga4DynmrNayK+fmn+ZtboGXMOa9YREg/Oz6LEVF46qb
   /es5ZC7F2Ckx4O0x5RvpAkd5t/H7rjbY46rIKNijq1+Dik2uHS1MO/y9h
   M0jxnTQPimNM6A1T7WG/eIRghc/ELhIq6080wqezLNBHUVV4DuyNeUYx7
   xBO90EPKD7PeDSkPGnMZO2DalQkrD7WiZ9e9mqrt2JA7x4y7tGmcVouHt
   BUOWZztMrcM3dppk8JHrXP7AQS/6B0hWvT8SuSuAv96gETqnhZA5Ym55m
   YKnM1zCe8JdyO0gtgyfrLq+0/T2fASihEkJB8Aly44ihMFIu+fswOVpIv
   A==;
X-CSE-ConnectionGUID: krq3xOgZRwulCPWxWecAMw==
X-CSE-MsgGUID: CJBtFW7/RJamGkI65ZZB8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86485241"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86485241"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:40 -0700
X-CSE-ConnectionGUID: 4fbKvVegQLK4jH6l8hSZMg==
X-CSE-MsgGUID: Vz6NQqQ5Sl2PQMy0eTRKJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259809938"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.114])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:08 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	akhilrajeev@nvidia.com,
	mukesh.savaliya@oss.qualcomm.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V5 08/14] i3c: master: Support IBI-based wakeup capability
Date: Fri,  7 Aug 2026 17:56:32 +0300
Message-ID: <20260807145638.168865-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807145638.168865-1-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_075740_338614_B7DFC9D4 
X-CRM114-Status: GOOD (  11.79  )
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

An I3C controller acts as a bus controller for one or more I3C devices.
If the controller can wake the system in response to an In-Band
Interrupt (IBI), then any device on that bus that is capable of
generating IBIs can potentially be used as a wakeup source.

Add an ibi_wakeup flag to struct i3c_master_controller so controller
drivers can advertise support for IBI-based wakeup.

If set, mark IBI-capable I3C devices as wakeup capable when they are
registered, allowing wakeup management through the standard device
wakeup framework.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
---


Changes in V5:

	Added Mukesh's Ack'd-by

Changes in V4:

	Shortened the comment about IBI-capable devices being wakeup
	capable.

Changes in V3:

	None

Changes in V2:

	Dropped the redundant #include <linux/pm_wakeup.h>.  That header
	must not be included directly, and linux/device.h, which is
	already included, provides device_set_wakeup_capable().


 drivers/i3c/master.c       | 4 ++++
 include/linux/i3c/master.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 83e04a2c202a..2616354dbe54 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2110,6 +2110,10 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 		if (desc->boardinfo)
 			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
 
+		/* If the device has IBI capability, set as wakeup capable */
+		if (master->ibi_wakeup && (desc->info.bcr & I3C_BCR_IBI_REQ_CAP))
+			device_set_wakeup_capable(&desc->dev->dev, true);
+
 		list_add_tail(&desc->dev->node, &i3c_unreg_devs);
 	}
 
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 26535beb1e77..9d675d01522c 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -524,6 +524,7 @@ struct i3c_master_controller_ops {
  * @hotjoin: true if the master support hotjoin
  * @rpm_allowed: true if Runtime PM allowed
  * @rpm_ibi_allowed: true if IBI and Hot-Join allowed while runtime suspended
+ * @ibi_wakeup: IBI can wakeup the system
  * @shutting_down: set to true when master begins shutdown or unregister
  * @boardinfo.i3c: list of I3C  boardinfo objects
  * @boardinfo.i2c: list of I2C boardinfo objects
@@ -563,6 +564,7 @@ struct i3c_master_controller {
 	unsigned int hotjoin: 1;
 	unsigned int rpm_allowed: 1;
 	unsigned int rpm_ibi_allowed: 1;
+	unsigned int ibi_wakeup: 1;
 	bool shutting_down;
 	struct {
 		struct list_head i3c;
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
