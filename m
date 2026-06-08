Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E5DCD8C92
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 07:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PrQ0AsiudVAC0yQBn26aIi0/R1y6cWFFOkDkdoxSDek=; b=qojsvhb1HWSanV
	fZ2lmedOfFWiLdSOZVmLtCETQuOkuNXsHWK1qYbcinVR+P3IKiH7y2uFCHSUmyh9a7JB4Hh6TG30p
	sXBswVP2w6DWwbhQev7B0zbF8giCEaZBxC4tyc5DR4lEzJH9E9xZ+CTkEJe3RQ0jOHr1UUCfriqLd
	skCh6tAql2w31ZtqUdCooZbVcyxmHj6eojkwiIFQIfbzkxOXW0RH+X3M4c+X0m4HNSBsXL9vRQqIt
	UvuY3UeM0uxvuEh069NOqgsFHeY7T3YGPSR6+md2EuUF8EJXh/Q3+tCIQEHLOkG2qJtuxaqbxP6k4
	7wkDsgmXcY8naO8PoDMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUsR-000000031TM-3BYo;
	Mon, 08 Jun 2026 07:58:31 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUsP-000000031Rq-1zlR
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 07:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780905510; x=1812441510;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TroHJn8S3OibCjpk35ZIgDkqpK8FwCd59x0jWgKNUYE=;
  b=VqF/G7LglHU7gb0KmsjujcAMpSft/W1XoWcY4538ueS1YF1+frUBtn5+
   VxsBqGOage9P29GW1DGQhK5mttbbwm6ztfivahpl4l/IVBN/vbPp7DOYh
   bopBwDCeJSYFb8n5iEWzXys16YCXyGC9M/+5kb0MxKVcL4GaI0SgZOAD1
   EfCTyaHk4wwNR2dVLKmbHfLNRDW29/t4WEYg1WnIFZFB2L+Q9AKB57Y/a
   4Xf9F57xcpX0Hyclp/uUUFUzC0fYIPgBI+dGPh6sJvb/xzEuAStGP3+JJ
   PqUA348/8iDmLmnswdH/1vXMi4aAR6ZqcbzBrSQvR+nXAujO/J5IJnmls
   Q==;
X-CSE-ConnectionGUID: TRVuQO9eQBqlUmB85JHyPA==
X-CSE-MsgGUID: gGx6gz2fSgaR2v5VpJkf9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="85520162"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="85520162"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 00:58:30 -0700
X-CSE-ConnectionGUID: jJj8fnRsRfOsu66UFsd5gQ==
X-CSE-MsgGUID: HPwtSjkLSkWPhjXQfG0/IQ==
X-ExtLoop1: 1
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.114])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 00:58:28 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 3/7] i3c: master: Prevent reuse of dynamic address on device add failure
Date: Mon,  8 Jun 2026 10:57:56 +0300
Message-ID: <20260608075801.16111-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260608075801.16111-1-adrian.hunter@intel.com>
References: <20260608075801.16111-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_005829_558549_7AB8C23F 
X-CRM114-Status: GOOD (  14.15  )
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

i3c_master_add_i3c_dev_locked() is called after a device has already
been assigned a dynamic address.  If the function fails, the address
remains marked as free and may be reallocated to another device,
leading to address conflicts on the bus.

Ensure the address is not marked as free on failure, by updating the
address slot state to prevent the address from being re-used.

Emit an error message to inform of the failure.

Opportunistically remove the !master check because it is impossible.

Fixes: 3a379bbcea0af ("i3c: Add core I3C infrastructure")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	Fix 'if (IS_ERR(newdev)' error path.
	Be defensive and do not change the addr_slot_status if it is not
	free, and update commit message accordingly.
	Amend commit message to note removal of unnecesary 'if (!master)'
	check.
	Add Fixes tag.


 drivers/i3c/master.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index f87bf0099d3c..7b60b0c7f646 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2345,12 +2345,11 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 	bool enable_ibi = false;
 	int ret;
 
-	if (!master)
-		return -EINVAL;
-
 	newdev = i3c_master_alloc_i3c_dev(master, &info);
-	if (IS_ERR(newdev))
-		return PTR_ERR(newdev);
+	if (IS_ERR(newdev)) {
+		ret = PTR_ERR(newdev);
+		goto err_prevent_addr_reuse;
+	}
 
 	ret = i3c_master_attach_i3c_dev(master, newdev);
 	if (ret)
@@ -2472,6 +2471,16 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 err_free_dev:
 	i3c_master_free_i3c_dev(newdev);
 
+err_prevent_addr_reuse:
+	/*
+	 * Although the device has not been added, the address has been
+	 * assigned. Prevent the address from being used again.
+	 */
+	if (i3c_bus_get_addr_slot_status(&master->bus, addr) == I3C_ADDR_SLOT_FREE)
+		i3c_bus_set_addr_slot_status(&master->bus, addr, I3C_ADDR_SLOT_I3C_DEV);
+
+	dev_err(&master->dev, "Failed to add I3C device at address %u, error %d\n", addr, ret);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
