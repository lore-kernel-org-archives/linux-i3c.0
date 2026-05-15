Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103E5CD4F48
	for <linux-i3c@archiver.kernel.org>; Fri, 15 May 2026 16:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0vdeVD6XRVg6hwz0tMlDyP9o/0Az2yLT0J3nSyhTRwQ=; b=D0pOvbMKS4RDEv
	AbInnqOUXSMVH27UPw15+Px5NK3nOjxBFr/Hm+pzUqvVhVmQCS0QqgrNqg47q4s77JT0o6lOp0yPv
	FB7oeDVHeq7sdADdl8puznds5d8WfkM40NHx3jRXShMFWBwPr8cg+lXXYZc42ysmPLCkKIJs5BO1O
	5UlKSmBD6PD2bDPHaDK2p7wkEqWb1KKdG0PQaQ9gXX7tXNJOzEheB6oGTeCQ5ynifbkPRruUZGNod
	MGhVYLqPSULgI3XWEpsttvDGoyOta1Au8lv/9r5busoDHYqTwFhoFFN3IsK9SjIXyh250aBrkprp4
	7guYEiJbIwlSSBk7wc3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvNU-00000008rfX-3I8S;
	Fri, 15 May 2026 16:27:08 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvNS-00000008rJ2-3ohV
	for linux-i3c@lists.infradead.org;
	Fri, 15 May 2026 16:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778862427; x=1810398427;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nToMwuW9z9iC87oDlmlW2x/HtDiZ1V7hTueP90c3kwg=;
  b=CqDRd99o0xO7RU8U1v81xH5MI2KQLB+xb+mPdT+/tRHeqZ6jHvj5uwsu
   2zQJHZ59oCUeSU7YHtSOnVk2LRm4A02Tp0QwcpyOu0NL76zuNK8s95UQ6
   PIfmX3n0MmEhI9wE0LkxsP+iNRUmY+ppU+VNvwH9uth3FQk5f8H/tGk7u
   vt28alOvh7PB8ShYqSsXIiFTmghZGvI9YsavMzVM4O0L/eiPiad703vkB
   7bqkabSObDcYiyB6d+HKS8bMmNwmVEHSOq/5mnqSeYrpvsxAgmy/hHb/v
   aQzhuX5GKJvusB8O6u3/fgHGq+23mDyMqD4UlCIUws3BVKFRzTiNpMwwa
   Q==;
X-CSE-ConnectionGUID: zdS2hUukTuOgDBYFuuJeug==
X-CSE-MsgGUID: pQB5Z+aPRPecR9gtFeTp4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79785315"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79785315"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:27:07 -0700
X-CSE-ConnectionGUID: lhf+66zoS8eDkq99WLvdLg==
X-CSE-MsgGUID: DSHfI1QoQYC5tON6cqrTyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="238857310"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.28])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:27:05 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 17/17] i3c: mipi-i3c-hci: Increase DMA transfer ring size to maximum
Date: Fri, 15 May 2026 19:26:21 +0300
Message-ID: <20260515162621.57719-18-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515162621.57719-1-adrian.hunter@intel.com>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_092706_992809_EE10E95A 
X-CRM114-Status: UNSURE (   8.82  )
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
