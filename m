Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF299CAC59B
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RbsEzh1DOZEpAMHla5r4gZiwPOrei1eLno4Wdr12ivw=; b=sod3aVau6G/K/A
	7/pwiE+I4mxeTznJkz18KhsqRxp8U1DR7+wYu5hpJSrT4n8AesWLApDkSt7R1od50ObtNZKerQD+x
	2g6dY5vMVLjYCeY7F5U5kuvAAHpxFq1p2RMNYDbxB2ToYfRbT6aA6Pk5KlQxLCNmqL4yOyMzca96N
	btBwQQPPmMNkB02ree0tGNEpbfknrzQWxy+ohoAmCGqAxwidRnbhLiAnPYbTsEqRlED9rkAsKiTFs
	v9cBBuGNN9ZZiIkoGOlQoOnbNNud6CIm8Zdi9CyFe4PKRctnQ25KHijz23KvvFi8UNwFOpA6yjmlq
	AVph791s8lmHg9NHM9nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtPm-00000002A2y-2Eu1;
	Sun, 14 Sep 2025 20:33:38 +0000
Received: from mail-dm6nam12on20618.outbound.protection.outlook.com ([2a01:111:f403:2417::618] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJGp-0000000Dun7-02eG
	for linux-i3c@lists.infradead.org;
	Wed, 10 Sep 2025 11:45:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rF04tNvI3yJ+73QeSBDtKjrA1VvMQMPQr84l3Z2DzYNVgicr4jrgl2SF+zmjQ0n7xeSkg4INy/+DFxj3c0KfZurgfTXBwfhwQMhPGpA9pptBLsn0wmeieWQDkEDBuGjMLzAxyXhK/yOJOiK42x6+jaxA1OnFVB89DRinpMnVp6IzWPG9wqxwaNZmI0E4KcA6RO0/8NSYPTTIqD8R9MiZaIJYyQZKGjWCEuNa+zDmxO0kq4adc1Ycellins1k436N8P2Mflmx91ruWA/sy4u3ZJQ3oMiJBfeH5fGyG+q1Mz7YYM/npEMeR/soCVJrZYyW7JrHyFW5ZOyQwFOT6w+oCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgM9V/u6mNNMFtaFlIIL4nsrYTmYBHocR4T4iKJTDnU=;
 b=CNwTJd4KaGHS3aqcVKfG0Ug0sUMSitlRDgJTkszo6g3mrLkFR2Nc2wO+2LNghLhJdZE9KuNjGLMrEm4QgH+B0slGPNSL4Ak/OtqTcnelrCVJB3VKxxiduwre6UJW+aFI2gVBziWDiVyOv5KVm+k3Itv8ljUCqRJri6K7Bdo6ib0ahg7KYj6q5mM26lrN7aakXCjxUcASDV+Ugl5JRNfIt7uhKWVsxEayLlSBywAqa3N/U+iKT4S27qtYzgs2kF1m9ThoUEZ9rsDJRA4KBh+axCaWf1BMu7vAPsSyaItLyB8fr/Sq53PC6yzO8HHrnx0+GcBSDSRga5UHi4E04MscEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgM9V/u6mNNMFtaFlIIL4nsrYTmYBHocR4T4iKJTDnU=;
 b=anuciSXiCxKCgvfxH9L4o0WoMooDzJcbCQu/Ai8h6adb5GOvvtTN7116zbwGx+zFYEqVDZDvnKY6nrxuilxyjfXZNswYgK5pKaDTFlV4h8JSMiorm3OwKIQdgQs4I2f44zQcxAHIF2abTSbrDlp+XWOnqz+WG4PZ/J+E7f6yBNw=
Received: from BYAPR04CA0011.namprd04.prod.outlook.com (2603:10b6:a03:40::24)
 by CH1PR12MB9645.namprd12.prod.outlook.com (2603:10b6:610:2af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 11:30:30 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:a03:40:cafe::c5) by BYAPR04CA0011.outlook.office365.com
 (2603:10b6:a03:40::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 11:30:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 11:30:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 10 Sep
 2025 04:30:13 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Sep
 2025 06:30:11 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Sep 2025 04:30:05 -0700
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <alexandre.belloni@bootlin.com>,
	<Frank.Li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <kees@kernel.org>, <gustavoars@kernel.org>,
	<jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hardening@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manion05gk@gmail.com>, Manikanta Guntupalli
	<manikanta.guntupalli@amd.com>
Subject: [PATCH V6 0/2] Add AMD I3C master controller driver and bindings
Date: Wed, 10 Sep 2025 16:59:52 +0530
Message-ID: <20250910112954.553353-1-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|CH1PR12MB9645:EE_
X-MS-Office365-Filtering-Correlation-Id: b1825412-ebdf-46ea-aa6e-08ddf05d7236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?avtdFGfUvFtPWg9Y7AeT4YLvlpsnOfDmNVsfnASQ06mi8UGDBkeyrnB7kZ8V?=
 =?us-ascii?Q?ERB7R0gDr5M5DpHUR0BOjg3I6Sm0fVBvMk6LoR05gNcNMXUaLYbTlrEmn8F7?=
 =?us-ascii?Q?Yg1/UXYUzT20fEvbgM5Zc6zZ1Q1EpaYI7/LQYFoJBz+6KnKf1R6AkXnQKHRA?=
 =?us-ascii?Q?RYEiZSVJ/n0ZckIDiJjA4Db1IxbR+f3+kN/+eZvOqGqGJ0epHScPYPeMMGNK?=
 =?us-ascii?Q?t5uWJobMyT4iSoe50iCax8pGjAZ8Dve2KQiW8YRLjAeWWRCgbm+ALaFLRoZO?=
 =?us-ascii?Q?vZcootvKsmx+tggGRof67o3k8gjNNiNOuN/o88XxeNKIm9WKz60xQAjuMmQF?=
 =?us-ascii?Q?iXVgtRXiW9pUybdjy3hI4R+rW0SvXvi/2mhy6CxN5DZWcy5STkdki8TTPDYQ?=
 =?us-ascii?Q?y5Kd6On00Cjjw8d216Xa7sBijFkyyZb/RBj2BjqTVhHuAzp41O9ZgkWr+9t4?=
 =?us-ascii?Q?tfa4yFhHZGRYn/mQx8So+6eHh34vbrpgf29kc5HfEcegZjZKpRWhq0v4oXR5?=
 =?us-ascii?Q?u82Nt5UwskjZsLCTnNT5tAbwzF1eDi/a+1WuINH0L8D5GHYGypO4eiLhL8o8?=
 =?us-ascii?Q?RHQ1hYXYiOuebG6LwU/p7oycolH+Ol7mJJfggBHB3uPDUn9ENgV719tLZPKv?=
 =?us-ascii?Q?g++G8MqHFEA5C9nr5EZ+kZ46tzv0G+v9C8Kooh18r0UKTsw2Xvdma84ePpCA?=
 =?us-ascii?Q?tOto0OOQMTsVRudmkLpzvD+Dn8UbZuLQ/NbpdH512ihziEAUZENWAvmzQDOc?=
 =?us-ascii?Q?hmNPGuMGk2opglvY/kyjaRztyosjbNpR/u+ky9Skm5ypsWG8W8sdl5ko02/l?=
 =?us-ascii?Q?ZtmTOd9pUNJYedYDxi3AO1J2e5ZWKLLEDWcOQP2iTR8L2wyYpABaK2u7RoJP?=
 =?us-ascii?Q?HpKL9poAtPrLk/yMjawIqdct1omiObuJgm9F37PgXL5pyWBqyn/6UM+gLwSi?=
 =?us-ascii?Q?rS+nK1rWy/hR6Pfvv5fPX8nlTulYOHfbxRxkr/Xx4aN2iw2ZrnrcjD0MxmuG?=
 =?us-ascii?Q?VM96zlZJvrQJU9NppxrDhh4aVMlQtY63Y2pJoIdyEUGXGip4s7Kv9CYgmdlh?=
 =?us-ascii?Q?RJdCJyUEhWLRTXwqwzrmQNH5wJfoiaurYxe02DG7SoBIfx+tiX+hrjRoXsgB?=
 =?us-ascii?Q?1xFtealP5acTiMTgligeHeG4MjBKtPzRjk0qYJ3eQZed5Iu/B+sDmMEwxhgL?=
 =?us-ascii?Q?NlTvn3l8A0UCTxVu9QexS+tmSwezRYWmsR9ji8D/QnG2N6MDG4aRJseFMMzn?=
 =?us-ascii?Q?fi1WM79GBbyWx3JpTQ7jI4G357DSbjJ56iAn1Mq5JnKO/IcFera7/UQx1Zzf?=
 =?us-ascii?Q?ySu3gtx4gnJM3L3o5h3HmyzEl4OO5KNpsGO1qziPvrfK30CLp8d0x0GAYKDb?=
 =?us-ascii?Q?5flUwenEQZJqlnib+wYm3OhFIPIotoqnpm/aWi4dSj4+WkQg7IIhKNMM7NiX?=
 =?us-ascii?Q?4pLz4rHJBP7N4JNNnXRXreiQrnOuXLKnKpehPRQJSAEW7ShqVrQvay8w4shG?=
 =?us-ascii?Q?uVJaA6G0Xcw31ZbnjAfpm4wsrgZi+VTiGWKcMcuEkJMHXS9X0x1IYI9KZg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 11:30:29.4582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1825412-ebdf-46ea-aa6e-08ddf05d7236
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9645
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_044551_049945_3FEB25DA 
X-CRM114-Status: GOOD (  14.09  )
X-Mailman-Approved-At: Sun, 14 Sep 2025 13:33:23 -0700
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

This patch series introduces support for the AMD I3C master controller,
including the device tree binding and driver implementation.

Changes for V2:
Updated commit subject and description.
Moved allOf to after required.
Removed xlnx,num-targets property.
Added mixed mode support with clock configuration.
Converted smaller functions into inline functions.
Used FIELD_GET() in xi3c_get_response().
Updated xi3c_master_rd_from_rx_fifo() to use cmd->rx_buf.
Used parity8() for address parity calculation.
Added guards for locks.
Dropped num_targets and updated xi3c_master_do_daa().
Used __free(kfree) in xi3c_master_send_bdcast_ccc_cmd().
Dropped PM runtime support.
Updated xi3c_master_read() and xi3c_master_write() with
xi3c_is_resp_available() check.
Created separate functions: xi3c_master_init() and xi3c_master_reinit().
Used xi3c_master_init() in bus initialization and xi3c_master_reinit()
in error paths.
Added DAA structure to xi3c_master structure.

Changes for V3:
Updated commit description.
Corrected the order of properties and removed resets property.
Added compatible to required list.
Added interrupts to example.
Resolved merge conflicts.

Changes for V4:
Added h/w documentation details.
Updated timeout macros.
Removed type casting for xi3c_is_resp_available() macro.
Used ioread32() and iowrite32() instead of readl() and writel()
to keep consistency.
Read XI3C_RESET_OFFSET reg before udelay().
Removed xi3c_master_free_xfer() and directly used kfree().
Skipped checking return value of i3c_master_add_i3c_dev_locked().
Used devm_mutex_init() instead of mutex_init().

Changes for V5:
Renamed the xlnx,axi-i3c.yaml file into xlnx,axi-i3c-1.0.yaml.
Used GENMASK_ULL for PID mask as it's 64bit mask.

Changes for V6:
Corrected the $id in the YAML file to match the filename and fix
the dtschema warning.
Removed typecast for xi3c_getrevisionnumber(), xi3c_wrfifolevel(),
and xi3c_rdfifolevel().
Replaced dynamic allocation with a static variable for pid_bcr_dcr.
Fixed sparse warning in do_daa by typecasting the address parity value
to u8.
Fixed sparse warning in xi3c_master_bus_init by typecasting the pid value
to u64 in info.pid calculation.

Manikanta Guntupalli (2):
  dt-bindings: i3c: Add AMD I3C master controller support
  i3c: master: Add AMD I3C bus controller driver

 .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        |   55 +
 MAINTAINERS                                   |    7 +
 drivers/i3c/master/Kconfig                    |   16 +
 drivers/i3c/master/Makefile                   |    1 +
 drivers/i3c/master/amd-i3c-master.c           | 1009 +++++++++++++++++
 5 files changed, 1088 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
 create mode 100644 drivers/i3c/master/amd-i3c-master.c

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
