Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC44D78785
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 14:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5AQYm57nFGaHWtBlPgqV0dxek9kX76miGIvu46mu7OE=; b=N3PwVqRFZ0ZmUu
	7IMbL9V9lGPiFuO0ICRoks7a6rRsppMzILuGChT/LrgZOPl1OLaT6XnwYPaZwF8mEIPnexdrWpZ0P
	l2aW5Dn2LFE3iGBZhdN8ApmYWI+1570Jj4AUci1Vx2C83PBsKICLkvu2yXzRo8NwTpywQi15WFFLe
	z9mWFwqzmdLKTIr2dyfZsqgAj9PoONSvV6klPSvfVbV9dNZ1eeXneWV9odjFIz6pOG5viJc2UpHE5
	le/bLW9GUPARhsVJmjzEXVsrBfzJE0DhFSUcN8VusjyERqqoCDaAP0n6MELGWyS1WWYP9FKTDYG9J
	S38+J0+5rIXEWwJ+wIfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbju-0000000ARNa-12ni;
	Fri, 19 Dec 2025 14:45:54 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbjr-0000000ARM7-2s5B
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 14:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155552; x=1797691552;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uxxuW4hVW36KHL2iiDQ7NRQbp1j4IDusxrcNYYo9quY=;
  b=A+FwHKNX1DZExZlMXCK8urtPBuVIec1EoUQDWxFA+HnLEormG0S8Rfh2
   8BgMgF8FkSCO+QeNf63PQBSKOC95KhtLWlpnrzehCo0OCxn4QUMiGG9M+
   QJKHJRFj+JeBJqCJscZ+MLXf+x3nOy8BXmggC8WtsPwm5BJEvrkTYGRcn
   aPY1m0k/M2sMZHSqZxluYFcsjQJ5DapAzceiqRZgim7Of5WVsCEkchFog
   XuU1ia0aeHxHR/ohHbObLaN2sl9SHdaUsieywq8WrIofsgXh7A6M79ECV
   g62p5m5gcprIp2EbUMh4Hve3q5ohDBhuPV02nOAWP14D5lDB23wDwp8Pa
   w==;
X-CSE-ConnectionGUID: dDc3MFjnRMmeXgCv2H/lDA==
X-CSE-MsgGUID: B7ls3sUgTZScM36AsHgh4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93588897"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="93588897"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:45:51 -0800
X-CSE-ConnectionGUID: o/zeBjecRNWfkT6R1y3lSw==
X-CSE-MsgGUID: LMgjTNtoQh+BNMxOWmqIPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="229563919"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:45:49 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 01/17] i3c: mipi-i3c-hci: Reset RING_OPERATION1 fields during init
Date: Fri, 19 Dec 2025 16:45:18 +0200
Message-ID: <20251219144534.84391-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219144534.84391-1-adrian.hunter@intel.com>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064551_753890_7E2E0381 
X-CRM114-Status: UNSURE (   8.36  )
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

The MIPI I3C HCI specification does not define reset values for
RING_OPERATION1 fields, and some controllers (e.g., Intel) do not clear
them during a software reset.  Ensure the ring pointers are explicitly
set to zero during bus initialization to avoid inconsistent state.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 0f6bbe184e85..5515ed740ca4 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -340,6 +340,14 @@ static int hci_dma_init(struct i3c_hci *hci)
 		rh_reg_write(INTR_SIGNAL_ENABLE, regval);
 
 ring_ready:
+		/*
+		 * The MIPI I3C HCI specification does not document reset values for
+		 * RING_OPERATION1 fields and some controllers (e.g. Intel controllers)
+		 * do not reset the values, so ensure the ring pointers are set to zero
+		 * here.
+		 */
+		rh_reg_write(RING_OPERATION1, 0);
+
 		rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE |
 					   RING_CTRL_RUN_STOP);
 	}
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
