Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47834C3DA63
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jul 2024 07:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=64kwzfA36HbkL9LkFfz8bGXhaZzwPvHzdCaOJ3I8BJE=; b=pf1Lmwp9Ky4Frz
	xxfrBNWmux2b6SeWipl91E6r336tMGE7a1U656/YvxuLdgozB3fovbMSHeCDuz/zckw/faT+sLyNj
	KGOKArd+Vq8bNXMj1gknwWqvHuW1S3NTwO4RHKbIzAMWu8EMZplURln31koZXiM4HHMlkkuP/VLa2
	jgCeoj95Ox6tf87DdP4P1kpbpA+Ke6zW1n8XZVkgoTto4EHq4BXRPg+MrnO30A6x/iaxmypNHNktv
	xypwZyWKG8iMQaDpiHivnWySTupe2VmB97TeJ+r+x1i4iWglIj04boyWYAOKcXPv5NV9Y7XId7t1Q
	tFwBCve12ReuwCr8YlHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWWBs-0000000Eaug-456E;
	Wed, 24 Jul 2024 07:13:36 +0000
Received: from mail-dm3nam02on20600.outbound.protection.outlook.com ([2a01:111:f403:2405::600] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWWBp-0000000Earu-0qWS
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jul 2024 07:13:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dD4JC/+N28vO9tPHjq9S1EgkhWg7vqSq9XzMIe1UkshuxJUGf2Qp1ANfHQj1VPU++Hs/C4fQqnqPs5a9tfbGo4xkCOaqmQ4g+MJQeh1UUO6Rc9SRcQYTUJM8sw3RXr3CHiSyMhBJvd6l4lPMe/RUrwUHgJHqGgygW1isVFBLWzcfbJtt+YosiR1/lL4kjwo3JDZOQiu0MUku7G+x/b5M8NXTDNViJY/dB5DAChpW+5oNeZTfpEVmzZLCVOF8CoNz89LKwU/K7Y7nwaMQ6x9ugbTsV2SHh9oFtWPUDsQKI0hq9Ez5uUIXLLNTUSDYVBWyfE4olv81XVmMvFeJGsF2UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMrvv5KaVaRLzkoKWn7MmSXd6PTY5shWek6qlzF7EXo=;
 b=ccDcQ4tARop75/0Kcp2zEwwtDzb0x5GSBmg4bpnnPXoN0SG8nkzvccTBg+l4xtKEmn1d+WLxm/twMO+HYHO+pd9l6//121uAl0HrrnhCjU7ph7H8fnpjtyff0vY0HPIHaXe/vjfs0EqccfZpzqc/xbix038K4+9pPdbX5R6RQXiY0sVndN/KRiNdiZbJWzRPQjuT35UoTU3M0Nm6qmbEggHVklwZEY7KIq0nibgQA7B+hs5KWZ2/n8swB6CbWYul59elstZjopz/1ggqIH5BqWFbrwxAV/0ATIy1CcLtEaSEBuo4GiEck2HHYtDSnCzwTdOvDVt92Uh1Y3knd5bGqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMrvv5KaVaRLzkoKWn7MmSXd6PTY5shWek6qlzF7EXo=;
 b=Jg/1Ud7COVgtcBn0GdcxRxtgShgJMvWvkgj6MbuYCB3wAcreNLJYrU/q+em/7tEx0ZnAm9qrLM74y3/2hojmjzWIVz/ed0vJFIzxIoXUcdhPfP2iAV3W6an6X6ev+x1N72/6XpHvaVJgxPVV7RwH4OjnK7Qn8hrBBOCtaNuWCqg=
Received: from BYAPR07CA0100.namprd07.prod.outlook.com (2603:10b6:a03:12b::41)
 by PH0PR12MB8773.namprd12.prod.outlook.com (2603:10b6:510:28d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 24 Jul
 2024 07:13:24 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:12b:cafe::97) by BYAPR07CA0100.outlook.office365.com
 (2603:10b6:a03:12b::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Wed, 24 Jul 2024 07:13:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Wed, 24 Jul 2024 07:13:24 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 24 Jul
 2024 02:13:21 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/5] i3c: mipi-i3c-hci: Add MIPI0100 ACPI ID to the I3C Support List
Date: Wed, 24 Jul 2024 12:42:41 +0530
Message-ID: <20240724071245.3833404-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240724071245.3833404-1-Shyam-sundar.S-k@amd.com>
References: <20240724071245.3833404-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|PH0PR12MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e55ff4f-6f96-48d0-d149-08dcabb01b63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hPSEOkk6qSRnvBYAHYnnWrmreStog9ou3cZYc3luaV7KN9GkQN9sWC4rxr68?=
 =?us-ascii?Q?kh3GeUiOvFcDo9csq0bV8jHKixRXtUYintWcnxkk+D4QxkGWQ15XOK6DRq1Y?=
 =?us-ascii?Q?LK8oR9wX/pJEcX9Oej9Q/ExMik3Djd887Qy7xvVeKoMS8R0iRSlfhp5PXZ3q?=
 =?us-ascii?Q?j8TC1XsGzA+oWRZppdD6KXOnm1N7JbVaTAueB+10QIRgTeIZvFzkzYwBbWDK?=
 =?us-ascii?Q?3Lts5YopUOfVQAvcUsDpHs2jF7YEX1OpdaALkPJ1Z+ZyWCsG+tA/cFBIxY2C?=
 =?us-ascii?Q?fF9rnj555hCkeuSOkt5Msdun+UKvz1goKcpp9Ps76bjtl4R6QDkmgrjOUcjE?=
 =?us-ascii?Q?4mjRMELf45IeSvRkWQmcmfE0Hv7yzV7iI+UcIeU6WOiij/fu4wYZ7Y1noLST?=
 =?us-ascii?Q?nAXliq6eDVtU+bPtMPhiCH87wOpTuRUcoGCHeuNtcveBOjAaZ2vwW4vZluDw?=
 =?us-ascii?Q?7rMNXTbafmCDdnpydA8ky0UKG5I0g3Nnut4idIPS9WtCXeHyIeGvRjIjXAjW?=
 =?us-ascii?Q?/SliCJGIgYjx+yADB7AcPo9WYy5aykTaLuJHi4kGgMFjJ5J8dd8H6orIC6GQ?=
 =?us-ascii?Q?+CIo2mMiF3dGrVsvD4S5ZlOJmzPqjUpDqJfsOfvAQ9Q85o/TR7Q5+H538ZA+?=
 =?us-ascii?Q?c2+IxEDqJfDCI0d9Blx1EanMufEi24WRpZPL+cWPzRFs8d/ep0c9SFUyzdPD?=
 =?us-ascii?Q?puiu6HZJh1Iwv8SQ6RBnpNy8SZtf6nYEoh4P62offp9FFIwzn8GjVEoveUfH?=
 =?us-ascii?Q?MVT+2GZ3LSz8Rq2gyO5M9oncZ673w94MZwI0kLa+E9mpWVh2J6t7VzvdOjSH?=
 =?us-ascii?Q?InnJhzhNUgSzAsscObhcjuK/g75ilXaVbz0sed8FRnC9mVxvxUjgX/YVVjlE?=
 =?us-ascii?Q?76WxsTMvo2Rbua77gOy2sC1ig5lwKNU4awa7QcxODfznIYzUQKN2gWaV5CzX?=
 =?us-ascii?Q?mKzwgJjbu/epnr1B0vTiI84lFwd+3WP0VBuEm0OnINjyd2idHDrN26TOcxGq?=
 =?us-ascii?Q?9KCS+XbzPBIdeo1MOr4ZTM0ffRUaqDJfNFFD4FEfv+sDgD2UaVzs8vSohjHn?=
 =?us-ascii?Q?OoCwObGi+Gxz/FazdrrPwKJBH9f7D1BNeth3MqUm1AdE9I60iEm+5Hozsz2Z?=
 =?us-ascii?Q?K44/0DfCNOw4jZ1yIhKnBH8PMYkuqaYtkNeNRUiZoFtPZ89p678kXhjdRBjq?=
 =?us-ascii?Q?agxgpUFujHbmCnv8CMO8nTsL9NIHudnv3Ds62XUI6hTwdQwPV+b7PqA/Tg2I?=
 =?us-ascii?Q?RGdaR9NK6kdyo72f6YBEbwUL6NibaxFalFqCwTlhMdxipDjZjgNi9A26uiRF?=
 =?us-ascii?Q?xgo5W74DuwQ3z0JfYayCGQd1IYppSMyRm5V4YbMek0eXClsM6W55lKXd89pH?=
 =?us-ascii?Q?UXtizBF1Zsqq8GpDouboMoEKr50rRSR1Ig+1t05AcVRDDV5iOsZ/LmQ454C/?=
 =?us-ascii?Q?OpLV+6ENYSMi57FBwH307OUnIUiDU0P3?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 07:13:24.0325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e55ff4f-6f96-48d0-d149-08dcabb01b63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_001333_256157_E3447F0F 
X-CRM114-Status: GOOD (  13.36  )
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

The current driver code lacks the necessary plumbing for ACPI IDs,
preventing the mipi-i3c-hci driver from being loaded on x86
platforms that advertise I3C ACPI support.

This update adds the MIPI0100 ACPI ID to the list of supported IDs.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
MIPI0100 is the ACPI ID as defined in the MIPI I3C DisCo specification.

 drivers/i3c/master/mipi-i3c-hci/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index d7e966a25583..dbc8c38bd962 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -826,12 +826,18 @@ static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
 
+static const struct acpi_device_id i3c_hci_acpi_match[] = {
+	{"MIPI0100"},
+	{}
+};
+
 static struct platform_driver i3c_hci_driver = {
 	.probe = i3c_hci_probe,
 	.remove_new = i3c_hci_remove,
 	.driver = {
 		.name = "mipi-i3c-hci",
 		.of_match_table = of_match_ptr(i3c_hci_of_match),
+		.acpi_match_table = i3c_hci_acpi_match,
 	},
 };
 module_platform_driver(i3c_hci_driver);
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
