Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07018C79F82
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Sep 2026 11:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KfkD8zC4Nv5WEFznb3EriMzFSK3DguLqGFDtyd/ELxU=; b=jziLdqusFB3fA/
	XDisn4yBHTmWSNdMKG/t8EE+IvjI7f4MFIOT4c9QIYIM4krk5u8WEq/p+2MMNDNHRqxS6qLHk6aze
	qsAQGAtXf3sofQX+8WoblqrrJw0565CNig4iG3CMeXFQqdOnwDIgKn5qi1NknaQ5SdrnT5qvvm3OE
	aGkL1N5NnpXvtbWMQVjhDITrOpj62e+Z3wPCY6XIX+wjeu4meJdzzaZVj5v/jLpNBY9T0BYOCI37B
	bM8k3lglLyHzqA1wv/gGpagAmoVB8/yHxC7YvZgIZczHnRiebuQTjOMiyoGvNfsFURwcZNep0QIGZ
	sI4esXUTq0gbI6tfLJ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tkf-00000008rKT-2AMb;
	Tue, 08 Sep 2026 11:12:33 +0000
Received: from mail-centralusazon11010008.outbound.protection.outlook.com ([52.101.61.8] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tkc-00000008rIe-1v90
	for linux-i3c@lists.infradead.org;
	Tue, 08 Sep 2026 11:12:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRLQq0XV+N7EYGHdqB6kHbBdV+Rl+XsF9KsnHlo6Vi9RMlIboS8aGTSyHvTXD1cDulGt2UA4CJ9wJh6S7gyiH8Hu0HEdK8l6K1/vTuKOcD9At56rhgimyErh9X1XhEiv6VyUjqmOnLEa0/Qo+EWYJsz4e+2N/AtIKp4NCia8VQvScinrV0VQMepWx67GfgQh8mUwCnVjEWgi8gXDUjLlFg0yc0zKC8xnrexByT8yU1vAiS8ytkGRb4Gdl/9Muw6FLqsUyUIoo++Zg/Z+/T8v2Kjv5oAAMO+qiqpOkcZBRVY2nO5sR1ZlyQ831fJp5Lb1rTyaWZih5zvLHCX990RuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6XsTDmuf3DjmoVsgul3/sgUp16y8fLr6QBNh6O3/rc=;
 b=NzTthdqMRW0BAY12czY4i6xyX+HudpdOHKfA17o4iimq44Obhi8Ng4gPDZ4JdkF1GvXY6GWR7mMNCgDOCmeGyZoi8IHe28iiKiBEmX/aHuf+mYDkwODn64RxMqEve7ISBOF5v62oXiZdlhaIKG6HdbekRqc1k7IxUtbvvG1K6DoeHDL5qNAyN+6UOO7iZya0vXFHX3bW01qpnqpoYYd1Ii6uyFRRjkCIrHVbjMSUeuVQyO0YPAtKjydiJivTDCVhkhTMFZw0UcPSthCz6vaVie6P4MGTKNukFQO1hOODmScGTqf5kfq0c6CCQijn9TDT5mO/iRJKyydh2ztKcFp7Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6XsTDmuf3DjmoVsgul3/sgUp16y8fLr6QBNh6O3/rc=;
 b=d3c84Di9wRqr17r5gXlrQyTKSFf2Zrx+Naa3WOOj/9rlvFdOmPz3lbgxE9lLFW9m+pcscNs41fX0UoNygCnAPv4pZWkUTVu9TSrPab1TpysFhbLFk7GK2nqj5S1p9KxsJZr/uskyVu8OufbHOFdkCWTfRHbsZT4yGbmGmCCqxn8=
Received: from SJ2P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::19)
 by DS4PR12MB9658.namprd12.prod.outlook.com (2603:10b6:8:280::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 11:12:24 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:5da:cafe::18) by SJ2P220CA0006.outlook.office365.com
 (2603:10b6:a03:5da::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Tue, 8
 Sep 2026 11:12:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 11:12:23 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 06:12:13 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 06:12:12 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 8 Sep 2026 06:12:10 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <adrian.hunter@intel.com>, <git@amd.com>,
	Shubham Patil <shubhamsanjay.patil@amd.com>
Subject: [PATCH v2] i3c: master: amd: Report direct CCC read length in payload.actual_len
Date: Tue, 8 Sep 2026 16:42:07 +0530
Message-ID: <20260908111207.3274407-1-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|DS4PR12MB9658:EE_
X-MS-Office365-Filtering-Correlation-Id: 8139271b-f513-4dbe-c665-08df0d9a0eb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: XZJ8uJlH2o3HVJkFPk/1im7xbKXb5c7cHXWMYUqA3+JXL7bn4LNTEOWkTdE+u5uYP2W7dN1V9Wt8zA1Q/e7I8BsWrNUvRRT5+/D+GKnZLYrQjGVDfh2K0h397Klxp364ytzBW/V0LIH4UVTzBITGJ72y9u8wE025Tr17nSZMqEulOU7bvrHjbqxHgOLZ672tneQZ9udJkzpukXQB6mXXRWXoRA41Fln2HBG3PJI5RgtpoW03owbmKQvmbF/083xU4Gt+yLXUWoyqbyZKoJhNHx10+CKrgtBrCSwH46LJqSInGU4D1GvQyvzE1o3HRnUUjJIm4uf/gTXl2duDlftNp4u9yQH5ICSBfJrlpEpxb0Ka3ny+0p7aE1ArN+KKfhBBH0PqRBl06yeEJd2CEeVZ+nfGdninq0Ih6FkvfkqJvD4DYZzIwabfJEdZpX+n6tGI9X7LCi51Synwamy2dK+oOKDXcEWIprXmvzMTTv+1u4NxDOy5dOvunF3ETa1S/YJaKCLrC9kx6baM1q/5S9RziztbgtKuPJewBvymupErMcKoySOXlmJfl0eEKIKJ2QSJVH0z1/0Io/GKghkxPUM4qo3zLoNTQXMR3XF5Y/K1HV5hZHRMP5MjeYPZNqEJO/J2guMOXvdjEgm7YM96WNqlSBfzdLOQs6Mu2NfM985IQVyCDgvsKHicQGHrRMaj9cKRlHiKeGvi9IDy0ogpL3+eUw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FHHrWhzEEudxfsaW5zNawaqVWbxPXupcrB0x+/jcpq5gs8UoRZfn0peBwcFZWD0ZD1s1oz5RcxLb7BHhvdmGddyFh0gMF7C5tlHkM+ngmdVIiOPGHO1owlLbwdfn9hUeb3V2FKbYW5g8ZWYlMZI98LpSaJR4s1x2QE2baYISUVQ1tS3KDDsNWjtuFKOmtufAsULZq3TYemNdLP/Hy8ia4Ujh3wUhGU3k/uerG+GtLXTZHDtZKnXW74CNY9AnOlRBLAv0Ft71pIGvWZPFi9EbTrlRTvFPjWqu2gcYXMuRyIzdFq83AxhlfurGGjzKADn9tmqe09hInVKD5iPlsnhb19jijATSisojUnDb/Xshvf9cUy5J1fzTkoaJA2kfBhb/YwtLzTLH3TpHbBTAAipHJRs7gW/8CAHJfrW6Sxt2XTASSmZscOz7kb/e5n5tGZYn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 11:12:23.2282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8139271b-f513-4dbe-c665-08df0d9a0eb7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9658
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_041230_506421_52DD9A1F 
X-CRM114-Status: GOOD (  12.36  )
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

The I3C core expects master drivers to leave payload.len unchanged and
report the number of bytes received on GET CCCs via payload.actual_len.
The AMD driver was overwriting payload.len after direct read CCCs.

Set payload.actual_len from the directed command's rx_actual in
xi3c_master_send_direct_ccc_cmd() instead of modifying payload.len.

Fixes:629a6ddd1d9a ("i3c: master: Add driver for AMD AXI
I3C master controller")
Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
Changes in v2:
- Added Fixes tag
---
 drivers/i3c/master/amd-i3c-master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/amd-i3c-master.c b/drivers/i3c/master/amd-i3c-master.c
index ef5ad5abb788..f205aa06f9b8 100644
--- a/drivers/i3c/master/amd-i3c-master.c
+++ b/drivers/i3c/master/amd-i3c-master.c
@@ -806,8 +806,8 @@ static int xi3c_master_send_direct_ccc_cmd(struct xi3c_master *master,
 
 	/* Report actual byte count so the core sees the right length on short reads */
 	if (!ret && ccc->rnw)
-		ccc->dests[0].payload.len = min(xfer->cmds[1].rx_actual,
-						ccc->dests[0].payload.len);
+		ccc->dests[0].payload.actual_len = min(xfer->cmds[1].rx_actual,
+						       ccc->dests[0].payload.len);
 
 	return ret;
 }
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
