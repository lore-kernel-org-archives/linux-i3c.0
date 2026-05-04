Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CB3CD342C
	for <linux-i3c@archiver.kernel.org>; Mon,  4 May 2026 11:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vwEskncv4xo4yK0+OVoT8VMu6GPEfNW46e+GRBoVsgo=; b=4BRWw48SO9Y+6S
	4axvFfSwrnp3Hu+wpUEsF2/cQXcOvW1tNLZHkXifpbFu3I2NWxUFXoEi2iKsdF1nCWuxEIvDnt7Za
	AtvacfQmJln53QsY75t0TVaLFJznXVc6auIYqbi7eL5DaS+8F4QDJolWt3McWNie8gukxPedHyTmr
	ZUqLVhrgZeDBHozS7FbpCOuIpjzfUW7sveoJnMYL0hj3xtRHWtSnIxGRjx6p7EQDRGSvN9wOlvnME
	HtrjoGWsXE7lvTxh7lNtL/kb2P1KaCyDLp2BeD/Gm1YBPAE1wVTGmaIyg//CnZEOKgaRVXEKF3WUg
	6daSJV2TgdcA+phGrhGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrYw-0000000D3Iy-2qAy;
	Mon, 04 May 2026 11:34:10 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrYt-0000000D3HH-2NxM
	for linux-i3c@lists.infradead.org;
	Mon, 04 May 2026 11:34:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777894448; x=1809430448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=teWJz0OV8eS9QHdCuehQXJXiHZ/gJsf/+8wEIwLhtIE=;
  b=ORxqHim9ZsD3mMAgWx6vNVS0/V9ZkNC9EOlhuVl6KEROr1qwIgeWLWcQ
   NbU85RmbBkstVUx8Pa6hXvG8KTeEzLcLUAPc5dHdnrJlKsOh6RdrPMG3v
   pB81J07iXrSP2ohzpgtiwI1kcIeXIDFyjceyzoKjCNViwB7l3dmmSr12e
   2LmLN6kX1QSiVqMjqEbKdbJ9p3mtpX0K9XoOzGMfXJyl82uUsM1TqO06k
   HD2QD9FkTuK2H4bKBdURPncAwz6FgUOjcZWYbKhlKz4lc+MgH3B9//fxq
   WbBKdpp4DHNTyxn4vXo/gdiXtnFt5SI3nFSGhoHleqRp3Y+cBLat10Sxi
   A==;
X-CSE-ConnectionGUID: dZsip+djSuGxMYenEPrKhQ==
X-CSE-MsgGUID: S7TIMizgQFCOKLVpXl8jkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="81315140"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="81315140"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:05 -0700
X-CSE-ConnectionGUID: HUKmFH1vTRSpfOIvS0ncJQ==
X-CSE-MsgGUID: HasUU7NGROKR5FngHOQvNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240478189"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.92])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:03 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 01/16] i3c: mipi-i3c-hci: Fix suspend behavior when bus disable falls back to software reset
Date: Mon,  4 May 2026 14:33:37 +0300
Message-ID: <20260504113352.38490-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504113352.38490-1-adrian.hunter@intel.com>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_043407_689024_A1710FE1 
X-CRM114-Status: GOOD (  13.45  )
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

Software reset was introduced as a fallback if bus disable failed.  The
change was made in 2 places: the cleanup path and the suspend path.

For the cleanup path (i3c_hci_bus_cleanup()), after software reset the
function continues to do cleanup for the current I/O mode.  For the
suspend path (i3c_hci_rpm_suspend()), after software reset the function
returns early.  However software reset does not reset any Ring Headers in
the Host Controller, so returning early is not the right thing to do.

Instead, continue to call suspend for the current I/O mode, which for DMA
mode will reset any Ring Headers.

Note, although Ring Headers should not be active at this stage, performing
this reset follows the procedure defined by the specification and keeps
the suspend path consistent with the cleanup path.

Note also, i3c_hci_sync_irq_inactive() is still called via the PIO and DMA
hci->io->suspend() callbacks.

Always return 0 because the device is quiesced as much as possible and
returning a negative error code would unnecessarily prevent system suspend.

Fixes: 9a258d1336f7 ("i3c: mipi-i3c-hci: Fallback to software reset when bus disable fails")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's rev'd-by

Changes in V2:

	Always return 0 from suspend callback
	Amend commit message


 drivers/i3c/master/mipi-i3c-hci/core.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index b781dbed2165..afb0764b5e1f 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -762,15 +762,10 @@ static int i3c_hci_reset_and_init(struct i3c_hci *hci)
 int i3c_hci_rpm_suspend(struct device *dev)
 {
 	struct i3c_hci *hci = dev_get_drvdata(dev);
-	int ret;
 
-	ret = i3c_hci_bus_disable(hci);
-	if (ret) {
-		/* Fall back to software reset to disable the bus */
-		ret = i3c_hci_software_reset(hci);
-		i3c_hci_sync_irq_inactive(hci);
-		return ret;
-	}
+	/* Fall back to software reset to disable the bus */
+	if (i3c_hci_bus_disable(hci))
+		i3c_hci_software_reset(hci);
 
 	hci->io->suspend(hci);
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
