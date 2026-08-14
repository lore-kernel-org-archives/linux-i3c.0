Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49B1C5CFDB
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Aug 2026 11:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/KWBBxrQLlyLYBvnOqh8kSokziLfDIOsvmJb15VGE00=; b=QW8UwYFvN5KX0u
	E+YPtvfxVl9D5DxaoumAKL64AliDjfazSPqtbo3Wj20HNP8agpOS5fNZSziVyiel2BtZxNeu0JShA
	UApjDyYSZbXx/r7uSiZv/e7tbFYeADJmRUztd1hVNzSEhsjDgqOP7UB3QjFbFZ1yzBCON1Nj3KNPh
	ezdqJF8b08v9tTwZe3Z3V5hNWhoHBFf9Tb9WwGM2sDxnxDxsgbTMErazCP7JE+ERejb4eZ3bQ/pRc
	C3jkU/0mDjMppvtKAE8waXdci39Zt8GEWP6cbgcYfh6t2griBz1xgTyc91BdLayUf5iNyGZi4tQCz
	lHsEhkpphXFyksrwhVMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuqSM-00000002cU8-1nZ2;
	Fri, 14 Aug 2026 11:52:14 +0000
Received: from mail-eastus2azon11010023.outbound.protection.outlook.com ([52.101.56.23] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuqSI-00000002cTY-2sz4
	for linux-i3c@lists.infradead.org;
	Fri, 14 Aug 2026 11:52:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aM+UNVgiZDENnzIGIjY6CUABQ5uCBWeqzuJ5C6/wDuIjqGgwVQVl5+dBakIRUR1rCw0+eJdoV2J3SSSdeoPRhmkclm7BO4jWHPn6iDy1DFjyXAbT5JNpnyWoZZdw0Z9e2HR8YdgB9+eP+Pzr7LBgQcOd5IxiqoV4Pri8EZTd6T4I+HETb95bA4aMA+kBQtPIGBSDOIsATooZdUlngHy6/egVJx37ARTOc0rlGLCzTL1h+bJfBhiKRRZGUvgZ8LdE79L1kDOMt+QSO27RvO4UpVQkCyrlLO1ISFsqEs5Yg7EOI1E+w7hE8FbckSoYFxeH0V7S8KbJ8U6+LxdKgzrK8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0JU/6GtXRJvlfqpeZrU+OhS8r6/vFI8tRL6aEywSw0=;
 b=hFe9HXFmCog//2vhnlmB4rkidi28IJGORhX4W6oZWBYxhdGWWUv/rin+0WY5Xwg+Y6u4tPRRO9ESDbw5BkXgLZ0uO5kVugfOhy0BEn9Ae9+SqemHjjh1xyz5TS+H3Kyrp2D651egI9Z5V8ITHVYn65QPqgyJeNAviLKTyP04HS6fHIp4Hk43Lm5sFJQY/x8lN5OPmVvcFppjVgnhesHBVe25HJrE4nsF8pykqUQTPmTy+u+CdTKgbfTInvtsp/tcXS2KbGqrMK0ANB3/X0R6OU+nDu34stFi596lDWJbuQeKwQWgBAd8WDMgW3keICVRkw3SC44YwSz5xe12H/53Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0JU/6GtXRJvlfqpeZrU+OhS8r6/vFI8tRL6aEywSw0=;
 b=w/K8T8i5Ri0kpGXIOTNQ5bpgXfTtv7TyLxBuM4tpx6zSa4GiYw4/aYcKTtlwZMcbGrJaEFEgcP2ljYXaXp9A0EShAzJEmHVVhFUoW+h6JLdYZSuylOvFV5nw3RV8oncmDTy9tC0UcduR/APebnIPhwfHmY4R4fSz3Wb8qzMiPow=
Received: from CH2PR20CA0014.namprd20.prod.outlook.com (2603:10b6:610:58::24)
 by DM6PR12MB4331.namprd12.prod.outlook.com (2603:10b6:5:21a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 11:52:01 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::16) by CH2PR20CA0014.outlook.office365.com
 (2603:10b6:610:58::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.16 via Frontend Transport; Fri,
 14 Aug 2026 11:52:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 11:52:01 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 06:52:00 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 06:52:00 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 14 Aug 2026 06:51:57 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Shubham Patil <shubhamsanjay.patil@amd.com>
Subject: [PATCH 0/3] i3c: master: amd: Add IBI and hot-join support
Date: Fri, 14 Aug 2026 17:21:52 +0530
Message-ID: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|DM6PR12MB4331:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c532e9e-0081-45df-2895-08def9fa73be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|18002099003|56012099006|3023799007|11063799006|10067099003|5023799004;
X-Microsoft-Antispam-Message-Info: r8VP0za71oufUCxys/SVepHsavRskbvwCt/5UBBHxFx4rx+EUa2TdMOf1hEr4jW9bwEw6Yi02rDXtI03SY9v8PCfWY1cE4lw0BBSf9FxpZWOQkYf6TGw99/31cnGvPk+l1/5h6ICTIM1Zi+Fd+CWrsx3bu1qzXczltkpt6L+uFcQJRop1Pmpeo0iImAeicyfyRPt2EfyoJDWHOp7GfGfQxEqR1w6aBAj5Xr3SKH+WVAt8vo/P2VzHq8UKpW4zgoGxO+g99w68dvnuNJsvQ+D1t4RcU/yxbhPf6KRf15L1ufJCYxnS57WxqipjOWh4Zfz7go6ABj2QxwvjzGJ/Nt4GNzn8qwYtyOOgaAlGUVpqLqJtsh08rj0MqqfTMcrMHKFIzu8sd0O/PkoKTLBN0AgZTWrKDk71mlumpcxNzRNKRKhoNk3w3GP+M+0NqFiUOp6fuBdgI8G/WHoJ+iW2X6KB8p7iOg1XWuoWatmM5dIogNRD83cnk1cdsTu+jPkVZ80f3PHn9FF1Yz49p47eEm7Ap43ai7fkn06AjFN2CaUSFtgaze27hKLiuC7uG83QxGp811zDkKcvXI+zapPX2h1vQh0gV5sDWcxukh0iJuV3sK56XxL63MEq+4ZBjAY8CEYzDKN0oJd077QT7hKnvxuZakat8oL7vw4bcnzEjZhMZ4+Tg2OlK+JpCQ5pZlvoW1cNSrWrsmEwBVpu0JPltUFvQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(18002099003)(56012099006)(3023799007)(11063799006)(10067099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6LNCeM2vjw7+0BRmQ1A77eLap0e1nz6qxFPo1O0Avd/fxFkjjpOzTCPDGaIyEwXEyl10a5rKwOzXPl28zaTD+Bi0ibOCmCIg8EySik2/0GhQLmRD3BaK6luhrfzGCvpMSSPY8Br60s80ph0UPb3wz8DO8lE2MkPm6ib0ljy/4qtGlZGPnUGUvzj2JXSGpKUri6gdh5iq8Rc/RchwrFZ4LmwsS7A3omKqvOePu0MFwePUhkcLZuYIe7jQjwRWFm1K7MC5oAmoxmkchgWClCYW8gJZBucN2CEfols0iTVSZQppcxPMY5VBYdpffnjWq7Rkv9Zgx7NKuT2xJRVfj++Im7+fpD25n6VM9Zk6LbI19TTL+mYzHQZGh7hcWT99D4eBjXuGLUMXrlP9+J8mNiymfppRGPO3zwLTmiGndmnjH9OF37gbF04kDmnv2ryEWuKU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 11:52:01.1636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c532e9e-0081-45df-2895-08def9fa73be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4331
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_045210_944821_440AFC3A 
X-CRM114-Status: GOOD (  12.07  )
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

This series adds In-Band Interrupt (IBI) and Hot-Join support to the AMD
AXI I3C master controller driver.

An In-Band Interrupt (IBI) replaces the dedicated interrupt pin an I2C
slave would otherwise need. When the bus is idle, a target wanting
attention pulls SDA low to generate a START, then drives its own dynamic
address with RnW=1 during the arbitrated address header. The controller
either ACKs the request, accepting the interrupt and optionally reading a
Mandatory Data Byte and payload, or NACKs it. The interrupt therefore
travels in band on SDA/SCL, saving a wire per device.

Hot-Join (HJ) lets a target that was not present at boot join a running
bus, after being powered up later or physically attached. Having no
dynamic address yet, it arbitrates using the reserved Hot-Join address;
the controller ACKs that and runs dynamic address assignment to enumerate
it. The same hardware arbitrates and ACKs it as an IBI.

Both features are synthesis-time options in the IP, so patch 1 adds two
boolean device tree properties, "xlnx,ibi-capable" and "xlnx,hj-capable",
to describe what a design implements. Hot-Join requests are ACKed by the
IBI machinery, so hj-capable depends on ibi-capable and the binding
enforces that. The controller interrupt only carries IBI and Hot-Join
events, so it is required only for ibi-capable designs. The driver
assembles its ops at probe from the capability flags.

Patch 2 adds IBI support. The IBI ACK enable and its interrupt mask are
controller-wide rather than per-target, so they are armed on the first
target to enable IBIs and disarmed on the last to disable them, with
per-target control left on the bus via ENEC/DISEC. IBIs also share the
response and read FIFOs with normal transfers and are distinguished only
by the reserved TID 0x0F, so the transfer path identifies IBI responses
by TID and discards them along with their payload. A raced IBI is
dropped rather than deferred.

Patch 3 adds Hot-Join. ENTDAA needs bus traffic and can sleep, so it
cannot run in the hard IRQ handler; the Hot-Join event is therefore
deferred to a work item that runs the re-enumeration.

Shubham Patil (3):
  dt-bindings: i3c: xlnx: Add IBI and hot-join capability properties
  i3c: master: amd: Add support for in-band interrupts
  i3c: master: amd: Add hot-join support

 .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        |  23 +
 drivers/i3c/master/amd-i3c-master.c           | 593 +++++++++++++++++-
 2 files changed, 596 insertions(+), 20 deletions(-)


base-commit: 320722812708d34c11c2d067a018fcbeec6b64aa
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
