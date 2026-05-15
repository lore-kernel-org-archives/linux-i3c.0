Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADE8CD343F
	for <linux-i3c@archiver.kernel.org>; Fri, 15 May 2026 16:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6MiVyl2ScWLxkyor6NUwpQnIz2nAMxTYAYRE20Yg98=; b=mP+ogVyX6+E3zA
	UNeVuL7XYfLRnenrxoSBudLZgUYtLDehZguK9mPEPW9jQUewKb9mAA27CP/bSYrkWgIuSlQVVL1Th
	H7uqMx2Oq8x2ng2aur0WegUMJu5FM+a82SxW7fXDvLItjQYqpaIEHVipyp7S0MUVR0xVPblDvH+bV
	KTi6mHvdiAlHmExcJXEt2DpPx1xqy135qcnFeAd14LElOlmeCprEoS5vVp2VHfv/tnQUbxSmJqQya
	i4Jc1aq2AxfQ3JpGcK7UoYRBcV+7PE080JMHtRdz6S3y/We3RzGy/ZqT2i397FY5DU61MCdV5uDSw
	iD2q1iA72CEYR+MXvSfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvN3-00000008rKB-2faU;
	Fri, 15 May 2026 16:26:41 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvN1-00000008rIk-1Ff9
	for linux-i3c@lists.infradead.org;
	Fri, 15 May 2026 16:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778862400; x=1810398400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MqUQxPJtRMYyoi1ZCQXB70GwPNJeUef867jmLmOks/U=;
  b=dfUgLfaYtCdQr1ZgW1TgUEhP3SXDSqlHptizsMJfGY6QIn3rZ5pwi0TV
   qtIYldezmQHtraxivGB65xJYlc5oU2dSAzrJ14QCu/HqBc5KUykjjxBZf
   S/jFeb6ai+9M+v7mYz84FBP2qplxqw+aG1hLqJ6HLYC5FVMdrA8TiWs6S
   OSPFT+BIO62wbNqvJ49ysuVo0YbXoGxJK8lgBXrEK7kqq50V4nZm1AC8q
   SyckO6rp9lPIOL92aAbQuATJsRIACjlQESOuvuX7mOCC1owZsgj/3DuAG
   I/bPHReCzvn7th6O8CFcayMqnVY0xlcF3dDNOEMF2wuRGPN236rb6gVhg
   A==;
X-CSE-ConnectionGUID: 3+0GXIeBQJKxWFXo/gRXgA==
X-CSE-MsgGUID: v6al51/KQA6UQLxLWdu4Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79785222"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79785222"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:38 -0700
X-CSE-ConnectionGUID: eeoBwHfTRRygzhT6+8r9bA==
X-CSE-MsgGUID: b1wIOrVET8ivUnZR3VNi0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="238857129"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.28])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:34 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 01/17] i3c: mipi-i3c-hci: Fix suspend behavior when bus disable falls back to software reset
Date: Fri, 15 May 2026 19:26:05 +0300
Message-ID: <20260515162621.57719-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515162621.57719-1-adrian.hunter@intel.com>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_092639_403344_A032BE81 
X-CRM114-Status: GOOD (  13.33  )
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


Changes in V4:

	None

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
