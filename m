Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F9ECF6BE5
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 08:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PqWcZtZ57Ow4ecrxbM0c0jp63qwy0ARMwrKA1L8CI8A=; b=hJijXx7KZX6b1D
	NWXmmm9pLFsVBTng3H16AduWw3vb48B4omwrDP6vwZu/d4G2HAu4GViQq/Cl2fNC14QQrVb4dmBKp
	9IjswKYJvvhOs+5ELjXjHP3kNVwZ76aNvM1i4POnzhQqF163eDwL4pIiA5Fq9NHLW0FUFGHbhdJln
	x9Z7jdKuLY9W9cwcwIkdFke5cLMyVqNUvVOms+k4hHqNwgLazUiWWDtQHODqlg6VaQZagSGX5+hiD
	aQrPLKDp5LqRQWVKZ+vfTOAdx/GpSr/YAyoS+mkw+fKdF4KltxB8q+Ne76icoLpGk9QHEMHx2+OWi
	e1F2vD4s6E02iWZlQrfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2O-0000000GDDB-3scB;
	Thu, 08 Jan 2026 08:06:32 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2L-0000000GCzw-1fsM
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 08:06:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767859589; x=1799395589;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cvXvg49nQpwlr352eLkz+6eW0qXjzpwfHPoGNJUEE/g=;
  b=K0CuOdRwlx1dDRvG+Tpfg8Z3sECb0zoQlbKw/KJds0RMJa+PdOmPIj07
   zdkonwYAj98JYJfsYbViVVVBsTA7GESZHPerqwGS5veKpt8XkWiPuGPOf
   DqL4Ngh8Dcpd8T3sPGzEeb7VygR4FvecNXiDj4ZSVijA1HCZpJ4bcuRJm
   6z1x6G1MWcbghP7wquFmVxjOT023kiSrh7cKjbxd+V7BUbFTkp1Gdzn7W
   wrbAzJUsqkzYh+aG7ZBjKDRH83oZJTbDE1mDO67kFBrj7MtCHAMDLfQVf
   1dOrk7QGZaTeIjrQBOkFF26dDv7kjcdVb8E9xJtdXPdcICcB/wfiQlpAp
   A==;
X-CSE-ConnectionGUID: PigecCAEQCytUmNxUOGBVw==
X-CSE-MsgGUID: 7/aBwQLVSty1Y8Ett1cIyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56792305"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="56792305"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:29 -0800
X-CSE-ConnectionGUID: YfHiPyGcQ7y8OopSJpyMJA==
X-CSE-MsgGUID: gacGzfKfS6yxdZF1QvE50g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203413599"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.195])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:27 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 09/20] i3c: mipi-i3c-hci: Introduce helper to restore DAT
Date: Thu,  8 Jan 2026 10:05:47 +0200
Message-ID: <20260108080558.21767-10-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108080558.21767-1-adrian.hunter@intel.com>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_000629_464072_85398FD1 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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
