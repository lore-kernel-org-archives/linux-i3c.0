Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EB6C27C6E
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Jun 2024 14:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MQ9V57rA+2GTtEJn+PuQishy2wj6D/mzvt2Z3F92m2Q=; b=CHYaXxvP1tfKUm
	KCO3miIWZ4ky2/HK4bTj0mOln+2+Ix1PlnTKym+bZ6tpLGNyV99nzUO+I9ThlMbTMdMSUonopUQoC
	pBjvFNnBMIeivz8KSd7zVagpuKfKioDciim9OVmaVr9SMLBc2DzcAyp0OmMJZcLEbzbbRVyiD2YLg
	i5QgXf4HE/ueilH/c5yrc4GhLcLdjO5miV6fBKVypu/z/9I9mDMEb86Ur1jbQfvxwMoqbDmHG3VQc
	B8mdPL0SjAx5O69hUx/tGgu7nCxMbpJ+W9bFgpYbvU575nGwYiJWbG4jqLdWmV3EsjGDUBCY82wQC
	FDkKSzEuopa4fi3JheKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7Vc-00000002x92-2386;
	Fri, 14 Jun 2024 14:02:28 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7VZ-00000002x78-1cly
	for linux-i3c@lists.infradead.org;
	Fri, 14 Jun 2024 14:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718373746; x=1749909746;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s6xRNmCCbSgnBkdiDlasSc+/0KaX3EhVizmJHdtpVZs=;
  b=LPMvBqYX6p1ajQRPmX6acTpON+DjL9MhPpZqCp5TkOw4Bjt7i1kL0K/a
   EEUo/orQMsfSF84+nXGYHDhxxKYgoV7wBO7Zd1rcKg8W5OmnxhGDe4KzU
   GRu3xlwtytmJxRAFE0+wYSsCGAI7KyLm3pvN3sGLrXtLtfKaXzuTEmV7H
   VH5I2Y4oK3Ws51e+s8x1YzV+Xq6V7bn6B8sDsOBJmdIZOIFbYHRkuR1xZ
   ZxkZ9UhpgXDp7qk6fliVMGhVKkoE38xzW1Q7QeT3ewTv06V+YwwEtoJUK
   vTU4XKhOBIPId1nc3Su8QZsyfeQJQJYJ9Ni240LLt1TYTncCl5Cn2vJzi
   Q==;
X-CSE-ConnectionGUID: o6nsDnbiQSuzqUjHSPRiMg==
X-CSE-MsgGUID: Wj56kC/LSB2WF5FTaW4z9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15040034"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="15040034"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 07:02:15 -0700
X-CSE-ConnectionGUID: Ggwpxcd2T86SJqIhiQgj8w==
X-CSE-MsgGUID: uA3qFTeERPeyE9d6Q1Egiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="45622567"
Received: from ehlflashnuc2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.57])
  by orviesa004.jf.intel.com with ESMTP; 14 Jun 2024 07:02:14 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	stable@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i3c: mipi-i3c-hci: Fix number of DAT/DCT entries for HCI versions < 1.1
Date: Fri, 14 Jun 2024 17:02:08 +0300
Message-ID: <20240614140208.1100914-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_070225_575394_5626B499 
X-CRM114-Status: GOOD (  10.34  )
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
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index faf723a0c739..0ff3055b8e78 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -646,6 +646,7 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 static int i3c_hci_init(struct i3c_hci *hci)
 {
 	u32 regval, offset;
+	bool size_in_dwords;
 	int ret;
 
 	/* Validate HCI hardware version */
@@ -670,11 +671,16 @@ static int i3c_hci_init(struct i3c_hci *hci)
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
 
@@ -683,6 +689,8 @@ static int i3c_hci_init(struct i3c_hci *hci)
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
