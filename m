Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD65D29DDE
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 07:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eqTRbq3gLdHi6yMU25WrnXWCvp7MJP+DiPDRN6+N830=; b=z9JtbN2mherCDx
	SbMQ5gkBbWaPTkyoTO0K6wB6TIN3KB+7cOnl+9JMIqAXBFYY1UVruRsvxXmsFmDEzMPhkcFcCpO5P
	b6xcJdrYPEsU12mLkFPluTOEAZre/ckey4kNawi0WG3wvYgdfWn6So0/d/hl9BeO0s6fgHzP0GlBq
	uLCOF5WQ7fWk2wzWCCcfce/7x/y6ysG7TNtyUSlmttzADIDTLg0aFriZ1CT6W3cZOHZnLeMU5GhBM
	i+RygpyxZtD+vsfKsfkbwVzEyGQ3BfbVEO6iq3NEW8OiL5dCvVPCC1Qr8WWmtMFCTfknj0dD+MvXe
	wAxlvnYOAeLSzWZYZvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoX-00000006eZ7-1Yoz;
	Tue, 13 Jan 2026 07:27:41 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoT-00000006eW0-43PP
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 07:27:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289259; x=1799825259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mtbqtd76Og2D6Or6dDzvSjuIyXb4BdL2AIZfOtOny/k=;
  b=ZYLbTOITk+FibviWU+R2wTNfoj71H+13fhk9w74yKx13B/4d7NCcrJuZ
   nWKcruw0IAcYoQgbKlxSznukG3oAm2acFJeKurG6hSMiHGloGatXXf2yX
   BWI33Naj/fiNh5D5dWjhIEnBJT86ACs19PJzmVBDT8Lng4qCUnWceb5P6
   OXzZ1ol2f4pMN9CGzDVDWUQXPiM+yjWF0EjBHQ6v/mgUw6AYXG3+D5dPr
   URoT8jGhc+Gdz3K37WtSyxwXhSQtJGcWzGcGmON5bVFzV0Hf88kHW8H7h
   TEJpRTUzzB3dmT53may2yx5/8ITjC3y+7CFqE5kXVzv7kCgoTFxE8m4SH
   w==;
X-CSE-ConnectionGUID: CoVt5xEyReyNoqkuXYH3Xg==
X-CSE-MsgGUID: V2SonRRUSeKDM04CE+asAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625474"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69625474"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:38 -0800
X-CSE-ConnectionGUID: Azm7APm4RU+loD5yQDEdMw==
X-CSE-MsgGUID: 1mHinvjeQ+mkalgyB6+4Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235021265"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.167])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:36 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 09/21] i3c: mipi-i3c-hci: Introduce helper to restore DAT
Date: Tue, 13 Jan 2026 09:26:50 +0200
Message-ID: <20260113072702.16268-10-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113072702.16268-1-adrian.hunter@intel.com>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232738_357778_E9EB40CC 
X-CRM114-Status: GOOD (  10.07  )
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

Add a dedicated function to restore the Device Address Table (DAT) in
preparation for Runtime PM support.  This will allow reprogramming the DAT
after the controller resumes from a low-power state.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/dat.h    | 1 +
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dat.h b/drivers/i3c/master/mipi-i3c-hci/dat.h
index 5277c65fc601..6881f19da77f 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat.h
+++ b/drivers/i3c/master/mipi-i3c-hci/dat.h
@@ -24,6 +24,7 @@ struct hci_dat_ops {
 	void (*set_flags)(struct i3c_hci *hci, unsigned int dat_idx, u32 w0, u32 w1);
 	void (*clear_flags)(struct i3c_hci *hci, unsigned int dat_idx, u32 w0, u32 w1);
 	int (*get_index)(struct i3c_hci *hci, u8 address);
+	void (*restore)(struct i3c_hci *hci);
 };
 
 extern const struct hci_dat_ops mipi_i3c_hci_dat_v1;
diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
index 644ab939be1c..852966aa20d9 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
@@ -181,6 +181,14 @@ static int hci_dat_v1_get_index(struct i3c_hci *hci, u8 dev_addr)
 	return -ENODEV;
 }
 
+static void hci_dat_v1_restore(struct i3c_hci *hci)
+{
+	for (int i = 0; i < hci->DAT_entries; i++) {
+		writel(hci->DAT[i].w0, hci->DAT_regs + i * 8);
+		writel(hci->DAT[i].w1, hci->DAT_regs + i * 8 + 4);
+	}
+}
+
 const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
 	.init			= hci_dat_v1_init,
 	.alloc_entry		= hci_dat_v1_alloc_entry,
@@ -190,4 +198,5 @@ const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
 	.set_flags		= hci_dat_v1_set_flags,
 	.clear_flags		= hci_dat_v1_clear_flags,
 	.get_index		= hci_dat_v1_get_index,
+	.restore		= hci_dat_v1_restore,
 };
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
