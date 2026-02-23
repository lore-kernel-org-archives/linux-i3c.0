Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C509E98E10
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Feb 2026 09:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ofmlK69htiQwSR3SO75OYXmaAe/tnT8sSqxh8kjOjuM=; b=D3SrFDfPjwu/OO
	muMe65MSMibFqd/SYV96sAILwUrWK+6Cx0aWOGF9PSNHnvemvnlfaJj9443ieuJc/FPbEYiaE5OAh
	pB4KCSc8IcrVDWeYmbmzIG62Jx9Qlav6TDqrE+vJ4lisfx0QxovURiBYrfnr8mCI4QQsaQF7U3TGu
	qybrCADetmKWS05yMvS0HTrJMVpkejtr7mBpfoRbwIzfFIeeacnPiGZjOspPjAJKZDYTY3bwnRttH
	LLs1/ryD8jNCCL23gvIIJsqFVuujESHYckusMqUbmXbyzbXQrPtKYInB4NBzDwfISGKwKFZ++4WGb
	Xheb+pkmyAJzCOlvubxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuS7j-0000000HWmY-0z8r;
	Mon, 23 Feb 2026 09:21:03 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuS7f-0000000HWk8-0sBk
	for linux-i3c@lists.infradead.org;
	Mon, 23 Feb 2026 09:21:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771838459; x=1803374459;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nJoS04WRIbALpdyQ4/xt0PHkkGiWif0IWZzmhvBHJLw=;
  b=VzRNIGVmrjBKYMJsLLnXuI6hMhshtwYkPrgrWRbH0YFmzCp0KR1CVUN7
   ybH1EhXBPLbW/8gqsbr6Qy6O6T4DVc5X1VQQW5lGaFVzIdPBUTu8Y+LsV
   YkCsGiiSk6JS9cZoofIrQQHmTTOE1JUw56ToK4i0UJoekibxtbO9WDe/0
   +Cj1X0tDqPWWLHgsapg5aW6ozoIrgvbJIxXH23/oiNxB5uIDQHjjOSP/P
   P3DeHFFtB0mmWiZpsD/6T2fmQQoc+CVZNCDGvRVUDcHldE1BukgXKFbZT
   SgMCphbIXYonoa1+VDrlTOqcesve7x2Mj5wScRXKt/3oCQ1HWAN1DtW8l
   g==;
X-CSE-ConnectionGUID: k2WJAM5fSqK7OdoABH9a2Q==
X-CSE-MsgGUID: G6JYDeP5R/O9Rn0Z29UVaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72928696"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72928696"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 01:20:57 -0800
X-CSE-ConnectionGUID: n3u8m63KQdCeNyclllsyCw==
X-CSE-MsgGUID: SJk1sgUSQQ6KapCAuF5Guw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="215346062"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.206])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 01:20:56 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V4 2/5] i3c: mipi-i3c-hci: Add quirk to allow IBI while runtime suspended
Date: Mon, 23 Feb 2026 11:20:38 +0200
Message-ID: <20260223092041.104689-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223092041.104689-1-adrian.hunter@intel.com>
References: <20260223092041.104689-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_012059_264729_E8A84529 
X-CRM114-Status: GOOD (  12.03  )
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

Some I3C controllers can be automatically runtime-resumed in order to
handle in-band interrupts (IBIs), meaning that runtime suspend does not
need to be blocked when IBIs are enabled.

For example, a PCI-attached controller in a low-power state may generate
a Power Management Event (PME) when the SDA line is pulled low to signal
the START condition of an IBI. The PCI subsystem will then runtime-resume
the device, allowing the IBI to be received without requiring the
controller to remain active.

Introduce a new quirk, HCI_QUIRK_RPM_IBI_ALLOWED, so that drivers can
opt-in to this capability via driver data.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	None

Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	None


 drivers/i3c/master/mipi-i3c-hci/core.c | 3 +++
 drivers/i3c/master/mipi-i3c-hci/hci.h  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index e925584113d1..ec4dbe64c35e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -959,6 +959,9 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	if (hci->quirks & HCI_QUIRK_RPM_ALLOWED)
 		i3c_hci_rpm_enable(&pdev->dev);
 
+	if (hci->quirks & HCI_QUIRK_RPM_IBI_ALLOWED)
+		hci->master.rpm_ibi_allowed = true;
+
 	return i3c_master_register(&hci->master, &pdev->dev, &i3c_hci_ops, false);
 }
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 6035f74212db..819328a85b84 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -146,6 +146,7 @@ struct i3c_hci_dev_data {
 #define HCI_QUIRK_OD_PP_TIMING		BIT(3)  /* Set OD and PP timings for AMD platforms */
 #define HCI_QUIRK_RESP_BUF_THLD		BIT(4)  /* Set resp buf thld to 0 for AMD platforms */
 #define HCI_QUIRK_RPM_ALLOWED		BIT(5)  /* Runtime PM allowed */
+#define HCI_QUIRK_RPM_IBI_ALLOWED	BIT(6)  /* IBI and Hot-Join allowed while runtime suspended */
 
 /* global functions */
 void mipi_i3c_hci_resume(struct i3c_hci *hci);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
