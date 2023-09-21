Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5D9CD495B
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Sep 2023 05:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+h6BLFocXQk+1R261HXVd+um8MKMEu/Ck0qqK1GhZiA=; b=NjALeyio1IuT9N
	y+3SjzhQ8S8Oh+kimW1YLXiUO0IrxK0RXp/xq3mxLD+VqjyLPRCvSP4fbuZ+Dj2/XjXQDDUiTUx25
	79Ng6Fcmx+bJuQZ2ZX7yqgd8UPurtmD296qmpFSZTtkNyvAFvO9XCY/cpK4Ir2vU7xvyR9OmauhGC
	0bfeztmrH1aKWG/m/7OBsw5WIIGlpJCQ+p1eUe3FJEIr6kTQOLqJCPB4WS0V7nf8s+EDhjNA+/sHh
	RFYrSzSXBZgQUR5NNc55q4Rv5Aaxpl1Z2ndM7BflJiVcSkTcnScC3WAHYFB1R6YgOz6EEhDiSMaKV
	6nC2/+3OyZ6NLvuAFNTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChY-005DvY-0f;
	Thu, 21 Sep 2023 05:58:12 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChU-005Dqh-2T
	for linux-i3c@lists.infradead.org;
	Thu, 21 Sep 2023 05:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695275888; x=1726811888;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sHwG0LRCGJTQwEECNZVlE5NOiPMorvt1Jj23oTd57hU=;
  b=O0KMnYI6vbQ37mBkw6qsoN9iLMrqwp/WZcu/MFuvPPrcT7kvgYEKbwVB
   emHbh79AA8Zoe9UI9edpH26VestZXnlyXj1sHhu4HIbdmaJ34L8ZXWsPl
   NhDrf6P5UZAb4ppnSs2lU6psKz0qghcqvo9caoRVU+NbVQZYav0q8q+wt
   +KKZXRYROGwpX+wwuhvY0HLbvGVqpW4mgzED3Oixd9jNaNRuB57D0NFyJ
   zCgM6Dx4uZYRcJKD+IzhhbgQPBfc3Z5t8DbGgM29UVXojf/ICF6PJkv5i
   sKHRrwWNZNZPe5iHdol9vydxIvy1oTM1Ic3NZGbn9/hJkZpPzpVgqQDQx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360678491"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="360678491"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 22:58:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077771257"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="1077771257"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.152])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2023 22:57:56 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 03/12] i3c: mipi-i3c-hci: Fix DAT/DCT entry sizes
Date: Thu, 21 Sep 2023 08:56:55 +0300
Message-Id: <20230921055704.1087277-4-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
References: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_225808_820445_279FCD93 
X-CRM114-Status: GOOD (  12.78  )
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

MIPI I3C HCI specification v1.1 describes the ENTRY_SIZE field for the
Device Address Table (DAT) and the Device Characteristics Table (DCT)
section offset registers (DAT_SECTION_OFFSET and DCT_SECTION_OFFSET).
That field is not documented in earlier version.

ENTRY_SIZE value 0 is meant to be backward compatible. For the DAT entry
size it is interpreted as 2 DWORDs (8-bytes) and for the DCT entry size
as 4 DWORDs (16-bytes). Values 1-15 are reserved for future use.

New version I believe fixes also the TABLE_SIZE field description.
Before it was defined in DWORDs which I believe is incorrect since the
DAT/DCT table entry structures, and sizes, are described having
8-bytes/16-bytes entries.

This is more clear in the specification v1.1 which states the TABLE_SIZE
fields are interpreted as number of entries in the DAT/DCT tables. I
believe this same holds also in earlier version, at least it makes more
sense.

Fix code accordingly and let the DAT_entry_size and the DCT_entry_size
variables carry the size as bytes. Which is how it is already
interpreted in the dat_v1.c: hci_dat_v1_init().

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 8f43ad81fbfd..76a3e6bb3665 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -610,17 +610,17 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	offset = FIELD_GET(DAT_TABLE_OFFSET, regval);
 	hci->DAT_regs = offset ? hci->base_regs + offset : NULL;
 	hci->DAT_entries = FIELD_GET(DAT_TABLE_SIZE, regval);
-	hci->DAT_entry_size = FIELD_GET(DAT_ENTRY_SIZE, regval);
+	hci->DAT_entry_size = FIELD_GET(DAT_ENTRY_SIZE, regval) ? 0 : 8;
 	dev_info(&hci->master.dev, "DAT: %u %u-bytes entries at offset %#x\n",
-		 hci->DAT_entries, hci->DAT_entry_size * 4, offset);
+		 hci->DAT_entries, hci->DAT_entry_size, offset);
 
 	regval = reg_read(DCT_SECTION);
 	offset = FIELD_GET(DCT_TABLE_OFFSET, regval);
 	hci->DCT_regs = offset ? hci->base_regs + offset : NULL;
 	hci->DCT_entries = FIELD_GET(DCT_TABLE_SIZE, regval);
-	hci->DCT_entry_size = FIELD_GET(DCT_ENTRY_SIZE, regval);
+	hci->DCT_entry_size = FIELD_GET(DCT_ENTRY_SIZE, regval) ? 0 : 16;
 	dev_info(&hci->master.dev, "DCT: %u %u-bytes entries at offset %#x\n",
-		 hci->DCT_entries, hci->DCT_entry_size * 4, offset);
+		 hci->DCT_entries, hci->DCT_entry_size, offset);
 
 	regval = reg_read(RING_HEADERS_SECTION);
 	offset = FIELD_GET(RING_HEADERS_OFFSET, regval);
-- 
2.40.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
