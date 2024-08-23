Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78554C52D7C
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 14:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cqWCBPBv+8xz0okRdackp08Ou28FYaszRHOR8tvqHQM=; b=F5s6liU/Lxofts
	ztUU1WcND554ji7QPA+BMwW6+NdZ6TdZUulGh3cDY03uNbuwmj25FyV9ly3ng/O0wFWIsAhJA9thq
	XqBRnn6HCyacnNdxg6+buaI6267FTodqfuFOawD5u85G+fqj5fHYqo/Pt89mgPdYLoMHTCOly/WpN
	QC/J+qHwNMMhZ5Wjh6vJ5c4uAmc7nWP0bLk5CuG3oYhpuUppmQVscf2nzWy67QjLURCX0MBv+ZnRz
	bNRsx1XLF364jsOGl8S2ctEo/by+vH01eWIZAntVT9oMoAcmhdBGkfTQlknirgWDvPAz7c9KbpPM1
	Xj9O/ZlrCb+P/PKZ5Neg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shVA6-0000000H4FF-0lyw;
	Fri, 23 Aug 2024 14:21:10 +0000
Received: from mail-sn1nam02on20607.outbound.protection.outlook.com ([2a01:111:f400:7ea9::607] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shVA1-0000000H4BJ-10kz
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 14:21:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fs1ShQ2f+MUnlWidkI5W6HKpEiFEXKWBA6H0RnUHSKsH3jAmK17yoAjN/cTBAE2zVbbH0xZ/nmQdybyHePf0iysMb45/a/aCj0vg35FO1Ua1+Brm8aT9EbShjYC/aUpCIv5s8aAUAtTDOBPBHE0aOFVD4tEZYHQmue3zo0Oz2zelzBw9oyZwSFWts9oaTDFsriNyHIhYz910yAre3eOGA12MfXI93x9W5btt9ebNK5Y41pTUO8jvGcI+ldHmjKQ4Y0BU3iaPT47fGgUFuDxIAqg/IEhPjvduSTX4WhoakrBbQFgKKH2cCOy+btqN1ODf10Snj/jH1eJDAxymzFa2KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=078x5TqlbMlFMajgTQWnSzSxWojU9nd09Hfcd3+SN+0=;
 b=o+vzHZIRBfguQdjVF20w3+A2xQ0EZZBlmmpF+DfeI6UA06tfkKJsxV0iI+P1BdcORshCDlTySLtO+kMMbnSKPdRkwgbroI5iDsQpRa8u6dWjMdZF1niR0ov9eW0TqAB2ynTMdfdPUBsY5R74477ZGypFqcIs2azN0rp7BqkwanSRkgldhKDyenhBR3ThJF9EM69wmOpKdamk+MhNaRFX13qLGmFqn1ETMf0IPz58mq3m/7nntH9QtzDM7ZGLeLy4UfLFxHmrnnIvcTZQM30WFmIoOJUwgQamvXhiP0ARTdbpsJfLdjRGdcEDybB0XmvnJnbnW771HkPvzaKtpstGOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=078x5TqlbMlFMajgTQWnSzSxWojU9nd09Hfcd3+SN+0=;
 b=UwnZUNLPhv+N0gKc/Lm6W62aWKGMEkkScVjpLn1VUIpoAjj5mEzQfcaVCUTtJe9yLxBWFZLcdwaCUbKzmL61/boyJQpf3KE++s4o/dZNzJQVi+Kzv8xtuEV/Q3sEFmz23MYXvlQeUSYPQnb1wx/K+I4HJJUH3BMkMD1zsqjsdgw=
Received: from DM6PR02CA0151.namprd02.prod.outlook.com (2603:10b6:5:332::18)
 by DM3PR12MB9327.namprd12.prod.outlook.com (2603:10b6:0:42::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 14:21:00 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:5:332:cafe::c2) by DM6PR02CA0151.outlook.office365.com
 (2603:10b6:5:332::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Fri, 23 Aug 2024 14:21:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 14:21:00 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 09:20:57 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 3/6] i3c: mipi-i3c-hci: Add a quirk to set PIO mode
Date: Fri, 23 Aug 2024 19:49:14 +0530
Message-ID: <20240823141917.692336-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823141917.692336-1-Shyam-sundar.S-k@amd.com>
References: <20240823141917.692336-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|DM3PR12MB9327:EE_
X-MS-Office365-Filtering-Correlation-Id: 19c22fee-b10f-49a4-dad3-08dcc37ed00e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZDRPaaJCsYwu0s7YkaGEcc8jNCkcPv/BPyRpLOVx4G6ZW5D6Jd9kZ2tHi0O5?=
 =?us-ascii?Q?6zfKZRp967qI/K7A7rr4JxV6usVIQPuj9bSMcYNdB7JqH6cZzh4hOz/qMw2Y?=
 =?us-ascii?Q?MZ+hyZbPZxCAFFl6aQl/nQ1v2vYFbJd0UdWscsY6K2LUNB1WjdPaq0vL0Hb8?=
 =?us-ascii?Q?n7HKNKJpdonlizWYYXbTsbFz0QYb75fUmeuWv93Ckbj1imPPZuSF4TW4awKV?=
 =?us-ascii?Q?NrwPSCjepq1hE5/QfOuZRfC6cL6QEwTDfPkOUiX467YdW1LwEOetpjlhLxi9?=
 =?us-ascii?Q?0lWKks9uQcOx+z52P1XnZd4noUlz+0GKO7YubhuNMdT1jQnAeiiaCihQ1apM?=
 =?us-ascii?Q?HeOYuhFg5l7J4MAfiyCI/Ub9Asn0Ts7eN2Bve95UrCTcTHSgPyzC0blFHWPO?=
 =?us-ascii?Q?6ncnsM5mfIrW2I1moVvgJs2F68sgfAioQLgZ9OZGJueUf5JGa5iskLlHpqY0?=
 =?us-ascii?Q?FS7bLNjf+Wxf+3jeFQS3Brfju0ACzPFutaX29R86IoEkfqLarIbX6DE646aZ?=
 =?us-ascii?Q?QvioTXc00rfJbQNR+WUGXuN7Fcv0/uluByNzQPwajTbcfp/5PWDvRrIF7aTL?=
 =?us-ascii?Q?R5gd+QMEEizF0VRSNkzL0PIcmkov5CvUsRlpl52KjTMm/DdGfgSgr6+ll0G4?=
 =?us-ascii?Q?Gp7wcdPHN7iYr8kaoWnbnGc/840FJ1+VFYT4uofq1bm4tRE/hz3mu2wJz8uE?=
 =?us-ascii?Q?FheZg8VU6T7TjkdBulXj3ilgMUlONAZKV4FdCsGw73kF+9VYskLAY8tNWYkA?=
 =?us-ascii?Q?BiGYwcFKC1qcgo44SM42Vbo2tYfKp1vw64oCzn1cJMwZLq8u3uzQBe8nv5CO?=
 =?us-ascii?Q?ZRs9cHqjnduG7CMWBaM4KP7Yd6oH6AFKAyiQ3E9tJUhzcbHv6EowRFoPVNbE?=
 =?us-ascii?Q?Ab76E9q4prWYPRPIuUbYlrUIgMVrD1hfMxTN7wYezbGfWu4RsJHg8Y1k+m7s?=
 =?us-ascii?Q?4sl0IulT0NcbC2bGHndxkTPFOB885P1cl1l2DAQPt8RWmcHcKH6VgWau/144?=
 =?us-ascii?Q?HNb1QPNX4J7e9QtZah2jtvvrKRBzZOzKjbqospNC8HA+RwkdW+zhaGt6FRVA?=
 =?us-ascii?Q?5rlQ8croWPl+jtCWKWkSvGaLQFTZyyiTYIaVfwCfype5QhSTyun65iZk8lj2?=
 =?us-ascii?Q?BllxkZcf1jyPN1v0waaDw84kD45GsS/7hoCgcQwcLUndXg+/PqfCluO+hA4n?=
 =?us-ascii?Q?MvAjzq5V+M4myOxNZxelkMKZnGMQPn8OgoLH6puGD5i43cLBWGKLBkRDLiWg?=
 =?us-ascii?Q?xdaDtfwSidSw8WrdnDGHe3VXsDSqAGGRm6xqEQmtguv5cGMWED27MskcqwzP?=
 =?us-ascii?Q?aYgDCtCtjJ+lalIv7NNnTMy1jXjz4SXNN6BPsT2NegcEoWwXWLw+A9h5Yq87?=
 =?us-ascii?Q?10jpcSmemSSlU2waa/QjXwLOfO/QtNbenVN99rE1tblEOpO3PNJjFaHB7+e+?=
 =?us-ascii?Q?GfYj26LFmLVjGPliNVW2WQ7rwP4T1w0b?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 14:21:00.2760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c22fee-b10f-49a4-dad3-08dcc37ed00e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9327
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_072105_316407_5AF7FAB8 
X-CRM114-Status: GOOD (  17.86  )
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

The AMD HCI controller currently only supports PIO mode but exposes DMA
rings to the OS, which leads to the controller being configured in DMA
mode. To address this, add a quirk to avoid configuring the controller in
DMA mode and default to PIO mode.

Additionally, introduce a generic quirk infrastructure to the mipi-i3c-hci
driver to facilitate seamless future quirk additions.

Co-developed-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
Signed-off-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
Co-developed-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 8 +++++++-
 drivers/i3c/master/mipi-i3c-hci/hci.h  | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 42d2362d072b..03a63ad205ae 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -756,6 +756,10 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	pio_mode_support = hci->version_major > 1 ||
 				(hci->version_major == 1  && hci->version_minor > 0) ? true : false;
 
+	/* Quirk for HCI_QUIRK_PIO_MODE on AMD platforms */
+	if (hci->quirks & HCI_QUIRK_PIO_MODE)
+		hci->RHS_regs = NULL;
+
 	/* Try activating DMA operations first */
 	if (hci->RHS_regs) {
 		reg_clear(HC_CONTROL, HC_CONTROL_PIO_MODE);
@@ -806,6 +810,8 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	/* temporary for dev_printk's, to be replaced in i3c_master_register */
 	hci->master.dev.init_name = dev_name(&pdev->dev);
 
+	hci->quirks = (unsigned long)device_get_match_data(&pdev->dev);
+
 	ret = i3c_hci_init(hci);
 	if (ret)
 		return ret;
@@ -838,7 +844,7 @@ static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
 MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
 
 static const struct acpi_device_id i3c_hci_acpi_match[] = {
-	{ "AMDI5017" },
+	{ "AMDI5017", HCI_QUIRK_PIO_MODE },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index f94d95e024be..c56b838fb431 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -135,6 +135,7 @@ struct i3c_hci_dev_data {
 
 /* list of quirks */
 #define HCI_QUIRK_RAW_CCC	BIT(1)	/* CCC framing must be explicit */
+#define HCI_QUIRK_PIO_MODE	BIT(2)  /* Set PIO mode for AMD platforms */
 
 
 /* global functions */
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
