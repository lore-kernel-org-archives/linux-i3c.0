Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49709EF36F8
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Mar 2026 07:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KF0vcxU4RewWIx1zf6MlaueQz8neixF9xJWDglE8MXU=; b=DGqdAaWzREiAGj
	noZZNvPib7RUbQDyZ3gTojMHE4YQ9OzH806rvsEeK7gDxcw1rhW4vMoCaGsQryKmpt/jpkHa7dmc+
	ES8dC6bTaGtPhpjNzcsBKdpnMDIT3OCn868cq/5zEwmTKtPdEP9K5ods+zb7+NJTocK8pQHNaUei6
	0KVgPou/jkXJI2Cw+r2r5a0hK5CGyAKhdVk5gXJ5w/Vei1yg8eIBpDmtoUm3u6cv2OEJeD7JAzGOA
	yNsH5zeSZ9/FYbqfV0sN+G9zFCPjPXsRGF2D93X4dF7z1Q6C/vLFcEDoxy14GJG2/IZFZGhRvTn71
	Vca6CvqEb5bKpbGgZvvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzVOK-00000006q8j-3wHL;
	Mon, 09 Mar 2026 07:51:04 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzVOF-00000006q7g-40IC
	for linux-i3c@lists.infradead.org;
	Mon, 09 Mar 2026 07:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773042660; x=1804578660;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eaV2oEQ30YnvYbc0RUL78CLCfoySBE4ZGddPYHx/FVE=;
  b=HgGHPWMa8DkRH8BIutgRefAIn8dgzhMUOyvxCJzwjVdnCQPLKKzzWpbR
   QHS/x1344js1qCIvOHVscNqmIF0Ng3FJf6MbiNRAYjjpwLP2WRHyNlxzk
   XJZXu8qf+plkRkoPg0T+nT4S3zfkkxPF3ceJiyHlXFzmXA6DAHUpb6vvN
   SSOBAHFZIy1bpsBEbArqlJWRoHNUUn58X001r7K3olzGU7t24aLw2KSJb
   leAAi/jEF6dibBUviCwho6Qzi3iKcWA3WrCR/2eP6AfIhLtNTeSFq2oWr
   t+39tYKOm5IAs2VBlzf1fCvj2a7U2t+Mkmvp4fmblfQCvBtrIQOV57KEV
   A==;
X-CSE-ConnectionGUID: kZ36XzxqQlWzBaqTNIBrkQ==
X-CSE-MsgGUID: r1Nynq8xSsOr3R8zERBf5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="85148568"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="85148568"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 00:50:57 -0700
X-CSE-ConnectionGUID: Ow38RtZLTHu9K6N/ZrGnvg==
X-CSE-MsgGUID: /elXN8hOT+i18nZDevMqRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="242687817"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.128])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 00:50:55 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: mipi-i3c-hci-pci: Add support for Intel Nova Lake-H I3C
Date: Mon,  9 Mar 2026 09:50:45 +0200
Message-ID: <20260309075045.52344-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_005100_035618_8F7AB92C 
X-CRM114-Status: UNSURE (   8.05  )
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

Add I3C controller PCI IDs for Intel Nova Lake-H.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index d6bbc3f8cd2a..9468786fb853 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -472,6 +472,9 @@ static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
 	/* Nova Lake-S */
 	{ PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_mi_1_info},
 	{ PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_mi_2_info},
+	/* Nova Lake-H */
+	{ PCI_VDEVICE(INTEL, 0xd37c), (kernel_ulong_t)&intel_mi_1_info},
+	{ PCI_VDEVICE(INTEL, 0xd36f), (kernel_ulong_t)&intel_mi_2_info},
 	{ },
 };
 MODULE_DEVICE_TABLE(pci, mipi_i3c_hci_pci_devices);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
