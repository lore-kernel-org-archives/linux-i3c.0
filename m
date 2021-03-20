Return-Path: <SRS0=AFd6=JV=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3847BC433ED
	for <linux-i3c@archiver.kernel.org>; Sat, 24 Apr 2021 20:15:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 645FC61406
	for <linux-i3c@archiver.kernel.org>; Sat, 24 Apr 2021 20:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 645FC61406
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TNmAM/R1sORKO1L5b4S25vObn8qmNvjH3l/keSpzP7o=; b=HOK0EPCrj3zti3bsXNGeEVm1e0
	wqZxC/EKWWZt4I81057iO5gLLK9pblT3p21hMumjbyM2G08eb5MyyYG6FK28wsoLPdEmkV/fQn71B
	ol0N7PlmFxDhk1oQC8GFM4L2Gyyq/5X8+n6qmz0X1ZVJ7y3+izevoD8jlAW7Ob4wdRyJ+G91GRBOK
	mpfjSQx8lVihjc7rTvSj2uxdqY69k9KgPbW9uGDWuAMpMhFDiNMLmiOy5a8KIDz/UxWWKjn5Lczgz
	+QRjJJ8JpbFIPqntPR6kOAT+rEzq/B4LBlVav+PdByYhD1sTR84KZc2KZjv2LDGXZ+6WznZJCuxIl
	88k0KteA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laOge-004MsD-DK; Sat, 24 Apr 2021 20:15:32 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNOt8-008KYU-By
 for linux-i3c@lists.infradead.org; Fri, 19 Mar 2021 23:50:44 +0000
IronPort-SDR: vfgL8a4YAsX2LUaWLlsV3G9J51UxK4pCRamAHyoGtTcto9gH/c+z7BWa7rPS8LX8YP/6BNZOzj
 ehZ8QnvujsSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="253989402"
X-IronPort-AV: E=Sophos;i="5.81,263,1610438400"; d="scan'208";a="253989402"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 16:50:34 -0700
IronPort-SDR: 069xrTn+2P98SOZ4ZiWV31GZCNeJM8Hw7OOZIMpxroY3SaebklP+ukYVuoWO3phXcrkX2KsGFb
 aXSUsC1O1Efw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,263,1610438400"; d="scan'208";a="389807593"
Received: from maru.jf.intel.com ([10.54.51.77])
 by orsmga002.jf.intel.com with ESMTP; 19 Mar 2021 16:50:10 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-i3c@lists.infradead.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH] Revert "i3c master: fix missing destroy_workqueue() on error
 in i3c_master_register"
Date: Fri, 19 Mar 2021 17:03:29 -0700
Message-Id: <20210320000329.13809-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_235042_849554_EE51112D 
X-CRM114-Status: GOOD (  10.16  )
X-Mailman-Approved-At: Sat, 24 Apr 2021 21:15:22 +0100
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Adding the destroy_workqueue call in i3c_master_register introduced below
kernel warning because it makes duplicate destroy_workqueue calls when
i3c_master_register fails after allocating the workqueue. The workqueue will
be destroyed by i3c_masterdev_release which is called by put_device at the
end of the i3c_master_register function eventually in failure cases so the
workqueue doesn't need to be destroyed in i3c_master_register.

[    6.972952] WARNING: CPU: 1 PID: 1 at lib/list_debug.c:48 __list_del_entry_valid+0x9c/0xf4
[    6.982205] list_del corruption, 8fe03c08->prev is LIST_POISON2 (00000122)
[    6.989910] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W         5.10.23-c12838a-dirty-31dc772 #1
[    7.000295] Hardware name: Generic DT based system
[    7.005638] Backtrace:
[    7.008369] [<809133f0>] (dump_backtrace) from [<80913644>] (show_stack+0x20/0x24)
[    7.016819]  r7:00000030 r6:60000013 r5:00000000 r4:813b5d40
[    7.023137] [<80913624>] (show_stack) from [<8091e1a0>] (dump_stack+0x9c/0xb0)
[    7.031201] [<8091e104>] (dump_stack) from [<8011fa30>] (__warn+0xf8/0x154)
[    7.038972]  r7:00000030 r6:00000009 r5:804fa1c8 r4:80b6eca4
[    7.045289] [<8011f938>] (__warn) from [<80913d14>] (warn_slowpath_fmt+0x8c/0xc0)
[    7.053641]  r7:00000030 r6:80b6eca4 r5:80b6ed74 r4:818cc000
[    7.059960] [<80913c8c>] (warn_slowpath_fmt) from [<804fa1c8>] (__list_del_entry_valid+0x9c/0xf4)
[    7.069866]  r9:96becf8c r8:818cc000 r7:8fe03c10 r6:8fe03c00 r5:8fe03ba0 r4:ff7ead4c
[    7.078513] [<804fa12c>] (__list_del_entry_valid) from [<8013f0b4>] (destroy_workqueue+0x1c4/0x23c)
[    7.088615] [<8013eef0>] (destroy_workqueue) from [<806aa124>] (i3c_masterdev_release+0x40/0xb0)
[    7.098421]  r7:00000000 r6:81a43b80 r5:8fe65360 r4:8fe65048
[    7.104740] [<806aa0e4>] (i3c_masterdev_release) from [<805f3f04>] (device_release+0x40/0xb0)
[    7.114254]  r5:00000000 r4:8fe65048
[    7.118245] [<805f3ec4>] (device_release) from [<808fe754>] (kobject_put+0xc8/0x204)
[    7.126885]  r5:813978dc r4:8fe65048
[    7.130877] [<808fe68c>] (kobject_put) from [<805f5fbc>] (put_device+0x20/0x24)
[    7.139037]  r7:8fe65358 r6:8fe65368 r5:8fe65358 r4:8fe65048
[    7.145355] [<805f5f9c>] (put_device) from [<806abac4>] (i3c_master_register+0x338/0xb00)
[    7.154487] [<806ab78c>] (i3c_master_register) from [<806ae084>] (dw_i3c_probe+0x224/0x24c)
[    7.163811]  r10:00000000 r9:8fe7a100 r8:00000032 r7:819fa810 r6:819fa800 r5:8fe65040
[    7.172547]  r4:00000000
[    7.175376] [<806ade60>] (dw_i3c_probe) from [<805fdc14>] (platform_drv_probe+0x44/0x80)
[    7.184409]  r9:813a25c0 r8:00000000 r7:815ec114 r6:00000000 r5:813a25c0 r4:819fa810
[    7.193053] [<805fdbd0>] (platform_drv_probe) from [<805fb83c>] (really_probe+0x108/0x50c)
[    7.202275]  r5:815ec004 r4:819fa810
[    7.206265] [<805fb734>] (really_probe) from [<805fc180>] (driver_probe_device+0xb4/0x190)
[    7.215492]  r10:813dc000 r9:80c4385c r8:000000d9 r7:813a25c0 r6:819fa810 r5:00000000
[    7.224228]  r4:813a25c0
[    7.227055] [<805fc0cc>] (driver_probe_device) from [<805fc5cc>] (device_driver_attach+0xb8/0xc0)
[    7.236959]  r9:80c4385c r8:000000d9 r7:813a25c0 r6:819fa854 r4:819fa810
[    7.244439] [<805fc514>] (device_driver_attach) from [<805fc65c>] (__driver_attach+0x88/0x16c)
[    7.254051]  r7:00000000 r6:819fa810 r5:00000000 r4:813a25c0
[    7.260369] [<805fc5d4>] (__driver_attach) from [<805f954c>] (bus_for_each_dev+0x88/0xc8)
[    7.269489]  r7:00000000 r6:818cc000 r5:805fc5d4 r4:813a25c0
[    7.275806] [<805f94c4>] (bus_for_each_dev) from [<805fc76c>] (driver_attach+0x2c/0x30)
[    7.284739]  r7:81397c98 r6:00000000 r5:8fe7db80 r4:813a25c0
[    7.291057] [<805fc740>] (driver_attach) from [<805f9eec>] (bus_add_driver+0x120/0x200)
[    7.299984] [<805f9dcc>] (bus_add_driver) from [<805fce44>] (driver_register+0x98/0x128)
[    7.309005]  r7:80c4383c r6:00000000 r5:00000000 r4:813a25c0
[    7.315323] [<805fcdac>] (driver_register) from [<805fedb4>] (__platform_driver_register+0x50/0x58)
[    7.325410]  r5:818cc000 r4:81397c98
[    7.329404] [<805fed64>] (__platform_driver_register) from [<80c23398>] (dw_i3c_driver_init+0x24/0x28)
[    7.339790]  r5:818cc000 r4:80c23374
[    7.343784] [<80c23374>] (dw_i3c_driver_init) from [<80c01300>] (do_one_initcall+0xac/0x1d0)
[    7.353206] [<80c01254>] (do_one_initcall) from [<80c01630>] (kernel_init_freeable+0x1a8/0x204)
[    7.362916]  r8:000000d9 r7:80c4383c r6:00000007 r5:819ca2c0 r4:80c67680
[    7.370398] [<80c01488>] (kernel_init_freeable) from [<8091eb18>] (kernel_init+0x18/0x12c)
[    7.379616]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:8091eb00
[    7.388343]  r4:00000000
[    7.391170] [<8091eb00>] (kernel_init) from [<80100148>] (ret_from_fork+0x14/0x2c)
[    7.399607] Exception stack(0x818cdfb0 to 0x818cdff8)
[    7.405243] dfa0:                                     00000000 00000000 00000000 00000000
[    7.414371] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    7.423499] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    7.430879]  r5:8091eb00 r4:00000000

This reverts commit 59165d16c699182b86b5c65181013f1fd88feb62.

Fixes: 59165d16c699 ("i3c master: fix missing destroy_workqueue() on error in i3c_master_register")
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/i3c/master.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index f8e9b7305c13..e2e12a5585e5 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2535,7 +2535,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 
 	ret = i3c_master_bus_init(master);
 	if (ret)
-		goto err_destroy_wq;
+		goto err_put_dev;
 
 	ret = device_add(&master->dev);
 	if (ret)
@@ -2566,9 +2566,6 @@ int i3c_master_register(struct i3c_master_controller *master,
 err_cleanup_bus:
 	i3c_master_bus_cleanup(master);
 
-err_destroy_wq:
-	destroy_workqueue(master->wq);
-
 err_put_dev:
 	put_device(&master->dev);
 
-- 
2.17.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
