Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078DDC54EFC
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 09:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljaiZq2a++bSX5OOu6j3pVMiC4Jfub8yxRDZu51IriU=; b=ZHUhRyWtuM3IUb
	O9gHUsCfkl08y4kAeWig7D9ypAVdCuifrfMZw3KMsWGt0iqrxFOGoi9+t8hVn2Kn0Jzy6SGaWHNm7
	D9Wdkdy057PqLa/Cb6b60hSE/pZk+4HdWGxedrHlGTrvrwHIODYWrLOR0S6rgd+mE3IrJynri2U4F
	jmOIfGit5QaVwvno4DAi6Od3C/RR2XaiP4ch7cFkMYJpnhLX3iKiLqDIojft2miQLWQGpafI0sqAw
	yPSItf0oj5PpDVZn7Rqan6MyWxiSlEqA0W8fEubmLkRzeknxiMLqsX4ELxKAQROhmvSG8oqEDhRFb
	GToVgpo+8IIxbhg/qb9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeBh-00000004q5v-3Fst;
	Tue, 28 Jul 2026 09:33:25 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeBf-00000004q5F-11lT
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 09:33:24 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so2793943a91.0
        for <linux-i3c@lists.infradead.org>; Tue, 28 Jul 2026 02:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785231202; x=1785836002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=308oSo7DW1Rp6UR8eNqxP/xbBlK8xc3P8d7aI8vQRXs=;
        b=QsOijlzZmOxK0pggPjBJ1w9EghJdapQz/VMY2L8+TMdWtxHbvVUPcyBT9VN1vKOCLW
         YiWVsEoCVQ/7QmA+gY8CiGmll8dGi26fVoOFAlG6aL6WKypnHH7zwuc/UmKFbBZ0Mx8O
         KI8+ETi0lw6c4NtiAFseYlI5i3/1K0v6fSAurYzQgDYJ4jHeOBd+naRI6TAtX0YZiKkB
         I45CREvVmFEaZDm5NX9xk/of3KXgY93jLmubAKtY3ngWBIKD84d4quGHjm7sKMAUsHZe
         XRVavKjj44EjXsBf9JXaASHoZbP3nglrxBbbqIXYWI+UMPB3Lo8fp8ulOKea5ZUUxaK2
         a59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231202; x=1785836002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=308oSo7DW1Rp6UR8eNqxP/xbBlK8xc3P8d7aI8vQRXs=;
        b=CeHMYJ/a3ctdcBuhntJd0xE7MFcFRTY67TIjvqAQgTNbyTykWE5Tsgp9iaXcDYsGOS
         mNuH5YrZfbMLRoKlGRnPMMF8GeicemnGhpGjPWKTfXGt9mEJqcJY6vlJjMJL1sgH8etF
         ITN/AmIdVNXYqAhAEHtkQ860i12I9brTLLuyjTxZhHk+ZE3xRbI7GMMVzGL53yWvLqC1
         hXUCHxy5k77LISbnT5J+/n+m1KCE/xe4FnH+jsR92ZafkEYGjTqUhUGPX5D6icSWnk2c
         H2hLeVVjuWXi6f5ipintK7UdtmRl9Vg+tt0B77CpBvm6sl11Hm68J2HGezlcxmt27vQU
         Afmw==
X-Forwarded-Encrypted: i=1; AHgh+RotYv6Av9KgZxXrwypOoS7hd/7Z2Xw5YVK0CY9MUBHZGS4kaoa9pFXcSofI/8RKm2s36WR72MpwHy0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yze8JhuILGZDyVC72X0F33Y2T4LYDrd5nvmZcC368O5eBGfXpzv
	HBJHMRfpI9NCkybnemFnP8Mbt3YubPPpk7ZXGIpQueOp9vY8aZBWH9LB
X-Gm-Gg: AR+sD12sMpfSDsqw3FoK85ze7N5s3JAvx0JDDt3zqluno7Mgw7isE284M48V85H1qUy
	7ZpSv7zFhnkFYtxfHpNqwwG181p2tWhWVtswvxtAxIB92Qm3Y5ABkdFX/twAW8S0XgG180vu3zH
	KGxY/iYa6hz3tbeZq/Ei5ZZJrsuv3O18ZjkpclA9altFpfLTDJLw7toA9Xhcn/g1YZ//tBfK10s
	zBGZp5KPW4GbV7A/mtocENgdckIQ93JsB7ZUJYWgtTJEJC+6MsFoHnZe4AAA8vC/os+9xMEVbAY
	1RQGKOQlGSKJJ1CO6OubTd3uvU1ffBsXBz+KqNbfZMAU1iwODaeBQ1UaQ6i05XqtMWmDYbS8mHl
	Y1ZqYkiNW+VCqTmfLl+6fEbA6xo+7jb/t0y/+InbIM4Y3+PgfAorVRb3e/7LSz0ii2IHTSyTIPy
	3CE2/9gZcNoGrAXwoo0f5eTCF1xhAzS8dCuNKTh52Seyzs1/c77AAwURu3aW+BrzJW2BsGCN94q
	vTkoyn6dDDYSdiE2splq2vQPs3kMhMUIzck3nA33XYLDg==
X-Received: by 2002:a17:90b:4ac5:b0:38e:5ac1:9517 with SMTP id 98e67ed59e1d1-38f6a2ce98amr1715165a91.3.1785231202219;
        Tue, 28 Jul 2026 02:33:22 -0700 (PDT)
Received: from jm-Lunar-Lake-Client-Platform.. (2001-b400-e14e-87ac-83f9-7a00-1613-f224.emome-ip6.hinet.net. [2001:b400:e14e:87ac:83f9:7a00:1613:f224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089e3472sm4592446a91.3.2026.07.28.02.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:33:21 -0700 (PDT)
From: Jian-Ming Liao <tim678910@gmail.com>
X-Google-Original-From: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	adrian.hunter@intel.com,
	jarkko.nikula@linux.intel.com,
	linux-i3c@lists.infradead.org,
	Jm_Liao@asmedia.com.tw,
	Chloe_Chen@asmedia.com.tw,
	Yd_Tseng@asmedia.com.tw,
	Patrick_Yen@asmedia.com.tw
Subject: [PATCH v2 3/3] i3c: mipi-i3c-hci: Add support for AMD_PT I3C controller
Date: Tue, 28 Jul 2026 17:32:38 +0800
Message-ID: <20260728093239.487156-4-Jm_Liao@asmedia.com.tw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728093239.487156-1-Jm_Liao@asmedia.com.tw>
References: <20260709071744.333403-1-Jm_Liao@asmedia.com.tw>
 <20260728093239.487156-1-Jm_Liao@asmedia.com.tw>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_023323_291005_ADC96C6B 
X-CRM114-Status: GOOD (  11.89  )
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
---
v2:
  - No changes (rebased on top of v2 patch series).

 drivers/i3c/master/mipi-i3c-hci/core.c             | 3 +++
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index dccc974ef15a..15f9faed07c8 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -1198,6 +1198,9 @@ static const struct platform_device_id i3c_hci_driver_ids[] = {
 			HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET |
 			HCI_QUIRK_DMA_REQUIRES_HC_ABORT,
 	},
+	{	.name = "amd-pt-i3c-hci",
+		.driver_data = HCI_QUIRK_RPM_ALLOWED,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 5a9e2a43eff8..d7549edd5839 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -193,6 +193,13 @@ static void intel_i3c_exit(struct mipi_i3c_hci_pci *hci)
 	intel_ltr_hide(&hci->pci->dev);
 }
 
+static const struct mipi_i3c_hci_pci_info amd_pt_info = {
+	.name = "amd-pt-i3c-hci",
+	.id = {0},
+	.instance_offset = {0},
+	.instance_count = 1,
+};
+
 static const struct mipi_i3c_hci_pci_info intel_mi_1_info = {
 	.init = intel_i3c_init,
 	.exit = intel_i3c_exit,
@@ -475,6 +482,8 @@ static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
 	/* Nova Lake-H */
 	{ PCI_VDEVICE(INTEL, 0xd37c), .driver_data = (kernel_ulong_t)&intel_mi_1_info },
 	{ PCI_VDEVICE(INTEL, 0xd36f), .driver_data = (kernel_ulong_t)&intel_mi_2_info },
+	/* AMD_PT */
+	{ PCI_VDEVICE(AMD, 0x444c), .driver_data = (kernel_ulong_t)&amd_pt_info},
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, mipi_i3c_hci_pci_devices);
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
