Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B2FCAC59C
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5sIvOf/7+bjISih2dsOV9HED2/I21l7PqmMdukeoqO4=; b=twzpuOzT3YRXiA
	YNYj4KFn/39Vbs2fRWto/i4pFWtxw4am6HqlIEnFzqVrOt6AajFIjawR/TW16YHettc9ngMsQe0Y3
	fQlV1MhsXmOi1OyZyX4pVXA3VUzdnKeMkMjbeGAnM7xVieEkZ7Vri43Vcy5HIjTEmUE2nuN0dAhy7
	+XtXqi435gipWr2rcSliEOe5RRUWIjX43l+YWYiuxSZhVQZJF4POBqjf3CuW+mh7b8VxF+KSsM6c6
	08NLaY21cA5S3dCZok72wzgUh5+Q4FnI11Ti1s+aTraIhnnTeISohz8/PcpbRGJVZZVFjlxUnp7qX
	HrkvMY+E+locLM/lq3FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtPj-000000029xM-3azd;
	Sun, 14 Sep 2025 20:33:35 +0000
Received: from mail-mw2nam04on20628.outbound.protection.outlook.com ([2a01:111:f403:240a::628] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvZwQ-0000000GdeL-2ZCR
	for linux-i3c@lists.infradead.org;
	Mon, 08 Sep 2025 11:21:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmcF6rO82GaxrB5UT5BZ4DP2EyQQH+hcNtYyLA8lIDF32yxLEC1LQHC6vvpGf8X/HQNhmmKCXJ96BVfhWbKtEGH6J+GrA7qlIOgxi6b6c2sNRHeogcLDRDWM3qpvOYafu5/GEd/pTW7vvY4oRMjgVuoh6zWGrPR/UkGf/gfXe0W7E/GoywvyQMIviayeZZvqNKTxzXE5pN1k2IPxUW5PsiYqyLW00amnDsowTttnwx9i2soQSLZX9YbY9XlpbMiDLD42NTGzfNpjmqhWdoKwpKeDnat8MVl9l1poHNopHKx7A4nJpuOXkFIv+nvM33tPXt2EFKKoK714lnG+tsBn7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlzlJcyncipZ33Qg7z5m23BoO4A06Nfxh4zTmEMXnNU=;
 b=m5qOhBNyH74cPAWKkLcWKnGt9kRIMTTTmSbXZOARLJx4Toi3l64IsncMIwvcemTG7nP3tSElklA+BxBRBF9mxL2gDVkOKTf6KJYVPrv3ntn7V0R8BP+X6QVbzd6O9vkRPAFCZ6orLjHIDbP0HFo0Mmc2rodhVr3iOFuiRBnyGYgHGaEuasn6j5VI7gRLKXm3VeIxTfuQTu4692wav9osYCW2+aWrresvSmVYz/WAklmBQXb27xSoQlpeEC4M68SVszeyG1SGjandFF/KHTEdG8bLmHYE4RtqolYiH52UW8emnoKNIIEPhcxIwQLVfpgt0nwBNsC9ihESTDKJGBUW5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlzlJcyncipZ33Qg7z5m23BoO4A06Nfxh4zTmEMXnNU=;
 b=iURzAVf71XEcFplif6U/FqRWnMRmFU0sXCSNKBVJn2J9q70WpBl5d1RTVl9Djd2BGqPJ9rF/G7vlFaNR74jEV+6e+SHT7zGaMKdlypQGi+p+Wjt3z78FBL2D8WfEoxt9b4EtNMn3ar61EyHQZpzhbBUhWgp6hqOxD1BSIU4/NYo=
Received: from DS7PR06CA0020.namprd06.prod.outlook.com (2603:10b6:8:2a::21) by
 LV2PR12MB5894.namprd12.prod.outlook.com (2603:10b6:408:174::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 11:21:34 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::18) by DS7PR06CA0020.outlook.office365.com
 (2603:10b6:8:2a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 11:21:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Mon, 8 Sep 2025 11:21:34 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Sep
 2025 04:21:27 -0700
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 8 Sep 2025 04:21:21 -0700
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
Subject: [PATCH V5 0/2] Add AMD I3C master controller driver and bindings
Date: Mon, 8 Sep 2025 16:51:15 +0530
Message-ID: <20250908112117.205270-1-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|LV2PR12MB5894:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ab49449-60ca-4e29-c7d3-08ddeec9de5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZDrAgNOvmC3JFi0leXQVH74uy9OA4b0p0D+nKxEJB3V2jQeLHwpk8tZ9mQBC?=
 =?us-ascii?Q?xENe+XYJ3G8DhQKtYy6TnA5vj8jAkkhV4spOOhI5C/tHSzCy661vWBd9k6x2?=
 =?us-ascii?Q?NtYxPUlqcLQ4++twTiPMy0A716dWTyirhY1M4p0rC4WLO4S9qGo+EQLFCo8q?=
 =?us-ascii?Q?w9lECnyTqnlKN4l9iMOErlQq8IEI1aFv3LaDljzUbl7wehenX2khKx8OYJ56?=
 =?us-ascii?Q?ESTX6K0t1BBKOKl+9Y76Cit8SuwYd5AaYiWkCr+720g9lPihqlNY8vk/UDfw?=
 =?us-ascii?Q?ciuqEsKGxaRZYLRbVBouArmNC1k3S8JxBdHqCrgUh7t7/2IoPBCOd/8xKlks?=
 =?us-ascii?Q?aGiEbQk2BTPyp+GzMkGUrM3cyDkkDLFC2okutnyrddv6QvjtJCn88jHEeQxa?=
 =?us-ascii?Q?xTvGyAq7pLgpYxRR8XEqjzN1tcXanDHrn6i9pOjwdn4ZfTIsDxvR0f0wx8yQ?=
 =?us-ascii?Q?0Ga55sd1qtsjzzcAxi+/vAigVuG22GuVobIFQhApzGPRimzw96O1lLA55/uV?=
 =?us-ascii?Q?RC/KdY0wSBtXhZVZm/OYF2DsXzVO8YJzMUsRmpUrQjHjBLU7X4EhDldX422i?=
 =?us-ascii?Q?VvmBi2NflezrfIqut/fqn4/glnXxqpqhg0JUsdn+cc4C9G3Y4KI9ImJIiNvt?=
 =?us-ascii?Q?xBQrSs68ekByNLuTgvSR+eyN5o3s3TNKN5TlcYv7XEOz+sK+YFOhTtgAm5KV?=
 =?us-ascii?Q?J0xEYx5WOrSo3DmKy66YRScdefgPW8w9RDxLDkDdJjSPPbCZHHLdqef7VmpA?=
 =?us-ascii?Q?XWT70iLhSXzN3olyXkk4Aqyz3LLl/WnAtIPIjAxnFZAc4Xz0ZiDXpMM5hDS8?=
 =?us-ascii?Q?xehAgws/Qbxk6M2d6+voiFOf893zsnYtUxo7XY5ifpN7RoOueW+3y+w3u0Jl?=
 =?us-ascii?Q?i6jCnPKkjfJ212kNTl7+pcEVHXP5jLi5ADY2l3t1ANTxtlruXhumSEBP5w6R?=
 =?us-ascii?Q?RBLQtkhZxACh1ryvLPkJHVEIQSo+XsSZn1zplJxtohTDmJ2YvtBDJ2jcZSoI?=
 =?us-ascii?Q?d4JhkRlseqKQOQPfAryKmdHrHP1ydjceMg7Nf5XmhvPu7pjNirR+bgyfX0wj?=
 =?us-ascii?Q?UJ03ESMpBOysHDnPueJqFHdKJhD9rbeba5/uUZkBKDzHVbMCuzqTMQJ/GjX5?=
 =?us-ascii?Q?DgxZwtLxjq7vdKptMriQIRNG5ivZDCBznaRMl+G3iJ0Za6qk1NxEtOT3bdQ5?=
 =?us-ascii?Q?TrRGxD2t7VmXLc966eohyvFJNogNh7++/czvYdTzBuhPHkDRX/CLhSIH+nMj?=
 =?us-ascii?Q?3weA1obVfShUIx1bl1/sjHKpvRhiu07yT1q8nMOEE9gIQtySWTrVeAZyTq+N?=
 =?us-ascii?Q?YV0lalaqIJVdApSaZYXegySobZwt+UDQLtXw2dSiXgXg6K/EVeW7h4CnMPDQ?=
 =?us-ascii?Q?glQxL2cz1MgVTOdQ6BVb6fJsfhWfJkAvqwP9nXQvxjNURlDx1g6SSGA5b5Ei?=
 =?us-ascii?Q?b6bUy5+5Yuhr+2Vwu3Wm+cLmsyDVzde0MPbSEy1ZX5MJi6A0cEBXEQfhQ0sD?=
 =?us-ascii?Q?jpQr2vziabKMQwnqEp9kkpBDCSgmbQ2TzPblkBP5qzpOByZlbBiTnl5XhA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 11:21:34.2198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ab49449-60ca-4e29-c7d3-08ddeec9de5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5894
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_042146_649615_95E74283 
X-CRM114-Status: GOOD (  12.59  )
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

Manikanta Guntupalli (2):
  dt-bindings: i3c: Add AMD I3C master controller support
  i3c: master: Add AMD I3C bus controller driver

 .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        |   55 +
 MAINTAINERS                                   |    7 +
 drivers/i3c/master/Kconfig                    |   16 +
 drivers/i3c/master/Makefile                   |    1 +
 drivers/i3c/master/amd-i3c-master.c           | 1014 +++++++++++++++++
 5 files changed, 1093 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
 create mode 100644 drivers/i3c/master/amd-i3c-master.c

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
