Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91E9C5B572
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Aug 2026 08:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FBiMRcqZyJLMXlx+ZqLqlvtVJ5CoI5/K3bvTYEB7gSQ=; b=xf5qbLxf+WdJkA
	x9tO5MPj6TR6uv6YClGkQ7lkeVODrjDxr/iJaCL0tGOX4YOkKYP2AgCziydMcRwF0nywzgCp8bfKm
	CE7P32EnEpYnGQ7sPmbQYLDg3UOw2GxrRhutyyP8i2qx0DK1e60JXYmNuoq8hpsPFnH9xRkVA1MSm
	R6/OdmOmhQX3G5SiKY8g9QOWc26cyVzAtwaH+l2XoUc+7jznnnkewft0HcQiz0s7SICYGyOCXykWN
	ibnTJUszPBv6CGHfS1pE/ZT2uirdj2VJH7hmlNFkSTRnj9YUX8TLf7I7B+WixorY7o91Natu3QUUR
	iDv9AExInajlTWgaKG2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsgx-00000005gtP-2Crv;
	Mon, 17 Aug 2026 08:27:35 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsgv-00000005gss-1z8u
	for linux-i3c@lists.infradead.org;
	Mon, 17 Aug 2026 08:27:34 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38101f85591so3712617a91.1
        for <linux-i3c@lists.infradead.org>; Mon, 17 Aug 2026 01:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786955252; x=1787560052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcLgl0+h/OICdBv26fz7jBPq9uDcAjU45znC7e+Ppl4=;
        b=HJwOBZuvod7fdNvng6kU/UJORCZ5uWwFRxC2bT71p3A2n30kxTxYyH+wxL62dIVA2U
         qsQQ2sUNt8RV+ErWStPedcGyJWo5C8GKFVzWLxhlBi8tgrgJTso00rg2m813gA+xeNtA
         pUk/xo5Z/k7HJ8vbfGmHu/p7lRmAeTCO5tFyK/wi+LBuGVLXdzrFKUgbxm8JdJS0fUyT
         1bN+ifdtcTW4XXpVXT4TIggwkV6DNgWVeFQnAF/A0ZZgDQMFfRHIs8tDBn4DOZSIStnK
         60oYCZ96E+m0ZX7oYaDOWeMQgCZ+BVl5AJS9BR0MONwmM7nVHs2NzFev+Vno0Z2lmT/+
         gsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786955252; x=1787560052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcLgl0+h/OICdBv26fz7jBPq9uDcAjU45znC7e+Ppl4=;
        b=iD3pAtpr4EomrOh0ikb3hcB9YD0zWfM/0NcAcWit8AquJdVlQi0nHg8HEslRZ0WCnR
         Po6kthbY9kK06K42upgY8Qq1VOb+wS1HOeNZgakb0THDm1+ZHyHO3Ka18/RgeePdLAyz
         HxuTouVqvZ2lvAXOoQVEUeNW2EJ+9w5PdebS/3anYBWi5grzOpjMvdyQ2RBtomFoB7Io
         bbNH4LcoyQFWpNBkkzL2o7LKtkMbJk6LL1sNJSj/EGhXI+BokkKKHCzZ8+MGl7Oj/Qyh
         gfpZZpT570aWsoB2oz+uxekG/zYmW65UYKtztBAGy/q1StmkK7dNqEl1qxL73cr+wZ8O
         ybJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rox0HYtNlq7Z6/o9XhEK/ZojvwlSy1ipl4gqJUg+UGASC3udnoz5PKYcxxtXb3+uUMq+A24ySFJL10=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg4YlqTK9XxJBWcps0owQRDe0JG+4Mm5kLnd31kw+Q5jZ0yCEd
	Szb+TgXBmJLjY6N+SHx9KTbf5ARV/QMaEh+oLwcYptV0NLPPLzxXEOPJ
X-Gm-Gg: AR+sD100vuEB52PwG4jebLLQt30hs8Y6NjO+5smsCvJWDn7cE4Kl+AJrmPGUB4ywLsN
	DJInW+DKtwjrfRbrs2WJR7DFaiLSthfWHxuE6QSv8PKhml8aAeA8tQoUsitOsa8V8GsMUoqQg6O
	qjklt42G+6W7Ggfm6Cysb5C63PKZViIho/A1Mn+EMfRFOhTAedeI6UcuU5oXUHfcj+0DYwZhS16
	oQ/rGfCN/UR7m3y1fzU5tBoT67Tht710q46mWj15ripnszDyjVWsPxSWH7Xp1Fby9m7x3mW1y5g
	b8T2gN02//Wu2Fq+JPswAwVng/CmMTGdOrfOHQIQqM/ENmxGclsQeP48vFSoJ1qwQC2Xff2/alK
	iEIGFcgN97YhVKZFbLwY15U8ls/WZNPE5IFn5x1mspuFczodD3+/O2KsnM3JH5SpJKyETW73zpy
	fqOHjfEjvWNN06g0b25MrdUt4P1y20HXtLOyDvtIPWUqDDgIpO2DgnCy9TC2iPuXr3eqRrspH5z
	JmzEMdCNfIpEXhmrosdSabfkKeKfIg7jpQnJPp+ToqAlpg5Sx0qAW/IOHTjuxqyzZPB0wDF2+VI
	S9HaGrzH9bHrN522E+RTNoJzdVw+
X-Received: by 2002:a17:90b:1b43:b0:38e:9ca8:e99 with SMTP id 98e67ed59e1d1-3933af8b5d7mr16476597a91.5.1786955252563;
        Mon, 17 Aug 2026 01:27:32 -0700 (PDT)
Received: from jm-Lunar-Lake-Client-Platform.. (2001-b400-e15c-4d9e-e270-183b-5fe6-6f07.emome-ip6.hinet.net. [2001:b400:e15c:4d9e:e270:183b:5fe6:6f07])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d2b8080sm1393379a91.4.2026.08.17.01.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:27:32 -0700 (PDT)
From: Jian-Ming Liao <tim678910@gmail.com>
X-Google-Original-From: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	adrian.hunter@intel.com,
	jarkko.nikula@linux.intel.com,
	boris.brezillon@collabora.com,
	linux-i3c@lists.infradead.org,
	Jm_Liao@asmedia.com.tw,
	Patrick_Yen@asmedia.com.tw,
	Chloe_Chen@asmedia.com.tw,
	Yd_Tseng@asmedia.com.tw
Subject: [PATCH v3 3/3] i3c: mipi-i3c-hci: Add support for AMD_PT I3C controller
Date: Mon, 17 Aug 2026 16:26:47 +0800
Message-ID: <20260817082647.612471-4-Jm_Liao@asmedia.com.tw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817082647.612471-1-Jm_Liao@asmedia.com.tw>
References: <20260817082647.612471-1-Jm_Liao@asmedia.com.tw>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_012733_534904_BFC92DA9 
X-CRM114-Status: GOOD (  12.93  )
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

Add support for the AMD_PT I3C controller by introducing the following
changes:
- Add AMD_PT I3C controller platform device ID in core.c.
- Register AMD_PT I3C controller PCI ID in mipi-i3c-hci-pci.c.

Co-developed-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
Signed-off-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
v3:
 - Restored Frank's Reviewed-by tag from v1 (Adrian).
 - Formatted platform_device_id entry with '{' on a separate line (Adrian).
 - Moved amd_pt_info definition to match device table order (Adrian).
 - Added space before closing brace in mipi_i3c_hci_pci_devices[] (Adrian).
 - Aligned From: and Signed-off-by: email addresses (Adrian).
v2:
 - No changes (rebased on top of v2 patch series).

 drivers/i3c/master/mipi-i3c-hci/core.c             | 4 ++++
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index dccc974ef15a..27dce02e7931 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -1198,6 +1198,10 @@ static const struct platform_device_id i3c_hci_driver_ids[] = {
 			HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET |
 			HCI_QUIRK_DMA_REQUIRES_HC_ABORT,
 	},
+	{
+		.name = "amd-pt-i3c-hci",
+		.driver_data = HCI_QUIRK_RPM_ALLOWED,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 5a9e2a43eff8..cf61e056bc2a 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -223,6 +223,13 @@ static const struct mipi_i3c_hci_pci_info intel_si_2_info = {
 	.control_instance_pm = true,
 };
 
+static const struct mipi_i3c_hci_pci_info amd_pt_info = {
+	.name = "amd-pt-i3c-hci",
+	.id = {0},
+	.instance_offset = {0},
+	.instance_count = 1,
+};
+
 static int mipi_i3c_hci_pci_find_instance(struct mipi_i3c_hci_pci *hci, struct device *dev)
 {
 	for (int i = 0; i < INST_MAX; i++) {
@@ -475,6 +482,8 @@ static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
 	/* Nova Lake-H */
 	{ PCI_VDEVICE(INTEL, 0xd37c), .driver_data = (kernel_ulong_t)&intel_mi_1_info },
 	{ PCI_VDEVICE(INTEL, 0xd36f), .driver_data = (kernel_ulong_t)&intel_mi_2_info },
+	/* AMD_PT */
+	{ PCI_VDEVICE(AMD, 0x444c), .driver_data = (kernel_ulong_t)&amd_pt_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, mipi_i3c_hci_pci_devices);
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
