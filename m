Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B65CD98F2
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Jun 2026 11:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3XAsWo5XQ1w6DkkYHY1DsqVN31XF5dDbC4+hgpFneHA=; b=A9B/7mie31q0at
	gFMtYNH7/jH8TFnO9huDdoQKVPqNMqEH1s6Lz6Z9tBSY0T2hetU0QtVHG4BfLNwpgt2VZo/5FADLW
	npaWGmEcW/12VdAk6I7cWpCH0UBGSUmLhz6gnEgA4TFQnTqkIvM1+QE48sVjcW10UXf3s03NmhVQ6
	O0l3/IojsVVK5awX2qiKT94gbxRUx8h3PPX+prJnpCIElj26CczaJWmlO4zxkLxnuk5vda7eppiF3
	vo0r29pLA02Cr/UzaRHzTVr5PEari8dB00BDukEh1X7LOchr3689Q4hazteGAwGSB8w2UqGas3I99
	B9r+hfIO6LqFxSQZw2aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzYj-00000006CKf-0y8T;
	Tue, 23 Jun 2026 11:44:53 +0000
Received: from mail-westcentralusazon11013041.outbound.protection.outlook.com ([40.93.201.41] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzYg-00000006CJk-1hVV
	for linux-i3c@lists.infradead.org;
	Tue, 23 Jun 2026 11:44:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V85AgKTVGCvjbMc5Z64JaFHXuD4YlYDl/eT9bMxiA7Mdzw+MrkUiACmtIJRqqLvf2ogMTgJsQXFIfDaUvbMeacaYyU9OZ6HqJAf4uxSGSPfN4OKD9gwVEnYY7U0yY2qrMtrDOhoN7eV6I/Py+xk0A2B0jxDNHO3vwiEjpVBd5zWI7I79zKWn+x56jQ+4Osd5I4Ml5YamqT/2EDWENeY6N9O8uCG1HP5ck+KkEh+m6M49IF8+WTl4ofUps6sVcDl+Fa3h6d4iXJ3Uo8Iz8JTdeEwRa21uEqDbVVmsK4rjFVMA0//Rt1vomi5NopF9NtNa5DeQuUATwNh9HIMAyOOwpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSqHpaC3N5h1QLHJR/8jhQv2KN6Dj380ECJeIv6IFJw=;
 b=an5hDhKL9EwqMSt8/Kew/suKVICl5SGlFZGLVzmFy5Vx3kYZ7WzAnotFL3tN5D5wsS6KV3y/Iv696nlAaK8HBpHkbNIxHpBhFDbyw26D9pAJcLwTg4qTh8AsI4KuRxyo4+BLzbFnxLoZzREemvEYzVarWQG+6/GTMMqDu0JjF5zP8AWM+Uqvx69pH31vbf2mXLNMt/eD7aObS4XITX87uyaBwuAI23oI4GpyQCllP8ciU/VUF7CtZPxX7q32nvDsMEUkF32Royiox6JuJEv4tx8nNwyK1Db0XyUdSdDLqOCEMdvE/EiBmyhSFP2detwUoGxRPU9zjGrWHTljGlRYIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSqHpaC3N5h1QLHJR/8jhQv2KN6Dj380ECJeIv6IFJw=;
 b=gA9cmxxYpikJEH6f28MMwzxFsfBDPzFv8SnZNWY/EJDEfKTc3uGyA+jSxtIj9smLKa9PNqzuBHGO/oOrEQaJyTs9qzW/mVmy/MwNe8YW8nUG05OKINxBw+JXv/P91Aho69A3eMskhVoMywtX4FVl117ET2VM6Smz18qXpNYxK30=
Received: from MW4PR02CA0002.namprd02.prod.outlook.com (2603:10b6:303:16d::10)
 by BL3PR12MB6451.namprd12.prod.outlook.com (2603:10b6:208:3ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 11:44:39 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:303:16d:cafe::62) by MW4PR02CA0002.outlook.office365.com
 (2603:10b6:303:16d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.16 via Frontend Transport; Tue,
 23 Jun 2026 11:44:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 11:44:38 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 06:44:37 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 23 Jun 2026 06:44:31 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <alexandre.belloni@bootlin.com>,
	<Frank.Li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <pgaj@cadence.com>,
	<wsa+renesas@sang-engineering.com>, <tommaso.merciai.xr@bp.renesas.com>,
	<arnd@arndb.de>, <quic_msavaliy@quicinc.com>, <Shyam-sundar.S-k@amd.com>,
	<sakari.ailus@linux.intel.com>, <billy_tsai@aspeedtech.com>,
	<kees@kernel.org>, <gustavoars@kernel.org>, <jarkko.nikula@linux.intel.com>,
	<jorge.marques@analog.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-hardening@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <shubhamsanjay.patil@amd.com>
Subject: [PATCH v9 0/2] Add AMD I3C master controller driver and bindings
Date: Tue, 23 Jun 2026 17:14:14 +0530
Message-ID: <20260623114417.2578189-1-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|BL3PR12MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: aa113acc-12a6-4e94-141a-08ded11ccec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|82310400026|1800799024|6133799003|56012099006|921020|18002099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: CMd7FJNxlbkMpn8moiQ9taLKi/oPsz5PB6kpBMdYLt8HneHzmGipa8AQGAP9/4GXGgciYO8GrY8h+ddNi7wjFt9Sps+O58EtVoAXob8jOGZkQ80kE0kYaL4ZY21KQffskF2ClR296D8xUUVGoOCvJOTJ4QZ4GqUq8KGx0zFtBWpu5pdSqYqjvvC3hfqhQySc75BdHqqa4Q4nhXD2ox+o/VsQvDcC3cXVQswgvoVIiySC2ntkkh1rNIJLWH+BwTs/e/A8EUpLryi1MH2UIWKstNxgokZJ3Ra4SUzm+uJGWgCpfYf7pHepiLueAr8NM64ABpF9Q7fZPuAfnBakzIr6XKxlNQAotWQtgJY6ojyXYQxZJF4iSvaRl1vsjrCr7PhFdVlgkMP5r7HzifUTRBMnAtBELiwEcOyD9O558dCF7Wmu5ghdYm6BgAwuPLUbsw5QXabN/NxGL0sjCzjny6yjB/i9pCrVFbmxeDK5ZpAfjPXUTjYLtdmTNxZHVlv04kD6UmdzZDfNiK/68ih1QtuOV1fQmOt5ApoXBuTycimuL0AqYvuXXbZhP1wxuQcCWtUHON+eidpCS5YchNIqhzeu3HIsiL0Q0BXYPQDZ9Pit3pOWMWPXPZngr4ESuRTe0l3W6ohzXQG0t+eNt5MWbarKEXtsGCxFLWL3BY+w07zofCKOZflgqzrUzX2paIcCmTYTXoygwJoNOQ+uP+GEF89aj6o59dhMP1xRYjBzbxrGgs9WwRDselXMJgryrxXR1bhT
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(82310400026)(1800799024)(6133799003)(56012099006)(921020)(18002099003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wQOinEGNlWHzuyMFDQ7ilFo4ise7umvpoXRyFv7+wFviD3bKHXXBbWvrq/zDyjhD6Bl2GBuJ5XMPTLWdaMRxAsJl7Js8HTh7CrHMO/PfHwjJKKzc2+jU0EPiqCk/BnraHIGnCtKbeOk1VSnNaJl2m9AQMQlfq8PDL3BhnLMT8lerSPMEQPw0fEHB9NyUAEOOLi+JuVbtC/NTGhoB49Wff9Br89GK9aW3SeKikDR2slXqBB8MslpUFu+t8Wdf2hhOi7/7cuU7mYB3dKHMTYhPgDC76Mo6czPAgTLc8M6EhlUpGtaosOTDnPvckAOlqd/hIt0FFdkXZpP71qAgn4ap3k4M3kGRx0LHQUodtOb1teDpu3qEMEjFnHnX/zdT3j9OAjIcG/bcfw5S5WtNlYLiF/BebUzgNUjk51X1LWscePU0REslnImTT4JpqkHBgLAC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 11:44:38.9966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa113acc-12a6-4e94-141a-08ded11ccec2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6451
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_044450_447855_6E54AD2F 
X-CRM114-Status: GOOD (  14.31  )
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

Compared to v8, the big-endian MMIO accessor and i3c FIFO-endianness
patches have been dropped; the driver now handles big-endian FIFO
accesses internally.

Note: There was an extended gap since v8 due to the transfer of ownership
of this series from Manikanta to Shubham. This transition contributed
to the delay in releasing the v9 update addressing the v8 review comments.
We appreciate your patience.
---
Changes for V9:
Dropped the three big-endian MMIO/FIFO infrastructure patches; the
driver now handles big-endian FIFO accesses internally.
Replaced the async transfer-queue with a synchronous transfer path.
Reworked error/response handling using enum i3c_error_code and proper
-ENODEV/-EIO returns; propagate err to CCCs and priv xfers.
Switched to the new .i3c_xfers op (reject non-SDR, report actual_len).
Reworked DAA (incremental address assignment, -ENOSPC bound, -ENODEV
end-of-enumeration, checked device registration).
Avoid busy-spin with usleep_range(); use FIELD_PREP() and inline
helpers; split the timeout macros with documented units.
Dropped ENTHDR (SDR-only); updated MAINTAINERS, Kconfig symbol
(AMD_AXI_I3C_MASTER), authors and binding maintainers.

Changes for V8:
Included dependent patch "i3c: fix big-endian FIFO transfers"
to this series as [3/5].
Resolved conflicts with "i3c: fix big-endian FIFO transfers".
Updated description.
Used time_left instead of timeout.
Used __free(kfree) for xfer to simplify err path in multiple places.

Changes for V7:
Added i3c controller version details to commit description.
Added Reviewed-by tag to binding patch [1/4].
Added big-endian MMIO accessors [2/4].
Added endianness support for i3c_readl_fifo() and i3c_writel_fifo() [3/4].
Updated timeout macro name.
Updated xi3c_master_wr_to_tx_fifo() and xi3c_master_rd_from_rx_fifo()
to use i3c_writel_fifo() and i3c_readl_fifo().

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

Changes for V5:
Renamed the xlnx,axi-i3c.yaml file into xlnx,axi-i3c-1.0.yaml.
Used GENMASK_ULL for PID mask as it's 64bit mask.

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

Changes for V3:
Updated commit description.
Corrected the order of properties and removed resets property.
Added compatible to required list.
Added interrupts to example.
Resolved merge conflicts.

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
---
Manikanta Guntupalli (2):
  dt-bindings: i3c: Add AMD I3C master controller support
  i3c: master: Add driver for AMD AXI I3C master controller

 .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        |   56 +
 MAINTAINERS                                   |    8 +
 drivers/i3c/master/Kconfig                    |   15 +
 drivers/i3c/master/Makefile                   |    1 +
 drivers/i3c/master/amd-i3c-master.c           | 1060 +++++++++++++++++
 5 files changed, 1140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
 create mode 100644 drivers/i3c/master/amd-i3c-master.c

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
