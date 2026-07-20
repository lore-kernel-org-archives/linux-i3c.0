Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFB5C44521
	for <linux-i3c@archiver.kernel.org>; Mon, 20 Jul 2026 07:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D3gnspzz2Q2GRUQTY5gT5ofw1Y6dPuXPRHdjyjiM8rU=; b=OmAfnHcuUEFFHy
	Q1XxjiQg6zYeEBaX4RoTCaUcAFm7mVx56rB0398Da+JIBdzcsi5HTjqRHEjvzIpA37CaT9lSeKBVD
	CJi913SH9+3MFsK4p5NQImJKl5CsYcl5+gFKFFHmsocf/nyFV3MYpgdgZ6i4ha7i2LRwqsWjPjy9V
	z4vz0TWqjgnXVmDGv96xQCeo7BSyJ5FF6QvYMtbLTuO8ySUjlv0dUt6zsov4DHfd4ERAjTDlb9hCt
	Ux6vCiMP1dbrZAoMaWTFyTUMakY93HXQ/L1+sBXjTB6PFn6a6z0SnoM6sVE304QzAXg3P/mUNiKnN
	Dmy26yu6G+D8mkhJP5CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliXb-000000066Y2-33W1;
	Mon, 20 Jul 2026 07:35:55 +0000
Received: from mail-northcentralusazon11010043.outbound.protection.outlook.com ([52.101.193.43] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliXZ-000000066XX-11D8
	for linux-i3c@lists.infradead.org;
	Mon, 20 Jul 2026 07:35:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1BIENhscPuTG38QYBXgOnQTMwa0dx5Hswl+6Nc1ZnkKXskXPaSz1jnkYW3LNv4a9NfhDkLSP5ev+5K9hputIvA/xiBZpJ4sF8x1JGVSYUNOCXiPX0Ib0A4jZiAwDJbNeZZ0nI+jB2osYYGPV2nJ3h5ElO1Nh/iEFIKWOPGbFvn2e3dz5sZzslMmmaWnRqvBC6FRfTgnQ/L7jyR5g4ahhj5xr4a1JYI8jmyhQ+RDJJ1ocMFSO63DwBAybd6p9xafp1G4LAVCYocUgdMcNOYpbN70rVjrBrvP5f+V05nchJE4dG88kOg1Fa0/07P5sY2z/cgVzqcUdIOCf3j4lI5bzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nGb4dV+L+TeXc7RsLEClR3t48eXbhtA+FYcXcatggo=;
 b=l04KtR+2DCHH+5T1kiqbQdX3bsAuDVjHDM4QXSORAX4KVdQfcmShI2otVmQkTDSaiJJy4kGixUyUtlpFJdwO7UzhfnD90Tfd+lC6mD1jDiA2J1UtSwx0txQ/D2lXpGPtFZKxhQ0UqS3+BoZ7MJ626uJoROA/7sq+Siwf5DloTT6GFEP8ZHGCVLON5n2ZWTRu3BXOl9Q7ylqVA/ZiKdEH1BjGVlDs1axkOlBkSIT7nuI+Ck/ogz/0IbfftzMiZYcxDwjCrMxr22So+yHw3HJrZdCqK9/2v0QqXGkg1iKhQbTLTnBUBmSljLOi8MXkZ/2bqpx/bZOfX0qFzB3CaFEx2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nGb4dV+L+TeXc7RsLEClR3t48eXbhtA+FYcXcatggo=;
 b=h+EqRw24WkCxJJM0fFKvYOaD0DJecrp+Pld2UDo9AN/Rlcc1dL8RsuPqf8mUkGbT7Ukmr6pLY7eb0weJG/CQKiwul5arJAwMvr3+nESisQjwUcneE8vJVEFOyi2Hxl6wAITBRHZ7yFBem9XZt97aMUn3YUl+2b7TRq/pd91O1v8=
Received: from PH7P220CA0111.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::35)
 by CH3PR12MB9343.namprd12.prod.outlook.com (2603:10b6:610:1c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 07:35:39 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:510:32d:cafe::4b) by PH7P220CA0111.outlook.office365.com
 (2603:10b6:510:32d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.16 via Frontend Transport; Mon,
 20 Jul 2026 07:35:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.0 via Frontend Transport; Mon, 20 Jul 2026 07:35:37 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 20 Jul
 2026 02:35:27 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 20 Jul
 2026 02:35:26 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 20 Jul 2026 02:35:24 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <michal.simek@amd.com>,
	<radhey.shyam.pandey@amd.com>, Shubham Patil <shubhamsanjay.patil@amd.com>
Subject: [PATCH v2 2/2] i3c: master: dw: Drop redundant core reset name
Date: Mon, 20 Jul 2026 13:05:10 +0530
Message-ID: <20260720073510.1869623-3-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
References: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|CH3PR12MB9343:EE_
X-MS-Office365-Filtering-Correlation-Id: a3799553-cd11-4186-3e1c-08dee6317e0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: Oq+BGNfcXh8ATfX5vtd1RMHzsKeMDsSDsG9vLoQSFISDkEvifpRVDM2Qjoy45sCaA2Ul92JLPv6UwT43nT2o1ckwj7SoAcJMRYjmMBypl13xFbgZ6mbyIhWDNNsF0U8gDWWSpQbnnv8U7WRsLm/1qSiTal525YzU4BLR0Jd/lBiHjeuUGYn7w61WCp7wkwz8+Y/ef+CrLz6JDpP20PZHCOP7NYM+Vw+4HTbtr2u6rxPhEOLhU6WmYB4LGaEejcEuH5YMGi7XtVlfK+sebZ2z6CqSA3aRvpHYiUwzyhJJIvc1LVhz+H34XZFvjS0UV3Ibq/E6yM9HWvUv94VcrxaVvZKmk2uwOTDxMhoptKretou+FeuCqnC7q98dQ32JMslKd6+GXqvvXArVrSzFD1BNsbGcvwkNuwhjiKHCbSv/oPZlwNj7zr4S0h6tFwfR8Fto0PDCllXnZCI68HMHjN+2mduO4uQlgR75krmQ53C9vfKN/1PSqpW3YzPvASP0rFJ0iDZqaMBN+jG1+SeFVxNgp/oVlzg2SYz1Ma0B6jttBPL3FLF1LFKhUhUxWYe6mE/QPEGMSTt2Ax6F0AYw63IdGAreWABsYfJhZFoepswn2B0LCMFql4MPos2oZZl8EJaGazusTW3BhFJl5YWj1yWai2gv48vcGIx6OWho3iX8+qQ8jG1cTq+qPhN7R2I/f3p8ayzQBXLDH4n7tnSNVnR7hg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NTWxUiJeZql78GGzg9wLRRE1AB/lEm9a+lpDbuUOpLNmMAOhewXVhq/Oh3S35axvYo/6+OQKvax+y5lLuaRFbn34XqxYP959WY3M9DbeCvq14m4ZUl+sAYGC7nQGhUACpYm6gW0FXYf1A7o0O3MfL1b+W4jemK5X+L4D8SpBacaSV6Hu7McWV2x0eZS8noVylyfZ4QCZ9qUqyr+EdkKGGKwN3XjPX7qNqK+kbGpl5lcrjF+mPG3zeKnEcASoGW4W9CcE9ucOxVj6j8ZvwKUgaXfc4CfYDnl5KUvkotbITFaOul/nqWKM2A+WcIDWYact/Ldz0d5RRpp/W3WkdZPaNwFdDA0d30HXQXKURUPiYRZTF0lAY6uHlfHClJ5jwgRswz2Xz2KLPjdqG5b+vWAZiiSWGxawj0+RqB/NjbSKeJrFU78Qof9q6Bza8YUna4Cl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 07:35:37.4873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3799553-cd11-4186-3e1c-08dee6317e0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9343
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_003553_281523_8FB387D9 
X-CRM114-Status: GOOD (  10.56  )
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

The DesignWare I3C master has a single reset line, so a dedicated
reset name is redundant. Look up the reset by index by passing NULL
instead of the "core_rst" name.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
 drivers/i3c/master/dw-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 2f8c0c4683e0..488fb455d3cc 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1584,7 +1584,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 		return PTR_ERR(master->pclk);
 
 	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
-										"core_rst");
+										NULL);
 	if (IS_ERR(master->core_rst))
 		return PTR_ERR(master->core_rst);
 
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
