Return-Path: <SRS0=QM85=XF=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33662C5AE5C
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Sep 2019 06:39:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0991720872
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Sep 2019 06:39:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GigcpnJj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MIlLrbgS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0991720872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t1dbrK1s5UE/ZBIM5LUgODDvJsY6g598jwKhMcp2Wyc=; b=GigcpnJjLA1olfenvMWMCM8NiC
	5bmn4WyBpgs50kYvnelYfOABX0hVJ3IZqJ1eCfY5j0tjfVCgsepla/aVTl+65H/ylJhacUNmGr4/L
	4/tkAA9sQUJFR5AJQYYdedF6sB5Sy67NLD1tb0wrStadys9Fji4IfeH8N0IoHOeoKI+a6LmFTdTMi
	VBnFRyr0eVqErCBak5azzDwY+em527PShP46y8r1TJ+3fzOlfB6vvgO2q4oPL/P42y9sL29T+tLFh
	yqRmNVkxzODi9Gq5QHaERkzY1UQT56NZcSh0m/8ZotEKZtCywhSyWosvAe3Z8p/O5F849Zo2jXHau
	n7hIdz3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7Zof-0006uA-Lz; Tue, 10 Sep 2019 06:39:53 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5oZQ-0007cG-Q3
 for linux-i3c@lists.infradead.org; Thu, 05 Sep 2019 10:00:54 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 47DFFC0DD6;
 Thu,  5 Sep 2019 10:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1567677651; bh=Ni9sjBFke5ST6exyzATqN84XzCCoj9ceZGLl4BFE4IY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=MIlLrbgSmKUQ05aYWhiOIFaTIOXKQm/drAB6X9hpRl+V3B4CPuBaGcv/fWmlMcdLi
 iyZCfvdyfk6AVxSNZ1qlC8Dji5jM9rMbWu2YsceW0Q8DvHtlckMTPzGk9JuufZG3J0
 oxGSUOZb4jtOnRulUBFS+MaqedwCqVfWFo+VRoltCTKUmI66dygQWGMfzZn9zy3uQB
 CjBHm3Es5P2CFlZf5rMYcLQmWOMNCmpmX8/zQomBTWKA5iojltBZmo1kCYLmOnMzkM
 rqr8aklEq+maiYWIipu/XoWHdNEayEA4ihb348I14qBzMZNdExjsgN/jrB28AqSA3n
 fV5AZoZEybQ1g==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 7B74CA005E;
 Thu,  5 Sep 2019 10:00:49 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 5E1AC3F3B5;
 Thu,  5 Sep 2019 12:00:49 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i3c@lists.infradead.org
Subject: [PATCH v3 2/5] i3c: master: make sure ->boardinfo is initialized in
 add_i3c_dev_locked()
Date: Thu,  5 Sep 2019 12:00:35 +0200
Message-Id: <ed18fd927b5759a6a1edb351113ceca615283189.1567608245.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567608245.git.vitor.soares@synopsys.com>
References: <cover.1567608245.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1567608245.git.vitor.soares@synopsys.com>
References: <cover.1567608245.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_030052_856949_E0598CCF 
X-CRM114-Status: GOOD (  13.42  )
X-Mailman-Approved-At: Mon, 09 Sep 2019 23:39:51 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, Joao.Pinto@synopsys.com, bbrezillon@kernel.org,
 stable@vger.kernel.org, Vitor Soares <Vitor.Soares@synopsys.com>,
 pgaj@cadence.com, robh+dt@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The newdev->boardinfo assignment was missing in
i3c_master_add_i3c_dev_locked() and hence the ->of_node info isn't
propagated to i3c_dev_desc.

Fix this by trying to initialize device i3c_dev_boardinfo if available.

Cc: <stable@vger.kernel.org>
Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
Change in v3:
  - None

Changes in v2:
  - Change commit message
  - Change i3c_master_search_i3c_boardinfo(newdev) to
  i3c_master_init_i3c_dev_boardinfo(newdev)
  - Add fixes, stable tags

 drivers/i3c/master.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 586e34f..9fb99bc 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1798,6 +1798,22 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
 	return NULL;
 }
 
+static void i3c_master_init_i3c_dev_boardinfo(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *master = i3c_dev_get_master(dev);
+	struct i3c_dev_boardinfo *boardinfo;
+
+	if (dev->boardinfo)
+		return;
+
+	list_for_each_entry(boardinfo, &master->boardinfo.i3c, node) {
+		if (dev->info.pid == boardinfo->pid) {
+			dev->boardinfo = boardinfo;
+			return;
+		}
+	}
+}
+
 /**
  * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
  * @master: master used to send frames on the bus
@@ -1818,8 +1834,9 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 				  u8 addr)
 {
 	struct i3c_device_info info = { .dyn_addr = addr };
-	struct i3c_dev_desc *newdev, *olddev;
 	u8 old_dyn_addr = addr, expected_dyn_addr;
+	enum i3c_addr_slot_status addrstatus;
+	struct i3c_dev_desc *newdev, *olddev;
 	struct i3c_ibi_setup ibireq = { };
 	bool enable_ibi = false;
 	int ret;
@@ -1878,6 +1895,8 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 	if (ret)
 		goto err_detach_dev;
 
+	i3c_master_init_i3c_dev_boardinfo(newdev);
+
 	/*
 	 * Depending on our previous state, the expected dynamic address might
 	 * differ:
@@ -1895,7 +1914,11 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 	else
 		expected_dyn_addr = newdev->info.dyn_addr;
 
-	if (newdev->info.dyn_addr != expected_dyn_addr) {
+	addrstatus = i3c_bus_get_addr_slot_status(&master->bus,
+						  expected_dyn_addr);
+
+	if (newdev->info.dyn_addr != expected_dyn_addr &&
+	    addrstatus == I3C_ADDR_SLOT_FREE) {
 		/*
 		 * Try to apply the expected dynamic address. If it fails, keep
 		 * the address assigned by the master.
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
