Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84417C4332F
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Nov 2023 13:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Vp47sTGV99JHSTJPZZ07vMuw8ClisyWovBBIt60uTc=; b=s1dtgGm0B0zPFb
	tMazl4R4F1g+voOSYrh+fNXhS0P9fuo4xwCXVx1+faUQduTkn4anMer4QqVMXmb81zcZUuW+N5yHh
	cSUWtl0hk2YCKthG6Go42obyeb48wiqwjwpf+LxN7utjlIrdnU61MgulGDBA90okBuLqye4XCFg0c
	/lB0nAIKe7Q1znYGOJIj/v2nl56KybbcXWXwC5BYuUYV+VFwOfELUZUmnsb/Rd3Uh9y+IGf+zT0kR
	P08GgaUL8zBN3IrUxQGeCHsvgIAhkBez/I3EjTCesgjWesi7Nbw6XIydUvHHzlWt+K1uMM33m5DwN
	sOS5ZaJhvSFC2oZdok8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r15Er-006OtV-2y;
	Thu, 09 Nov 2023 13:38:29 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r15Ep-006OsH-3B
	for linux-i3c@lists.infradead.org;
	Thu, 09 Nov 2023 13:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699537108; x=1731073108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9SeSn39vA3HNnGtEdoNJbsGLYDoNtG8on5nyHfleAws=;
  b=AcTfxeyVsT5nnZaZm7VrAQiwTPhDwJjqOirfpeI2hizAQHDMKvRe4Bm0
   1+WOY9fbPg/iz3utCQAnnAcOY5KmMxvURxOPVC3uiHR7khzXL/4frAQQj
   LBBlDM1TCLwVvCORNanVwwU4rtL/18iYBfSDxnJm2kuEI9kxlk367E89v
   /DiLOZ9ZzzoOQ++7W9p4Bkb12pKGvkqwa/LXL/AqD+usWSiU+T1zzNMNp
   OLyuRfphgHAXLD9zTKUOwnVxe0mn27Y0b1YicfP4e0u+Ik+cPK2Rfaocl
   H0bZUaWS9xWu+DnX5evp1XognftOKahIjKyksHdfnZVclepJwzGfa6fBl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="2949357"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="2949357"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 05:38:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="907127733"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="907127733"
Received: from display-mtlp-1.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.68])
  by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2023 05:38:23 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 2/4] i3c: mipi-i3c-hci: Do not overallocate transfers in hci_cmd_v1_daa()
Date: Thu,  9 Nov 2023 15:37:06 +0200
Message-ID: <20231109133708.653950-3-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109133708.653950-1-jarkko.nikula@linux.intel.com>
References: <20231109133708.653950-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_053828_043679_BBC34A7B 
X-CRM114-Status: GOOD (  12.82  )
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

Function hci_cmd_v1_daa() uses only single transfer at a time so no need
to allocate two transfers and access can be simplified.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
index 2b2323aa6714..31f03cb22489 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
@@ -298,7 +298,7 @@ static int hci_cmd_v1_daa(struct i3c_hci *hci)
 	unsigned int dcr, bcr;
 	DECLARE_COMPLETION_ONSTACK(done);
 
-	xfer = hci_alloc_xfer(2);
+	xfer = hci_alloc_xfer(1);
 	if (!xfer)
 		return -ENOMEM;
 
@@ -339,12 +339,12 @@ static int hci_cmd_v1_daa(struct i3c_hci *hci)
 			ret = -ETIME;
 			break;
 		}
-		if (RESP_STATUS(xfer[0].response) == RESP_ERR_NACK &&
+		if (RESP_STATUS(xfer->response) == RESP_ERR_NACK &&
 		    RESP_DATA_LENGTH(xfer->response) == 1) {
 			ret = 0;  /* no more devices to be assigned */
 			break;
 		}
-		if (RESP_STATUS(xfer[0].response) != RESP_SUCCESS) {
+		if (RESP_STATUS(xfer->response) != RESP_SUCCESS) {
 			ret = -EIO;
 			break;
 		}
-- 
2.42.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
