Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139A2CAC59A
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Sep 2025 09:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qu/QEc+j4+GUwTPSr6YAehVd8AblI8DbByPbINkM9eE=; b=Pkv9uNEEKqpZww
	Gkcg8gpWEJfB1q5hIRzpIpcHhSTxsPsO+ZJgIK09Dw3KoW6AEwUJe0Sz5pg/fEmyaE4+QtFvk7Rpd
	QeBoAPESYeeS42CrcvobFrsd9QGF6kbfkpe+kI/C6fKqQ4Sg1Xh7AYYetN7UKgibjLdh0MGYjaV++
	QFf6jjQ0Cldcw2TajHMBaQKU12U6mlWoeMXYkohujvs5KobCU5274u0/FJByzMYXFtNm/hpHf1yaE
	oc4hnRWNDwKri3cul0ShFggOIrC74kwXtQx0negKnwnhyqou7XjpINnoHhcAb8SdWQ4jFo5fqgowc
	XFmgUvp0cSOtd6RftdyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBMY-0000000Gwra-3Sme;
	Thu, 18 Sep 2025 09:55:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBMW-0000000Gwq2-1jBk
	for linux-i3c@lists.infradead.org;
	Thu, 18 Sep 2025 09:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758189336; x=1789725336;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QPBd2rmHbEVccc1KwUlqm2+3s1NAlCKOZ5yQGVmON0s=;
  b=z/7ryx7x+c6w+iBMcL4pX8nxU+c+Z7l/qpDmAzuzzQMdXq8WiDzOge7T
   htq6YSDr4fOPrSVH4400E+d+hB/nyc08Y67MFc9/HEw76Oe2GFzgN2kY9
   7MRokU9n4hu90UmBkRkIJZl6AHzK7WXa1x4/ENaWTrSP8xm37alU3jwep
   awUnPg9FLtxRvKzVrbx/pdNPLaGcUc0ZDYKvQANcbuncm5L/rEHKVpYAS
   1MCd8mMM4Mglb8u+nY5TiXKStScPfS+Kk4cHV5mlmgAF0fo7x/sybDgtc
   EICiejtq0nMz2nHFt2Uylc0fo6yqUKRPt1RzQDFceVHbeFMzU9FybEH/A
   w==;
X-CSE-ConnectionGUID: C2CLuXmBRGGskdefAW9nyg==
X-CSE-MsgGUID: Tfws/mIkQSq4rDARAglOJw==
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="214047280"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2025 02:55:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 02:54:41 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 18 Sep 2025 02:54:37 -0700
From: Durai Manickam KR <durai.manickamkr@microchip.com>
To: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
	<Frank.Li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <balamanikandan.gunasundar@microchip.com>,
	<nicolas.ferre@microchip.com>
CC: Durai Manickam KR <durai.manickamkr@microchip.com>
Subject: [PATCH 1/4] clk: at91: sama7d65: add peripheral clock for I3C
Date: Thu, 18 Sep 2025 15:24:26 +0530
Message-ID: <20250918095429.232710-2-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918095429.232710-1-durai.manickamkr@microchip.com>
References: <20250918095429.232710-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_025536_512212_3EF3E64E 
X-CRM114-Status: UNSURE (   9.79  )
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

Add peripheral clock description for I3C.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
---
 drivers/clk/at91/sama7d65.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index a5d40df8b2f2..84c6bbe20873 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -671,8 +671,9 @@ static struct {
 	{ .n = "udphsa_clk",	.p = PCK_PARENT_HW_MCK5, .id = 99, },
 	{ .n = "udphsb_clk",	.p = PCK_PARENT_HW_MCK5, .id = 100, },
 	{ .n = "uhphs_clk",	.p = PCK_PARENT_HW_MCK5, .id = 101, },
-	{ .n = "dsi_clk",	.p = PCK_PARENT_HW_MCK3, .id = 103, },
-	{ .n = "lvdsc_clk",	.p = PCK_PARENT_HW_MCK3, .id = 104, },
+	{ .n = "dsi_clk",       .p = PCK_PARENT_HW_MCK3, .id = 103, },
+	{ .n = "lvdsc_clk",     .p = PCK_PARENT_HW_MCK3, .id = 104, },
+	{ .n = "i3cc_clk",      .p = PCK_PARENT_HW_MCK8, .id = 105, },
 };
 
 /*
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
