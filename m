Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C520ECD6E55
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Jun 2026 09:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJEWzXQDObwUIQM7UkaNS7r2f94ap90rjdfZJdyBUlw=; b=4Jx0xJpCpg4DE7
	YU/S4HptrQp4wJn9b2Qkm1X7q+7h+VPJmxmqDVdSDpWdlroqSqeJsTQIWU10HlY6Y8+pF8FBDtk45
	O7YNMhr6T0/Ruiwftwu1/N6lVbEEhmgRTm78RPxK03DVDkQYfAhtJS5lhEcD4ZiIEwojR11ED/X0z
	IvXNpv1WyRtrOtJOBQi6zzebkF4aRis5KjD/QjCQBNXU8D2n0ZBFToMXP+0S48MgvAxfZpbgs2EyX
	mPAEZHyYAciV+vHCeazn4drXYEBVjMgzC27uYHatIBxf8VXS0VUNdJmP0ayNuahvoixrpSkGyflKB
	OGlt15Q53PoGKylRDAeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhae-0000000Eg1F-2Ir1;
	Wed, 03 Jun 2026 09:08:44 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhab-0000000Effy-3A52
	for linux-i3c@lists.infradead.org;
	Wed, 03 Jun 2026 09:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477721; x=1812013721;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U8i31m+uoQ82HkqAIhMysB7L27S+R96vCj6fh1UOFvk=;
  b=CUZD+AjZYHs/55GSQEunzemDLMJJ5m+EFq7ffxoDYzC1VBljYpaTBr6f
   Wvb3XPc5ewLQo3WXCUb1cdws7acHzZK0nx3rVkHFV998k1BE72DEhSJnY
   /M/ANYf11vvTOps5vqsW1bOksfw1FPp6imhfIIi0IV7MbFqOPV4W/yKlE
   DeoikOeu7jHDP6YKO90C/NU0XzzMEFH5tqpGtGEMFWpI8E/cAIFuAL7Pp
   DoPkxVHlbh890O2XpPL+3TLUt1EQJHYN4qNj2TD7SHNMhPB3QL4booF/o
   SVD0vWqelDjUE+lG+Cnwbuevd8fZi7Li26Wk2Hqq/VQDOmGZr7uciopf8
   A==;
X-CSE-ConnectionGUID: HFRNUAmVQE2rCQ2KvKDjNQ==
X-CSE-MsgGUID: qY4XceA2RzmRTiRuxl9JAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91852680"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="91852680"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:41 -0700
X-CSE-ConnectionGUID: QP1Yb5wXSe6tjNXdu4+W8A==
X-CSE-MsgGUID: XJN9rBjDRSmcKiSwcDsv9g==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.137])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:40 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 17/17] i3c: mipi-i3c-hci: Increase DMA transfer ring size to maximum
Date: Wed,  3 Jun 2026 12:07:54 +0300
Message-ID: <20260603090754.16252-18-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260603090754.16252-1-adrian.hunter@intel.com>
References: <20260603090754.16252-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_020841_804502_EE502E40 
X-CRM114-Status: UNSURE (   9.17  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V5:

	None

Changes in V4:

	Add Frank's Rev'd-by

Changes in V2 and V3:

	None


 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 0136f3064ada..5c6ae2055618 100644
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
