Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BC6F8D763
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2026 17:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1QJz/hxa12rHXypm0OJPjRa+Wl4TO4IYBfg/GQOCPr0=; b=Evq/xTGYQ446xH
	r+TwGp70KIVD6cbaAvDIFh4oGrGtQLupabJm4B3Q8iJxSMhuXaDmwJTSlnlpVPt4psKvRdf0qnJm/
	bzY3DW2nGx0AgzXseJNCtZwk1pAxmBvGGEDhm6OD1FvznUVnKpmCFCkZSPyQQE8Ffzb74dcA438T7
	Q7/IcZN9YuEe7uceRNrv+aaRFQfGz1DNvEQ7kBpcGlnq2EhPjvpmjD7pqr3eBjXQJMPol6egvdZ5m
	o+rskGt633kaX6am6pyh2Ulki18nYL3LhAL1RrxScSS9BY47QixgP/WcK5xzPm4zZqlglN4fzi71U
	8DzM1dQEMurvPXOEaq+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQyN-00000002jtq-0pQd;
	Thu, 16 Apr 2026 17:57:51 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQyK-00000002jpJ-0r3T
	for linux-i3c@lists.infradead.org;
	Thu, 16 Apr 2026 17:57:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776362268; x=1807898268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2l1bjQ3UxJDbLGnSdNgnKS/z3CGthZ/e9ZN+hJneqKU=;
  b=gmbhMQFkNoZ5iAGquUXxlpaev71TYDJ7NlsTybWegLBnzDRYu3A6yEeG
   r+gDZVzkHmHjept9W3ZgWBTD3GM1Ymz8ahJ4X3053s+JWWoYbmLF4yxCg
   Zzu7XJYMXIjVavGINJv/PKEkihtGv4FFpJ73cxwou8j+v8O3wqO6dG2kH
   q3A8ATmsbZ12GTsAQC5Y85QwMngkWKwR+2QLU3qso5jfKdGF1hVl0Z26U
   kQeqiuf/IcARfPCA9Cb3GNIAl03HhKTmVbadC/eoQRF6+blpBodDUibc+
   d3AXK23nmYicFmMrIO8du7blPzxudlgjhaMr8H+tAWl6mGaM4FQE7wfEF
   g==;
X-CSE-ConnectionGUID: RG6DzS1NT2OWlh7Qo0g5Yg==
X-CSE-MsgGUID: Go2iQGX+SK6KLMO6PzROsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94778432"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94778432"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:47 -0700
X-CSE-ConnectionGUID: PaQ+QybLQbutQ0OdfkiywQ==
X-CSE-MsgGUID: gSgt0mbfTHqnFxXhaPaQqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="235784671"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.222])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:47 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/16] i3c: mipi-i3c-hci: Increase DMA transfer ring size to maximum
Date: Thu, 16 Apr 2026 20:57:04 +0300
Message-ID: <20260416175704.41217-17-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416175704.41217-1-adrian.hunter@intel.com>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_105748_333766_230B1925 
X-CRM114-Status: UNSURE (   9.09  )
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

The DMA transfer ring is currently limited to 16 entries, despite the
MIPI I3C HCI supporting up to 32 devices.  When the ring lacks space for a
new transfer list, the driver returns -EBUSY, which can be unexpected
for clients.

Increase the DMA transfer ring size to the maximum supported value of
255 entries.  This effectively eliminates ring-space exhaustion in
practice and avoids the complexity of adding secondary queuing
mechanisms.

Even at the maximum size, the memory overhead remains small
(approximately 24 bytes per entry by default).

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index b06405a9aa7b..fdab1e2df19c 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -27,7 +27,7 @@
  */
 
 #define XFER_RINGS			1	/* max: 8 */
-#define XFER_RING_ENTRIES		16	/* max: 255 */
+#define XFER_RING_ENTRIES		255	/* max: 255 */
 
 #define IBI_RINGS			1	/* max: 8 */
 #define IBI_STATUS_RING_ENTRIES		32	/* max: 255 */
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
