Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C487DC4167D
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Nov 2023 13:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w3SNTAdzRcKufsVLF6PqWiGeSKHiXMwPI+yWk07mx+o=; b=0bhV/kHL0ag42E
	LKD6H0hiZIKsJti5zZdAwXJ46RUBeVFAE1r751Vy0v5hOuaiP5v5aX5dgbud1RsX8ngjpB1Is4Q/e
	ZF7072L6BHpWIze9sTjP1RplaPTcArkQ/guStK2bUG8wDAAIAdIOe4VvWZikXDDaLfNYlsTVoW8zn
	Zuy7UO78Z+NiPSbtRp1DINBzveu7MfFTbL3zx444+ssrjymMKOvzVTEYDUHXL8dz6tcTVWkeg/XrS
	LsRu2RolrJDdSZpw5SQVEU4O/fz35I+Es1mVVR/nOttK26VdHV/Z9st/Se4pH6RAy1p7uuLSJD8Gt
	I6TypmC3QbXYm0/NV/gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r15Eu-006Oua-14;
	Thu, 09 Nov 2023 13:38:32 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r15Eq-006OsE-02
	for linux-i3c@lists.infradead.org;
	Thu, 09 Nov 2023 13:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699537108; x=1731073108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/FZZtJ6+Hdv0BA3obePg6w7dckLey/G2RfAjB2DjZeg=;
  b=TXww1X3417ak89CwmS8Rk+8dSYNBg8sBu7PhLQQKvQGVtF16ixR9yzPZ
   gGjFi2nKBHkKNDZWFpbM0zaxCK0LPnT4IQGLg9H39GL12FUU490bBD2+j
   sVvpYztiIbJTzAPNIGWkhSJsyTfnmrlYS1jkpqh+uhrYA9FR4wyTlBUDH
   LrLFTXIlfe1OtfFc/jpkG303liYwr2hwUMhmAtEGi1YG+KzzcReSiQCUU
   7jgtwJsnzZ2j8KxvW8OweTT/fN7MnJBmlWg2daY7DvSHgBYpSn5FSna/U
   rSS5zXaOyUS+QuKeagEFCNl6cVz7w7iLi/IP8Mp2tggmpn4l/BVmrt5HD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="2949353"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="2949353"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 05:38:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="907127730"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="907127730"
Received: from display-mtlp-1.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.68])
  by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2023 05:38:22 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 1/4] i3c: mipi-i3c-hci: Report NACK response from CCC command to core
Date: Thu,  9 Nov 2023 15:37:05 +0200
Message-ID: <20231109133708.653950-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109133708.653950-1-jarkko.nikula@linux.intel.com>
References: <20231109133708.653950-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_053828_060414_8327C6AE 
X-CRM114-Status: GOOD (  13.17  )
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

Currently probe of mipi-i3c-hci will fail if bus doesn't have any I3C
devices connected. This happens when CCC commands that are sent during
i3c_master_bus_init() are not ACKed by any device and controller responds
with an error status set.

The controller can detect NACK both during I3C address header
transmission (broadcast address 0x7e is not ACKed) and when target
device address or dynamic address assignment is NACKed. Former as error
status 0x4: Address Header Error and latter as 0x5: NACK.

Difference between those two NACK statuses were not described explicitly
until MIPI I3C HCI Specification v1.1. Earlier versions share the same
error status code though.

Report both of those as I3C_ERROR_M2 to I3C core code.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 1ae56a5699c6..8471a1fe1dad 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -245,7 +245,14 @@ static int i3c_hci_send_ccc_cmd(struct i3c_master_controller *m,
 		if (ccc->rnw)
 			ccc->dests[i - prefixed].payload.len =
 				RESP_DATA_LENGTH(xfer[i].response);
-		if (RESP_STATUS(xfer[i].response) != RESP_SUCCESS) {
+		switch (RESP_STATUS(xfer[i].response)) {
+		case RESP_SUCCESS:
+			continue;
+		case RESP_ERR_ADDR_HEADER:
+		case RESP_ERR_NACK:
+			ccc->err = I3C_ERROR_M2;
+			fallthrough;
+		default:
 			ret = -EIO;
 			goto out;
 		}
-- 
2.42.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
