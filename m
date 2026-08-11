Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0D8C5CFC1
	for <linux-i3c@archiver.kernel.org>; Tue, 11 Aug 2026 10:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tXdncewjhusNzt1IA6CPMOQEpNFJYa68Oo1PNvNr4Mg=; b=qX8pcyCcYfRnyL
	9vWUORwkrG8Kx+02sHUMieXih5NxmajmRX8wJEU0m7jIqdSonxVTAd+9/IAIhdQjlWAs0PzZxJ8xh
	itCMqTsxLObQsz77bxLLUi9jzznfEnDcZ7g0KdurWRLuWMiioHnpltO3OW3WOQFXOBc1d+y4CgIjH
	hZYFX13C8SFJHVfrHfRgMVwgu4BEHFdzp227jYMka59g2NWHU6KU4ThKBXpOZxDeM5fTEiGCaXM+J
	Rx0bcUQqTEQQpL9eID4gE6xdc45Yk2IWV5e9i5aHScytp6+Bc0/4dSGiNkqTb9SYPsnPtNQZL+3Ah
	bFt0CB4sV9y9qSszzkoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjsx-0000000Drk6-0wBt;
	Tue, 11 Aug 2026 10:39:07 +0000
Received: from mail-southcentralusazon11012070.outbound.protection.outlook.com ([40.93.195.70] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjsu-0000000Drjd-128r
	for linux-i3c@lists.infradead.org;
	Tue, 11 Aug 2026 10:39:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kqxje/M+0bGFfH0Lc7tS+y3Q/CF/QopF9Bm3pVmcKWRL3FJij+R2wD9la8COjF44OtHpl9RqUTWxtDSLe4MhSVY2t8tqTXRFA+88qZIalBWz3z95oZz+dSrVKNfVvJPtxFmL+OGphCx5R7UjNZIe8kVAZg33OXgCzpStDETr23M4iaIIhqO+UOfrKo4sHdKgPU/6hpK7ZV7ZnzwGJmf4xR2KKgA1EOAwKBVFvfUs8h9+bSf+dUu1HLr1fzbKQF5F3NjJk5BR/W2weNkiLOP6EXIfTocQV0vqUvui2AnKss+bc1xvUxKezCuDHdt7S9rbFp6CWwqEVJD5/6NvrF3X8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rWMqMu4yLenazCUenF9kly5Kb8nOOOfZpbxGfwEBnE=;
 b=DQDIUC5Fcv4nfIh1kJnfyYmAw8jCJQ7aKBx0lG/d4csPuhot5aLj2FDpYMvkV3jRLVXaqVzCwXOzZQDPa/nXQSrWtCbXNWbO9j17GYJlS0HuRD7iuLTO+u6/HJ3HQCN4vlHWF69/P+3baSNrohafD6NIYk6FUHsPu91ZAvA8G1MqOlctYyxewJQuqqRGBzQqPbW4jVKkMX/wYVqgueM1YFeS46kVpIwk/aOTJpjp84xemuQk8o/xwh9pRtpySoR2NSp7ktBdUay9VKpIEYUABaeEPjivqqQLgFhKxoOi1CkxIkpxipgnFJ/8/0HgjnkENVTB60tE/b+RRP/C3yBhCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rWMqMu4yLenazCUenF9kly5Kb8nOOOfZpbxGfwEBnE=;
 b=FcKzaLLaWINcluU83lhc43H30HcfJgUGIdJdFiUaVKoQURXBSD75gg4GVUsx0Lebyi8e1cC0sLWCk6+LsopWxqjTvOcILZCxVk0vAJW8iyItopF+oUTul77y0vnGa/Ho358Tu3/bFR16XC0PqUMjdgnretC1tw9VW180vOMaGEIefIK3FNoSGK7K5IO14xH/AsTSI4si4BzUH4sJbNq79xTLE+8ksdpbMyEjJ97Ohixphd2Yp/VQqx6W3w0dgmKl9BYzSJsILFVT3OA+8HtLHZgorfFwjBcGnpm6sCBeJgjSjSvZtRIJTPSyW9e2AgIHnK9XjYZqMEhY15/WuTEKPw==
Received: from BY1P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::7)
 by PH8PR12MB6746.namprd12.prod.outlook.com (2603:10b6:510:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 10:38:54 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::68) by BY1P220CA0020.outlook.office365.com
 (2603:10b6:a03:5c3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 10:38:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 10:38:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 03:38:36 -0700
Received: from 82875d6-lcedt.nvidia.com (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 11 Aug 2026 03:38:35 -0700
From: Nirmoy Das <nirmoyd@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>
CC: Akhil R <akhilrajeev@nvidia.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Nirmoy Das <nirmoyd@nvidia.com>
Subject: [RFC PATCH 2/2] i3c: master: Propagate SETAASA early device-add failures
Date: Tue, 11 Aug 2026 03:38:11 -0700
Message-ID: <20260811103811.3380073-2-nirmoyd@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811103811.3380073-1-nirmoyd@nvidia.com>
References: <20260811103811.3380073-1-nirmoyd@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|PH8PR12MB6746:EE_
X-MS-Office365-Filtering-Correlation-Id: b6213aba-89bc-48d6-6fdd-08def794bce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|6133799003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1CsuUzNBT7rr2PKRNoCuYbxB1S9KVMOX42GlLhhtie7zq8XSg6sCJ0BMZGOMoFNQ4UZwTrOxvizXUxYo2QYzxEw0n2f0eM84cS9TyD3Jyhu5sua6bDNJMEwT+pWQqIUuGodYTd8tVlI20tgHM10tpqAPL4QxPpmqMNY0JQ2sVWYlyv8HL3A2bJbm5VcY13YgABoxUjkNnQO8VKN4lnY6TR67DXMjXPdLFz7LgRUBU1MdQAxFVzc0/xMJvnR9HsKCTBrCyegu+W71PEnWiJcnN6jRAO3B2xeKM2Fmml3jBwpPpX22QSy2v3zlM4ZUOl9lUIierFaIFtQgbELBKtQIeMs2cKPTBDUuiBOqKiJ9NJEeqt08HN6Z+JbwKGIql7JFpBulYgnFJwOTgTEY1E9sLT9gruqMwwjLRd340LE5G8PWD29lZsgkRfBqrl/ftGHD7KkkFJsp/IDwghMFyZBiZm7h9QrDHAB6mjiP+PcNk89gxnb2oWr9dflGU+sIAeuQmkdSaULrWnjeiLcV7K0dlIzemWMRB7p6dmoXWTEft6SbemqUiErKe17Vz6mZRQEU8xSH4VT/PzD2t1IzeflOxvmhu8fCXNQvvl6czjQQaXPomlc1tj2/GBn+MMkDXKQx0hAvFDsJ6r6yAQYDY7Rrj+3CZSi4czOQNe4wYJ14TDmT0FblKCMxBkmy9Nu9pFY3zGTlWWro4r5lXJpx6X8ukQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(6133799003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5mrXSV6x5HQSgdbjwxroKtItvd58SIyDgBNBO/xeAgs8sH2PEDso73orzKDO4kMPhc+AtigsM6ZHbY7xSPiK5jiPeojCkWPcmomicO2K/R3h4rF2S2dQKm7jkQJQiT0SI91Tq217AagM96OXt75x9zdlTdyCGRi51iSs5fpohzRzrVTNmyOSy/0Vc90bz8N6xnxvQffYll2TRq4mLjRIrR3nfvlV1yZT2GyyILyj8bCjmrHnTJRcHWOG6HD76PmfUbrVqovpMRQNr/vTxG5rEtqWutgW9ft2R3jLzJi6/mzWnzhXUL5sD7aC2459Qe/OoeEqrYhU0rBClO2lKc+zMa3HYdv+LV+OZEIpjB6Qn+5P2F2UQRQLGb3NcmQYFydngvDValKlMSmYsiJ3F9JtMsfgOXKy9Kx8qtXpqSj4mLHqE8JGTOd5JQJLZ3YTIeZ4
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 10:38:52.7828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6213aba-89bc-48d6-6fdd-08def794bce1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_033904_289808_FFCA2F4A 
X-CRM114-Status: GOOD (  10.79  )
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

i3c_master_bus_init() ignores errors from
i3c_master_early_i3c_dev_add(). This is recoverable for SETDASA devices
because they can be discovered later through ENTDAA.

SETAASA devices do not participate in ENTDAA. If their early attach or
reattach fails, bus initialization still sends the SETAASA broadcast and
continues without registering the device. The target may consequently
have an active address without a corresponding I3C device.

Abort bus initialization when early device registration fails for a
SETAASA device. Preserve the existing fallback behavior for other static
address methods.

Fixes: bbaf8733b848 ("i3c: master: Add support for devices using SETAASA")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Nirmoy Das <nirmoyd@nvidia.com>
---
 drivers/i3c/master.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 922da77cbdf324..7a83f39448e8ed 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2537,8 +2537,12 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 		 * addressable.
 		 */
 
-		if (i3cboardinfo->static_addr)
-			i3c_master_early_i3c_dev_add(master, i3cboardinfo);
+		if (i3cboardinfo->static_addr) {
+			ret = i3c_master_early_i3c_dev_add(master, i3cboardinfo);
+			if (ret && (i3cboardinfo->static_addr_method &
+				    I3C_ADDR_METHOD_SETAASA))
+				goto err_rstdaa;
+		}
 	}
 
 	/*
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
