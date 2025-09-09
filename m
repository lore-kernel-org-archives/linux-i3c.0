Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F984CAC595
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Sep 2025 17:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qu/QEc+j4+GUwTPSr6YAehVd8AblI8DbByPbINkM9eE=; b=zlwhO5TyzZzbtW
	tyL7n6OuCcnxv6p9OH75Xtp0SOTwOHWfVTwaDjkg2YtrxLxEwqNA2GjxlwtMEQ1YE+17zp9XQFRO8
	Wamz+o4Ev7xq71LYxhVgRYdaRqCWqzPz+0iRhk/k+viTPuYCN1vQddD5MPcOKYBmQwYRYc5cqIgB/
	hcvoUWH2VvU9ezVkI/0uQcoqo2GJNScvcF7EWwNtNnmLM2zabzuEB4N22Rjum3odOEAgPRuo5eF9u
	0t1t46twh9sYOmDD/rCp3B4gRZCcDAIyskVI9m9HQT8EAznYKHuUBB+29p6L+0cD04ZrRgo0MqfSM
	5r2gnjwBv03T1YKwblbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1vB-00000008mgv-1jxS;
	Tue, 09 Sep 2025 17:14:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwIU-00000006eC9-1XqZ
	for linux-i3c@bombadil.infradead.org;
	Tue, 09 Sep 2025 11:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2hoOxHgMuTOoOAm+5X20muVi2uGUXAt29+Ho6tF0bcE=; b=kVwMoUFDmOV4mCXKtaeqcU8zMA
	hsJ82kMPCclHA8MgB4dDLOQX6vaI9OIVIN/TXEqcuW1RAZRMbxmVFR2FqobkQTGeVO02moAHqqFf7
	Gi0Q02YGyAClQRunPnA3i4EvzhDUswlymckUACzO4r4KXTMUDCE5Dgj1uBANxVHD9GL6kPEMWhAXS
	Eu4K/6P5m6i7ArwEYziI9JngAdMRtHjG1iNhT3YJBN0eXaVLHu1nk2aKfZHq6a5x18euj4xBI/qlf
	DABfWpWISngpgGsPD3dwMOFKM7P2JAWfv801iBu+dGbBqS6t6iee3sJ+HHpZlEbM7CGPFrKFC86Js
	lrurJCUg==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwIQ-00000005IZh-1Sb2
	for linux-i3c@lists.infradead.org;
	Tue, 09 Sep 2025 11:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757416438; x=1788952438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QPBd2rmHbEVccc1KwUlqm2+3s1NAlCKOZ5yQGVmON0s=;
  b=oUAfeIdPf8YCDtFPcausNqQ59aJg6eT0SgEaO9wr3t43Is4Wm4yvrrSd
   wVNWVktuuJq/1uVP8IEjQeI4jpyyK9sgpVC+mKCOxnLfMJUv5jea0IAaB
   mCXVFMbEQdf0F+zt12pZtaLC5NLLA1GyuDU43TgcTAkvx4Om3neMoyAzm
   XNyVZrX7UKWdzbYsALjImmVbC0u70d6RKu9KqFLYG/muRy49MFcOI/0ti
   gWK5Y6WuhA7oABT1JtfmoJA9LcOtGlRajhZ26o9eVoQmKdvYM0VzPs39v
   qmpt/5mIJYi26c3ASQW/4SKBHENBFHvsbix91laiqVbp0tVNm9DC6Bt7B
   w==;
X-CSE-ConnectionGUID: ARS+qEZySeuUoMKxmSXXIQ==
X-CSE-MsgGUID: QF6Fn9i0SsiX6+92XeCY2A==
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="52018064"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2025 04:13:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 9 Sep 2025 04:13:52 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 9 Sep 2025 04:13:46 -0700
From: Durai Manickam KR <durai.manickamkr@microchip.com>
To: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
	<Frank.Li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <balamanikandan.gunasundar@microchip.com>,
	<nicolas.ferre@microchip.com>
CC: Durai Manickam KR <durai.manickamkr@microchip.com>
Subject: [PATCH 1/4] clk: at91: sama7d65: add peripheral clock for I3C
Date: Tue, 9 Sep 2025 16:43:30 +0530
Message-ID: <20250909111333.170016-2-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909111333.170016-1-durai.manickamkr@microchip.com>
References: <20250909111333.170016-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_121358_953698_F4FA72DE 
X-CRM114-Status: UNSURE (   9.70  )
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
