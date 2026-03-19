Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEA21091904
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Mar 2026 18:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rmgpnn6esUopfRc5jgnPchMc8JEvdDDtE7xZ1MxtUs4=; b=k+kduiGPQMFKkk
	tw8eJDXT/tiCQWAFjavbWoCz8k0e3A9lshSe95hae5n1svlh3dNdt0I/2JiMxvzWgv/lZPeNqi8VW
	YZqihNXKRk5dZ2wwzidGzUAK2GcuanklvwwxQ1BXzz2je/6h3cs0IJnzWaxPQlUrmsEBYMcW7y+af
	Yn6ilKf9rT+IRMUEiTvZz0oPzoBT3yS5xaZ4owf5hVl5noYCRFyc9e5YOl/kvxpoIRFgfQ8OizmP7
	Akw7MiDegfcJqkdLu0yqWJWC8rtseB7QMK3btdxKMcz2dV9/KoImUIJ29cAcjFumhdJpR1DM18pfH
	Ih8Z+s3qN6fLf3dZAUhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Hsm-0000000BHid-0T7W;
	Thu, 19 Mar 2026 18:14:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Hsk-0000000BHhv-0ESB
	for linux-i3c@bombadil.infradead.org;
	Thu, 19 Mar 2026 18:14:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ucOowstxDqljeEXG8CESWVZ3zHK7MlHiUIk+185lwIc=; b=PSl07JFajYDv8Er7XQMOxC/Vtb
	iwzaDacS7x8vC030TkE/j94ZqYXubHQl3aaAeB/xBQM09J1V/zXqGTArukW7wHhzBXDXDiHvYfo3u
	RVO4Gm2L1sMb2yL6CUPDzN9OxrW+R0qsFGk5Enyisv+kLzdpYFIRK9xrWSZt3XEuPy/QeTuAxwbH0
	kzi7gr4Vlk2wAqOU/HUUxRG2W0JBtFQVePnbZmerrOw+dz+I2tDmCNU5CucE7/34jF0KDEIqbGsFz
	YCj3CBd5RfMMCAh0DEmxpfMWrqUiWwWUaxbPOMM1v2fa0zZoPJ1eFJIUY1V42r0A3QJqStTSvuWm5
	8DVWvBGg==;
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Hsg-0000000ECoE-45X0
	for linux-i3c@lists.infradead.org;
	Thu, 19 Mar 2026 18:14:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfgOxiBpmIUTYVtAhgtbGjuBbsOVEEKqhDLK01IAXgxLNZJhJn0HKrp/MocxEYWAUxEsTnn82E/0/iUzFAsg2+O9aqp8r4L/0VPngQqVH1uQUosyQLEST5YRieYg/Jklei+c5pd1VbO4pJ/U70lxeBOx3EWGdnvQUqfMMcoi4lmfMn517WLwZjROJelW7T/kBOGc6/mRVmgLLBAlAKgNFFoSdG9YTazLUZWjMHz9oco5vcMrHTJOgS9IdFB/32sCxNkOlsprl4VPYAqGnT/pMZ/lSA0ceP2HVczrfD5EhTZvYZ12znPYsk/C4NneA5PSkpH1DjFr/V6dMdnuFu0C7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucOowstxDqljeEXG8CESWVZ3zHK7MlHiUIk+185lwIc=;
 b=oGzcuuJSDcw6eX4LcDX2pBEcrVtqrDZio05iLDlXXvMtnD3RtUUcz9kzU+1tMkRRJQS9gGfM6M8lopUp7a3pqToOYLEhkzh342fvCpBN3/7/r4x5cOrgRUH0zfEqegg/JIRGHAcBzLJLFKnIDxky4iARJZtTIA4BjEsZ1wPE5EJEk8R4BRQ6iBQIeYPBBcorqns7inuuZXRO9NGZbtOcK05SomERCCeXMtqiTTT5TiqqM1jvlIY/eirpEr2a7DJ+xGfur8dpFHyqRUSeLVkqDN4E30yqrIhWAVRLOYBGsOsCZVn4aq4TL0cpH0KnhwREnDU58E5qwOnfTUxVATBG5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucOowstxDqljeEXG8CESWVZ3zHK7MlHiUIk+185lwIc=;
 b=DsoKGXT3oBgTDqzL3lsknSKZg4mCz8bJwjBi267nj6r7iXV4+nCtr7RCmeZmlqdDgqatpVDP3mhrV6vBLgP4i/9Y2YcmTPatIGoP3ves2QBou2WsOpXfu89hcvmp4/AMcT2zXdOapwiBxAT4PCMA3C7LRf6U0rX+JKL+A/XsZLmSLoiz0bXjfwcys5Yss/r196RhMOfxHm3c1VeqV/ImpBQ+JD3M7ixk6eURrJRbgOwaaghh58uiC7V+HU3UxQMEBMtXY4pGMi7JUxGz8AaAE06vSfzeqC+yqR7Mff8PdLVAZq1PcCKb6OUQ8pKZ77+HVht4cqhzhN5GEseC9urZ1g==
Received: from SN7PR04CA0074.namprd04.prod.outlook.com (2603:10b6:806:121::19)
 by CY8PR12MB7100.namprd12.prod.outlook.com (2603:10b6:930:60::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Thu, 19 Mar
 2026 18:13:46 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:121:cafe::72) by SN7PR04CA0074.outlook.office365.com
 (2603:10b6:806:121::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 18:13:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 18:13:45 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 11:13:26 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 11:13:26 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 11:13:19 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <krzk@kernel.org>
CC: <Frank.Li@nxp.com>, <acpica-devel@lists.linux.dev>,
	<akhilrajeev@nvidia.com>, <alexandre.belloni@bootlin.com>,
	<andriy.shevchenko@linux.intel.com>, <conor+dt@kernel.org>,
	<conor@kernel.org>, <devicetree@vger.kernel.org>, <ebiggers@kernel.org>,
	<fredrik.markstrom@est.tech>, <jonathanh@nvidia.com>, <krzk+dt@kernel.org>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux@roeck-us.net>, <miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>,
	<rafael@kernel.org>, <robert.moore@intel.com>, <robh@kernel.org>,
	<smangipudi@nvidia.com>, <thierry.reding@kernel.org>
Subject: Re: [PATCH 01/12] dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
Date: Thu, 19 Mar 2026 23:43:17 +0530
Message-ID: <20260319181318.21501-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <d36ef5bc-8f9d-48db-a868-f3683fce0d7b@kernel.org>
References: <d36ef5bc-8f9d-48db-a868-f3683fce0d7b@kernel.org>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|CY8PR12MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: d944cef3-dcbd-4c8c-e6e1-08de85e342e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|36860700016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: XhD+lPZep09SNPnAYRYxtPsLqnd2s7d/UGddxMywdi7r0G+lodWT+gLQ/UxqBrRwzWVI9rvLfOQqj0dX8O69xxMUNtnjIW1Qi0V4NQII1J0egeOWbeoGr2U1OS/vdSLsW7VxMVl/eQYmLcQEq8ezOa+DTCF7iQNrLwJtOFANGfqAUMB2yBTSvGqriFQkcK6iAkSRy/Nq1PbAy+UfU+/SRyMirmI7q5isVUPvVR49Glj/vCypwRktf2lj5Ni13g0pb8hkMSrDkJLs0Qgyjf4pZTmGBtmWjC0EL/ApSbrThvMg+bmQ5pQPPnpelHJjukFJStOZ93aSzP9iXiWMvh4hNw5vsuX0SETgPK5CCLpSFkAouFsfwl60iVEOulvnRxNY5+To6zwjCykwuewNnlL/l7A+rJWlBeRv6IDOEsy19/djPdUcmx2A6qe12BK//JiVEnjqjibkeUR+ZLaEv3yzsbxmTFhvXhRkhiHOpjEwX/fPc+wMiR5yFe8C0DuEuZvTujnKxSq4YmyZpj7zccS0vM6I7hnOv+zmQnMEPn9DwQUVbhLo8qp/DB+1p4ylybiZo1HN1U9P4wJNU8dFmzkMEbcV7QOKxwyOrPH5WnkCKXYUOaWkbrYDtRs/gJ/AV+eOH3RZvMCbgJ9Cak4ArOin1VFgiUE2wvFzgUiXccuRXRG6sMgnkEkue/f5BOHIgL1HWVrjA8e28wTJ/qT7b3cFxJK8kkDhClT1axa6XQ1Q4pEIlh38mrJg7m+IoxiupJ64IKWroT17lW41iEgJ4QQxeQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ONcng8Bjvt1MllDljOFJoEP1yqCUMMx3Vcy0cg/O8C6rPI3Dyh+zMOPRJcNiBFgdvTVbv8ZrO5CFrvOjtKz1PPzP17sbLRLnzO8Gy82FZWafKVbIkUE/rWCnfhIO6nUIYYbLSVr+UZCqa4+XOmIu09ylnoeEiNvK6Jy0BER4JKMC4Gdjv4Unwsr/kq6RHLOD+dDnAOzZW3P80NAIQt0V2GlmbRLwKtrLKqqlVIixf7XNsx1JOZddWmCVzsn5Fr4JbPo9SGvCpWJuMbVXInUqIzikyIkYOKiGL8QZvCPXgzZxy0i3c443/+Ye5QAfesC8EMJsjl+b9FPF6cWiPi//NXafFpuddJ5juLz4OVFCQ+ulP5mrVZNySWwEci9Mx6/pDbNN19D5wuvsFTFB23zpXOhqpm6wZZcbE2F1LHBNfNPs863G2es7Nl33daacicyL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 18:13:45.8611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d944cef3-dcbd-4c8c-e6e1-08de85e342e9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_181403_061596_A5F57911 
X-CRM114-Status: GOOD (  12.01  )
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

On Thu, 19 Mar 2026 18:14:41 +0100, Krzysztof Kozlowski wrote:
> On 19/03/2026 18:01, Akhil R wrote:
>>>
>>>> more than one method. It also cannot represent the vendor extensions (Bit 2)
>>>> cleanly. Would this be better if we use macros instead of raw numbers?
>>>
>>> Hoes does setting bit 2 differ from a string "vendor"?
>> 
>> Okay, a string array would handle those cases.
>> 
>> I am concerned if this can be a string array for the ACPI because the MIPI
>> specification defines the property differently. Would it be fine to deviate
>> from that specification in the ACPI? Or do you suggest to keep it as bitmap
>> for the ACPI and use strings in DT?
> 
> We are not defining here a property for the ACPI. I don't suggest
> anything for ACPI.

Understood. I will wait for responses in the driver changes to determine what
works best. This property is primarily intended for the ACPI and if it does
not align with DT, I would prefer to drop this from the binding in the next
revision - if you agree.

Best Regards,
Akhil

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
