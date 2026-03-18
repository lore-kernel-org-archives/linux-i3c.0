Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA9310775F9
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Mar 2026 17:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=daGjidWvUAg8Qhg0nw4Hr5LwzySt3k6ZWh443NZ4kFA=; b=DS1uF8LMKrPEXL
	kV8bUvnC6ruwb2nMCU3hIM+FF2hNb55607Cu6CuBqelis/d2/YjjA4x+fswPV1JTI8IczBD9vtIh5
	dwaZf0JWI04LtBUo7XdXKwvo7NZfhhNIkKpIaXlzTgX+0qnz8AICPMaOEF42C6yVKOri3IvoNH0d0
	CNRK8P+dEYdQPVN/L3r/ZdRnpVKQvZARbeHXxbmtFBjmGBI0gHyuu26WQi+7RtJcmghiBUj2MSQI9
	dB9/6KPjKMi5CTE02H6sXEv450prZyNG7QKAkpyFGVr1hh7ubEG7YmLkuqerl6ArICLPoZcwsbFHe
	i/CFjNda7OZNt5osrlVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ujd-0000000955Y-3L4T;
	Wed, 18 Mar 2026 17:31:09 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ujb-0000000953c-34es
	for linux-i3c@lists.infradead.org;
	Wed, 18 Mar 2026 17:31:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4j42k6AQLvpvI99yOtVWHBZsRrTowgA6rjM5wwxv4plYu10br8j2XD1ALqO5toJ0wixj2YjPllnpValvmRKXa7rloUzm+4wZ8UbMSE8eXKmIZcNYwimvsk7VlbVoyxe7PWSmZiqzSNMAGGuInlLkLA9oyW3eH8ovW6xFjPIkKLI5RjqnGJ7WLNgMyWQdsLCcY+V59EH7J74skRL1axVbqJT/mMzOyln9vDII2/aIaL9FGMCNTmQH5NswD6iORpb66qRJnl6/9/9f9Xc74cfa9wW3lAB2bHFnRVpfNU8Ls8i2ZQsIG0+St1Ml5cRIJb1KUrKkbUZ032l3AlLP4jhbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxdW/sL5EZN94MQGemkRDY0y5TTGOnjiSK2IeyToJy4=;
 b=tbCMp1VWQWE8y+qR/jdiGevEjODSk+EKJ7u6HlAJAPeKDJ0UwnTf/52tYRTdPfwYNhY+arQnbBnohz6Kykrj1VzzpaZhXvyApAPv+Kn5xrlRcAys4CcgPzpo67l9ttkh/pGojXCl9ov2VkT+VApH44CYzl4fwsc1TKDsINpHUCN+hg1uvPUy58+yW1Nyb63nGqUCK9s8r++MXoN9xHhMElwLKiHMztErPeIdQRcSwNgvzWSZc9OpyAVy06PB4koj7lqHhT2ET199iAKNtSxOCdO6J/uSBtvHq3NzfZB8np6MSGNSx9l8kvCM4L1MZoOrFwTMtJSHAh0ravgHPwXLfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxdW/sL5EZN94MQGemkRDY0y5TTGOnjiSK2IeyToJy4=;
 b=I2fzHbDVNoNjQouzNPbzVieKCulUN9XywIAJsZ0mnjJe+aTn9/+GwDeMbqmInRqSf1BqSywNIzCqDA0uSlan6o4OEoAo4BnY7Dz3GRsuziBrxJEaYpNUQ9G836rtY/N1txti85mSNwuTVvIZSBnv67CkaOLCzAA1SKw08N6Gqe0mQspYkbbsZJxxjct7iXYJZgmbuPgB1SrYA3yIAc0FFvpS+08t+VTtAA6vzn/bnOp3uPXhMexlRKuv8W1TBXhnIIWfJPRFIo+I1M4XOiB3fqV5DilSC5H4GzoVCoI/a+O2DEgGL0c11rPUFFx+dTPXGJgRNDnAy5bILVwxw39SiA==
Received: from BY1P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::16)
 by CH3PR12MB9732.namprd12.prod.outlook.com (2603:10b6:610:253::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 17:30:41 +0000
Received: from CO1PEPF00012E84.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::b) by BY1P220CA0008.outlook.office365.com
 (2603:10b6:a03:59d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 17:30:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF00012E84.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 17:30:39 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:30:15 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:30:14 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 10:30:08 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>, "Fredrik
 Markstrom" <fredrik.markstrom@est.tech>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Thierry Reding <thierry.reding@kernel.org>, "Jon
 Hunter" <jonathanh@nvidia.com>, Suresh Mangipudi <smangipudi@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH 08/12] i3c: dw-i3c-master: Add SETAASA as supported CCC
Date: Wed, 18 Mar 2026 22:57:21 +0530
Message-ID: <20260318172820.13771-9-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260318172820.13771-1-akhilrajeev@nvidia.com>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E84:EE_|CH3PR12MB9732:EE_
X-MS-Office365-Filtering-Correlation-Id: 884ae3a2-6a78-40cf-b49d-08de851412af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: QfMX2ZejuDAvnFte4SMVZoL3NJYAjhhEibjKGFnva4AT3zBYB8iI/xmzL7f73/6EqD/G24DmfciNpQ6rx6n+CKbDrvN8I+oBJd7IaQg575k+e8KLdF4Ovp12IaKTgm2jMl/VePCeUf2YYsMjsLLpysTBMN7zYpmUrGY5vMqvnpH+5RLr200YnEYlbi0hJ/aIf4RkM5d7PXkfcGW5/71cVRq/98vf99e0sEp+a7YFaVPg6fFXI9n8SeH7samm2XQCeVDfUyp8H5OI3/bRX33BUUBynfDycSE6zw5iISnUdwAaGKkegeiqd89evZ3KIbtdVmyvbJuwWxCqZCPPJ004YffnjTWB6aeI59G91bLJ9bg1ZqyEHbXUp56NY4gU0drV0k/wd34u0VNteuoXTuZ1S8hkMqz10PQpLoxKTj3nmGGQ/c60h9YgpIJC5iuWw42ZpseVjTGaXPAPTqU7gSXkwFoJoza7WiwtuF4H6DwqVCQNppWG+wt/frpOxWXIKfVCqUmxBDuP5nv/si5p0SZQhI3FEaXJnhBOL4HWtidfUzoMuB0nP2Kwbe/jdkcE2qzgr12rNbdirq27vkGbHvO5BZ6IgCTNhawhPisySuSVOngubpvRtfpwGqYS+GivEJd1mlLcYoMKTIchwFsNA40sk0kiRYuVeWhTGFFhqTJEGTz376DwcvFFjuMXGa5EF+5QTm5zsnEgyTG/3c8kZm/xgmlKHBOewt+S19zxPhefeWsBd2MuKrJdRUya5AiZAe0/P7G0gSVEgaZMYtXkDdTv83K/1nnarcMmDIob/XDBcmj0DQta4VFqsRD7jY7x6Qgw
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: z3IQgpGVQvfsYQlxYy8MKHuhuaXCXbwT/32lnsVCEXC/9HNKUaQVrp+X5Il8hVDZkbZHkKT/QANT8RvPI9N0z+B6UuQk9vvpLTD8pOxOrDFtTeo60NyKIu9OrXX3FRw1BG0BSF07HAKMOuzElMLewj627iuxUw6oEIva4SM5K+3JBumoFVWYRc0wOetiCE8YkRHSCkdMC+FvBhX93CRZn1q+wyC/83eIMMNcRljaLm3hW64JSbnL4DEaMbsLDUYnq/h+NGf1QKHw5TvwkTlXmCUbRVWhTj6vrTedJGpNkeGlNStymIaBxlb2mfr2I0R8eZfli3dae0vF7IAJLPkdLpKNCF5P7nkqWbXHIKQFbZYjTj8nhzAZS81gd/oZAyJz3z7oYAImwRCIfzeGG0+5d7CtJoG89CKFwM1C/HIUZXJlTA4ekqoaMJyC9slzyD+l
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 17:30:39.1499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 884ae3a2-6a78-40cf-b49d-08de851412af
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E84.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9732
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_103107_778338_E49D14A4 
X-CRM114-Status: UNSURE (   9.03  )
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

Add SETAASA and SETHID to the supported list of CCC commands for
DesignWare I3C host controller.

SETAASA is a broadcast command that assigns predefined static
addresses to all I3C devices on the bus. SETHID stops HID bit
flipping by the SPD Hub on which the SPD devices are connected.
It is a prerequisite command to be sent before SETAASA as recommended
by JESD300-5 and JESD403 sideband bus specifications.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d6bdb32397fb..05ccdf177b6d 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -308,6 +308,8 @@ static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
 	case I3C_CCC_GETSTATUS:
 	case I3C_CCC_GETMXDS:
 	case I3C_CCC_GETHDRCAP:
+	case I3C_CCC_SETAASA:
+	case I3C_CCC_VENDOR(0, true): /* SETHID */
 		return true;
 	default:
 		return false;
-- 
2.50.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
