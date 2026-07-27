Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BA8C531FC
	for <linux-i3c@archiver.kernel.org>; Mon, 27 Jul 2026 14:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JmsHmT8j6GXdZTKbxpAjMlHc4d3l0YNsEPzjQgrrTps=; b=qKCqq7x+hnjYp5
	0O2UhgWzyVlYNw8iomL7svVqLSWmNBjQTHIqYBT+t5HVPDRKJ/yU4WMX9J+C2hswU/WaNQUTzLRt9
	iD5+E2JlJcxRVd68XsHST/8zFUAV2pyBjD3FAX9KtNEzOeHCW9Mtci9GDoFrWjdUGfTKj5USUh7Xw
	pKKOQAdqkntE8eg/GK81eGB/T4QN1J4HTKM/0A1DRxHQHvxmnn0vVgNqsBEYdGQJgKuDvacCsnCXO
	nNqrHf5UgwYHUUFjJOrCVZJPecdKEAIWJklZqS8H5lS9Q8K18PUVX3Yd4/fKQ5tUoRgTUjnUbxtn/
	JWn4R014A1OenB3Fa+tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMXi-000000031h5-3q3h;
	Mon, 27 Jul 2026 14:42:58 +0000
Received: from mail-westcentralusazon11013000.outbound.protection.outlook.com ([40.93.201.0] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMXg-000000031gX-1HGe
	for linux-i3c@lists.infradead.org;
	Mon, 27 Jul 2026 14:42:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZqvkZCuO8bo3bK5C3N85ID2xxsCnZ9GeXaJUP1LfcdamowOm9VXaLRAILmSvqZD6lNTvBdvFAh8OYCB8EhKLajeaG+lW4WHKYSzDkkc3H0fcOEvAhZ0cmYs5v+AZAuWooINZshs+Cfz0dvYc6l4qPZvvj/Xu0iSAyylcg81NRtvpmlG6msEk4CFLWFl+CYOlfiOO6GjMS5shyksGG8s3AwmWR/Oru7nCOz8ug+G+cmidHfGIjib8JIOEwidLQLTqzQ7++VIm4Nte+fYLPcy9yEwCaRKcwFYEoFyvvL8jCE3bRmN6/x+sgwjwG1oKDKW/YuS+vWJszmnYqQ52YiwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GT/42Jla8tWncep2y4VhajVDXQx4+LobZ1oKoyoYGqM=;
 b=mE7Yg/EEmr77ETOn3W/i9ttms9vAETg4arkmW4x0R2hanGumTuewdz24OVH1S7AwldcX1xmaLnrfBwcGhrLnG3d25pgDUbBFp7Xm0Hybpwdo1knVpXU7BbfYxbExFYgOUZdrlujKcJRIM3pMcY1BdroPeHCz6/UxyAjW8DTDNXhHo1k6bsdmM0NYVwvXbjSYZK72i/KpBnGpR8rCk2XIpBoqqIEDVhxSo5J/Jag4nrwchjzD0WC6+6guytCJP/OF2lxfkLm3G9K9OVl1+FlEWJotLugCp4CL4MvBh/DsDMTOAbS7R0nSGvjYoijv9NglWHwUactxnbFMTcblVrb+sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GT/42Jla8tWncep2y4VhajVDXQx4+LobZ1oKoyoYGqM=;
 b=avdovCviMdz2wKisNZW6/NWQlyIqIFVQaPZS91WCQBqSprKG+55Oai1g8BPuX+ezqbAZMZlBAMTz21N/P4Jn3t16nOZZsEBP2Z+xAlpV1HKWtDOWv5+DGnTZ0N1BbEOXH4L1I7+6bCSGeinKOUT6dosMeDwPYQpPYF8hxCThIIaV80h/2LcSysAbV1uakRO2kT6YcQYfjb0FZHFVKJts6WwhupClRAjIJD+FpaL4AQJxCzH+3YBGMPm/U7iUF6hWBo6V6hiSIQSz27Kb6akIuDVCx+avt+R3MJ5RXKKC4i07HPlmsib02m10Vr4RrmEKWZkbMKcPiDpmddEquOSw2w==
Received: from SJ0PR03CA0051.namprd03.prod.outlook.com (2603:10b6:a03:33e::26)
 by MW4PR12MB6921.namprd12.prod.outlook.com (2603:10b6:303:208::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 14:42:46 +0000
Received: from CO1PEPF00012E81.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::73) by SJ0PR03CA0051.outlook.office365.com
 (2603:10b6:a03:33e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 14:42:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00012E81.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 14:42:46 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 27 Jul
 2026 07:42:24 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Jul
 2026 07:42:23 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 27 Jul 2026 07:42:20 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <sashiko-bot@kernel.org>
CC: <Frank.Li@kernel.org>, <akhilrajeev@nvidia.com>,
	<alexandre.belloni@bootlin.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, <robh@kernel.org>,
	<sashiko-reviews@lists.linux.dev>
Subject: Re: [PATCH v6 09/12] i3c: dw-i3c-master: Add ACPI ID for Tegra410
Date: Mon, 27 Jul 2026 14:42:19 +0000
Message-ID: <20260727144219.177646-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721042259.80FA81F000E9@smtp.kernel.org>
References: <20260721042259.80FA81F000E9@smtp.kernel.org>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E81:EE_|MW4PR12MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 811c90a5-65d3-4213-ce53-08deebed52bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|10067099003|11063799006|56012099006|5023799004|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: TmdCboCmw5kxWKqD0NEbLaD9IAKs2TxB5lfH2oxLhlh6GKrw+Php6hoP/Sv9v0PMpnFheKE6nD5wu0sZW8qJarSJStX1OjPMvmm9CGnS5OUdMSZhZxtNsRYAA2PlvffvyMrtIVC44ZmE/Nf3QzuARNKX3Pc4qiaZqjFK1kPfBpFCIkf71f+US2z9e7WpWR0VOiiwC4HI8ZXHpJzNAOvg5PZWaoKupPaFhXV6cgmlu4POQE3bY5Ax8tVCkri3IkrGB8gmyixVAuBMiL8UwbNtUicvnlBwgqSAQojoNr76T2O9RapeIId6zcLMcV+4nnEedhk08VgDCxdd9u/kONjokhDcrPeHyHDTenVReN5hudElbx37yC0UI6dJkt3nMEFS9J72ma1ExWhRmUWmyL1Hdw0H/JwOzIgg0mQBwywhLuqmfzx9zq+aPv5zciOJ31G7qVaa0tj/xhoWRuAv/hqzLHFx2jI1o+zqwlaJIEx4OwLRmr/WBjo6jD74yS/pSArsYY6W9Swzv27qqPxBPzZ9CR1ct4av4UeFHdqTWnV3v3lJ1D/HN9Y9abFSwlnDLmO1sOxdB1hKvwLJbSC/ymCxcVYoIG/RWw5RcpTSbqVEaIZxPexsJ74Yvf+kUM3TPc0S6jz6LMxvMBmLvTmoxPSf7IaeoMqYXH4efnKElcoVafd2pnD7kjtU43GPdCsJXfZX8S9kPzy0JRje0nxZICCyJA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(5023799004)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: X1aHNLSQT/+hPnBlb8GfF+UZqkEQy+KwQkAlvkV7lBSzNhCna5uU+S71X8NmRKXycoowNMvEXIG3LwFnw/GyVyPtUXkapTIjO8215pRu7x7Cfg201EdJ9GKiaX6sdKz54IHOFhMGxwmyfwSOCgDR0mWo1Pmy3n8c8ygwa1Mcp3GCDypqqLP24Eny8mOKka18IjKbl6EPqrKXx8Rn6L4Gmu7qGh6OjQoqmcFKb3TJy+xPRv3bSApNuIE0LTwTVg6DR9i/LkOcMccpMtQUk6rfkIQ1pS1lq3R+a4+RdaBNYMpPtz/W8NvtGIbgqotYeQZ+IIDNX6yQ+bhO8i7ESk8Cyndh+O2WvdqwiJn9193nctoZqSvhDjS1e3UhOiPCnHXlDLvok6Ybc7XR6tFrOPLkT9BWw4mQyHjIK+L0fEv6UhVQzGbSKFWTXhzxr5+GtDqk
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 14:42:46.0233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 811c90a5-65d3-4213-ce53-08deebed52bd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_074256_369282_0B7AA1F6 
X-CRM114-Status: GOOD (  23.11  )
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

On Tue, 21 Jul 2026 04:22:59 +0000, Sashiko AI review <sashiko-bot@kernel.org> wrote:
> commit bf82e9c156c66763c855e5549bd1a91bafc5fdf3
> Author: Akhil R <akhilrajeev@nvidia.com>
>
> i3c: dw-i3c-master: Add ACPI ID for Tegra410
>
> Update variable names to generic names and add Tegra410 ACPI ID to
> support the I3C controller in Tegra410, which is a DesignWare I3C host
> controller.
>
> > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> > index 3ec3ab1c13b4c..efe37f5224c71 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
> > @@ -1860,11 +1860,12 @@ static const struct of_device_id dw_i3c_master_of_match[] = {
> >  };
> >  MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
> >  
> > -static const struct acpi_device_id amd_i3c_device_match[] = {
> > +static const struct acpi_device_id dw_i3c_master_acpi_match[] = {
> >  	{ "AMDI0015", AMD_I3C_OD_PP_TIMING },
> > +	{ "NVDA2018", DW_I3C_ACPI_SKIP_CLK_RST },
>
> [Severity: High]
> This isn't a bug introduced by this patch, but adding a new ACPI ID brings
> attention to a pre-existing issue when handling ACPI bindings.
>
> Does this driver safely handle ACPI PRP0001 bindings?
>
> In dw_i3c_common_probe(), if an ACPI companion is present, the match data is
> cast to an integer bitmask:
>
> 	if (has_acpi_companion(&pdev->dev)) {
> 		quirks = (unsigned long)device_get_match_data(&pdev->dev);
> 	} else if (pdev->dev.of_node) {
>
> When an ACPI device binds using the PRP0001 mechanism, it utilizes the OF
> compatible strings and the OF match table. In this scenario,
> device_get_match_data() returns the .data pointer from the of_device_id
> table (e.g. &altr_agilex5_drvdata), rather than an integer quirk bitmask
> from the acpi_device_id table.
>
> Because of the unconditional cast, won't this store a kernel memory address
> into master->quirks instead of a valid bitmask, thereby activating random
> driver quirks?
>
> [Severity: High]
> This is also a pre-existing issue, but does dw_i3c_common_remove() correctly
> handle devres clock cleanup when the device is in runtime suspend?
>
> The probe function acquires and enables the core and pclk clocks using
> devm_clk_get_optional_enabled(). These clocks are explicitly disabled in
> dw_i3c_master_runtime_suspend().
>
> If dw_i3c_common_remove() is invoked while the device is in runtime suspend,
> the clocks are already disabled. Since dw_i3c_common_remove() does not wake
> the device (e.g., via pm_runtime_get_sync()), won't the devres cleanup
> routine run clk_disable_unprepare() again on already disabled clocks,
> leading to a negative clock enable count?

Both are pre-existing behaviours not introduced by adding the Tegra410
ACPI ID; they are better handled separately.

> >  	{ }
> >  };
> > -MODULE_DEVICE_TABLE(acpi, amd_i3c_device_match);
> > +MODULE_DEVICE_TABLE(acpi, dw_i3c_master_acpi_match);

Best Regards,
Akhil

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
