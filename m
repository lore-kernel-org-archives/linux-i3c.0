Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D04C5518F
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 10:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lF5zub/IfeDGLEoi5pG4cOhPOpAozfsl+RDCgkZs7/Y=; b=UmlqnNXgz8AQPc
	ePeypLlDuKOVk0dLY7y4YCLGXuOyik5QLNQvC8acaW7WASGXi37KQ/GM7Gv7zZCnDUyRx7mplxcr7
	jcHiqFt21dZ6JwEx+/BoOQlOUN9WKJwV99lMHaANAJNTERXRnGdwNc/axzII4qg+vaDHAfxRrdm7Z
	AGhdoM5c/0B4Kx8GE4agVOJnpwznc4QtrGPFGGblHF+YSJAyOcK3iK+2oMa7u3fGoK9lSBijVyUGH
	TmDhWymyDQJmRC5rGbaxtPnBPik2QK9eh2U6qNz7/Y3F6qT5LFRJT9VluQ/UMUrlr9vLACioNeTV9
	IPNEJwF0tYwJF80m/TYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrC9b-00000001WjD-0dEQ;
	Tue, 04 Aug 2026 10:13:47 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrC9Y-00000001Wih-3TfK
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 10:13:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pbq4BNJr+quUeSWJwaANPzrneOaWt4vMNBN59oI0dBbTazRYpu0mwk9oB551puzdEkSzZ3eeEcow2JFBsYweni6PMWrArcWFuaHjrOUwDJyN21BKtWg/cjfGrXMLjKxSrIksnNZQn3TOijw/62/N+38wcSfrFMo+4mnaK/BSSKIhKKXkyaksFnef8qsUYdNKI86St+tc+5mespxO93c+dxAitfOoRVqjhN7wUTUCEQGBzHQ38uio+YBW7uwE6x+erUCSrcaIRgPSmiRgyp4geFikjHEwop9oWrOf3wT/hm7pLgnf9XtU/VPHZTOsykbfBMUHsIiSnBjw1zIA1ivImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VLPUBMGrayaZIZWQhLi4Q/LJ01GYFukCQ92oiR3rBo=;
 b=NYkXty3tNoCMwxFkoXQqaPYok5W9Jb+TPIKYDmglhNsyGnwew1zObwb+SnzeoSaLqckhY5LZVAItQ6V2FBLv9AXrxU5YGBDT9xsbeubd7FCP9RQcwkmSBDpkyKZGYsfE50YopKVI22RFbfpH+tAQocc00jDOqbVBC38lmSSwLT0lIu9c/LnMf19C9rTfHFuO0uy8XJKegUj9WXU+sOIS2QbqAlmBMTFkB0W32wNAnS6BxlZ2NHgQykKrv2C+XZdxuFPdKV5vbvBq06uAuKtoNdkrTxKqulN5UbYeXTFcRPGOvX0vdETN8546iKfARekiOVUkarFs9iz12beW39nZQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VLPUBMGrayaZIZWQhLi4Q/LJ01GYFukCQ92oiR3rBo=;
 b=DRvEaDpxOYO8J4vSA7G0xrwxm56ahokLY3rJ6f+aBp5ZVui6YRWigKC1ky3TO/1NXoqZZDhNqozkpmvnBYJRBmaCK5wJnQryed1vuCC7RI42YNkEWK/MsbZcsFTU/y2Qp0NHTvoOz5dUGPPqxbXNoG/sLjieH67y+oJrNdrO7gGSOTPQ78EjVPaRr5025F6Cf9YQ1jbGC9tj48uVAI2mNJs6MV6p3ffRGpPIha/BXry87++lZ517BXd8fLpKBr3JQBVJTFLy2UeyybeuVHjERtrYYPjQ8y0f4gE7qjtjlzDwgb5zVDpEiRnd3nraeC6c3NFMsVZJmbW21QPbyZL3jQ==
Received: from BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::12)
 by IA0PR12MB7676.namprd12.prod.outlook.com (2603:10b6:208:432::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 10:13:35 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::5) by BY1P220CA0025.outlook.office365.com
 (2603:10b6:a03:5c3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Tue, 4
 Aug 2026 10:13:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 10:13:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Aug
 2026 03:13:17 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Aug
 2026 03:13:16 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 4 Aug 2026 03:13:14 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>, Akhil R
	<akhilrajeev@nvidia.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/5] i3c: Fix firmware node refcounting and error paths
Date: Tue, 4 Aug 2026 10:12:56 +0000
Message-ID: <20260804101301.2975911-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|IA0PR12MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: 86d06f94-df26-4d7c-23e4-08def2110a0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 6zdP1YO1X4OouOzhlSiuTUlX21FXhq7kVIxmqHF2LCB+/QmnryO40wDSoHOhTZazqqoStseSvSPrh+Cb5KQDncvtEfZ0rF1eKNBbNIJw88rvtV+tdJ2mSHNaRlZ+XVTqtIo04pgywQdVGP1CsUhPxNUqI5yHrwCcdYRUE2KXQLA2PRtM9OGcMQ9jJf5JYrtCrPbiy8FbJHrVMzPkj0o3E6RmuNHpIuDZYNJJt4amgSCYRL+wEdf8jVY/tT56K2/ixatNlHCHwoWtg4P5S6JqjRRfFILWrx5vSoXN9hgCe77lBfYUsdlnD8WFXngvF/7LEo2EwfhOTC10hHoFjS+fcIOyFi7Hboh5AiFPckOvRpDYSnYX0lWmeaXb5+7m5Qep/MCgYnEUBE7KdR9IuABgH38JltUESfM7m0MpwmaeE5/e3f8a9Q0zWijc40ax2tV5jehSo8GyKPw/McH2fEbl1k3sejEA/j/7EzD9xabhLeE20BorXTQwljOAc4ScrFkm8Zo20bRSQUguSrOwawyXDYv9iweRsKo+8gMlgU5cSpIcgMEkhQrsdsVIbfVrJGSkl8MrmbA3SfczjzCgumUTQTSHnIsMAzC4a7rfz8uaED2MPdnX0P9mPfhpmNGWf5SXaVbILxiSkKQsa/Hwu0R3soJVm05OlJrz7NwxudsrOYTQ7R5DWq2+CNihLCpYvTgmcb5WeIHMKkEhdEDQDtSxSg==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DIjyYeQw6pQ0bsFSCYcQfKc+s8kSxFo9gIz5TpUa6VV4rLIzfJsjZUfe4buisxi1WFsA9hZJRVZwwBjs6kAo9tnaDx8OzjXxQNEtTT6s6TwPPq26b/VUi3zxkTyAQRKjbzv9oAq+mnYMecXltN+xlD13UCU3zN/JbHZuUdl0GaqOiKhyZBYVh6/LHXe3J/EDjoAqGg9NJCfYK2jxYytRsBkCWnrMi61JbClWWuN+OJ/0RlnMupLSpMbcfyh10w88l/cNUJy/XtevPqPXpm9dW1fY8kZE+IA4926n/NNlz13Y9Ef3JnX1z3jQqAcpgLqFvNu/S4uFSd9JGQGz3csNfIZy889uJHMVXFo1K1jQ83LB2vFe14scM/Kqj3diwy6KjMPVOcypIpOIJv0PPfwIkMW0A6DOS/vydcXSrbrY6nyDIfqr5JTbRenLbSiPoICd
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 10:13:32.9134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d06f94-df26-4d7c-23e4-08def2110a0b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7676
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_031344_866211_D71FC4F3 
X-CRM114-Status: UNSURE (   7.98  )
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

These are fixes for problems that were noticed while reviewing the ACPI
and SETAASA support series.

The core fixes balance the reference counting of the firmware nodes of
the boardinfo, and keep a failed reattach from releasing an address that
the target may still respond to. The rest fix the quirk selection and the
unbind path of the DesignWare driver.

All the patches are verified by inspection and compile testing. None of
the error paths that they address were reproduced on hardware.

Akhil R (5):
  i3c: master: Release the fwnode of i2c boardinfo
  i3c: master: Fix refcount of i3c fwnode
  i3c: master: Do not release the addresses when reattach fails
  i3c: dw: Do not use OF match data as a quirk bitmask
  i3c: dw: Resume the controller before unregistering the bus

 drivers/i3c/master.c               | 18 ++++++++++++------
 drivers/i3c/master/dw-i3c-master.c | 21 ++++++++++++++++++---
 2 files changed, 30 insertions(+), 9 deletions(-)

-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
