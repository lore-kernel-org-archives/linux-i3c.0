Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6509D41D4A
	for <linux-i3c@archiver.kernel.org>; Wed, 13 Nov 2024 03:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/dgoF2+gZeHvJQPaQtymklD012psBjMp70h27KwlEJM=; b=Ik1CVpVFNyNXox
	nth2Jk3rDu7Hn7s2ij5hcNqllbD17Lolqwcrbo0J5k8XcMbaPTwc9WzFA07kQAcoWAVtbuBJZJIL6
	QV2h3C1BY/HOSKupsXbmrOxG2FWi55aQOCVoIdw13uhxNc7wyqoOG/gMH1qviOWQ86AZ4A6IVgxRD
	bkGv849bOtUVSsbKQQZNxGAPIzorCd/MiB+2QPKVHtwZBHAyA9MSZD/tR5aPmw6v0RXIX4DWaU5zR
	lMZUeG9MAhLgwpranV9z7XSkHTaUKFPL/imf7eWcDwhni/ohymSNU20UL5w53tAnHWtCVk/BY1rGh
	GGScQ70AGMWo+JJBEVsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB4We-00000005hZw-0AHN;
	Wed, 13 Nov 2024 03:58:40 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB4Wa-00000005hWY-3t1O
	for linux-i3c@lists.infradead.org;
	Wed, 13 Nov 2024 03:58:38 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 13 Nov
 2024 11:58:26 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 13 Nov 2024 11:58:26 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <alexandre.belloni@bootlin.com>, <jarkko.nikula@linux.intel.com>,
	<Shyam-sundar.S-k@amd.com>, <Guruvendra.Punugupati@amd.com>,
	<krishnamoorthi.m@amd.com>, <billy_tsai@aspeedtech.com>,
	<linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] i3c: mipi-i3c-hci: Support SETDASA CCC
Date: Wed, 13 Nov 2024 11:58:26 +0800
Message-ID: <20241113035826.923918-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_195837_217568_DD9774AA 
X-CRM114-Status: UNSURE (   9.53  )
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

When the I3C subsystem wants to assign a dynamic address using the SETDASA
CCC, it needs to attach the I3C device with device info that includes only
the static address. In the HCI, if the driver want to send this SETDASA
CCC, a DAT entry is required to temporarily fill the device's static
address into the dynamic address field. Afterward, the reattach API will
be executed to update the DAT with the correct dynamic addrees value.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index a82c47c9986d..6655e8396a35 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -438,7 +438,8 @@ static int i3c_hci_attach_i3c_dev(struct i3c_dev_desc *dev)
 			kfree(dev_data);
 			return ret;
 		}
-		mipi_i3c_hci_dat_v1.set_dynamic_addr(hci, ret, dev->info.dyn_addr);
+		mipi_i3c_hci_dat_v1.set_dynamic_addr(hci, ret,
+						     dev->info.dyn_addr ?: dev->info.static_addr);
 		dev_data->dat_idx = ret;
 	}
 	i3c_dev_set_master_data(dev, dev_data);
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
