Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76472C531D0
	for <linux-i3c@archiver.kernel.org>; Mon, 27 Jul 2026 14:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TP1VG1sMFXqsGzNy/vgVO7tlnCRmVWHmCG+BK+ckF8=; b=qe7ohh68Hegb64
	KB7rM2LpZwBUe/4cMVuJw6qmj8rAlzZVrzr7WnbGcfprkpZaTQvDu3xXB/smlf7XuoNHwMfG20gPR
	jLlfivaTbumKwETG0sEfftZYfwwjeWwXNpCu2qWNbO/joTIRfQG82UBK6B6l6zqzfoGXb+Qb93GMy
	L6tMB/5/cY83uD28SZIGiDwYynkQZYS9IxqyPDrh5Oiv4okhTCawQmxiWRqsSkQNy7beocjLhkd4v
	KEisrn90tGlmY3ybhsTFsqaAoAYDfDws9+YJBtDmBcjVMc63iOrEowDNQYzkMOEDMFK8xk8wHdsQd
	ZrAo10jR0NHSn4fMwr5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMhU-000000035eQ-0mgf;
	Mon, 27 Jul 2026 14:53:04 +0000
Received: from mail-westusazon11010055.outbound.protection.outlook.com ([52.101.85.55] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMhR-000000035df-3tR1
	for linux-i3c@lists.infradead.org;
	Mon, 27 Jul 2026 14:53:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kw2jAepBDixVMCjYlyjCpp04I3EWCPEbJlalmOY8G33BFQ9oZAZ/25vLdMWbn59XamIjtGxwnsd5XNDjzqvOow24BzuFZQ7m/+7daK9jWiJSOzQlDWRcmH88VE10iSfvXHgUDMKfeO25vBoiXlCm2HT7qHzhtM3OUzmw5HwB0jQsD4/5IvtxfUlFNLIKR/4t6zI3ao+nMgBtj6TF1v4JLMXcCnvy+U/aWKrQO0SGFTmtrtSpePz3zUMHE5Lv59A1aWa75yrexFipVz1Zb+eKpZ18yimmZ6KYcOpX+36lxSMWoLa+O22j1h92ODlg7LObA5ZI9rzzRLiOYFZUVRQZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EcDvdn2bRsWrWEOAYzSljMeSVIDARM3FOLe8Z5ZOzE=;
 b=mz5/4xi8N1EH6C2rOM7oGaxOFYcLFGu5OpZci644U/lUElMGZvyK5QKhzmRm6jnne27UVFNrglN6iJu3ZyUg00uhxxqfWK7pqWpDUnkXCLxtaJcF0PC+x11kNlvKYmYjOibuWBz93K+f4NsA8x7cQNKUbQ5FGT/VODWc0rc+TMzQXi4oHuO+qG1Kj1CHDH+u5qKpAVq5ycn0iN6qdMCt8/vKmLXttaKSoJFdQq2YuUu/INKxLPqSUrAtVOTUswl1HnaCPy7FqrmdchFccDnGgvbsJODKJ89pBgvWMbE0YDvmiGQ8Il6m7l2jDOHMQ4IPHbVhWOVOXWlBfngmsZJWrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EcDvdn2bRsWrWEOAYzSljMeSVIDARM3FOLe8Z5ZOzE=;
 b=hBOZ0/JVlBbHic0AyhTLdBjHmemgA5FEuTtStTJ0PMKvomDWWiAaFyFy01zq1ROxvYeIyUerza9a8HVv79FTB3WSVfhYfcRdoJfok0iXMCl/TXISMmZDWxTZ7gZ4HBLC/SOyew5W18xEqWHgHZuBV42rCb+cbImWcWppmbVuuA5zYoHvFbkk5jZYIUT4ebVWVTWNXNWIsNbBxIF11UZfuw5g4+ge5fJhspqQM4LHmo/rXd4nQWDhfEfXzDMpiVuTrSNYa48L10tJgSqVVsSnmaoFIFVVEKbcVN0JyGp+sxiRJvzweXSipt1eV07B/0fhC7c7a5jV/ppMllAq3NmA8A==
Received: from BN9PR03CA0450.namprd03.prod.outlook.com (2603:10b6:408:113::35)
 by LV2PR12MB5846.namprd12.prod.outlook.com (2603:10b6:408:175::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 14:52:54 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:408:113:cafe::a0) by BN9PR03CA0450.outlook.office365.com
 (2603:10b6:408:113::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 14:52:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 14:52:53 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 27 Jul
 2026 07:52:32 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Jul
 2026 07:52:31 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 27 Jul 2026 07:52:27 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <frank.li@oss.nxp.com>
CC: <Frank.Li@nxp.com>, <akhilrajeev@nvidia.com>,
	<alexandre.belloni@bootlin.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <jonathanh@nvidia.com>, <krzk+dt@kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux@roeck-us.net>, <miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>,
	<robh@kernel.org>, <thierry.reding@kernel.org>
Subject: Re: [PATCH v6 00/12] Support ACPI and SETAASA device discovery
Date: Mon, 27 Jul 2026 14:52:26 +0000
Message-ID: <20260727145226.179827-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <al-jx5AvUrxq8I75@lizhi-Precision-Tower-5810>
References: <al-jx5AvUrxq8I75@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|LV2PR12MB5846:EE_
X-MS-Office365-Filtering-Correlation-Id: b1bb0902-93b3-485e-4d13-08deebeebce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|7416014|6133799003|11063799006|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: jxEoTPIg1nLb8zPF9/OWEc/gK0p7o4eBFRMXxXqBF4vzokvBuBbmIePp3ipvRK0z2Hz9GBXhSPpvz+YUnqiXI/+rtjp782G9BiwbMthmxauX5NpWRcuSzdVr87Rq2PVujTZEV1JxQ585H+d/wILEzX0nN5gZD0SrACvj08LpH0gr/gCbNbIRB0yCCIbYP8wBMwkcwks+PN/UsBcJQ/jtPAfzwMLeXqOwD+7+4aDFuejCwyQJ91OhNfULl56BImmlMLoL8lh641n+EGOLLHe5Rl42kIxgx8Nx0TTloT7g2/mA47B8zk9FE1AZ01sLiEPFRvax5MU4EWE7pvwyCgBz+gdzc1uKiHYGDZ3uNeQgEN+FuJ4OkjjkSV4dJix0CCgqaXJnzAMaio0zg1iR/6u474CSOgn39yeByBohBc3KYIpdyr5TsSP593yenZBCZT1sYDzgTy/jm0IK27Z3UxQZHrws2pBjlM3Jlwx+s0j1h+nc3CybUAsqPqZOmvB0VX/aF3GznWfZM0ClU5aojy+ePzkEPyCDqxhe8L0TlDa3jfQ0C/qSgwGpELyUsdZCJac6B79iQ68HghInIpP69UAgBVZ+QGr2+s37Oh6LReeg/b0ERpSl4xpSwRFpXGavWkKO00tXvrwj5xVGY4cAfO8h+vRKSQw43KDknyKZjk8DIpAlPDZ6/mt+hbjaJyOP+STrz+HrDkQzyixpZKWyjyKtfA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(7416014)(6133799003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AvfncoMq2dCh1DqJZjU63RbQaE4plEBHB1pxNWzfx+6xBtoQU8XjpZURZNwK/Sb0r38CsgqIb9TgzpUc/nLSzfKatWD8Qj2GpgJU6s4jGWQfRIUz8ZXzItZs6bIaMNC2vmi+ZVgOkIWbnR2NdnxkjISawOtq13oYeIGsxBm0IG0YT1Fpizh7GKX+1tyaumQAjFT79byLi5Q4g/UeTdEcpGELHZ7R/ykw3GhqGMRUSuIrRHOhJzVbWJLOBsUW6rTLf92sAnZnsKsFLxReBpC74n2Q+JT7lNqSChmDTGTEKxBSjQmDALLWeUI4qpk+4937EVymSro5g/zVWkXJcI6MfcZ2c1oL0WftoP9P7+lXzt3XVTyJhS4KOc8TIwCtobI7bshK/ve2SvwjzNZEhWHF4335cPX6nUpmHcwoF8RCRA9Ed1V60tXHIfnsdZAnut2q
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 14:52:53.5286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1bb0902-93b3-485e-4d13-08deebeebce5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5846
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_075301_968299_9B42F0DE 
X-CRM114-Status: GOOD (  13.43  )
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

Hi Frank Li,

On Tue, 21 Jul 2026 12:52:23 -0400, Frank Li wrote:
> On Tue, Jul 21, 2026 at 04:07:48AM +0000, Akhil R wrote:
>> This patch series adds SETAASA device discovery to the I3C subsystem,
>> enabling support for SPD5118 temperature sensors found on DDR5 memory
>> modules. The changes also add ACPI support for all existing DAA
>> methods like SETDASA, SETNEWDA as well as I2C devices on I3C bus.
>>
>> SPD5118 and similar devices on DDR5 memory modules differ from typical
>> I3C devices in their initialization. They use SETAASA broadcast CCC
>> instead of ENTDAA for address assignment, and per JEDEC specification,
>> are not required to have a Provisioned ID or implement standard device
>> information CCC commands (GETPID, GETDCR, GETBCR).
>>
>> The series enables describing all I3C and I2C devices on both Device
>> Tree and the ACPI table, using unified device property APIs throughout
>> the I3C core and the Synopsys DesignWare I3C master driver.
>>
>> Please note that the series modifies drivers across multiple subsystems,
>> like Device Tree bindings, ACPI, I3C and HWMON.
>>
>> v5->v6:
>
> Thank you for hard work. I glance at there are some important sashiko AI
> review need be figured out. let me know if you think it is ready for me
> to do manual check.
>
> You can simple reply sashiko review result by providing your justify.

I have responded to Sashiko's comments. Please review and let me know
your thoughts.

Regards,
Akhil

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
