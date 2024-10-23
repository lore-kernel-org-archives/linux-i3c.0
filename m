Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F2AD2E016
	for <linux-i3c@archiver.kernel.org>; Wed, 23 Oct 2024 05:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mALFPuWoPjmZlSw5Dvep7QeQOruPn52dCii+Ly5KntQ=; b=GLLEV1TkqBFIK0
	w9cimyAu03T3KeOsa6eiWEm5UjojcUwqK8eE6bDn432RXJRW4rf4uWypF9bXrfnz6fcqIzgrvkKW6
	dzxeircHGCIDOzC/ro/DE6OomBf9dpIRmXRgsIdYkx8u0YJSliaJqYBTU0vd/pPBMrph80AAWkjc8
	4rHNTJQNR0085tv4SF0B9jC0v81dsbeJwiT+ZJbJxWZ4gYJwUCJCEhdis7NoLXS0IV9XiJav9M8AH
	R61Pyd2KSwEB3tZAeDduFNHB5oGx/G+05K5Kf/sBj9yK25XxdghNxQUi5neTaiVZpfu8tGzbZVcmh
	/RVM7wj/pfDtgJhW/XSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3UIX-0000000D7At-02II;
	Wed, 23 Oct 2024 05:52:45 +0000
Received: from mail-dm6nam10on20607.outbound.protection.outlook.com ([2a01:111:f403:2413::607] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3UHq-0000000D6xB-0NMs
	for linux-i3c@lists.infradead.org;
	Wed, 23 Oct 2024 05:52:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYqVAtKJVqkH3JBxJln1Xg15yb2biR4TWhgkugimR0Eg/0kHrNpej7FLda5xkEAig2o4kbEicT08v8ChuL8Z7sQZ10nuivC61DPw3UxLKSJoPAcJnSIVBymd5jTmyuvBOsE/200kARTXzaaNZty1+MjgodWEdcQZW1wSLiIKllgiCWw0B58JICZxCxjV/JmNiNw3jbj79sEShw2nUbKnKQn86mOYOvgfqTRpEnb7Y1CIkeeyM0uE21uuBJzgG64pVdP47OeX46RrbrVR+WsStpjRN4nXqTrjrxaEn6v0Tsd02wqGwWsLuI/z3Peslkbl1dEK2AgkqaS05EW280dK1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjwErfDQy6CzaMnw4++rs8wsNhqpWYxjOdTyHdGRSDQ=;
 b=l0P5lSRThFPgPKVEzrtKZzJg/cls+Rz2HbCoXBpjxPjWqh9tfhFN1lIPErP7XOjW5Z5rdmSB3Hvoi8dWRWZuapavWZaOGj+fpqcSpuVarhjtXE6YM1Z/E1et6wrZaC/3ep4vzwxUamnZhlazEw4Jric/E+ShLFDGO03x53mto1uYbcGGncgiLRMUnpRSgiDIG+u4PJXSKSPviIY+IYP2NuXkNg8vbCyXf/aHYxg/hShKWFV2JY/u407FrXBrL0+FedgJwO2fHkMFYP5nJLaFlMS4eOi+5Ili3V+2pkqUfYdHmVxI2UCLJiLvcFrtqiyu/E+aHOGYRYOeWXrkmfOMSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjwErfDQy6CzaMnw4++rs8wsNhqpWYxjOdTyHdGRSDQ=;
 b=rtRCJtYFva9C3gqZPzA9PtURbmmwc28pZRXizmejamzdnEwFVfQhkZku7kFAVnASQFA4IDR6kyxLA7z4cmsLtX0iAQyyoQoJT1KQpsMf/dF1cxDs4mh1yBg+xX5lR5eykVTCbY5x6VHKgUrIH5uhPzT5IT/fsSaRrYM6qf1qgyE=
Received: from PH8PR22CA0014.namprd22.prod.outlook.com (2603:10b6:510:2d1::29)
 by PH0PR12MB8128.namprd12.prod.outlook.com (2603:10b6:510:294::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 05:51:51 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:510:2d1:cafe::ce) by PH8PR22CA0014.outlook.office365.com
 (2603:10b6:510:2d1::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17 via Frontend
 Transport; Wed, 23 Oct 2024 05:51:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Wed, 23 Oct 2024 05:51:50 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Oct
 2024 00:51:48 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/6] i3c: dw: Add support for AMDI0015 ACPI ID
Date: Wed, 23 Oct 2024 11:21:13 +0530
Message-ID: <20241023055118.1400286-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023055118.1400286-1-Shyam-sundar.S-k@amd.com>
References: <20241023055118.1400286-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|PH0PR12MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: e64a0c13-c095-48da-591d-08dcf326ca77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ODi72jCa5UKdy+XLQ6pDxrpmDgRQR7kI1dIB7GZtuK4WtdrJO9G86H6p73nm?=
 =?us-ascii?Q?H8c9+xwykrUW82YgAgIw0jTp6MIzqDvgZWenTLDE5z+Mbx0DcH7xMTdFioXW?=
 =?us-ascii?Q?RkHxzxgyIkvMOn7D7XkIOfVthn9odQ6mabrd5X0JLSgUQ8iLlOTokXZDLCVX?=
 =?us-ascii?Q?mLFh4QwfvRrgL0p8jNFkgXSKFi89F/7033FSjC/lbxV4W5GfY0EA3/4Mp/ci?=
 =?us-ascii?Q?esDw4225LSIhtHBFOmGUu5UGAQXkcgw//020VtG87rDryPuU5u0BImIKk3tF?=
 =?us-ascii?Q?iNiBfP7PXBZr0sfK64qiAdeCGEDPUe0wsaIifvcQfiGCAny6fzvpkSwdfZke?=
 =?us-ascii?Q?rXLIC3l79nppm6TvMo5iv6EmHt1DsjuQKDzoBEtMCdPwlf8OUwqN6xPT2x7a?=
 =?us-ascii?Q?lK3omuXEebW4bvi2LSZf4a06x2QLZ9+J2R3Cg1aJPfxSRoPxFkGxE68979XY?=
 =?us-ascii?Q?8PM8XzeXOZpkz/HE/YcgJm3M+BNnh7AC3zIsTHvc6KfJRzCO1TXLQRVaJJKS?=
 =?us-ascii?Q?rRQ2SG9viABQgoTxsWfv1P6bOzZCoEAr3WdQflFLzBRkVsH7oIgqPGttKJUc?=
 =?us-ascii?Q?j1ZEvaYQcHJgyVgoAJj66ydvn3aG4l/QPsS7xY4PnbrxXndVFqixJ/qpHMf3?=
 =?us-ascii?Q?WG4MATFVMlAfv/YjnowstH2eCoGnk9WLsKLqDGZkstqSFFugO74F/4I85qsd?=
 =?us-ascii?Q?ZO3f1MJzXtYfEUJQ+ruHtiX1qRTvk/E/9L//4UFKFTvFTC1QTD0NuHwmVrO3?=
 =?us-ascii?Q?N4G1cZa8bGnWJnxU0iGU1z84ptWonDZjYPy0HBt7AFtjrgNhPaq+r0r+LrFL?=
 =?us-ascii?Q?6YVcXD9I0qZDqu8eQUUQS4YQ+tSwOUxZVlA5Ha2h9duVs0kfEXiN9T5i4z6w?=
 =?us-ascii?Q?m22CqUJ0Vkc3Xp7IlPXxJ9kMrnUfsb6IEMu8Ou1So8obSXMwUxA1JM101emu?=
 =?us-ascii?Q?MMG0FTy6vNs7t5sGWYcmT9g8iAWlc0+URagSUo9Hn4aitvMQeFKr9+O8T4aa?=
 =?us-ascii?Q?pPDb9RUqGG2k5aYbZfmzq1wQ9/c+ivOhN1dOQ+lzYrMQ2t1ZlIOORMD5ReEM?=
 =?us-ascii?Q?5tKmDmSuLuKRfqcz8hgTPW4Zp6AwfCruljQ3fKfOFM0/f290e7XvloBYP0WQ?=
 =?us-ascii?Q?igMPy1uQ9+uSW5WlK4CnBoaAqpNz/GSbQynwU2lhPG5fvfEbADixKTWShUp8?=
 =?us-ascii?Q?kCKsjykwUUujGl9pBVtTb8HUk7oNSXCNQYEeHzSTJv8p686ScRVEbIkO2ts4?=
 =?us-ascii?Q?LMQVdRGy6iQVTK7B7UHZrXxT1RmC277Y2hJqT+Rw0Lul/Ywm5yYTQj45AQ+W?=
 =?us-ascii?Q?/p4E1KC8g/qNHc+/Ls+bjEheIyTYOJGRVZ9XUQE+KFAJc9ddMMPt7fERaLrW?=
 =?us-ascii?Q?vXURGNr4Npwtyi0gxa2bVetMjRTvWVA6qcDI3wpSCtLr7YdOPg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 05:51:50.9175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e64a0c13-c095-48da-591d-08dcf326ca77
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_225202_153617_B230CAD0 
X-CRM114-Status: GOOD (  12.05  )
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

Add AMDI0015 _HID for Designware I3C driver so that the dw-i3c-master
driver can be probed on AMD platforms.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i3c/master/dw-i3c-master.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 8d694672c110..1a7c300b6d45 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1748,12 +1748,19 @@ static const struct of_device_id dw_i3c_master_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
 
+static const struct acpi_device_id amd_i3c_device_match[] = {
+	{ "AMDI0015" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, amd_i3c_device_match);
+
 static struct platform_driver dw_i3c_driver = {
 	.probe = dw_i3c_probe,
 	.remove_new = dw_i3c_remove,
 	.driver = {
 		.name = "dw-i3c-master",
 		.of_match_table = dw_i3c_master_of_match,
+		.acpi_match_table = amd_i3c_device_match,
 		.pm = &dw_i3c_pm_ops,
 	},
 };
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
