Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377D6CD8CB9
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Jun 2026 07:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmKKQtBUywk1ZCwBblp3w8M+kVxvTH3PQaXUOCKz1mg=; b=FmxeImEJiYODkB
	CiCUn+A7AZyof+LZhHxFIA561Gl3ZMQCpyuLRLJQ01un1kLUfLm3P/xdOBuxkMfEDf2bzIZJkYtsW
	eg8F2/j8spWi2GstQzjPqhfn9lAzWfaLnu3cS44XU24+PyLFkVnTgktVRbt6C/5JOfM7EIHuBGcZr
	TmT9ZaAEesaj9XMgzNk9rD9i2jOCRWqeQKcnYls+BWCLcOuSUCcg0tvL+6kD6xD41NXjbA5QcpM8v
	JwYT7flL7kEuQyPO1c338RtISwf2Lq5dw8tGnh9G/FymCIsW1c1pec8Glqn9aFj/DqQLo8pCHPAvs
	ZCvSb8DaDvU2yDt+CHCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDOR-00000006xVQ-42pS;
	Wed, 10 Jun 2026 07:30:31 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDOO-00000006xUH-36OT
	for linux-i3c@lists.infradead.org;
	Wed, 10 Jun 2026 07:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781076628; x=1812612628;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5eBs9mdqcoBy37Ne1LxATcEyfoSrgm4NfDJwLYCncEA=;
  b=eVJRgJvBYG3a3lrQMHQvgIkIO71JOlieZ8TjZoLkTttbOBV9+mXQAdPD
   xBJkJOib7MVvx9oGQwOCMU7FA+8YBwUGtDQckowB9ZzJYlWwCq4HtyIXD
   UGirFigDdg97j0UeIDZaVFK7sLHRd8oxML7WYOurNAdzpC4FxibkjpgtJ
   HqXssDQJhFyk378Jj5KrTwg5CKE8psfYRlPAqkW51C7Sd3t77DY+Vfje+
   D3FzrPDVcVlD7niyxpL5wT84Z2AGvrQSz1n5QlTyKArxSdxp2MHn3jcLs
   mGo9u6dH+YLXFdDY8xsE7Z/6S5IATGlAGzqHeY5G2FGRVu4eH8k4WYvw0
   g==;
X-CSE-ConnectionGUID: +nP47tMITr657O9SLH9BOg==
X-CSE-MsgGUID: km83tkhsSRKXDboFBIspMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="80878418"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="80878418"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 00:29:14 -0700
X-CSE-ConnectionGUID: m0EYzFSCRKWzhM+35usXzA==
X-CSE-MsgGUID: VSRUR3RiT329sxIJ7BN44Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="270103447"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.210])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 00:29:11 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 3/7] i3c: master: Prevent reuse of dynamic address on device add failure
Date: Wed, 10 Jun 2026 10:28:48 +0300
Message-ID: <20260610072852.36934-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260610072852.36934-1-adrian.hunter@intel.com>
References: <20260610072852.36934-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_003028_804356_AEC8170D 
X-CRM114-Status: GOOD (  15.21  )
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

Note, directly resetting the device's dynamic address is no longer
an option, since Direct RSTDAA was deprecated from I3C starting from
version 1.1 and v1.1 (or later) target devices are meant to NACK it.

Fixes: 3a379bbcea0af ("i3c: Add core I3C infrastructure")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V3:

	Add note to commit message about Direct RSTDAA deprecation

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
