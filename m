Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8884C52D7C
	for <linux-i3c@archiver.kernel.org>; Wed, 21 Aug 2024 13:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dVRoRl67CcBHIsS0psvEQgZyErf8Dt4iCrBH1hChKZk=; b=O94wgCCqvkBzgw
	drzHIixKSwVuDMbpzusDpSG+RroClHTEGiHb4L4ljpwG8O8cOWpX1LIwWrfa9cRoHPoT2UTqEbglX
	tqbv325NOvyhLkcKdw4NEwVShZFzax578q5+D8qeUGzKo5vm2YKzyUZ48lVJ689GcUaZW47S0a2wJ
	xtyiWuDB9WCbWftGE4ZxVrHwzc7vDxAw5gdrVdqvSS+cuKGVEi2C9I3DGzeolJxheMDlwGok1eour
	XalCdu412PnF1qxkcaw0kmWrj5YI+b6YYVM52WSW/+oSHEimqQcWEd0wHaYbNOQklyNmUylyx7jSs
	u2lANckqJekIZ7cqtBMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sglW6-000000099Go-1jGd;
	Wed, 21 Aug 2024 13:36:50 +0000
Received: from mail-mw2nam12on2062d.outbound.protection.outlook.com ([2a01:111:f403:200a::62d] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sglW3-000000099EJ-1fMK
	for linux-i3c@lists.infradead.org;
	Wed, 21 Aug 2024 13:36:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAD+8FhbyQUVpVQEzQFVRGMCT9dKNj6teY1qiKsEZysGFVBFray6Ebq48HSFLQZZxYW6bVFRDKLu7lfxmo9Kx+vAyUT/GIbav5GqBanNufdgFN9PhMUZHQ6CTIx0m8N157IwaCemkex9huUEvXzV4Na3f1cxOKwXtYXI6e0I3IPr+4A3wz5sm45AlLcPzmbuEFfU3y/2gNse5OgO9+/R/cgoxEBL7AE3xgPCwojLxMBwwEc8eEKbtM8eVX0kDDQ5/8skUhbuD+QfhPB+hS0sEFT/2M5RuWdbvOCt8Ltc2oMrgNV8kscjPFNCnvRJ5YGP2j/T8xUrCoNPKIzj7c7+4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18bYtc8BikfyPBu0K2CuzBkorByqC2GbFyFUD2nqDFU=;
 b=c5bjUgIWH17lgU4x9hgxs+rnfT8iXAaQ2DQkvv3+fIARsovXkv/Aig4X28IJZzyA9naN7rv2AsIPi5M14Ln2ayHxXKXztwjgMB28FWFiYMnpxp0i5ONO4wiQ4/st+ogdVwntyb0EooZrWbV8sW4Wo97ULLnrRIlPPMnsVO5HWg9xsVC7xLUZu3H4C/XG7rS1bEJiq6qf1c8jcPp4SkO6iY4Us0yJ70QDtT137zo6GENTtOpTQd0NmeZ8KZiiVY0s+HyI5L3QEF30bh9sFmiMpWnWeKH0Zj4oKCzHbwOqDCj5Sc5g+A0nrCa6oIzEuqfyeKkcTPiqvfXXQaddUcdmZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18bYtc8BikfyPBu0K2CuzBkorByqC2GbFyFUD2nqDFU=;
 b=RWepL+UNcpdu4ib0UPQkX5cvWffr6Om935q7L/aRTcN+eapvqANvr5dqZ4jFNN+MtryiKbUDUi2TkFrg9J9Fhyq9k5BoofYHOD2JuZ4Hh5IswjxZI5/1/hozsdR2nUrtiBs5A7m73WYxVaai1mgMKyvk97mwHFC0J5Vna+KiJqA=
Received: from BN0PR04CA0081.namprd04.prod.outlook.com (2603:10b6:408:ea::26)
 by MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Wed, 21 Aug
 2024 13:36:42 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:408:ea:cafe::d1) by BN0PR04CA0081.outlook.office365.com
 (2603:10b6:408:ea::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.22 via Frontend
 Transport; Wed, 21 Aug 2024 13:36:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.4 via Frontend Transport; Wed, 21 Aug 2024 13:36:41 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 08:36:39 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 6/6] i3c: mipi-i3c-hci: Add a quirk to set Response buffer threshold
Date: Wed, 21 Aug 2024 19:05:54 +0530
Message-ID: <20240821133554.391937-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821133554.391937-1-Shyam-sundar.S-k@amd.com>
References: <20240821133554.391937-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|MN2PR12MB4192:EE_
X-MS-Office365-Filtering-Correlation-Id: e34b4780-b23c-420a-a422-08dcc1e64aae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RuP8odDTxHl4oYJfMnmGb73XwDhIzNPcqWXRX23kZl8BWwfPc5GhUaqOv7K1?=
 =?us-ascii?Q?tPRxWNWn8eXtKiC7cznBNcywua8CKR3mQFtiFJLkFzfO1YZw6P0zVS9iDX/m?=
 =?us-ascii?Q?7ERMVphvh4fYB/2CUthZrmpdcqodBeTk2wzGDxloDSx3D+twy9TsdUy1Iqtg?=
 =?us-ascii?Q?rehXfMyv1Gc8hmQ0t8oRq5FHTp81iV5XhnLXeD+IZBq/bmd7UNFKRPdhFcWw?=
 =?us-ascii?Q?nlnm8tYccfdbJ3BWPSWvHft/VzlXzRXFYT6Wg9rFt2QbpJcxJ4Wx0uEVCR1Q?=
 =?us-ascii?Q?BghrihSfOxxvSqDCWu911qMbZ6tgfFULzqkieIy9S4+6eMvhADih06c72lw/?=
 =?us-ascii?Q?ogBn1ESOy0rgFWWBYs6sQrR+jlNYeQ8WR8m1ak3e+GfeSeQ7XLYqgBfi0aW2?=
 =?us-ascii?Q?h7Zo2MdXTR22G0SgRjIRVaJYqY/IIDj7OMAtgXxjJ0ePv1LSIOMAf2PM0flQ?=
 =?us-ascii?Q?2JdGESg/8Pu0Yj+4naaOGv0rdBeTwYg7yQFbABet6qttV198rcn908t2gXgX?=
 =?us-ascii?Q?NbqnqMc+DA6FJMLy91yBtQm8funuZ+foetzfx8OAGub72c5oqtElI7YIS+7N?=
 =?us-ascii?Q?mgBJOchkRy9wPZv0j8bQdX0VPzhbyegi0980yGOX4dqps21TQD78BElj/FL/?=
 =?us-ascii?Q?6QCmgnYn7q/CP1CEc666jF731YR7FWv5YKF+ksthu3+Q1uGzqpllesiBmcDY?=
 =?us-ascii?Q?vOxXebx2G+mpXiY3QAa+0A+7065uZEUDBmlqOJvoalCgo5kh79mfYVF3gNZ0?=
 =?us-ascii?Q?bIyV1RUQ0/8vpYj8TgbXAzvcUIFwp2KTu69/IRfLRtkt+kn3gXYD/55g+Kr2?=
 =?us-ascii?Q?qZpL0vmbw21dg+069mbghhJ4QBCxMgRqZ9JFBR2k7gcSahkC6EVAhhkaqJkO?=
 =?us-ascii?Q?fCSp+7h1ZWqUkdoRB6ybc13UEtrpjsC1aAVTi4xPx7r3KlWqGpCbYwkVfzvK?=
 =?us-ascii?Q?iMperPWEHIdxbwDyxEO7WbGCcb0qt/RB1ivrZm7zPW+Exhio0xkuqMrZN+lM?=
 =?us-ascii?Q?Hw6ppbd1sZ3qaSTeggQMp6rcSm/WKeURCkPQ1FRjbMKEOHR7n8Km5Nw5KHjr?=
 =?us-ascii?Q?h0P/I26fjlz2NSgzmm+SJ97gbY0T5xpK5wkojl7xhni5LLC9WQHDkMEf8PJo?=
 =?us-ascii?Q?nfs5lZ9bEAmonkaW93uRVpbkRtiS+To3nNISD+Xh/lP4W8SdYXK2V7/893mO?=
 =?us-ascii?Q?+2dm9YPQwxKuRcnI5QV6JxBBOpXi1vNF0/EOcQsC+fxh39qHwY2QHqmBhIpU?=
 =?us-ascii?Q?y8eTfO6jqhCl4fuNVGJBXJOgSk6Wr3P7ggBDYUb7yrUkEuKTdh5ZOnRRDtTb?=
 =?us-ascii?Q?PzFHLSn6334aNvIP+uEmkkpxzkakarvb6tzaRYXmcr5ye0Rzs+2NacZuUH0R?=
 =?us-ascii?Q?BncMVCPbqPAPqeUfFCiargoAVX1TAa5kNfKlZKVywY2FfuvR4K/wLCDB1Pcw?=
 =?us-ascii?Q?FwbvoG960YU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 13:36:41.8740
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e34b4780-b23c-420a-a422-08dcc1e64aae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_063647_463556_80285532 
X-CRM114-Status: GOOD (  16.11  )
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
index fe49765fc2da..094a93353280 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -147,6 +147,10 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
 	if (ret)
 		return ret;
 
+	/* Set RESP_BUF_THLD to 0(n) to get 1(n+1) response */
+	if (hci->quirks & HCI_QUIRK_RESP_BUF_THLD)
+		amd_set_resp_buf_thld(hci);
+
 	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
 	DBG("HC_CONTROL = %#x", reg_read(HC_CONTROL));
 
@@ -841,7 +845,7 @@ static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
 MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
 
 static const struct acpi_device_id i3c_hci_acpi_match[] = {
-	{"AMDI5017", HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING},
+	{"AMDI5017", HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING | HCI_QUIRK_RESP_BUF_THLD},
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
