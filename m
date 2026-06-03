Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6BECD6E64
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Jun 2026 09:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tH2jx9zOReWsfd2e9V5/gett2+uD4DF1BftpkSuLaD4=; b=gXeVlHSSy4wCvd
	gvl8k6XOacBaXR+kEZDhRb2M1t1mO7RipFdVJm0RDAfwHeLJdnARoV9cj2laZD0rgaKdjXdPss53n
	LvjG/66GBRpmDKFq2fnWn/F+6c7HaSc3EL2jjZenyUZxWqV/+Q6a4FCsZm7pZydqwelU/+tu6L9TK
	KHOjyIEwJxotkG4ksTd+QdV2nrnZYxTYmKiGnDD7yZEMlDTNW4eQo7tHNlF4KriyrLtOJ2OYsJ8zP
	NkcOITcOMsga1rRG4j5gITqhbx7tKj4GsMcghvyVuqm6g+fxeyaYu80wd6InD6wOKgZ3knuzgNI2u
	tuVjNBt0OjWpvBDMubCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaI-0000000Efk5-1q07;
	Wed, 03 Jun 2026 09:08:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaG-0000000EfiQ-3qJI
	for linux-i3c@bombadil.infradead.org;
	Wed, 03 Jun 2026 09:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wT5BOn+nwTnnXpHZJBL0wTSWFIKv9vpYN03XCCOjAjU=; b=DD/kyzz9OrZ7brWg/HCIlt1D4L
	mcauhUKJMsjw9LauSs0hBVk10y0QOz5rg/IYgxXKGDsym96eYSf4bzarPHFQmyMYArFzLbY09bWmR
	W4oLxoQAwnIwFwEyktw74mJXWXn+8Ao85+zNZtcNCtlgCIZowpbOsDK01/lFd0rsWe5hZyXJDURJ4
	Ppi6+z5KStPXAQ3kFkyAY8/K/aWId7Alxtc4CiP7XB4Ox5DI31FX6ZTxwNRJFDbFoDc1ESJTRX1//
	+dzPgE55NdjXdK4K0uiuhamoSfbNpyGDymgMz8f7pmCLVuR6ZP2l1jBwAxSshc9rhbscTlUbM2TQ0
	B/MfaaMA==;
Received: from mgamail.intel.com ([192.198.163.11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUhaC-0000000BfST-3hFN
	for linux-i3c@lists.infradead.org;
	Wed, 03 Jun 2026 09:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477697; x=1812013697;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pO9UCkLcVCgzQJ15Oc5dy2H25WqqT7dvU0P6rp92XRk=;
  b=h/aQlHkikNcbxVnAZj81AWZkUH9ZfgZ6Zy0vE3DmXfc66zLzI3ZobESs
   +cSu1qbVg3X7zftrV3359ZJRuhXjgZPLiRiEwrG5rm1hPgGuhYmRsq08M
   gVD7x1ApL5r+awl/f6cDh6DjTO6p/zitHaCR+57dNVYc9Et3tmIcztObb
   8e8avjq6ST01WPdR/z6aFuK2mYSjCLkJIbPOlf+Cw5tADNOKzTE4hJXvw
   GVIkD3XP7Bp60u8usiyWnUXz5U+hbd81Rd236+dRR0PeERrChduDPwbAM
   WZNDOyrnDj3YpAQsDVB+X9tfVfwpD2aNM1LJlqS1G4uMLyFE45Jrbfn11
   g==;
X-CSE-ConnectionGUID: iWlBPbC5RNuEG3ENdpCqSQ==
X-CSE-MsgGUID: WaGAyPbuQ9C6kDD3fVtp7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91852591"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="91852591"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:12 -0700
X-CSE-ConnectionGUID: BQT1qqSFT+egLyOiyZ2shA==
X-CSE-MsgGUID: bBW3aLS9QeKJ8e3NHZEBRA==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.137])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:10 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 01/17] i3c: mipi-i3c-hci: Fix suspend behavior when bus disable falls back to software reset
Date: Wed,  3 Jun 2026 12:07:38 +0300
Message-ID: <20260603090754.16252-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260603090754.16252-1-adrian.hunter@intel.com>
References: <20260603090754.16252-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_100817_324920_37584A19 
X-CRM114-Status: GOOD (  13.47  )
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


Changes in V4 and V5:

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
