Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E12CEACEF
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 13:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=moTezMjh/jYcZAxi1XmYqNS3xPimqNC2c1PAn/9H9cs=; b=IAorKimBoZ9XW/
	lyPDG4LZLbOVVu//AfmI7eDo5PD77FXcRy7b9d321QcgFq1naDTU5zPoV/08HRJCSAwa/ZTkd4fUU
	1NbRZlzVKuidEp41K60fKIHlzYSAjj0I4Jyy2vr0c92yE08aJ9ObBdqcuVOC10GuDABqzRL5CLCxN
	y5gnHL9ZlzJZiDZPN/OB9OjIT9TKhnJH7E1Y0m8xy/lrWzNSS7HZrpvvr5jzeTW8IHGVQWmFQariR
	8Mq+/QJkQeoxz2iB6vHqNs/+MT/SCRrOemSVR4ttKRvcAHodd6GtfGwfM5CxqyD6cg5BxSmShpLTz
	mrgvh7+obb21UNqUp5/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5q-0000000GA8v-453y;
	Mon, 17 Nov 2025 13:16:30 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5n-0000000GA6C-1Lvi
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 13:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763385388; x=1794921388;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mh5iLIb36WIfEuDykOhRmaTnJ+HaG8L4aMORszTVdP0=;
  b=PDhWTO+deT5V48Mq2hmIzHhK2K7Zm5GEQkWS76EuzTrVd95yRHVgbq+R
   Gljrgr4piFrdbo3ZVU6bzvYPaOhNAXxaigwOuM62zOFH+hnsozGOejVRi
   TnWe7b+MJQyev6P6TdkbwQmGMhf93gNGVxX+0zZ79ZN9hogiZLA1VK2iX
   7GBOYvlHvrYv4uqK2bTsXLyIBuOkuhsa9wLT2JU5fuD+T/Q3PKA8+5L7G
   QbQSt50MYFD5xvwL5kw8PYZCVCKrYta4E8vTF1dD0vM2cz2DHYLDEJ5fp
   73Y6DRHoKX0dr7mlky0I2L6dFmcBsVujiJqDBntzzJ/R3sJcEY72gEo55
   g==;
X-CSE-ConnectionGUID: IhCiA/1fSLqxUHR8PqnGaA==
X-CSE-MsgGUID: 8zmLZjOdSZWOnjn1r5c1wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="83009068"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="83009068"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:27 -0800
X-CSE-ConnectionGUID: SuUJvu/aRdu7flVN2pOhyg==
X-CSE-MsgGUID: +c/UFNC1RTefxJRSaQUzww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="194549300"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.191])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:25 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 04/12] i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
Date: Mon, 17 Nov 2025 15:16:00 +0200
Message-ID: <20251117131609.65988-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117131609.65988-1-adrian.hunter@intel.com>
References: <20251117131609.65988-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_051627_369705_D2BC9531 
X-CRM114-Status: UNSURE (   9.32  )
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

Use readl_poll_timeout() instead of open-coding the polling loop.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	Change 10000 to (10 * USEC_PER_MSEC)


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index d434e2962740..30915d78045e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -8,6 +8,7 @@
  */
 #include <linux/acpi.h>
 #include <linux/idr.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -24,11 +25,12 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
 #define INTEL_RESETS			0x04
 #define INTEL_RESETS_RESET		BIT(0)
 #define INTEL_RESETS_RESET_DONE		BIT(1)
+#define INTEL_RESETS_TIMEOUT_US		(10 * USEC_PER_MSEC)
 
 static int intel_i3c_init(struct pci_dev *pci)
 {
-	unsigned long timeout;
 	void __iomem *priv;
+	u32 reg;
 
 	priv = devm_ioremap(&pci->dev,
 			    pci_resource_start(pci, 0) + INTEL_PRIV_OFFSET,
@@ -40,13 +42,9 @@ static int intel_i3c_init(struct pci_dev *pci)
 
 	/* Assert reset, wait for completion and release reset */
 	writel(0, priv + INTEL_RESETS);
-	timeout = jiffies + msecs_to_jiffies(10);
-	while (!(readl(priv + INTEL_RESETS) &
-		 INTEL_RESETS_RESET_DONE)) {
-		if (time_after(jiffies, timeout))
-			break;
-		cpu_relax();
-	}
+	readl_poll_timeout(priv + INTEL_RESETS, reg,
+			   reg & INTEL_RESETS_RESET_DONE, 0,
+			   INTEL_RESETS_TIMEOUT_US);
 	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
 
 	return 0;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
