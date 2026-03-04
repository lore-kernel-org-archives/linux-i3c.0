Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F829EFCE2A
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Mar 2026 18:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJFEaZLfgP4BfPlYIIWqJTsmnsoVcKbxZmnzJ2UMP7I=; b=vuS6+nAMDGm9uX
	QuEUDk0mxHo7HusP0rKKr15J/LdwcrqVlfSjHvsF0tUpqcBkL4kq1d7EBawnOlcHicNizcgJV9Ma6
	xwjsantuiegLtyyMknRdK31oSGIRkBLuQfV/WI537M6p4KVowVD2hQFeqoQnJvpAYTMhdQvix73GA
	VakfbV1lKRNp0OenWGv6KFCALet83ErjcnGxZ6eUk2teijXePropTCTqoWUwTA5J/Cgc1Dhosd1Nd
	NevOZhWsM1FRQuZvmhTTX+9N0PvQoll/h/Ly5YQ7Wcs1mtoS5q1cbJpB/YG/fna0WE1SeFr7RlIDY
	hZN+sEKLrrxvtKzifXLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqmw-00000000KAi-41qk;
	Wed, 04 Mar 2026 18:17:38 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqmu-00000000K1V-44lS
	for linux-i3c@lists.infradead.org;
	Wed, 04 Mar 2026 18:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772648257; x=1804184257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VJUGidbBE83GjcKAEbXMYb3ZkgWaR/jT8MB3h2EtVyI=;
  b=hx/IMuZpCPVKZYMdCyqekHuxKFQw3U6oK/Wa1ePVqQvwWAB7gyS0wjLI
   tlVgumiwl5U3dzzDP4EUcqsSkzsqm10KjnqF3rsvh6Em3iiCChf2FauFb
   Bg4Gze/mNd2H/ffewGlaug0Ng4xb48qtAtuDGHzyRFdFM5YQ1HJYjpenb
   9+lYchhvwXzs+eNp0qfvleTsju1ugi8+B75DVNghLGqScRLf8wodnBcQK
   PmasHnrRJNN/5YsLh4pmAVKSv3u1uPlxK0bq8H/c5jZbx+JH9+D+PleDf
   ai3DOytMAt+xLRPOpBtClo7wYV931ruWIHUNXHB74w0F2Ku57erACtCh0
   Q==;
X-CSE-ConnectionGUID: Wy9XCVI0Se2gJp08NA0LLg==
X-CSE-MsgGUID: FzDxI0AbR8K/rYhf2jfh3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72745927"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72745927"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:17:37 -0800
X-CSE-ConnectionGUID: kRUrKHEqRvS4csTUgsAsjw==
X-CSE-MsgGUID: r1bjJ3QSSbet/X3RAhNQig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="217656772"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.133])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:17:35 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 09/14] i3c: mipi-i3c-hci: Add missing TID field to no-op command descriptor
Date: Wed,  4 Mar 2026 20:17:00 +0200
Message-ID: <20260304181706.143841-10-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304181706.143841-1-adrian.hunter@intel.com>
References: <20260304181706.143841-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_101737_043910_22DEE591 
X-CRM114-Status: GOOD (  11.91  )
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

The internal control command descriptor used for no-op commands includes a
Transaction ID (TID) field, but the no-op command constructed in
hci_dma_dequeue_xfer() omitted it.  As a result, the hardware receives a
no-op descriptor without the expected TID.

This bug has gone unnoticed because the TID is currently not validated in
the no-op completion path, but the descriptor format requires it to be
present.

Add the missing TID field when generating a no-op descriptor so that its
layout matches the defined command structure.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/cmd.h | 1 +
 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd.h b/drivers/i3c/master/mipi-i3c-hci/cmd.h
index 1d6dd2c5d01a..b1bf87daa651 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd.h
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd.h
@@ -17,6 +17,7 @@
 #define CMD_0_TOC			W0_BIT_(31)
 #define CMD_0_ROC			W0_BIT_(30)
 #define CMD_0_ATTR			W0_MASK(2, 0)
+#define CMD_0_TID			W0_MASK(6, 3)
 
 /*
  * Response Descriptor Structure
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index a3e8e01a35c9..239a195df7c7 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -582,7 +582,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 			u32 *ring_data = rh->xfer + rh->xfer_struct_sz * idx;
 
 			/* store no-op cmd descriptor */
-			*ring_data++ = FIELD_PREP(CMD_0_ATTR, 0x7);
+			*ring_data++ = FIELD_PREP(CMD_0_ATTR, 0x7) | FIELD_PREP(CMD_0_TID, xfer->cmd_tid);
 			*ring_data++ = 0;
 			if (hci->cmd == &mipi_i3c_hci_cmd_v2) {
 				*ring_data++ = 0;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
