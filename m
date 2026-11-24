Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B58A606A338
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Nov 2026 06:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4yVw9/wF;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cK4hkMag
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cuM/A3YohOZ+Ca3Z8g+qfj+uPtOZb6LvoiX9+QUBQSY=; b=4yVw9/wFo80LGOWgTT1Z7HXa2O
	JRiAAaY7jdLbsKfnL9/lX5Z0jWI8Ooc/Z0XjGMMOjNYJvx2KQGuCQQo391gnbGXyoIsL85CXU155P
	LlZdC8trzdjHTSoBytKlxV8y6jRvfqgNOvvsLv4lONKqcZAc5pQalMaRSjD2cLCiMRbj2WCcpDphu
	/TWvHLV+7TSWbho3XZ4Uj4GmAlrpwCiTR7lrsIP3MO+1vD8mZXTBq+VnNf1RsCKEyQj08zH2IM24O
	zzDxEq7KXufyRsVO0o0EdVR5/cQxUVuIzIDNiVxbYSFUgN4Xw5Kdez+QSBoBw1t4xofmWn7Z70Zhd
	lpmFQV3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVjiG-00000005dW3-40uQ;
	Tue, 24 Nov 2026 06:09:08 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVjiE-00000005dV9-1DI3
	for linux-i3c@lists.infradead.org;
	Tue, 24 Nov 2026 06:09:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNfRLQIqJvJNEoTXWCIwA9Cfg65Tmm+72oX3bg2G4LkCPSKOnn5SUGfzlcv306ChogOgoSEPVHy/eqif5y3U0XMd9vPivfuXhjE1w40i6X0b67zjowSgpZxs2qcqhUv0n+hU9tVLCbpE6vTrmBC0/uvx3/WvKdnXdYBs57GkJiylCpCAGnVTOhcIZMaPKPkt6JgjPdF/fJF04OGvce764p7I3AgIvHTLkdPgE0lkug+03KfIDvZoB5a5wH8TIPLsduJe4KPVKJf+7z81neJ5Gu6EEJRLhB5Qn0lI5TF/xiwPxZdZVr3lf0kALThRRfY75W853BRzLbxWS/7PAYoe/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Pf6DGuB5O7H6eurHYlhEkAGJRFo51ETIHTZJKvLn2Y=;
 b=ItubkCtW9TvMN4GI7c977QrcXhFqdMh/BYCsMvdSfq4Jd4HlYtLx6vk0dd+MvtEk4jfjAiyFz7wM6nzwv21vBNxxE7D1WpCB8bNlDWLTX3MXWMwh+t5uuAL/lUJQMq1A2hrxzpDJ/TqjCBOK3WAm/pXUprH03oGIkpg62dsggCgceml5UuqjciB4m7wk6Gs+wQDVEHn+pUw2sFimf2IWOYcB45+/hjMMKQ23zmLQpJcqiXX3g//DZTkEw4uedF2lhes/duiX2DlM7ABl2klXAXCD0YXJfmeQ8N0NO2q3KiDnYUY7GI3pC8BWxQinypyYaq3AqLqo90NDq18R1kSiLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Pf6DGuB5O7H6eurHYlhEkAGJRFo51ETIHTZJKvLn2Y=;
 b=cK4hkMagdNRZZ+7dCCUzBAeIY3X2CbqnNGxVhH2mR4HeVQiI+CtjYIwYraxhQvJntquROkQRkepT/rNr75/7TasHDd5kIRQ5m0RuCkeB6hSjwHkTLnENYJqqomsO2W6cGR79E9X/im9GbGXznKOTc7S7LnZ7AgHJ+dowO2mvQQI=
Received: from PH7P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::28)
 by DS1PR12MB999187.namprd12.prod.outlook.com (2603:10b6:8:495::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 06:08:58 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:510:32a:cafe::5a) by PH7P221CA0009.outlook.office365.com
 (2603:10b6:510:32a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 06:08:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 06:08:56 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 00:08:44 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 00:07:15 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 00:07:12 -0600
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>
CC: Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston
	<matt@codeconstruct.com.au>, <linux-i3c@lists.infradead.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<meaganlloyd@linux.microsoft.com>, <git@amd.com>, Shubham Patil
	<shubhamsanjay.patil@amd.com>
Subject: [PATCH v3 2/3] i3c: dw: Track the transmit and receive buffer depths separately
Date: Tue, 24 Nov 2026 11:36:50 +0530
Message-ID: <20261124060651.1987454-3-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124060651.1987454-1-shubhamsanjay.patil@amd.com>
References: <20261124060651.1987454-1-shubhamsanjay.patil@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|DS1PR12MB999187:EE_
X-MS-Office365-Filtering-Correlation-Id: e0b7b956-87df-48bb-8501-08df49f16c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|261009221227099003|261009221727099003|261009223027099003|261009220027099003|261009223327099003|22082099003|18002099003|3023799007|56012099006|11063799006|261028144727099003|261102123227099003|261026140227099003|261026121527099003|261021123027099003|261022105027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: bb9JjsT86TuEOA5VokgniyMdJ7P/QKN7wQv4kaarF3a84WIHwBSl4otYFhH80yD9zJYmKcGULOIpn+b2758/1SKiRpz2Qi7hyvLjbB5wb6MmBPQhZ4+xRmpojQElMQsHdudEGbaTRX5v2uCpQCbfYvrGAlhABxKKxxx/yLJ09YAM7zvSkJdiqby4ItDkW4Zom9AGHzTDShwwDRsU52gQhvWg5Z2YJyOaosEBkZ75L73Z6GCpWLaHAO9uQsrHETNCu+i8qLDzxLxy+FzEP/2En00bgYvpdYc/LD8fSLLr3jLShlr7pxyHFjHIeb2Eq5lh2Zfa/upF8WC4fTukGX+3LOxWkqPey5BElmmAqtpUHrweDyfkvCcULvEmgOmjfImTyYCND/ShNrHJbyLgxc1+uez3h0q+uExDwxd0E0zG2Q/CSS/RB9Qe87N2lry1RnBlWSkYohw9+GQHKlCwX558afuxPsylZ0APX6YYXNx4Eizw6xFXNzP+dhX2MnCTcxucI+i8HMewX/IlQxe9r84VBgUc8do2V9Foe9xAfsWdTgg2BzrS29Qhd0JytblsyTZT9ZfBdhUWU1ICUnGNxSwJfxhQHEonm+AKOrxgZh39Sw1Hw1UnSOYxHbPjXMVmPS0BuVsqOgOr3+samVaNsmfQcgky2mhASKLhYYButfhuVI3kBNsX0BtMhu4aEivMfwBbp6QKW6JqNXIdAn2XiNgwdQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(261009221227099003)(261009221727099003)(261009223027099003)(261009220027099003)(261009223327099003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261021123027099003)(261022105027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VoH7iI/ftHs7c7+9eVsO9jq04YC7to075g0bXSX4PMsJHOnYjSZW7i1OOhFvsrhdES165uXRlypmpoCqUM17nq+gZIX+6EItjq4DgYjBbnQLc6yf1v6zhd9QZPrB+OW7z6+Nro/3AxmPKEdAzeH25yRJunDmoYedLU+SDe+gLdIRYA612w10e4AyWTv4xQtTtGN0uxhhVDJIgvkWRUe3uoGgpc+cNJlbC1Alwt0bNt5Hst4o0xBGo/36MLhtzBcE8D53Eu/DIw8fzg0WSLipQRpMMUW44TayMcV5zzcDW/YGuvCDUpKkrS17xWrD/NHkTKnGXOPhSSosgu5QHXsL2AOfHGG48ZllVejzFvqchUZi2d/b8dkY6Fy93x8aKXA/EXt9JQ+JZaXz0LNyzGxeTtkPZ7CKas03UzEFDZrAqZcnbAnIzYQDlDlYX1wCoosI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:08:56.6022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b7b956-87df-48bb-8501-08df49f16c88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR12MB999187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_220906_333617_C23C7CC2 
X-CRM114-Status: GOOD (  18.11  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The driver currently uses the transmit buffer depth to validate both
transmit and receive transfers. Since the transmit and receive buffers
can have different capacities, receive transfers must instead be
validated against the receive buffer depth.

QUEUE_SIZE_CAPABILITY reports the configured size of each buffer. Take
the receive depth from there, leave the transmit and command depths on
the status level registers they already use, and split
caps.datafifodepth into caps.txfifodepth and caps.rxfifodepth so that
each direction is checked against its own buffer.

That register was already defined at the right offset, but under a name
that does not appear in the databook and with no user at all. Rename
EXTENDED_CAPABILITY to QUEUE_SIZE_CAPABILITY and add the field
accessor.

The DesignWare I2C/I3C databook, section 11.1.58 ("QUEUE_SIZE_CAPABILITY"),
defines RX_BUF_SIZE in bits [7:4]. The documented encodings 0 through 5
represent 2 through 64 DWORDs, respectively, corresponding to
2U << RX_BUF_SIZE.

Publish both depths in bytes through base.max_tx_bytes and
base.max_rx_bytes, so that device drivers can size a transfer this
controller will accept.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
Changes in v3:
- Use FIELD_GET() and a u32 variable for RX_BUF_SIZE extraction.
- Use sizeof(u32) for byte conversion and the renamed controller fields.
- Add the RX_BUF_SIZE encoding and databook reference.

 drivers/i3c/master/dw-i3c-master.c | 24 +++++++++++++++++-------
 drivers/i3c/master/dw-i3c-master.h |  3 ++-
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d1119f203d1b..21bd94e5a6be 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -203,7 +203,10 @@
 #define BUS_IDLE_TIMING			0xd8
 #define I3C_VER_ID			0xe0
 #define I3C_VER_TYPE			0xe4
-#define EXTENDED_CAPABILITY		0xe8
+#define QUEUE_SIZE_CAPABILITY		0xe8
+#define QUEUE_SIZE_CAPABILITY_RX_BUF(x)	FIELD_GET(GENMASK(7, 4), (x))
+/* Sizes are encoded, 0 meaning 2 DWORDs and every further step doubling it. */
+#define QUEUE_SIZE_TO_DWORDS(x)		(2U << (x))
 #define SLAVE_CONFIG			0xec
 
 #define DYN_ADDR_LO_MASK GENMASK(4, 0)
@@ -978,8 +981,8 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 			ntxwords += DIV_ROUND_UP(i3c_xfers[i].len, 4);
 	}
 
-	if (ntxwords > master->caps.datafifodepth ||
-	    nrxwords > master->caps.datafifodepth)
+	if (ntxwords > master->caps.txfifodepth ||
+	    nrxwords > master->caps.rxfifodepth)
 		return -EOPNOTSUPP;
 
 	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, i3c_nxfers);
@@ -1136,8 +1139,8 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 			ntxwords += DIV_ROUND_UP(i2c_xfers[i].len, 4);
 	}
 
-	if (ntxwords > master->caps.datafifodepth ||
-	    nrxwords > master->caps.datafifodepth)
+	if (ntxwords > master->caps.txfifodepth ||
+	    nrxwords > master->caps.rxfifodepth)
 		return -EOPNOTSUPP;
 
 	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, i2c_nxfers);
@@ -1666,7 +1669,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 			struct platform_device *pdev)
 {
 	int ret, irq;
-	u32 thld_ctrl;
+	u32 thld_ctrl, val;
 	const struct dw_i3c_drvdata *drvdata;
 	unsigned long quirks = 0;
 
@@ -1738,7 +1741,14 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	master->caps.cmdfifodepth = QUEUE_STATUS_LEVEL_CMD(ret);
 
 	ret = readl(master->regs + DATA_BUFFER_STATUS_LEVEL);
-	master->caps.datafifodepth = DATA_BUFFER_STATUS_LEVEL_TX(ret);
+	master->caps.txfifodepth = DATA_BUFFER_STATUS_LEVEL_TX(ret);
+
+	val = readl(master->regs + QUEUE_SIZE_CAPABILITY);
+	master->caps.rxfifodepth =
+		QUEUE_SIZE_TO_DWORDS(QUEUE_SIZE_CAPABILITY_RX_BUF(val));
+
+	master->base.max_tx_bytes = master->caps.txfifodepth * sizeof(u32);
+	master->base.max_rx_bytes = master->caps.rxfifodepth * sizeof(u32);
 
 	ret = readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
 	master->datstartaddr = ret;
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index f5b4491b247a..e23554bfc5e4 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -14,7 +14,8 @@
 
 struct dw_i3c_master_caps {
 	u8 cmdfifodepth;
-	u8 datafifodepth;
+	u8 txfifodepth;
+	u8 rxfifodepth;
 };
 
 struct dw_i3c_dat_entry {
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
