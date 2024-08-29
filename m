Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108D3C8300F
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2024 09:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHx9v89ttWspLCMrJvZq96GJbvG00Y6OV4gJwIQMAls=; b=bKo0RJxRyM5puk
	N+Rpd6ReW+yVqO+oXOFbf2g5phSqewKHLSk2Z2vnn0H2dYl93eGYfre0kUzUqLvFB/4WjQqUUb4o6
	bj+ZotzGSCbOJbZ/aJwrYahNm3PI4LuB0bu9NpYJl7kGoTTAnQtG84yOB5zZsoBWiB+JYhPxq56XN
	9Dq2Uv+eafmCtzVGjO9aBGPyGcVFoTNMVZqViiSSW3hiamTBV2uI9LQokz6Cz0V1BBvIQplPnMGz/
	x/d9Rk0TWCMMDx3h26jqvsVaAe1UJzbRBDsj51Xa2a3O80DfIyPm0Nr1oKzML/LMwebjTSXyoicb6
	AJn4EFk9YDa8mGmRCY7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjbIH-00000001KNW-328h;
	Thu, 29 Aug 2024 09:18:17 +0000
Received: from mail-co1nam11on2062a.outbound.protection.outlook.com ([2a01:111:f403:2416::62a] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjbIE-00000001KKE-3Sgh
	for linux-i3c@lists.infradead.org;
	Thu, 29 Aug 2024 09:18:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ov+96bNuEliVnB1waWh/mxfuH3T+gHdi974yNis6Z1S7kz0ub1JzRd1PSBahM33gLhu39n9bmbehIfMwQAiKpD/Tod+rvohrgL1zk3lfbtOQSF4oP82Cc/fpllVbwKhpe8GjKjEeeRQt685ur1978fIaLEGAtlNJ3ikklssteruYcmli+xFFOqRP45sWeyy+amuTc+0mxCSXt0kISB832y6v+yVvWKdT9dpcS1VF7GhZwY52d92ibWtgiaBADi3sChVzUFYN0mEEAQf/A6zsBoC9gwS2JoI6mW44/buhkcMr6/U663sDWvMVE16k97MWjg37qB816SM1RN9Ai7tlvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xbg0qkfhOolBOgB4wq2O2qvTMJYxtirSIgzI33VZFwA=;
 b=V+7rin9jub+K2JX69DXTrFrI9XM4LtGgeE6nV2x1bs+/7vcnuxE4st7MOiVFXGXVxiP39PPvuEphW16WR2pJaQTlaefOgEKyUZEVEtDsScKT4aY0Pdp8/1fPfw4LyKUm6IyeqvQ45Api1ZNpNeq2++m98obVbjOBtV2EoRl7j/EbKgvEgQRlIlT7NHd3Q1UcC4KvUgg1hnpWlbTPWU7NcOggHJosi6gZiiWyn2edxc1OPlcSFSv95wB8auKS2Iyc9qMajEBcGVXQ3HGXod9vOjYnI9Lu88YGqmyDYsaP/DEi2peAFODdtkmLvT6zergk/F04dIzb2xch/wmuy1rwOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xbg0qkfhOolBOgB4wq2O2qvTMJYxtirSIgzI33VZFwA=;
 b=AIFBsgS4g1rn/eo0IjD6ujqCrPAqOZwLtTHJXnAsW88mekYXovZPEStoP54Ioa9fdH/Nn+K/ORDQUqN6ZSJXi/VgrCdRrB271XBk8fWQxhvHkqfjtupfQ/MKBuO/b/pCoq8R3LR6mN/z83QG5O34ljo/HVaS3cyGQEzHvCi9IM0=
Received: from BN9PR03CA0954.namprd03.prod.outlook.com (2603:10b6:408:108::29)
 by DS7PR12MB6261.namprd12.prod.outlook.com (2603:10b6:8:97::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 09:18:06 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:108:cafe::c3) by BN9PR03CA0954.outlook.office365.com
 (2603:10b6:408:108::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28 via Frontend
 Transport; Thu, 29 Aug 2024 09:18:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7939.2 via Frontend Transport; Thu, 29 Aug 2024 09:18:05 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 04:18:01 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 6/6] i3c: mipi-i3c-hci: Add a quirk to set Response buffer threshold
Date: Thu, 29 Aug 2024 14:47:13 +0530
Message-ID: <20240829091713.736217-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829091713.736217-1-Shyam-sundar.S-k@amd.com>
References: <20240829091713.736217-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|DS7PR12MB6261:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a3b967-c155-41e0-1523-08dcc80b7dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q8x6siZSmv044SyebxDvj77zPd6YZgAPPbiNNDNiwuTIcdi9g2bfle6lVRqW?=
 =?us-ascii?Q?nUS6Wob2g/XQlLmezs0TlfO90Mcz4rezLHKP8Af14dRBWr5ypDKizJYGLzlz?=
 =?us-ascii?Q?RwmLQCVMpAblFyghfLDMZ9z8v/+wJBvovqLn4KV/xQeCpk5Q6HwUbMPMd8r/?=
 =?us-ascii?Q?o4ROoEcTcEOfgJf4Lcnh0QqtzeLCCVWdJqpzFFADjjQNJawfX3bmNQcUjWT6?=
 =?us-ascii?Q?iXKftpsBiQWMKXYcqmKA9bbtAh5RCub8vMhVkG2QsB2NMIhgQklxQGo2C+uG?=
 =?us-ascii?Q?5kPWSGYbq02jG3OGmqvOHmkpvHsot8wz98JOw7S5mWdf25EunDsQhC6p26Oh?=
 =?us-ascii?Q?U9a4sTQPUmnVtbYjKE3hC3D8OCsrH690RSeGFfzM2JPQyTQAVWwbq9Q6zbyT?=
 =?us-ascii?Q?HyIPQcPbT5QHbwzirPGyEI+zGBxgY0YvMKq27P8Kw5sGdjsOPAdisJa68PYI?=
 =?us-ascii?Q?0WxqEjHYYtM40RlGTjJoGBF647hl7OT2D9kEzMWf4GTQKDmVblz5Jn+m28sq?=
 =?us-ascii?Q?qGtDz7U2klEU51fPVXFhj3KdTgy6BpIMWlCcbvAFyjZSj8X5zSafk5ySK/P7?=
 =?us-ascii?Q?xK2AqrM795nyT5suYa5wnaTWoUscIvZicE+xzV+ak6vHAgjmswstdrtTOp72?=
 =?us-ascii?Q?mMzJ10ta1IySTqEF0nhWvUC8bxrQ5j1Rwfe+kmerTGAsMFA0pIEW8pR71cRR?=
 =?us-ascii?Q?KARoMc617vGLVR7i50/wIZx56OBhzkOECe5B5bSaPC58leLlDTOhXC5OGxsy?=
 =?us-ascii?Q?tf7HLhI/tZaltuiBlIfJSJEjgIeuHQ93/wyBt3VkGy/Lc7Lg4z5OkG7zowN5?=
 =?us-ascii?Q?WhEphjVyA25Pvz79kU/8cOozGDVkt/wZ2XbhlebVA7Y29BndroY7+DQrFZoZ?=
 =?us-ascii?Q?4+/5Su/LepQhm6d0k3XeqRq7OC92Ek6SCIBvupROEohZZfJxj7NmS/3Bg8Qd?=
 =?us-ascii?Q?qacfgmG4AEcsUY/MG5+42fM3zCq+tB4WPQIxTvHr5aRT5kZviawAiJgyRQGU?=
 =?us-ascii?Q?oUgCXqKdjEuGLanvaRjepj9UX8Ovg/vrbNKw2F9N0snOtk6x3dheh4A0r3m3?=
 =?us-ascii?Q?yvTe/PETAW5nqN3k9v08cJW5UEuhyKAwOEn8vx8WdG9A3Xg/ULY+AOrrhuly?=
 =?us-ascii?Q?IL4WwrZ9YRU4sMhUNjDQowcB9KRtp9O1SXoyyji9xoci4KlK/YMWLaTIvdKP?=
 =?us-ascii?Q?EyUZalzSTtXuksh3LoICBj4goL6JUTxzwsJDmH2DLqqpp8+h2s8H2/TXn9bQ?=
 =?us-ascii?Q?WMO3XAPBi1b8rvkkCLOQP1v4CBoHYYrqAM92nMKFYWXeQqQiGrHMjPaRGPsi?=
 =?us-ascii?Q?V7Oo2jfqe+J86+VGHsN/0jIhUx+KLaB0cX9Mvb1Q7LPeq9UrrE4Aw3iqzrR+?=
 =?us-ascii?Q?oetaKwlXAIfd+jfcdlOoEhocZBNHh2xXya6gLe6yu98sosr6NDcSsYe1/hS5?=
 =?us-ascii?Q?INLY+u4pyEA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 09:18:05.9467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a3b967-c155-41e0-1523-08dcc80b7dd9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6261
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_021814_904171_A64A51B1 
X-CRM114-Status: GOOD (  15.91  )
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

The current driver sets the response buffer threshold value to 1
(N+1, 2 DWORDS) in the QUEUE THRESHOLD register. However, the AMD
I3C controller only generates interrupts when the response buffer
threshold value is set to 0 (1 DWORD).

Therefore, a quirk is added to set the response buffer threshold value
to 0.

Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Co-developed-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
Signed-off-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
Co-developed-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c       |  6 +++++-
 drivers/i3c/master/mipi-i3c-hci/hci.h        |  2 ++
 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c | 11 +++++++++++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index f9ce0ee2cfd5..a82c47c9986d 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -146,6 +146,10 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
 	if (ret)
 		return ret;
 
+	/* Set RESP_BUF_THLD to 0(n) to get 1(n+1) response */
+	if (hci->quirks & HCI_QUIRK_RESP_BUF_THLD)
+		amd_set_resp_buf_thld(hci);
+
 	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
 	DBG("HC_CONTROL = %#x", reg_read(HC_CONTROL));
 
@@ -842,7 +846,7 @@ static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
 MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
 
 static const struct acpi_device_id i3c_hci_acpi_match[] = {
-	{ "AMDI5017", HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING },
+	{ "AMDI5017", HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING | HCI_QUIRK_RESP_BUF_THLD },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 361e1366fe38..aaa47ac47381 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -142,6 +142,7 @@ struct i3c_hci_dev_data {
 #define HCI_QUIRK_RAW_CCC	BIT(1)	/* CCC framing must be explicit */
 #define HCI_QUIRK_PIO_MODE	BIT(2)  /* Set PIO mode for AMD platforms */
 #define HCI_QUIRK_OD_PP_TIMING		BIT(3)  /* Set OD and PP timings for AMD platforms */
+#define HCI_QUIRK_RESP_BUF_THLD		BIT(4)  /* Set resp buf thld to 0 for AMD platforms */
 
 
 /* global functions */
@@ -149,5 +150,6 @@ void mipi_i3c_hci_resume(struct i3c_hci *hci);
 void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
 void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
 void amd_set_od_pp_timing(struct i3c_hci *hci);
+void amd_set_resp_buf_thld(struct i3c_hci *hci);
 
 #endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c b/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c
index e8ea4d101f66..3b9c6e76c536 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c
+++ b/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c
@@ -20,6 +20,8 @@
 #define AMD_SCL_I3C_OD_TIMING          0x00cf00cf
 #define AMD_SCL_I3C_PP_TIMING          0x00160016
 
+#define QUEUE_THLD_CTRL                0xD0
+
 void amd_set_od_pp_timing(struct i3c_hci *hci)
 {
 	u32 data;
@@ -31,3 +33,12 @@ void amd_set_od_pp_timing(struct i3c_hci *hci)
 	data |= W0_MASK(18, 16);
 	reg_write(HCI_SDA_HOLD_SWITCH_DLY_TIMING, data);
 }
+
+void amd_set_resp_buf_thld(struct i3c_hci *hci)
+{
+	u32 data;
+
+	data = reg_read(QUEUE_THLD_CTRL);
+	data = data & ~W0_MASK(15, 8);
+	reg_write(QUEUE_THLD_CTRL, data);
+}
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
