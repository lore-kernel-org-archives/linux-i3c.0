Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3C7C27C79
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Jun 2024 11:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MzXEH2ohNA79k6SBoAdKR1ygxyS/xCO7kt0XaHR1Rkk=; b=gy9V8IMccvW1mj
	TCaCWD1gA3LmVvuc4vDA5AiTl6Q4kt7WmyoOjOrjkq/x00K3uwgBtQ6vIJDNGrI8FYkVSJdtwDtdx
	4BEnfJm90HfeglYeK7SwH64TGD4bmFThOITrMmLoJHvWEAl3AinXdToVmsgMu/KuR0B9TXlfqbHx7
	o1G1Kdx10xnO1a/N45oeSBYyINVfJ4xNVY4/8kdU2Rel4CVuKc71gzSqVe6ZgryoYMILxEQYsHoUs
	+QliNjlHeKCaLTxzt1DUa0xtvUI8AUhAbmK91zJcFEqEc4ZYRD9EzLYwsqnN98JD56pa3P+dIokOW
	I6HD3lCfMZG7NUsPhYRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJAbd-0000000AV2m-0ij0;
	Mon, 17 Jun 2024 11:33:01 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJAba-0000000AV1q-2N9O
	for linux-i3c@lists.infradead.org;
	Mon, 17 Jun 2024 11:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718623979; x=1750159979;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Um1unrEpih4RsdNp/FkQUuZ18mOrO0zcEBS1C4T9egQ=;
  b=jDRxxbHaMK4qZVqWWrooEInhbBCudXNNszTBKEe9pNp1LLbg1b5wqci8
   fvJG5pvCtundXiFGL/DQxuNIOF38nCtvzJIGPbNWpHCTmYEXjYOzg8BZx
   bvkftVc9tRtle84HsyE02QEWz9xqbIJLHdAfg8ovrfoRDs7aeKQTRgXAT
   Dn2AnA0wxPl6P1hPzFRGO8xwl3tr8UOCGFC3K4r7uJrg95W6VBA6MkwOg
   Rq/PnaaaUWqxkCPEnwcv4Rbz0G7QzGrlEYdyWWmL9re23N54ChMGgqitT
   ob3LfQPX963g+1G6VtDqJXaWgxRW86tiaIQQ8+cAui3BCqcue9ImQQzQK
   w==;
X-CSE-ConnectionGUID: Cza3/PEYSmyKhH/Z9H4yTQ==
X-CSE-MsgGUID: OtH0PUPuSHW6Q40OPjFBIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="40857574"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="40857574"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 04:32:58 -0700
X-CSE-ConnectionGUID: ny2rQ4Y7QauXrj9Aba8Tpw==
X-CSE-MsgGUID: iMA1W/G1QQqIB8TaJf0K/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="45534347"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jun 2024 04:32:56 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] i3c: mipi-i3c-hci: Fix number of DAT/DCT entries for HCI versions < 1.1
Date: Mon, 17 Jun 2024 14:32:51 +0300
Message-ID: <20240617113251.1159534-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_043258_677643_EF7BBFD2 
X-CRM114-Status: GOOD (  10.42  )
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

I was wrong about the TABLE_SIZE field description in the
commit 0676bfebf576 ("i3c: mipi-i3c-hci: Fix DAT/DCT entry sizes").

For the MIPI I3C HCI versions 1.0 and earlier the TABLE_SIZE field in
the registers DAT_SECTION_OFFSET and DCT_SECTION_OFFSET is indeed defined
in DWORDs and not number of entries like it is defined in later versions.

Where above fix allowed driver initialization to continue the wrongly
interpreted TABLE_SIZE field leads variables DAT_entries being twice and
DCT_entries four times as big as they really are.

That in turn leads clearing the DAT table over the boundary in the
dat_v1.c: hci_dat_v1_init().

So interprete the TABLE_SIZE field in DWORDs for HCI versions < 1.1 and
fix number of DAT/DCT entries accordingly.

Fixes: 0676bfebf576 ("i3c: mipi-i3c-hci: Fix DAT/DCT entry sizes")
Cc: <stable@vger.kernel.org>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
v2: Added Cc: stable tag which I forgot in v1.
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index d7e966a25583..4e7d6a43ee9b 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -631,6 +631,7 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 static int i3c_hci_init(struct i3c_hci *hci)
 {
 	u32 regval, offset;
+	bool size_in_dwords;
 	int ret;
 
 	/* Validate HCI hardware version */
@@ -654,11 +655,16 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	hci->caps = reg_read(HC_CAPABILITIES);
 	DBG("caps = %#x", hci->caps);
 
+	size_in_dwords = hci->version_major < 1 ||
+			 (hci->version_major == 1 && hci->version_minor < 1);
+
 	regval = reg_read(DAT_SECTION);
 	offset = FIELD_GET(DAT_TABLE_OFFSET, regval);
 	hci->DAT_regs = offset ? hci->base_regs + offset : NULL;
 	hci->DAT_entries = FIELD_GET(DAT_TABLE_SIZE, regval);
 	hci->DAT_entry_size = FIELD_GET(DAT_ENTRY_SIZE, regval) ? 0 : 8;
+	if (size_in_dwords)
+		hci->DAT_entries = 4 * hci->DAT_entries / hci->DAT_entry_size;
 	dev_info(&hci->master.dev, "DAT: %u %u-bytes entries at offset %#x\n",
 		 hci->DAT_entries, hci->DAT_entry_size, offset);
 
@@ -667,6 +673,8 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	hci->DCT_regs = offset ? hci->base_regs + offset : NULL;
 	hci->DCT_entries = FIELD_GET(DCT_TABLE_SIZE, regval);
 	hci->DCT_entry_size = FIELD_GET(DCT_ENTRY_SIZE, regval) ? 0 : 16;
+	if (size_in_dwords)
+		hci->DCT_entries = 4 * hci->DCT_entries / hci->DCT_entry_size;
 	dev_info(&hci->master.dev, "DCT: %u %u-bytes entries at offset %#x\n",
 		 hci->DCT_entries, hci->DCT_entry_size, offset);
 
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
