Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A302C0018C
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Nov 2023 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hd0D1u64rq0VptueV7VtFhd4jpWut5ZsbF1b+QJ5Fm8=; b=xF2zx6MNwvinc+
	HcN6H0EcjB6rRk2w0WdmlafNzvyQp6SGCpMcd2GLfIRgDIpmNMbsXngPYirRw9yPSkhvkQw4dUwjQ
	rXpnK+N0wyeGCYu+Clgjykg6ZII0FQF+aMKZ23ehJNUAQA+o33sWe1Rb0r1LSM1Nl5n5yM/aPZxLB
	1ABwrLajY5SUd43+qaaeM0Jn1LdirEiefO5Nd49DrjL0Eq5wD5zlyodX/Z3Esw4adVDi9qcyzndqy
	Ww/Pkf0UnkBs7YmyfPRY443+3gehkBWOiKbMZkwYZ5xajJzqjBX/E8gieTpjIu/BjRfIrSn8RYokh
	sRAjUb59gnCZjf7bm0hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r15Eu-006Oux-32;
	Thu, 09 Nov 2023 13:38:32 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r15Er-006OsH-1m
	for linux-i3c@lists.infradead.org;
	Thu, 09 Nov 2023 13:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699537109; x=1731073109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c9eNuTC8Py04Wkg89wL/NdP4ycI2loadrD7to1ZGSZM=;
  b=EofJ3pvYvR2NKy47MIUb1UY1/qhoXiAJq8pqbu8NNGgRnGNs04GvxJdR
   7lB9EWPI3yk3sjsmC5aMbTCdEYBqgVEOAFd6KlIMxV1H49B6KR6Eq0l7S
   f48nXPOl0XMA5YpB/Z7zXyqE51WWvrRRliWj5rIfQQ6Gvq7yppWbdSOAQ
   q9V8VJWtNk59XbVjDw1KNsgEAsZcMMUaKwhWZl/drFVnxcx0L3RdbCUw9
   JHquVR+DaNTANHeEXbCDDXO40Izm2tpbVeEopjNnyebazUQHcGdx+XBrD
   bnALhOBNCfgIdJbiGGTWSUZiK48cSIMIUClkEdrtkWxXnfx1hKJcJZvfr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="2949363"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="2949363"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 05:38:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="907127737"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="907127737"
Received: from display-mtlp-1.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.68])
  by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2023 05:38:25 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 3/4] i3c: mipi-i3c-hci: Handle I3C address header error in hci_cmd_v1_daa()
Date: Thu,  9 Nov 2023 15:37:07 +0200
Message-ID: <20231109133708.653950-4-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109133708.653950-1-jarkko.nikula@linux.intel.com>
References: <20231109133708.653950-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_053829_601045_B96757DF 
X-CRM114-Status: GOOD (  13.92  )
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

Handle also I3C address header error response status as the end of DAA
process in hci_cmd_v1_daa().

According to MIPI I3C HCI Specification v1.1 the NACK error during DAA
process comes when the device does not accept the dynamic address.
Currently code uses it for successful exit from the process and fails
with any other error response.

I'm unsure is this MIPI I3C HCI version specific difference or
specification misunderstanding but on an early MIPI I3C HCI version
compatible controller responds always with I3C address header error and
not with NACK error when there is no device on the bus or no more devices
participating to DAA process.

Handle now both response statuses as the end of DAA.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
index 31f03cb22489..638b054d6c92 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
@@ -339,7 +339,8 @@ static int hci_cmd_v1_daa(struct i3c_hci *hci)
 			ret = -ETIME;
 			break;
 		}
-		if (RESP_STATUS(xfer->response) == RESP_ERR_NACK &&
+		if ((RESP_STATUS(xfer->response) == RESP_ERR_ADDR_HEADER ||
+		     RESP_STATUS(xfer->response) == RESP_ERR_NACK) &&
 		    RESP_DATA_LENGTH(xfer->response) == 1) {
 			ret = 0;  /* no more devices to be assigned */
 			break;
-- 
2.42.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
