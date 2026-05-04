Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EEDCD342C
	for <linux-i3c@archiver.kernel.org>; Mon,  4 May 2026 11:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3Ls8UB0SaQzkBxtFkqUjUQWz7OtlL6yPjGbDUeBeLM=; b=smgve/8f7EQDVA
	ATryziq9IaeKmkXmLyWb378VqnU859eIXyaAoH11TBLQ1vehN7ZxgjImEGZTCQlCbsUqni2o/VKEq
	+WOb8HR6lzn3f0HufIeR9pe4YAFJR8gt1FSvqT1CCegl1IcWOHVeG8IKsJSWNfG0wVhuvZig0jdvz
	BVLuc0j0RZ3nB5hxXRaDVvV1l597HtcaCFkIYrYLo0b0DfYnw+OlqEO3/pc2Zl6eSR8iPSc4zKqmc
	Ephkg4yUE+yrK+zDTyc4XE9dLCst2jzu6jpZVBl60iED3YbdU6Nh3ANxhqL6oRhOGGgwCxQJqeWDr
	s5iBRMplZQDJ3nbImTEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZK-0000000D3a6-1PAv;
	Mon, 04 May 2026 11:34:34 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZI-0000000D3YA-0F1f
	for linux-i3c@lists.infradead.org;
	Mon, 04 May 2026 11:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777894472; x=1809430472;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=prMcaVJdpa2v2ahCOleV4GJ+fFGnc0wB+iTPX8a7A8I=;
  b=Evx0V2OkUC1Y6q3SuSotGyL6LUrNd6jp4faR0GvymTc9RGwK6dn6TuJj
   TgO2dlo7Ldc9a81SZoxD2gaBgqaoajOPADI6lbJgiF1R4EWDH3IYpqW5w
   PZKSL7SCFMw9catcpWffGH3LrrbuPezuOaI6kyo8ppUbzQfwzKwh5qzSg
   8SWhIdqFFUG8HjLZbQPdlRxm+P/wm0mYlf3YaBnnE3avpdvO1TmnAshQL
   KIq/EhZ073vTW8BrRt3WEp4WTLxf55bHoLytyoF67EqNCCwtWkhDX2TDh
   sUD7WHbHpeJ4fpPWvag3fSYgneDi4EEzzUgE2g9CkKIZpJKhKgeZbb+Aw
   g==;
X-CSE-ConnectionGUID: Xir9KFT3Q/WIX9pBouvINw==
X-CSE-MsgGUID: eWBE2Vk7SLq0hqlZPYPYpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="81315302"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="81315302"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:32 -0700
X-CSE-ConnectionGUID: AI7RNkFtSre2SpVr7YgpYQ==
X-CSE-MsgGUID: IPelCT5UTDKpHaBJKegKpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240478345"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.92])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:30 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 16/16] i3c: mipi-i3c-hci: Increase DMA transfer ring size to maximum
Date: Mon,  4 May 2026 14:33:52 +0300
Message-ID: <20260504113352.38490-17-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504113352.38490-1-adrian.hunter@intel.com>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_043432_108571_3A245B47 
X-CRM114-Status: UNSURE (   9.07  )
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


Changes in V2 and V3:

	None


 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 4029d4d9e784..9549d98add4b 100644
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
