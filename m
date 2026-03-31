Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA09C1061B21
	for <linux-i3c@archiver.kernel.org>; Tue, 31 Mar 2026 10:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BNjrQzaZfLGlENkYDBO97XMHOMt1q9KHPJKnNwNYQZA=; b=b6Y5gWnbRqzA8Q
	sXckckULTpOBf0PffNw77RZS9Vljlfr4vmj263pR2xX3hTju19JUkUmXrp89mX/EhohEcjjPGa9lP
	9iQ/5BORrusA5iAQKHP2zgkyckkF3Ber9MUyQ6pVQb9o2u5WjzHSXUND4mLN3R0BjRRFrBzEV6YU/
	DLO/F21zNUrnSwRy8ngNPW4hSV1qQ4QZnoMuNCYTMoOsLkQM9KY2CdQqGn1AB5TYSUd0ZVkQsfSFU
	cNjPRpgxxMWhVtkOqwwNHHoQzuykzp1f9w/d1Fbv9q7drDACvO85me3t3FFsRc4H9ixrkgbOlfkk2
	34rg4fg8CMGoZZF2JSbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W2W-0000000Ck7n-2a52;
	Tue, 31 Mar 2026 10:09:40 +0000
Received: from mail-westusazon11012038.outbound.protection.outlook.com ([52.101.43.38] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W2U-0000000Ck77-1RC9
	for linux-i3c@lists.infradead.org;
	Tue, 31 Mar 2026 10:09:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qb48zAQFIXMpKf3cbZoXyNcvHYh4ut0s5sEDVbVdpPMBq8euubYbuNl3KBOXyCdBsyY6FAN/+0soK0ZwkVGMfDKQgkgtUBUShNuUjwrvu0dmP53VkeTPZQdQ6xTdG8K0O8ySpTfrosKrIo7FqWsq/8rbqIwkacNNzarCM/pZ9hob3Fog8RxafZVhJOQ9ikIJf5+4c17Z2pRQp5EmUSQKnDgSzCLU5trPokh+wKNpGQuUn9w+OsM8Nd7H4w5SN+nPgoEcy1EbrjlRt0kQwskodV/5WSXJhOOBnqkOeW5xowJ9fazAVlCtGclR+oeLofAaUaSVFSVuhfjTCc2b5hQTFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkzTy732sh6+Kc/GptaD4U1dc5kPwfd1HhpxUZvmFdo=;
 b=URz4UjvfyeM00mJ4WmE698Cl/zpSXj1B2HlfQGUzJdLw9axw/m35oEo8tnJtC4fN0Zg99TYgFfvs0PzGJH4Ac4uMxf/LK+TMecl1tba9kTdnxQ/gngJIO5GzVi6QQcWUz8eHO2J5ilcH59T9ezGWnvUBsK70sUsLOdBY31LgY/Dc/EhuA1GrHq3WlTA/Qpmbdmvs92rVn2CVkjn3UgcOwj9Sqqm1Guedf6ghlbpaGRdPwZqG83iu4UANoFJlOTJwIRL5NR7cffAZMFyTdLGU/exugbUxJcu3SE8lXevJOs2uYHMe1HMuhWKLVW/D5Wf4AvsspBhQsuz6O1uNMBqVNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkzTy732sh6+Kc/GptaD4U1dc5kPwfd1HhpxUZvmFdo=;
 b=i3oxRlQ5X45WCdGHStooJwcWzz0HzQq2vf+Wl+rZcjbPkfqX9b7d7x7uo1UPZnxfmOIL8orTd2RynKeDRMFqoYU3umZwW7kuV93m87FetdBwOZ9zGcozWEWSOX9dlb7is7eh/QD1ZQgTEeJiP1BNZ/8z5xZ/jmdElCQjrdZh+4DcoL4CXJO83dN24BFiXHsrXEhlKl8kxUl5fKH03H7QXSKUpdlBQwAiPeFmk8heVNIoTIsyF0p0ZAi7hRi+fP7MmwSNdBOTPNGER9bmI8Jj7MGul2+g02s0kFRBVV7/8xwZAFA37FwILSO1+/BnoGt6GGXstfStAfF55OUIL8utnw==
Received: from MN0PR03CA0009.namprd03.prod.outlook.com (2603:10b6:208:52f::14)
 by IA1PR12MB6138.namprd12.prod.outlook.com (2603:10b6:208:3ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 10:09:29 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:52f::4) by MN0PR03CA0009.outlook.office365.com
 (2603:10b6:208:52f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.29 via Frontend Transport; Tue,
 31 Mar 2026 10:09:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 31 Mar 2026 10:09:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 03:09:13 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 03:09:12 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 31 Mar 2026 03:09:05 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <thierry.reding@kernel.org>
CC: <Frank.Li@nxp.com>, <acpica-devel@lists.linux.dev>,
	<akhilrajeev@nvidia.com>, <alexandre.belloni@bootlin.com>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <ebiggers@kernel.org>,
	<fredrik.markstrom@est.tech>, <jonathanh@nvidia.com>, <krzk@kernel.org>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux@roeck-us.net>, <lkp@intel.com>, <llvm@lists.linux.dev>,
	<miquel.raynal@bootlin.com>, <oe-kbuild-all@lists.linux.dev>,
	<p.zabel@pengutronix.de>, <rafael@kernel.org>, <robert.moore@intel.com>,
	<robh@kernel.org>
Subject: Re: [PATCH 04/12] i3c: master: Support ACPI enumeration
Date: Tue, 31 Mar 2026 15:39:04 +0530
Message-ID: <20260331100904.30932-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <acO_PUjS_VG07qcS@orome>
References: <acO_PUjS_VG07qcS@orome>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|IA1PR12MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: 0178985a-f202-4647-67ff-08de8f0d98e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: o66Hi730BBYN4PsXul8TRyNJNTRWyLlrDJxFC9jpJpF7I2Ob1qgIhUAHDNEGvPsYARzSEHcnZt092aTt+96hjjiLf7mlmwdaByLY7eBVc2s7T2Jb3YML/tXN2VtIOSDuyPFrW5qflpO2njlIXJ4sG3/MgqydVZks9ZO585NZZMj9DLL+QtPf1/bDdPICX6DwSorO2tXq5683ky8JaoTTGG0eLG8vlnJwbWikQJrLgsSWsHJcUTLuA4j0PEUti6fcMlL/LWmgNtkJ9H3ywb6c5GgMTQTBhKDqQgktXTbWHTABJxrZJVFoogO1v5w9wx8xDQr4UUe1G4xcNpx6nSwBFyuSdzLiRQmrIJkyfKcp1Ah6wPiFNkOIVZwFI3N8vGSwe0k3URYhDh/WbNojFneEHdyJLrpy9p5IApDIcGK+w02TA0WGbXEkocqzOvXz+rsbZ90yEWm1u50syx/JPt5qEVsQZPOdCN27mZDscJ0qB+YYXyQ7l8bLpCf1a8avGzLsUCBZxfvwIo7HVxIcmJMwDUsSwj9VGkbdtcgexWh2OwLec0PmLaX44rsh6cbZLPSofntEpyHq7gzi7uIiYrQQDQAXFlm4hrxfjBKIFIhVgpyA5rVkYAtvnBvJyxQrY4H4YTXhSkXxrAa1mMJSP28QnRXH3P95oWM/Z276ZJZEpentn8QoIoZj8Q5v3AODjYSyjtoUVd+P1qsuud8t/wtGG0NJdKciQUiFcek1g+Rzh8JCB9OIqrSdlieNSjWeRG5PDBUGg76+wRlSBnmq8rFYQA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xTvS9JM/gPYed1yWoTFxG5DSrVMgL4FXA3s4LiLXzwutjkK9D6irMDTUKWs+M2woxZKj63S8KrY57S+e2Nu8vT2iKwhOwFdJskM8NUywTRSU/0EmyJA33ZILjM91aZLsl2dg2/QMZuzRcMARhBB7BfOHTrikfoeCLkyDb3PSkxUN4nMxHB1U42NQLilTBfnH6q6dVfPOTQ67NOwRGHzdDBVPzo8r+vpzQKMH5V/YV4TZLV1NvNpxOEhtPtdTXkegLDziuJszpEiDrMjehM2iyZPE6wxYmOJzfL6NorQZ1RdI3mbzlf/gvhZl7Ot/pGEcIZqzxKtrq1tO/0Pd/8spLM6pvVrRH7cWUWhqm+j2/lsWxR/F041phU0K6m57TagWXlNA/XAYTjl6nQiwGIHtE1kZ9xzo+FYWjxHcG8TgvB8VuLyV8/WbEr3svc+ga+n2
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 10:09:29.3415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0178985a-f202-4647-67ff-08de8f0d98e0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_030938_389261_2CB6D718 
X-CRM114-Status: GOOD (  14.73  )
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

On Wed, 25 Mar 2026 11:59:12 +0100, Thierry Reding wrote:
> On Tue, Mar 24, 2026 at 10:52:15PM +0530, Akhil R wrote:
>> On Tue, 24 Mar 2026 09:43:27 +0100, Alexandre Belloni wrote:
>> 
>> ...
>> 
>> >> #include <linux/acpi.h> is added in PATCH 03/12. The functions' prototypes
>> >> are present in acpi.h. I think the bot checked this patch individually,
>> >> or did I miss something?
>> >> 
>> > 
>> > #include <acpi/acpi_bus.h> is behind an #ifdef in acpi.h and your code
>> > is not.
>> 
>> Thanks for pointing Alexandre and Guenter. I also noticed that we do not
>> have stub functions for a few of the acpi_* functions in #else.
>> 
>> Looks like I will have to guard calls to these functions under
>> #ifdef CONFIG_ACPI.
> 
> Alternatively it might make sense to add the stubs in a separate patch.
> I don't know if they were purposefully left out or nobody's ever run
> into the lack of these before.

I looked into this and it turns out to be more involved than expected,
and requires adding stubs at multiple layers. We may end up either
sneaking in only what we require or a non-trivial change which may
involve too many parameters.

If you would agree, I will guard the ACPI calls used in this patchset with
#ifdef CONFIG_ACPI to keep things self-contained. If you think adding the
stubs is worthwhile, we can take them up as a separate series.

Best Regards,
Akhil

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
