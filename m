Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC37D374A6
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Oct 2024 15:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W6Df9hWmrAQ08076ijMn5ZKHMzQjY+l8cvoxpRjtHRw=; b=VGv3xrWi/avEvt
	Rwh0uhsIQNldXLjgsx5XCEHcgMhlYfcqNiSQe/CmJpy+yjHyZ8VKhv8oOurs1VKbWUUnC5elSK2Su
	7ARLseKvuaqobLPM0Fe5nPsu8pDpGsHHt8YAACTWsoBNd1qJT74Yu1nZXMvF14jxN4zRZqRRDPxcg
	2SD7mnYM5Pev8FcPypdMKLLkZshwEjB0CZcpe4XP0paNzpJ8eJdWcLQLf5AWIXc3SZ7W9p4jlJJKk
	/BFcRGAP02TvRANG35lb1yzDAoj/eZIeARzdLbFn3fiNwe59lQPz4nrgEdHiL195HnLmWwLeqsmop
	A+iyD4p/7yJb8qt/XQwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1S2u-0000000FDHx-01N2;
	Thu, 17 Oct 2024 15:04:12 +0000
Received: from mail-dm6nam12on20620.outbound.protection.outlook.com ([2a01:111:f403:2417::620] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1S2n-0000000FDDX-3KOC
	for linux-i3c@lists.infradead.org;
	Thu, 17 Oct 2024 15:04:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2zAEH5g9iF/2TQZvLdZx8BkcKy0Cg4bUfwl/PEL30ecr94pHYawUJ7YEaAqQXcjWYlfVbU1Z5N/5XvaicQpdA5HCZEYdoARqPU53opUkV153ePovKycqw8lOycvw8lM0FdB+mGnlzy2Ke25Nrhh3amPwRcW9bJ95/c/ddI0U+AW/U+JiQRaNNBB/4OE04+9oceFrnhw5ShqHZ6trXIJP9aR1O0mQhAx/YV04T2JDZ2rLXOXREMDE2pGhiMc+25Gh5xfG6pnE9/9HyrF56thKigFk9OOnFXJR6lfAPzSZ38WN2bsksonM3xV3smUG/4xwnl7Nb14Uh8g1mzTZlrJ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2eS3WcoEO94epiLm8nqRo+FQ7Vh0tmifhbEMUh1CaXA=;
 b=QyESInqCZ4pJ8tjjtgMZ99LweuKxWp8Jw77ZErmtX91ZRP1ntRQXz9QGz/+9b1xovWptmoR0sJ7nng42o8yApVwd9nctjrvJNtKMf12880CU4Fnw2GE9kox0S92IX7lqXV0weEL4+hznMBeLPDbvBGA5anHHGcuzGY2oy+xeF6FajLohkeOW8xlshPA2iRQJR7bT3dAUVEWzBf94V/rPKquWKj54x2AbXmUDKrSv66J516y/86oChPRkLpqbsbQ7lS0iaW41fRfc5AWirDPKmt0V1UfaGx/w6WyDDXjcQCpsmg30xzky22SyKBnaxY3YkBaid3KFSm5BENrWf3yW+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2eS3WcoEO94epiLm8nqRo+FQ7Vh0tmifhbEMUh1CaXA=;
 b=M7eu7Uf4t0HJEKDCZbeMpA6qz6RhJumCR6md4w6BX+LEl2cgxvRyNzuz6PdDIOyc1fnyXuPNsAa3pAfdVjw0xarheRoQ8r9zGnlcMWZmwIEc5lmrifoPpZJAKV9t1TqPEoHVPljSQXtJ1bBo5Y5BsNqf3EwusiWXfmhdhIvNqC8=
Received: from BLAPR03CA0142.namprd03.prod.outlook.com (2603:10b6:208:32e::27)
 by CH3PR12MB9078.namprd12.prod.outlook.com (2603:10b6:610:196::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Thu, 17 Oct
 2024 15:03:58 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:208:32e:cafe::ce) by BLAPR03CA0142.outlook.office365.com
 (2603:10b6:208:32e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18 via Frontend
 Transport; Thu, 17 Oct 2024 15:03:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Thu, 17 Oct 2024 15:03:58 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 10:03:55 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/6] i3c: dw: Use IRQF_SHARED flag for dw-i3c-master
Date: Thu, 17 Oct 2024 20:33:26 +0530
Message-ID: <20241017150330.3035568-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017150330.3035568-1-Shyam-sundar.S-k@amd.com>
References: <20241017150330.3035568-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|CH3PR12MB9078:EE_
X-MS-Office365-Filtering-Correlation-Id: 77ebe8df-3885-4d95-53a9-08dceebced72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T6MXAQOMASExDiKhAlrjx9XSaBjkw5paqfDonJ8uwWZD4cs/SbLwwtQzMxFW?=
 =?us-ascii?Q?nAwcBJr9nk/ijSWJSj43kzppdJ0fSfxT1g8Idc9EGEcDYGEE2nosOW0W9ZQD?=
 =?us-ascii?Q?qfo1X9Po4q9unmFd2my4AVMqXMu9oQ1sfxv6l1oZqKPIandxhL2fW8IOy6c2?=
 =?us-ascii?Q?91U6W2zeS07rbA9gUHJ8jJOvjw47rV39CQe9a5KjnlGSHFc6/N/sIqiZEH9i?=
 =?us-ascii?Q?ZbMxsx19/dNyibZeAeDS0LOxspKtkVVErHy43hhDq8PyHnKKCPvDq0dpQt8J?=
 =?us-ascii?Q?uirevoRrYkJO4FYift/NJXp161f2ySfKsJ4ScL2Cq1C/tX0eRiS1MG8+CYbF?=
 =?us-ascii?Q?ou708LYov700EhQtzaNvWaX0K9/W0xmj/iZOufnOLwm8JJ3zgLFbGuMa+vH/?=
 =?us-ascii?Q?nqSvyHvflrx3Iikbt+ScwVrQojSfv7cTC+Or2BAZKuy13K248vBG6hbDgH/O?=
 =?us-ascii?Q?nCHAeJylQK2f9B/k8LVu2RnnQy8NGdLR1y6D5Cq/Gp/Lx+30qnBLKhck7acN?=
 =?us-ascii?Q?J49lOKR8WuJ3RiMYpIQRbgtq4P2S1YaVYjPSb3dd/TFTJoUpEcoJqwFKFBgP?=
 =?us-ascii?Q?2qnLph3pDVmR2EY3DxomRsTnBi8Jj64oJsDqIloz3KHD3qMQBZjrYEm3X4/0?=
 =?us-ascii?Q?WsvqijM2Zmw63Tqhoiz8ElS3WYdYEdA0h2gPoZvHN2A4GR9KXGojxHymjQv/?=
 =?us-ascii?Q?DB+6YMkpv3N1FDFKHl3xSahZ51XUi3XhSa+uQ4zW9vNTHOzw4TjTNjpdjsKX?=
 =?us-ascii?Q?zIy4Asg5C+7gXD0fY1nS83h+GwAbR9bwyEnVfYWR6Q1JMzmB3XxRSfIfp38C?=
 =?us-ascii?Q?cTK91tE0tVf1dtHF5UhG+R9hTX31PFqrsVSlD+zMtxNvDxzEv/A3Otyrpn71?=
 =?us-ascii?Q?48HLEmTSXCHvuI/YH+SucoqsS91IZHsIyDCjIRqeny2yUehnN8armI5qtVqG?=
 =?us-ascii?Q?s1z4fcpx7xSJxJ++qRY3H4OjD/MJad3BLWvB0m6yzqNOeVwFxf+DYIWcMd9I?=
 =?us-ascii?Q?AuNDX1k7zAVtELqkG/Nuw/Wfo1dOOLD39CMVIqKBPTC9hHESpwi+ZJkOxvim?=
 =?us-ascii?Q?Djf2jyJAbTfw+a7FSCnHhz7TnsGSFbG9gX9GIDpDS+Js+8PPqulf61RKG4sS?=
 =?us-ascii?Q?N6+KJxdgIsdkniHQrlQs7ZJ/8B6WtWLssc6n4QltO2fMaLlmvl8dEaBVOZhO?=
 =?us-ascii?Q?9L/CfyrK3D1EyFkxdNZZR+S56yd8RqlB8FvgVTjQ+q71jDP89HgerAYTsgkr?=
 =?us-ascii?Q?vYqrXeHOTfwxmvLm/uabsNOR9GlwlYxjFm1vSbFjRJ63jXW/ZWESiHXN4dQx?=
 =?us-ascii?Q?5ETWT13nMKREe+IQ1c7I09y3RLiabqSl29pQn6Lzi9jLZOLiAcbv3fjTwHRR?=
 =?us-ascii?Q?n4kPy3MdzmH8oqgJtwl5KBh3fwmCS0XGXOH+vu8d24L7y6Cp4A=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 15:03:58.3316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ebe8df-3885-4d95-53a9-08dceebced72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_080405_859477_4AD9C58A 
X-CRM114-Status: UNSURE (   9.98  )
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

On AMD platforms, the IRQ lines are shared between two instances of I3C.
Add IRQF_SHARED flag during the interrupt registration process.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i3c/master/dw-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 1a7c300b6d45..fd58a95ae1c3 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1578,7 +1578,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	writel(INTR_ALL, master->regs + INTR_STATUS);
 	irq = platform_get_irq(pdev, 0);
 	ret = devm_request_irq(&pdev->dev, irq,
-			       dw_i3c_master_irq_handler, 0,
+			       dw_i3c_master_irq_handler, IRQF_SHARED,
 			       dev_name(&pdev->dev), master);
 	if (ret)
 		goto err_assert_rst;
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
