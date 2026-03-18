Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3424010775EB
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Mar 2026 17:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0lbyP+0h1HHsqhC6cRIWBYeiNScJ9I2Jlxmp/DnQUpM=; b=WajQLei/1pShiO
	PRBGGolikaTYNHFandwjO/8XBzH8rWyWRTu8lsWmzkgF5CGA/l7TXRGAX+uthefDX8gFZopQ9Egyt
	QWdmtMhi2k4UdGspQfN9Fs6T9Td+6yRIfwxgiswujHytff4Y6DbU+NmUPI7RJvf4cKBzMfzF6tymI
	I495Xj50ugAx6ejbxWLN55xOe4V0EI16LvbC8v/AOVCOR9xCzbeDqKltnixRiUhJMumQSJZBYPLIO
	a2Mq+6+twTA6J7ujEIqf04Dh4h5H2hUqx0L8jlq4m3Wcg3k34x8XVNHeBgiJfOdZvNVywLnJTYF/u
	4rX2GKilu0Utr7zGcPhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uk1-000000095FA-41eO;
	Wed, 18 Mar 2026 17:31:33 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ujx-000000095CQ-0rii
	for linux-i3c@lists.infradead.org;
	Wed, 18 Mar 2026 17:31:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnGbx5zAYwywMbB/JNfQerqhi0yXGe32lb4cHO9WQtfYImeAcYrCwrPnMrYjJDUJFwPcxobeh9afEvZRhVLM3x66H+dDB6FL+ZWsAX0Nqvu1bOWgYLN3+mtYzlMHJVdorMOlzYacPYKtSTdPeMwGXU97d02YpJzC2rZjshlDP+ro3D5AGePRNwsqVCqr0nYzxlWclC6DOZrzBHxj+aSmu1RIYJh5ijfaGGd2cXjrGqQxrfgktrTePrjkl07UbK8rCgRvUgyfkaxWmdG3ZBj84L3bOhI2BMPRhMlIkv0MQCLeDf26iDuXkrQYzANJo7We18SQQO1O5WhO4pQC6vXn5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEllIa7x8pgFOdZ6inIx8/w5CLBoRK6Bgjk3ZpJY+Z0=;
 b=PS1Qq7MssdvHUMyrKW7Ff4uKuFYpzOTrtNc3hAfBuX/Q2eXHiOs9/4rCY7i3jgwHZpOEEs5ekUyn+d4yHvM+EDFtG4mgAnCpyTNGRJ+0woT4TKD0NHtBA4Lnhivcir7gvhaJ7oKC+dHOu8QXhZYsilwVfSICNdJ2kxU26eKB8bCYGDCRNSoCLtS7muS72KNOJ41ZbnabGFdxpgYJrnnmAuTcmHF6KKF0CdMkG5fS3YEvptGkkZ0sx5Z1asxzKmAnUuWcljE6QiffTiKtx2+Xh1IwIeB0pEK09uFc57fzmw41iLvlgQfnyrfNn93aS7dETj2c/LBrCapZ0XoEZIyIeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEllIa7x8pgFOdZ6inIx8/w5CLBoRK6Bgjk3ZpJY+Z0=;
 b=sP/lnD50vxM/BnWuO5WeayfJaqWHQ6n1x7xHR9S4vfhX6t2/9QluWrTqdGKskhn+F4tc6D8gt0VYotuZhtycijNe6UEjUyYDPgZHl620NWmu2eTN+z14ZEDTqlsYJeiYBMEheE5dapKws9Qfc5xpP0bQfj0lEsMQapVWhi5txGnlXQ1ffu5aXr92zcvhgrMBLUIFRaAxnpR8cQFsGuQ8v4azqGAZaIcu8fl4bPDZ4FZ0VAyEutDLvFnxxyYpTRiVY+ZyxLX07qqZRFeIgWtWAf1Ukz0pG6cTzzczutbuOjosBaPRniC5F80ythzkueoD0tiK60kRFWmBqvOvnl7mGg==
Received: from SJ2PR07CA0011.namprd07.prod.outlook.com (2603:10b6:a03:505::20)
 by CY8PR12MB7194.namprd12.prod.outlook.com (2603:10b6:930:5a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.8; Wed, 18 Mar
 2026 17:31:21 +0000
Received: from CO1PEPF00012E83.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::35) by SJ2PR07CA0011.outlook.office365.com
 (2603:10b6:a03:505::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 17:31:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF00012E83.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 17:31:20 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:30:58 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:30:57 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 10:30:51 -0700
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
Subject: [PATCH 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
Date: Wed, 18 Mar 2026 22:57:25 +0530
Message-ID: <20260318172820.13771-13-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260318172820.13771-1-akhilrajeev@nvidia.com>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E83:EE_|CY8PR12MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: db6cd285-21cc-42a0-4399-08de85142b13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|22082099003|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info: EVZ7asWHPxrLMG0dLfLDWOa9qTY7WNaE+RRzHojwufeJKRHqDmdQb6iu9M9jQ0hQvOJ/fwqr1KIqrTlFhDf2qdJRlLSO38KtynLceWNcPghMgBneeu4mv0xP2zg+2LWYtV5wPCwo8h+70QWGB7i7ZWO+IODBumxV5IIU4hxfIEyDYZqhiwqs9VTC96UHMBdXHU1wdVnRZOmDo5ZB0C34zjTBxCtx2H3wCo6KfQCJz6Pu0I/2ksjYXTPq4t1McYQfa0nvrg9pYBSGu+tg6wHoJRLd/PtdLDQx02ieqTDoXzIT2HkzOdikoOIuni5lBdVcOIG2hDsU1rwTOjjtWV+tuGz4wApNCenCrZlvkiM790BFfxoOyiqXrAYHTMh+F3JKF6wFBIuXwOr+nGvBb1xPdHYPCVREf8m72DIFbpLIGk3XlQGJciWL3sPNIxXC+Q8cyS3oVc+MbgwX+JpV0Qm2fVtSwVSz4JqmtR4PJTc4MHSjBPTecCuYv5zZZOqI/82w1QQPvDCz5C7FHsR2BPpW+uNrlEXxAJpMZadSh6U6EItE8AEorcUM/84CTpEn0PxTCQskm9Mf2SnBbQ62ut8DczZflCJTN6UNKcj2X6JdMhG8tEdEox6Ju7Lt8ykwtaMyyN1K3oyeP440sfwJbhxumqW4YZHQmSmE+HdC10KoG18SHWhCJiGJkU1pRf9EXMQf4yMwUfxQxSb2jtcTIS6W03Hqzrq63HFaYowrzn3EAEwmgNk9wEpKPERua77n7vvWx+12K7cayWVoDCGoh6tOyxczgbm6U+JnM0IGaJjBDdD6JRS2XQdQJYKP4e84BySP
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(22082099003)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gt8b+Gmpq2EqZ5ko6gsIM7IF3TzXPmUFD7qqHtAmjVKargiVUeJ5eaRgZBjCwwye/lUVAnNIsbCt2dK3redH5tIGPIlK/gjg1sZI7I6OM0+DOgAGlEuhkeK9gQ9X66jEg9YO34BKJwjNU6PFR6FwnlNFX2ctVxazH7+V6QY5m6ws1fgQdFBNHdDUl2/Yf50wYKVzZg/D0pAvh2cR02NXGaC8EpJY7IK/Qw70bs39anli2/PCw2wn1G83hxjbiCPTiBFItr2n4oVeYv1BAUyF/Eusl5Ogqo/6/KDo4uUXPGuKainhdGwXjRF4BJuCy0p9VK+EO/aYrHM+q0q5Re5kd1/rWFgqqGQZeBZyhhQGJgRj1yeVao0vL+6l0ugMauVyyLhKOYwnlPSbHA1gz7fih+Yk7N7ZRBmuGmKZuVikuALtE09oEsvA+/CYenW/92B4
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 17:31:20.0733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db6cd285-21cc-42a0-4399-08de85142b13
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E83.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_103131_126180_8A4118DE 
X-CRM114-Status: UNSURE (   7.52  )
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

Add I3C subsystem support, DesignWare I3C master controller, and
SPD5118 hwmon sensor as modules to the defconfig.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 18881bd239f9..5dde063822cb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -582,6 +582,8 @@ CONFIG_I2C_UNIPHIER_F=y
 CONFIG_I2C_XILINX=m
 CONFIG_I2C_RCAR=y
 CONFIG_I2C_CROS_EC_TUNNEL=y
+CONFIG_I3C=m
+CONFIG_DW_I3C_MASTER=m
 CONFIG_SPI=y
 CONFIG_SPI_APPLE=m
 CONFIG_SPI_ARMADA_3700=y
@@ -761,6 +763,7 @@ CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_AMC6821=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_SENSORS_SPD5118=m
 CONFIG_SENSORS_TMP102=m
 CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
-- 
2.50.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
