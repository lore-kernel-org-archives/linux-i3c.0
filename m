Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20E1C5321E
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 14:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LbZcY5mTBX5vRWyxhYr2LS2fNZv87woeqQTI1hNrPb0=; b=AJvAjDCmTwsFY6
	tuzLmkkg08MaiBNGzSIxAY8ws1Z1m7s0FjlnkvBYKVXz/tHATswM6yGEN9RHAT0HxKrLDNQJXBgEF
	ltQuhJEdktjyt8kUzm7oUoPFGSqDkw12he/0UFtClRdQVKQ7RdXlfy+LxJhSpaVI34Df4gBVju8yc
	w31a0cRHZ8pJnZVMv5VjbuWTwFTQzzcXM4kqkyC+/Rhl3jrPCQCSG7XkG0SVxt5MZ7OTGXFatSnBF
	HJLb4HAaeJMNp9e6pLtFhGhV9SFy/Uj8XTuy9xKhALkjduNq8ER+v0YzjOkc2rUbc703nzK2W7mzU
	p8wOG5puf+T2TIIsA8Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shVAs-0000000H4Ra-2YZe;
	Fri, 23 Aug 2024 14:21:58 +0000
Received: from mail-co1nam11on20631.outbound.protection.outlook.com ([2a01:111:f403:2416::631] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shVAA-0000000H4HG-0nlA
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 14:21:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IduLOnXr00LUr/TcNSvaLaTAsPn1ImLUJbL5PoK6eRkddfeXxS4cMG37u1ZriycEAM7GMbAT75gtHQ+d4jniuJhxxz7KJByIQQ0UVVCP64SnWCwL/F9mm+u+J2zCP2aLrpR5kGfnJcrAIYuP31t00YeCKU4PAa24mKIi1HWDarWpUFXLQgi0NjUvf8POtVP+ZGA8CSE95abzd2wGwIzAFaTC3getWMLh7azbsRljtroPU70Ij3fT7ghNW3vtlVEBdoPCszFF8SMgWOcoG580c+UmVx+gJbHiUDqk9yqEY4U+g5cyg+HTc+M2hnxpFMhQvLNMkE84h2VEZQRLFeIcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plCBiXczcfa3cQMdMY1qi4Wnpdsx9NRUXYR2EcbtojI=;
 b=JxOxFMLTzts6IoOORmIlQIzcOfGiVxysUQQHX2Vz2HlqfEQECZUpElKVtrpOO45fWt7xYGc8zTxmPn4VoKetZ3EKJC9yvgUGGum0TeucQ8KdMyhTizJunqjB2xfWqvVSBI3uLNapAxX3s5jkfjJwW7n8LBYYCdPSnp9ZkBq91KavINhfw1HBPVWZlqe+acLb1PjDQMiDAlphtvxZ3KbRxNdT1gLKm485twOVvbUsZONusZhW+HJNuQAj3rVt2tjeNvsDtAJJmxaHAAlFv3/tNBg3D2+WssSkpy7J/u3GTQej6pa5oQVGohctv0OogV1jqq+nXMvlIG+o6DMTG8jdDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plCBiXczcfa3cQMdMY1qi4Wnpdsx9NRUXYR2EcbtojI=;
 b=QyfX+XMvaJ4X+M9ry73vB4dMV48a6LyFTAu1g+Vc7Q7vsnMAMPdqdCmKfXnQWJbFshRl1iU54LJ3P4nKOpfdWEZxfMzGRnZDVFdBNp4IxPWA4yb8fxX40eKLIgmSmTdzPHIOrvUwnbuv/UKuYuO6Y+4LvyW8BAOkbMSbBfa55N0=
Received: from SN7P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::34)
 by CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Fri, 23 Aug
 2024 14:21:07 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:123:cafe::85) by SN7P220CA0029.outlook.office365.com
 (2603:10b6:806:123::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 14:21:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 14:21:07 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 09:21:04 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 6/6] i3c: mipi-i3c-hci: Add a quirk to set Response buffer threshold
Date: Fri, 23 Aug 2024 19:49:17 +0530
Message-ID: <20240823141917.692336-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823141917.692336-1-Shyam-sundar.S-k@amd.com>
References: <20240823141917.692336-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|CY5PR12MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: 72afca8c-1fe4-4a3f-96cb-08dcc37ed45b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X0TOg1zZZYCqJm+YmfWK6olyAHcN1NOtzzk3nUfL5x+XPQNBYyPklBQyw+KX?=
 =?us-ascii?Q?srTLv4T4TAbSmgZcpEdMdHmkqjUAfZqAHpt3A0HmObpjZp4mAgr10ajTOBEi?=
 =?us-ascii?Q?W4ZrFRJYVBfwu8n6dYNKRxq3kngYQAvKIvJyfJcLwjADN30Mkk6G4eYzSB1w?=
 =?us-ascii?Q?4DrKDUanUzHi5jnTphfz4SmXGFk6W1m2+o1tHBqFytW7rWTF+kf8nlf2HXbI?=
 =?us-ascii?Q?194cCAt3nI7jYKxF8orfwNrJZLEs3SrYDFKUPL+4P5NWBQFCKu7Sbxai8/DX?=
 =?us-ascii?Q?0s3axBg8MdL7gdC353/XCwGn6Ynx6MYw1p35eiWzjr1vjXKMnpsmVVjbiCnF?=
 =?us-ascii?Q?U62cjjSkRdA4KUHDv9HJaU0Pz8hZ85WDISquM+x2ld9e/wN3s7eq1umiuKR6?=
 =?us-ascii?Q?FkKuMgaeI9zGVYem7AtjtmHtDURj68oweLZAyWTBTSedxKthl5/uJ7FyzVph?=
 =?us-ascii?Q?h5JvPEo799da8W9mdWEGjPWZSm3CibcBPZaghuz7uejGQmf8EP7zGGzWx0Yd?=
 =?us-ascii?Q?GrfQkqKAYF2cG30izdHEBFyTdVQyDzoOxoOITp/qkSjfswfa2s0Qm54kddPR?=
 =?us-ascii?Q?sizPQ/gm++baZslrsqEBPRrlu9Snp82tW9B+KXNVmzx+csv6cufUs6hvdgUV?=
 =?us-ascii?Q?QseYB1zSlugSgcXD2EGPv0bHGZMqqy6TZhInbDo4xFBpnmq2XujF6A5Ifs9b?=
 =?us-ascii?Q?79iAux4Z8BAbj6AThOAEYn7KngXvqaIuwyRimF6hU+nIRbllbEMswPPL6kn4?=
 =?us-ascii?Q?Ob5sLYim0Atxiu3EIeVAuWK983kdGWHlgJ+avk2FqE6FdPNzq54ThgQd2xMX?=
 =?us-ascii?Q?5nQ7umZ/kkRPlkSOwY/A0BB9u+4vT8CT3hMHaanXBve5cgiczaoAry1L6LaF?=
 =?us-ascii?Q?08KC6Tcd6hlCDydxNWxO6TiwoUVejqJyn1IQy/4hVt8t7/8N3Ud2L4JXk+Gs?=
 =?us-ascii?Q?vzWflHnzZw+oTKeesX9dqPt3jGGl+y1168pBNPV9oxQY1/2+bW7e6FIYDkqN?=
 =?us-ascii?Q?eoQPZQ5ovGPJebh6InWlra+YaeM0cuRPfVn93yJgF4MoEyfQVzzv8w2ce5Ct?=
 =?us-ascii?Q?2jtPgR18EtWMSY4wtLLT90aLz7c02AIuDAPWomptoUUqGyeQg6AZVmERls3u?=
 =?us-ascii?Q?fGNtlvfR1MAaXsGFDRXRqsOfBxsoiV+pWx48uzfGFTDinoh69mx0+b1jDnT4?=
 =?us-ascii?Q?eRvYlGiaYkwhUWwv1vi9VZj8ygcxKqTywppbFtJghH+Jt+Njx79Z0Ug9Lu0k?=
 =?us-ascii?Q?eeFjzTjv74endt3vy3ALkrjgNG3zKFWpjvD4qAYKtnLv7LW+Cb71n3/V602/?=
 =?us-ascii?Q?6N4RKQkPgJIkOlMdPOyG3Tst4SgVuZSmLcp524yh00DOwguvWhvlekXYGJgK?=
 =?us-ascii?Q?IIY8g8GHnTkC0vgW97Zv786qmww2sUlyCZP5zu40flSc59P9VepKf1AQosAd?=
 =?us-ascii?Q?apQ8vH0fo6c=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 14:21:07.4898
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72afca8c-1fe4-4a3f-96cb-08dcc37ed45b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6526
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_072114_301570_62EEF9CE 
X-CRM114-Status: GOOD (  15.22  )
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
index 6c6029e6edcd..4e54238444bc 100644
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
