Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2F1C43458
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jul 2026 07:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EgdQny0vNKFz1xxsUvO7u0R9rh3NK+3IWDlsjZj3yPI=; b=xkQwBX0xLWgsTq
	2vfEYU9BBa34IPqsQR1uuXB6U5S8Q8fJHxeNSdfXvPcjr6YfDybDoL/TaDgKVF4hJIhn413gELhp0
	dQ94ZBCJVrpVPnPpz4g/SXFESXcU6E12dA1nKCh1pyz7J3zVh7XeWVJSFoxKtLwSFuqMZmNHBuJgM
	jgkYvb2avnqbLL+KdLH2kL7UH4SwfQOyfvE3T/eW2DKD7P9Cx+viiuhgy3JDrsIDgysy9kzd+25/T
	yYFDtDP/tawURCkbtO+kRCmmkobD8VjGBbiK1j6cZscisHMePZYs88Y4sjzvmcjvRXh9dKJoDPQ0L
	W094wZI5QegQI8C5FGLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whj2e-00000001G8e-16Zm;
	Thu, 09 Jul 2026 07:19:28 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whj2c-00000001G8G-04Mb
	for linux-i3c@lists.infradead.org;
	Thu, 09 Jul 2026 07:19:27 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-37cab825ec9so1773187a91.1
        for <linux-i3c@lists.infradead.org>; Thu, 09 Jul 2026 00:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783581565; x=1784186365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JnzCgsHyvLiiyptjtlHGf++BqIzSiHRzIaeJISadqIA=;
        b=jkav9NIexEnEwyS7b/orFZNw0VRVM47uElCUhCKMGJgdUGzxOGIIfA6eA4tRXIyT/q
         c+WSLOcUVUB7icoePsnCbwrl62+HymZwOtmqBzMDWo2UyekQwJI6kv1qefqjOK5O1eYn
         BfFh++QInehUD1I1cyBJvsMMDxhVASXU+RyJS1EBe9y+zENcgSjpUe91M5MVAuOgltk5
         mKw8JXqJ99rRVEfFPZXoFeeuRQ8Uc3UWaF5p7txx7dNYpK9AIh1QyVuzbRf4qG13eumY
         o9eTuQRkd91+S4N2rbvHec4lr5HUzagxuGLGU67GxFmAgYPzoYXvcyrgmgBS59QWJYiz
         tWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783581565; x=1784186365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JnzCgsHyvLiiyptjtlHGf++BqIzSiHRzIaeJISadqIA=;
        b=TB6CLyMqosKTJWTUDjdTUJJIZsv0MQkg6En+zJalx4sdVLA1svgLQQeT4ThDG11nGK
         03MRjY2Ze7rA8Y1OlqrPDApojDg0TR3U4YrrLXKq44Y1BciH2CAOtNfxJxBizE/cYO/8
         DBHdb2uPnLbnUU/DQQ6V6goozizNdfhIgUqnHjUwL7h4KKZGpP/eXTecKh898ZwmEubX
         GJIuWORxe3wLkQtySWc0CkAq//W66fs+nyaKc9JWbre8LvBC5JrHXf0dlGxFCpAfjhcX
         5sVQGVwoYLZfnBUZNEznzzadxssjDjzPVH42awVpL4k3zRf1sRAtLQMlKgrf+Cz3O8fH
         1jdw==
X-Forwarded-Encrypted: i=1; AHgh+RpdM/7MBrPKhzlSbKUq/nB0rCZ3Yzn5CFiNgICSoi1cXYdi5elkL39/q0ewN1KnXUDe5rhlwPVq9mA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9bpMDR61Y+KZEyEOpaIlMJIG33294qbgc0Jxd/9gaklzCGip1
	vTuazOsvzPQMhQndGi5iVL4xepYjrbBEdhWs5dZho2h9l13AChja/bos
X-Gm-Gg: AfdE7cn599JrBf1OzzeN8BYWMH/3w8qrd3TvgeAg7nsBgX/cwAnY8SVUVsQ3D77gtuI
	dqt3cZnK9MFA7+6zyUsEdtAJrUoehj4lk6PTjy9fcrt9cl3EZc9H0LnHc3QSQWOj57rglbApbWw
	2xAWn6w6DZ/R4WrJiCHeXZCXZFB9zqXrHPeCx5RgwymAvt99BUdYQ8rb2PcbfWkAX0TE3FCDRzy
	2hjTZL2Ed8zw3WA9eSAKth8vDi+kodHxYNv+UYMXPYWuq0H4JtYHmCBdUblyOzvirY1PMX0QieP
	OfkNdBwTgeOL4GnufZtZ3KFILs3Kt8dysH4qOSO8Ohk3ebCBIDi+1kqImFZ76CiR9K08wxVw9lc
	ARW/sJziYg6Rr54uWGr4c4I/2lxX1tf0kg6X/P9RuxXjJ8/x6PumtoyrgGKsZ/DWlRS2ZWIwTGp
	1/hl7ibAp0Fv7Ak2VicIeGg4swLrBkrm/V6ZHVBXwVHsHMtNqmo93Q3dpH6ICqLwPELBBiMx5AZ
	Xtd2x/5KIo0o5BJAJM7BNLqntD9Qkjkk2nC1kOnjzxSow==
X-Received: by 2002:a17:90b:53c3:b0:380:9ef6:e8cc with SMTP id 98e67ed59e1d1-38940057b32mr6003686a91.5.1783581565129;
        Thu, 09 Jul 2026 00:19:25 -0700 (PDT)
Received: from jm-Lunar-Lake-Client-Platform.. (2001-b400-e11d-51b8-fc5d-5f39-cd11-ce64.emome-ip6.hinet.net. [2001:b400:e11d:51b8:fc5d:5f39:cd11:ce64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5506b48bsm697456a91.1.2026.07.09.00.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:19:23 -0700 (PDT)
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
Subject: [PATCH 3/3] i3c: mipi-i3c-hci: Add support for AMD_PT I3C controller
Date: Thu,  9 Jul 2026 15:17:44 +0800
Message-ID: <20260709071744.333403-4-Jm_Liao@asmedia.com.tw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709071744.333403-1-Jm_Liao@asmedia.com.tw>
References: <20260709071744.333403-1-Jm_Liao@asmedia.com.tw>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_001926_058336_B957A043 
X-CRM114-Status: GOOD (  11.51  )
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
