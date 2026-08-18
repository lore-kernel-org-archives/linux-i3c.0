Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9DEC5DF7E
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Aug 2026 10:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQc2BqKiY5D28Mqp0KrGho9RYexOqnE9o7Y99Cz1QXE=; b=22Xh3ztGwN+kA8
	Ijy5Lw4cLY8ZdWigcsiZxA+NpUoeF3ij7o/lA/sXql2s4mrBsd4toG2JKHh6KQj2/sJBLJWzgqQZo
	63WxV/6sNtv0N3DPdxBtHY8eQ2MeWRAKczGBQItGkrCKkgEX0iatBrbKQeEDaNZqhs2oP33gEKtjY
	5mvSooaSeHgbLr201vburrHXwDYYKmHzUwKuoizafhECIe2obvQLUeCHdAD0YJakBTYmVIstgIIq4
	15KXrCRWQwa0S0OM0kv4P9FcCY+7zaxs3jZGKe7WXsK5R6dZOoOLIYBvSQxAKOPg9wkrC+cclO/ZZ
	ErZBrxJHexBgenGX8wrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHGa-00000007lcB-02EK;
	Tue, 18 Aug 2026 10:42:00 +0000
Received: from ms.asus.com ([103.10.4.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHGX-00000007laX-0k4F
	for linux-i3c@lists.infradead.org;
	Tue, 18 Aug 2026 10:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asmedia.com.tw; i=@asmedia.com.tw; q=dns/txt;
  s=asmediacomtw; t=1787049718; x=1818585718;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r1hukYTpBAhlQXjTqHSzx2crMUIXV42JqW4ErYvsJhs=;
  b=RKMRipkd9Uk16sHShWyyiBmRpokRgyvZGBFGpUrDKRgPVfm0AFaf1TG9
   2btE7QWU6Or73EmJQdyrSvk4djtmCCSwYV2ys8tN3oWkd0ChHQ0tiEACq
   b7tWovirdIsndDKpI2+bRKLO8z1UDDwF70OnSbo2wr0LVmWAkhErwlOkF
   g=;
X-CSE-ConnectionGUID: 9QdRliB7QlS1cvBVTxzFCg==
X-CSE-MsgGUID: 34fqJwzgScip2n42eMyu6w==
Received: from unknown (HELO APZA006TMD.corpnet.asus) ([172.22.47.66])
  by ms.asus.com with ESMTP; 18 Aug 2026 18:41:51 +0800
Received: from mymail.asus.com (42.79.21.38) by APZA006TMD.corpnet.asus
 (172.22.47.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 18 Aug
 2026 18:41:49 +0800
From: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
To: <alexandre.belloni@bootlin.com>
CC: <Frank.Li@nxp.com>, <adrian.hunter@intel.com>,
	<jarkko.nikula@linux.intel.com>, <boris.brezillon@collabora.com>,
	<linux-i3c@lists.infradead.org>, <Jm_Liao@asmedia.com.tw>,
	<Patrick_Yen@asmedia.com.tw>, <Chloe_Chen@asmedia.com.tw>,
	<Yd_Tseng@asmedia.com.tw>
Subject: [PATCH v4 1/3] i3c: mipi-i3c-hci: Fix missing STAT_IBI_STATUS_THLD in PIO mode
Date: Tue, 18 Aug 2026 18:41:04 +0800
Message-ID: <20260818104106.763772-2-Jm_Liao@asmedia.com.tw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818104106.763772-1-Jm_Liao@asmedia.com.tw>
References: <20260818104106.763772-1-Jm_Liao@asmedia.com.tw>
MIME-Version: 1.0
X-Originating-IP: [42.79.21.38]
X-ClientProxiedBy: APZA001EXB.corpnet.asus (172.22.6.13) To
 APZA006TMD.corpnet.asus (172.22.47.66)
X-TM-AS-Product-Ver: SMEX-14.0.0.3239-9.1.2019-30140.006
X-TM-AS-Result: No-10--8.552600-8.000000
X-TMASE-MatchedRID: F/FIGPscYWXLULYDu+Fb7J0UyaWO1QCnJbzZuwLx+4VsKxodnCpGd6U2
	U/OoCvowScHjRvxSElWzbl+VPQZlQw/qdKL6q1thquZVB+P8J0ZR3UkpERYmZPsFqaKfjkncE5d
	/5oQRCFL2KV//ZhZIP3ZbKubOxSU95gSSltqdMe4ZD7bjq+6lMGzY00haS8QoYcKx85MjSJVz3h
	/NOzc2C33XOw7xn4JjrenqZh8kT1zwKwep2yrWF9h5c4TN8zbZXO2SJ/uvWJVyKUQT4+N7z1XOq
	MYNeYhmthRFAcCnfMpb+mAWJViEhQB+LdKdm6AqGsvMcdPBBzNr0/W4hjWmJRNRe6x9srT3
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.552600-8.000000
X-TMASE-Version: SMEX-14.0.0.3239-9.1.2019-30140.006
X-TM-SNTS-SMTP: 61096335489586118A2D8ABA2F6E474C01599166C0187E225BD5E05B8AA16D942000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_034157_542260_AC2BADF0 
X-CRM114-Status: UNSURE (   9.79  )
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

In PIO mode initialization, STAT_IBI_STATUS_THLD was missing from
pio->enabled_irqs. As a result, the host controller interrupt signal for
IBI threshold was never enabled when transfer starts, preventing IBI
status descriptors from being properly processed in PIO mode.

Include STAT_IBI_STATUS_THLD in pio->enabled_irqs so that the IBI
threshold interrupt is activated alongside error interrupts upon the first
transfer.

Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
Co-developed-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
Signed-off-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
v4:
 - Added Reviewed-by: Frank Li <Frank.Li@nxp.com> (received on v3).
 - No content changes otherwise. Resent to fix From:/Signed-off-by:
   address mismatch caused by mail relay configuration (Frank).
v3:
 - Added Fixes tag (Adrian).
 - Updated commit message and code comment to accurately reflect that
   STAT_IBI_STATUS_THLD is activated on the first transfer (Adrian).
 - Aligned From: and Signed-off-by: email addresses (Adrian).
v2:
 - Removed "Hot-Join" references from the commit message and comments,
   as the change focuses strictly on enabling STAT_IBI_STATUS_THLD
   for general IBI reception per HCI spec.
   
 drivers/i3c/master/mipi-i3c-hci/pio.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index ff2657ee220b..a1341d66bc65 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -185,8 +185,11 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
 	pio_reg_write(INTR_SIGNAL_ENABLE, 0x0);
 	pio_reg_write(INTR_STATUS_ENABLE, 0xffffffff);
 
-	/* Always accept error interrupts (will be activated on first xfer) */
-	pio->enabled_irqs = STAT_ALL_ERRORS;
+	/*
+	 * Always accept error interrupts and IBI threshold interrupt
+	 * (will be activated on first xfer).
+	 */
+	pio->enabled_irqs = STAT_ALL_ERRORS | STAT_IBI_STATUS_THLD;
 }
 
 static void hci_pio_suspend(struct i3c_hci *hci)
-- 
2.43.0

==================================================================================================================
This email and any attachments to it contain confidential information and are intended solely for the use of the individual to whom it 
is addressed.If you are not the intended recipient or receive it accidentally, please immediately notify the sender by e-mail and delete 
the message and any attachments from your computer system, and destroy all hard copies. If any, please be advised that any unauthorized 
disclosure, copying, distribution or any action taken or omitted in reliance on this, is illegal and prohibited. Furthermore, any views 
or opinions expressed are solely those of the author and do not represent those of ASMedia Technology Inc. Thank you for your cooperation.
==================================================================================================================
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
