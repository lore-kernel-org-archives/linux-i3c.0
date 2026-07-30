Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6711CC54FDF
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Jul 2026 08:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fbU5TmJbAcXRODWajtDplTIhrPE8AI65xdasKe7OoaU=; b=eW06o/sbE8SR1d
	1qRClbcyQ2aF4mj1ajSzGekN8lWO39zy9hicfLThx/OA/VMqT2f4OOLJpt6ggpX3HlnesI8+IBQit
	mVrJpXIq44OVqWQrPZC+6db3a89ficJqS/gQJY0Mu6+73doVNwYLp2fecsbfB0RIGaNWZeTSw/wRH
	YiAbCsrjZn1KEWzpwwKYnYtoNCg0U025C5zYNH1XlDpRyUKqP1a1gq5xM9R4ZWcVI5cNuVs5tycX/
	2aKo/9lB5eGk8U0R+QKtzAva5Zf0L2sfaiEJscSfERtWZLDNh622EfABfL6NItX+n6dqwgA3K1Yvq
	OVx8QY7IkLVkMk9h45Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMaE-00000009w1u-05w4;
	Thu, 30 Jul 2026 08:57:42 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMaB-00000009w1C-3KRJ
	for linux-i3c@lists.infradead.org;
	Thu, 30 Jul 2026 08:57:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYqiEgY6eMhgXPWS6XNuGaqbYpRM6G7MQIbKRaxXjG/6DN9XbW9EXSVIaJVpBLnUAqHnkoALPhYs1cNh2yFyH3R1LcOOYRYuv+RKdKvyRiiBr5e+6goSzEIA0inxWEIAou+mhGfr153M1fPl9BpFTAGfopfAzK1nbI/281/icT5lJvRTp6PqrtBZQcUFX4fY3SpBfp14uf90wfQ04ueoPuZelLiv2HrRiw/S8Fuh6xy67mEitOZHSXs8QKwNBwToRxcC0TluLc/xV94N7WDsTkhfPg9/bD+GjGawJHX1miMszFfdL5PKFuyjd4j/rID0mk/yFjBIjmDUdni5Gv935w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PX5YtWwhoe9/u48fqRtRismSVpFKtRDiSICqHlebWhg=;
 b=fFEqLIKw6Sy+NoijQMep6mvD7Xgsq4IR2flEK7Tf4yxzqaAKqejuBBlqMQeBuHp/bac7Farzi237d9tA6cOnuQr8Ys4QdnVf9wyoe7yij3dF+CJNUyJW0rbrBGhdQCCVSn5TWVcw++LPsOsv/vCvj9EePZZ57bIKs+BJhRoPlYyMrSKLJs+N0K99cp6l0hvsd32PPHIs+LPi7YklH677+mD156FWzJZleyP3MWmZOeMFCGK42E0GbZnAuKiWgRTLdTjBT9STccm7rUG6qyxmeY9VAeMek6RJVNDTPg1BDKqBs4UEbbjenlljmOOo4CkI80241riBSLjxrdpZY+keIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PX5YtWwhoe9/u48fqRtRismSVpFKtRDiSICqHlebWhg=;
 b=hImeHIsG9m5eskmTBrI61MUXmE66cs/TVLfMEesVqWX+MS405wb1EwDkA3TbdcODy5MN94akbknHshRDIarAaHS8/qeF8DMEaEJ+ul31uEoT7gBQEt5jEBudO+d79xP9G+Xflc5LDXv8yr8NoqjZEnej7BbfHyReQ8UDPOZFumqOvyi5hz8X5euBq2EnWdadHnKttCJTg8QVvP9zlJvLmyUUMpPeL+yFmeMgc9Nb8VjsXeieJnWHl3TZbnO/qP9xxX8NhWJoYaTBHsEahvc6ANEBVWWKRGzcxnvZY+q9RfNBmSnvFARFyINHfDdHNKHEi5AxyVfAqedLWwnJ8YKohg==
Received: from IA4P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::11)
 by SAVPR12MB999119.namprd12.prod.outlook.com (2603:10b6:806:4e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 08:57:32 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:559:cafe::96) by IA4P221CA0009.outlook.office365.com
 (2603:10b6:208:559::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Thu,
 30 Jul 2026 08:57:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Thu, 30 Jul 2026 08:57:32 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Jul
 2026 01:57:21 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 30 Jul 2026 01:57:20 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Thu, 30 Jul 2026 01:57:18 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <sashiko-bot@kernel.org>
CC: <Frank.Li@kernel.org>, <akhilrajeev@nvidia.com>,
	<alexandre.belloni@bootlin.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, <robh@kernel.org>,
	<sashiko-reviews@lists.linux.dev>
Subject: Re: [PATCH v7 04/12] i3c: master: Add support for devices using SETAASA
Date: Thu, 30 Jul 2026 08:57:16 +0000
Message-ID: <20260730085717.2456089-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728072201.AD0D31F000E9@smtp.kernel.org>
References: <20260728072201.AD0D31F000E9@smtp.kernel.org>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|SAVPR12MB999119:EE_
X-MS-Office365-Filtering-Correlation-Id: f17ea34c-955f-4791-2eb0-08deee1897b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: SgWbX0gAuf1xEfw1LILJ9TyqLg2yP4G4k/NmYlrSwaqOTiV3PGsOa6e0G5Esso/4s7xuXIPVfh/o/vHx7JAcyJAuSYncR5xqQ76zHqCVJNupZN12Vo8truPP4P8CckracymHHuZYUY3H2RsojvI7OM30iOBTpvT8Lrqw8MtXScjz6/ROkp2LbdsPzpVv0W06Y1cscsbA0RrIFGEf3Dt3DNmn+US0ZRwQkJmCF12xU46WZMw7TO7LSTVxKBIwbed/i20h0Hm1ys1/EoBTxLvQptUhht4lmZ5rzVrFV1KL0fpXIPeDhNByhXAXgz1PSjgd6KHzaqKcJTkTvVQqKK0G3Nq64fvrWXrTWw5PplLAQjwFz0TjK7qVOsW/gklKrILSSU8fthMUTCc5/+WkfuuIVUPPdIo4BQHu8wu+Vv6aT32GhJy6x815P2K+OaPq9V6SUFw4gDI8ygEx/iwn/siGEY+fVPiY6AbaB177TjdrncF2IpkeHQjyQeqqKNK8olJF7HtYV1gJIG3LZa+uEfDA/kip1zciD7ZnjzvkjozT4GNcjv//Xy5i2JoXawpjQyEADvaoofwADBePXuc5FDvXTQNT72Lq7C38HhP4mxS3/hBY38De3pljcwudTE8q6RAGOsI6rICeC4jDkRhHlXy7PEqVlXJ4si09a7DjV6uMoCQBBO6hHla0e9WY+KGC0dZce5THyD3rYWKv+f8T/SWf6A==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: k8NNX940pp4w3EYggpQhv6XJCRnyRVxsnZOBLSHJwF3QC5uUFteL3cXszO8dkoQpy3hM/dm51D5MDI42JVIpwknOrssMMSJCj1EYgBt5Z2KFFhjYUJoDLwlp5B+2f4VSiZYnGKjwDeOi0exEx/EyoX+wR3amCr4DofZtAONpIg5zTDqbxhuadEUeOzykzV8Ygrp2PsX01TCXJEU1b3xoUZZdCPtLJ7lKv44DzGGTDGUL2iLSx51xfRdCLAr49nr1sQym5S/Q71guZVQJbGY9cC+wLBVO2oi9OOajGERSnz8wcstZ+IEtnYWmppc6eJKtxYeaVCnLhlCWKuFAG5zLTBhLUlivCIe+hsrEHwOSNaxAotEjShBniGXwtGf7EpmLnSW8NLwsHlEDTSLZ/qCmd3CNDf6s2ppIbpGN9tz5oCblcQCxIieVC9zgQ2kXHQjo
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 08:57:32.3202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f17ea34c-955f-4791-2eb0-08deee1897b3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_015739_838544_F5341FCC 
X-CRM114-Status: GOOD (  24.12  )
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

On Tue, 28 Jul 2026 07:22:01 +0000, Sashiko AI review <sashiko-bot@kernel.org> wrote:
> commit 61911732853b10649effe5164454ca8a4a87e970
> Author: Akhil R <akhilrajeev@nvidia.com>
>
> i3c: master: Add support for devices using SETAASA
>
> This patch adds support for discovering and configuring devices using the
> SETAASA method, which statically assigns addresses without using ENTDAA.
> It adheres to the MIPI Discovery and Configuration Specification.
>
> [ ... ]
>
> > @@ -1878,6 +1926,22 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
> > +	if (i3cdev->boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> > +		i3cdev->info.dyn_addr = i3cdev->boardinfo->static_addr;
> > +		ret = i3c_master_reattach_i3c_dev_locked(i3cdev, 0);
> > +		if (ret)
> > +			goto err_detach_dev;
> > +
> > +		return 0;
> > +	}
>
> [Severity: High]
> Does this early return prevent the device from acquiring a unique PID?
>
> Since PID validation is bypassed for SETAASA devices in
> i3c_master_add_i3c_boardinfo(), multiple devices can share the same default
> PID (like 0). Because this skips i3c_master_retrieve_dev_info(), the dummy
> PID is never replaced by a real one.
>
> When i3c_master_register_new_i3c_devs() attempts to register these devices,
> the sysfs registration fails due to duplicate names. The error handling calls
> put_device() but leaves a dangling pointer in desc->dev.
>
> Could this dangling pointer lead to a use-after-free when
> i3c_master_unregister_i3c_devs() later accesses and frees it again?

As clarified in v6, devices without a PID are named using their static address
in the next patch of this series, and two devices cannot share the same static
address. The dangling desc->dev on device_register() failure is pre-existing
and will have to be fixed separately.

> [ ... ]
>
> > @@ -2272,6 +2346,19 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
> > +	if (master->addr_method & I3C_ADDR_METHOD_SETAASA) {
> > +		ret = i3c_master_setaasa_locked(master);
> > +		if (ret)
> > +			goto err_rstdaa;
> > +	}
>
> [Severity: High]
> What happens here if the underlying master controller driver rejects the
> SETAASA and SETHID CCC commands?
>
> Most mainline I3C master drivers, like Cadence and DesignWare, implement a
> strict allowlist in their supports_ccc_cmd callback. If they reject these
> new commands, i3c_master_send_ccc_cmd_locked() returns -EOPNOTSUPP.
>
> Will this cause the entire I3C bus initialization to abort and detach all
> devices, effectively breaking all I3C communications for that controller?

This is clarified in v6. It's an opt-in property and existing drivers are
unaffected.

> [Severity: High]
> How are SETAASA devices handled during system resume?
>
> During resume, i3c_master_do_daa_ext() issues an RSTDAA broadcast to reset
> dynamic addresses and then calls ENTDAA. Since SETAASA devices do not
> participate in ENTDAA, and SETAASA is not re-broadcasted there, will these
> devices lose their dynamic address on the physical bus?
>
> If the kernel still retains the i3c_dev_desc with the dynamic address
> uncleared, won't all subsequent I/O to these targets fail?

i3c_master_do_daa_ext() is only reached through the mipi-i3c-hci driver when
HCI_QUIRK_RPM_ALLOWED is set and not through dw-i3c-master. So this issue does
not have any impact today since HCI_QUIRK_RPM_ALLOWED is set only by
intel-lpss-i3c platform.

The same issue also applies to other statically configured devices like SETDASA
devices that do not implement ENTDAA. It will be better to fix this separately.

Best Regards,
Akhil

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
