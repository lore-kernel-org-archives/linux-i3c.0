Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9401090257
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Mar 2026 17:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BHxv6UZ9S1ax5CTU4J3RUhzKl3zpVSbl9a67UVFQw74=; b=UXnUbULX0nKse6
	JAxYwM7Wv0G1aTw2XVmG48MYtm0B1tvytoo8yHBDPdXkPtgt/idFo8ZF9CiUNf0y6rcNeO0vrLk+6
	Wc1OaK91QflP31z8psxIoWrJtPqp0nPnC2op7YpPuPRW92y5wslZoQ602jmyibXX6rY/bb/nGPN2t
	j2WUWHMCotLIVFIvKiLDEk3+AuO6t9ixgNqznEbAuPQfaphvausR1S1ld9zIbQHMcRp7Kf74msz78
	hsnSBAaIEC+/HpXgN7hvN8gwQQ4lAM/Z9KIRClYEVYSg2LzRTMdbjtpMW1x+d+01ohPIWY370kyub
	GElnpfYmmrEN3+ze+TsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Gsr-0000000B9ec-1MAp;
	Thu, 19 Mar 2026 17:10:09 +0000
Received: from mail-eastus2azon11010007.outbound.protection.outlook.com ([52.101.56.7] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Gso-0000000B9eH-3hEy
	for linux-i3c@lists.infradead.org;
	Thu, 19 Mar 2026 17:10:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4hQHZbluaqv5oMY00KXAe3dquYW87pdc9sW0yeY2FTQDbmoq33HnHtJlZQ4Z6wuLneSD+Y9ss/zQFKNyl0fMG5V6Zejy2eLSyz6lf0Jwdx8MVPbOZrHxs7IsVllRMGKj5WVB9pyR2gHRT5vKIPno3V/ThSegjyJ0rO+HBB0SpnQx31pLrhAtOFY+uvXiXq8XhZ7HqUvN0ztaLMyfFmEb1nOWJTgJi0AuVnipH+cnx50r/J/RQr3Rx2CTm3qE3JuPjw9cdAjQvsrmHmhAjefbClCsXE93mB9RGQs9dJwGV+q4xHU+s7h5v448pxmb6w2D31ApNtQ0d209F/UJ5lsTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaQNuY7IkHJPE4pBKoU9PnUShsOQC9QfXE9WJBr+7EU=;
 b=FooTMruht9Mdma2+DHUqhoe2JJL0JxXzuLkSPFYrExfJw0/iupT+ZQho8xKFWgUC6Q9g0AwTuJ0dBx0Z3sJTLIRDS/jp9Tpa5fnUt4F4b14Drbn0hVLRE3DvzdUz4xq0lecxeh7GYGTLhYZLdGE9bnCzqCvDMVdB503uJvJfCdJhGggjgFd/+CbRah6vFuaU9tRKjJHJU9r0WzpCH8r9q1BBe2edthDvvqSruEVFzfyJnlN1EUx3U3UmssB9Ex53Kg8wPNHjTfsIEf/Wq0NGzMLn52MCpTnRNdqbcf1ihk9MT0rpVB1WT+c+ZEhq60Lnba+taVvylL3pm+/m31hBiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaQNuY7IkHJPE4pBKoU9PnUShsOQC9QfXE9WJBr+7EU=;
 b=R2inxnc3TdZR4EDOcPDLoWV9H2mq4EAWjrOYaBQg1xK4JIu1oaTNzYSDHBwlc5hKXoR5EGg6FLdo6SUUBnodX6WNXetLqXz8n8sVudFJWBF3Zh2LOo94KlufUFHKpM4KXTTo6oMhgLdXKQiBjOmO6C79XvUg5d1qvX85FK2FJL3cP4pgAVYjLzM+Zu2efjRLLcf9bdgTZHw/TG0/f6RT7A8RUMQ5rrIyyGqu6+hAiXn1uHpI2pQPC7uWFqUIMhoAu+PPfkx4p8XKq8F7uSJWXSXvH00Lvtcl98jambuxz7wLWV16cdWHdkyxlP+4gawrzs0LwohDqej8cuH6XPCU1w==
Received: from BYAPR08CA0022.namprd08.prod.outlook.com (2603:10b6:a03:100::35)
 by MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 17:09:58 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:a03:100:cafe::31) by BYAPR08CA0022.outlook.office365.com
 (2603:10b6:a03:100::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 17:09:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.0 via Frontend Transport; Thu, 19 Mar 2026 17:09:58 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 10:09:37 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 19 Mar 2026 10:09:36 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 10:09:30 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <krzk@kernel.org>
CC: <Frank.Li@nxp.com>, <acpica-devel@lists.linux.dev>,
	<akhilrajeev@nvidia.com>, <alexandre.belloni@bootlin.com>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <ebiggers@kernel.org>,
	<fredrik.markstrom@est.tech>, <jonathanh@nvidia.com>, <krzk+dt@kernel.org>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux@roeck-us.net>, <miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>,
	<rafael@kernel.org>, <robert.moore@intel.com>, <robh@kernel.org>,
	<smangipudi@nvidia.com>, <thierry.reding@kernel.org>
Subject: Re: [PATCH 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
Date: Thu, 19 Mar 2026 22:39:29 +0530
Message-ID: <20260319170929.14543-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260319-nano-manatee-of-vastness-fbafa1@quoll>
References: <20260319-nano-manatee-of-vastness-fbafa1@quoll>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|MN2PR12MB4176:EE_
X-MS-Office365-Filtering-Correlation-Id: 191e28c2-8346-4376-9226-08de85da59a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: pTCjEFMICPNfeIxZgwLQCkUPCteivtGZVoTD6Qe5NcBE5uCfN2nrg1pLr8YIn85ZgbI2LW5kedbUdMbhYQntMDs3DLCDlpSAqHUv1yBl4iJFpZLpBMJipYGwVbUsnju/wDk6txljXvlqHNy2Mlmd1tzvHObCPPoybqwsf6cgD6rzThDPVS4e7IgEudL7XtFi5CCkUDFfaPacmxD3nMOkfaA4SsAA87C0XO2yrBmeJSyDFE+o9hMnKa/aX+dKkYRpYo0E6mzuKvZiFDlRztUHycedJFvrikBqPlmAgChHjecw/lxEyGri3QivbJ6z/zrOZ1cKkokfZqb0zllr4dEEmEXdsGAMLOzH9y9esLiV6nmPkF1WPOWrk1pNfhJWqW4V+/irAaounQ1aTUkqmHiUoGy4t9eN9GIk8lRHzx8RkyZTjbuSmHPXVGOLdOLXm+niLOV2daIhsqzjbZ2QLiDKb/rGOTckAiZokNTG6JBxTb4chKlbupnraeeUzjrLcY3GPz0JUEaOPkTr+ImWH67KeeZbQfBAI3uomoBREEPxfMdFVfY2nSLrIxBKGXT63sYXGeO5ANEWjcv9tvyfMZrCiP0jRKeAWi0Wp733VP57xnF39AOAidHGU022XERoED4pLrKwEs2klpb+WFNUrcrvWnbDqzUD9TvQRdaUI58EE+OhQsFwuxOPDL6azWz/FKc+4xiI+1vZeVE7o4Wwh/ahYatzpYyuW/30csFuzgiZ32MzYM43j36fvDa4KqdItt/yIRQGqDzq1BmUuyY//VKFeA==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /8ox9nUMLOfmMZrMRC8YSFGkLnbmaXy3L40PqWb1g8usApshy43afNkte0OMRi35nVmbATarDYoqDRroFofKZdVO8fs5nRurvDX8mt7NPDmwHu/0GxuCyIrHpdQX+SKq8bP+LDCxI8zcEPOVDR63K55VOdzXfDR7qpqcdA/CPsguAnrASxVJt8v9dlJ5yyesJVjdQJn0djmwJGVwqgO6SW4DPmf4UYkLUiTl4h+HTARo+nnSeC0SMb75kXYrN4jf3AdGATQnxGbVDfDEEvhEdoPaPdyQWjYi/sNqGCHrVQ5EtwFIh5Dn3KLLpwQ10MjS6HWsMSRRKKECeqRN6gbv/DCCLI42gCRYKjxVWDzcCC36SydKkvZH1UThVSdykl0bi2/jbVCcjS9VmVul79+e900fi0azi7fGkNlmDQsK1Is1bCHW+gfwXk2z2067thbj
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 17:09:58.5812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 191e28c2-8346-4376-9226-08de85da59a1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_101007_199878_EF75178A 
X-CRM114-Status: UNSURE (   7.11  )
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

On Thu, 19 Mar 2026 10:40:34 +0100, Krzysztof Kozlowski wrote:
> On Wed, Mar 18, 2026 at 10:57:25PM +0530, Akhil R wrote:
>> Add I3C subsystem support, DesignWare I3C master controller, and
>> SPD5118 hwmon sensor as modules to the defconfig.
> 
> Why? If there is no user of that, why would we want it? Your commit msg
> should explain that.

Ack. This is for Tegra410 which has a DesignWare I3C host controller.
I will add this in the commit message.

Best Regards,
Akhil

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
