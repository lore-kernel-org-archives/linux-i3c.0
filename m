Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1213CD98DB
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 08:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEsi1maIUKOy/A49JLAxAFS8WA6GMfWZmHbUiBO8Ijc=; b=ACqrsCNkx/SEOR
	4Ory3Q+4cUMP/3CLWOlTPLdIocXKOlFf7UcCu5kVLXWUNofbF1JKJiID/L3H9Voi8aYDXwCeefNoA
	uzyeHoAeC6YQ6J0JuYx9kUJ4WNP0QhDR9ZkLT3qzc0tdMDjbgsk71GvDhmwB/XmYFrCNiM7NXbOFV
	DO9B5uMAkzM3fz212+lCyCLhbGVfOmqv302FeMeGBG5VOgADAzs4YEN4gP6JUW7FCunrLXpFZpoe2
	dHPXtIRFj+bILobMAYrz3UllW9+X3qECgSxYDlb7JLCoroQrXA9MJcSs5jWnH8hVuPp6/jWZsbzKy
	nLKe8NmCyP5NGg/rRVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwpc-0000000AXCg-1tEQ;
	Fri, 12 Jun 2026 08:01:36 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwpa-0000000AX8b-0oRT
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 08:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781251294; x=1812787294;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k84rv3Xnyg4D/Yols7ebbAZiUKu8nCcY2V+K2fYDOwI=;
  b=MfB7JAELlUo/Ys42180FZQCbvAI1MrPUX7qfos9zkIviSZN5HQZBXtED
   ruCPOWnPAmT9WTgTPaRqjRm/C2TJwRrVfH6E4v/oqMNQMnn81qrLJ6+Zv
   Pdwqbm560CPk/w2Xe7gy7xaGdoqNNFfAxWJ6xOeOOU8mLeIbWeHpwivDV
   rifbJYVLrfZPeZeCIYA+mNrmhV0Kwo6ncuWVBhCO4evDloB93dKtwupgt
   GRVW3zwYze43JMVbS49NsLAdVSNhZ6kYe/vlOJL9oUdjzzUWQj1AvtnTe
   8/1xp5XRHbFAd/pBo8E0fivf6Z1QIuUYcWZJ6VsPieICKhSz+l4rXqS2z
   g==;
X-CSE-ConnectionGUID: /ajebKCIQUmsslnn4P62FQ==
X-CSE-MsgGUID: 0IY4b/qFRe2cKx+bfYusUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82186749"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82186749"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:01:26 -0700
X-CSE-ConnectionGUID: pJgDCCnfS3ScllKPkgAsMg==
X-CSE-MsgGUID: DcvOtPMWTASL/PVIslygOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="246630360"
Received: from vpanait-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.41])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:01:24 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 4/7] i3c: mipi-i3c-hci: Tolerate i3c_master_add_i3c_dev_locked() failures in DAA
Date: Fri, 12 Jun 2026 11:01:04 +0300
Message-ID: <20260612080107.11606-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260612080107.11606-1-adrian.hunter@intel.com>
References: <20260612080107.11606-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_010134_287359_FFAEDFC1 
X-CRM114-Status: GOOD (  10.33  )
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

i3c_master_add_i3c_dev_locked() no longer leaves the address marked as
free on failure, so aborting the DAA sequence on its error is unnecessary.

Failure to register a discovered device does not invalidate the entire
Dynamic Address Assignment (DAA) procedure.  Align with the behavior of
other I3C master drivers by ignoring errors from
i3c_master_add_i3c_dev_locked() and continuing enumeration.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	None

Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	None


 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c | 4 +---
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
index 75d452d7f6af..3b9345718d27 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
@@ -358,9 +358,7 @@ static int hci_cmd_v1_daa(struct i3c_hci *hci)
 		 * TODO: Extend the subsystem layer to allow for registering
 		 * new device and provide BCR/DCR/PID at the same time.
 		 */
-		ret = i3c_master_add_i3c_dev_locked(&hci->master, next_addr);
-		if (ret)
-			break;
+		i3c_master_add_i3c_dev_locked(&hci->master, next_addr);
 	}
 
 	if (dat_idx >= 0)
diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
index 39eec26a363c..8d93748e858d 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
@@ -296,9 +296,7 @@ static int hci_cmd_v2_daa(struct i3c_hci *hci)
 		 * TODO: Extend the subsystem layer to allow for registering
 		 * new device and provide BCR/DCR/PID at the same time.
 		 */
-		ret = i3c_master_add_i3c_dev_locked(&hci->master, next_addr);
-		if (ret)
-			break;
+		i3c_master_add_i3c_dev_locked(&hci->master, next_addr);
 	}
 
 	hci_free_xfer(xfer, 2);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
