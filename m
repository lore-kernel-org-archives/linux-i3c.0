Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0272F36BAF
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Apr 2026 06:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12PpUSrm+zGlZR9l1zMqn7j9/lOO7dO4PemS6WTG5pI=; b=KPLz/+WFaZ5UTr
	LuF0xb1VcZRgEguNFkWKxVfw+Q8+S2d4FjPV5I9hg7qbYI2C3XuvmsdbyktL0Tvhu4Iq9FshHeygb
	RU74I5uFUT8cXeLKGFR1zZAO7jGo1KdCUPw/Db4607GlltzSC4yB3txffaJlg+f+wJN7pSD6lSSet
	eV8io796EhHpfhutxSA7WFPWAgJRtwo7B+UYcBFrM1VX/KoDjpM8s3PQj7m/MmJkcDpjyU8CfHt6W
	X0eHtPPSTKq2sBXuoKxEs+RcQ/3UYxooT1LoBF6YBBKQS3Jk3DTQYq2T/ajHuKLZDXtg4JytnnWx7
	p+Vi2BsAq95aoNhRb4bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB51v-0000000BelI-24dT;
	Fri, 10 Apr 2026 06:07:47 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB51s-0000000Bekw-1d76
	for linux-i3c@lists.infradead.org;
	Fri, 10 Apr 2026 06:07:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rweEAYl6TsEnpzmXa3yGaiwhBd+SjWKHZA1BxJ6kbqCBcUNPbGKLKaog+ic8pSvRyfODqrPMSW5SJE41mkcLt1pWb28VpYtGTr5+tFitTMZn9fZTS2r66juykgOGJQx72hz+P4/yagK4rqjPsljIv6nmiB635jl5kQMWoWq4TQdmYdUHq8DBUBC345Cy3TJy59amn9HtDwdkUQoxPj2939ToErgp1sZ4LKWwSbnjGoCRA0wEpWGABKLTGWYL0JtFHukR7wK8gCgSWbSoamujViFE2iG13Ze9489sDmPyvDr3Upf/5Cl62h4q5C5oZx+ZNC050thGxXdy+m+FvCczSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhz0AwWQhArIG6X1e+sdWmQzlKSfSIGnLp8dL+slUj4=;
 b=h4Pp0u0KlPnC1ULTEd8W3RtdQX/Sjli+Kno66WhZUrY4MvduAuc3LVxFOejIDDX2BFmYFpHJ60gC7UvaAneeF2ypO4FQ4EBoYrjYN9Pjc76wstm9i+ysy7ygeG/4uHtCmvePjbn3XBCEWv9IHcCB42YywlgPzF2PTRRsPYDLpqunyXH4I+zpSZDzwX51vSRg/4oVKvcB1QEkrEyL4Wqz5Q0R+x3SKlA3d2bKWMDuY8SsMYcE6fVra5P/a236DP9gBiyj3kFRaO+5K83TmSPDOOu+KVEV7rSI65lqQcxMLFtvVr3Jv4EizklBWMSXMY8ac+cBz9E9whvZ4CfWf+XVgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nxp.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhz0AwWQhArIG6X1e+sdWmQzlKSfSIGnLp8dL+slUj4=;
 b=N82LxzWN2deRU43cvLtvq1jhaWSWdGQuDJF9eSDYCulnSZSEjAMfcEmSqlycQA5Z4xwIZJb4AaTrEi0A2yl0mHsugMuB4JiLaFTl5Y2WcxLLpyDsi2n6XdCuga6FcCLgdbJpxN1JteOwlYgIgfFd3G4sbKavuxCFsspHkR7qDk4e+j1KzkWehGJlTO401/vI00NMjJVbfVt2ztBh4aQqJyPaIoUEk3nM1iPx5mzj1Pw6u2EYTcUtRb5J4NOTsrVZ1gxn1MRDPskA5/a+SC7WZGF50HPm99Fl76hI4CaPCfQ3hPyeWZr0HjFSZx7AWeF3T7EVCoFZLVqmDE4niOUjAg==
Received: from DS2PEPF00004556.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::510) by SA5PPF5EA4322E1.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8cc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 06:07:36 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:2c:400:0:1007:0:8) by DS2PEPF00004556.outlook.office365.com
 (2603:10b6:f:fc00::510) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9818.12 via Frontend Transport; Fri,
 10 Apr 2026 06:07:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 06:07:36 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 23:07:19 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 23:07:18 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 23:07:13 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <frank.li@nxp.com>
CC: <acpica-devel@lists.linux.dev>, <akhilrajeev@nvidia.com>,
	<alexandre.belloni@bootlin.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <ebiggers@kernel.org>, <krzk+dt@kernel.org>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux@roeck-us.net>,
	<miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>, <rafael@kernel.org>,
	<robert.moore@intel.com>, <robh@kernel.org>, <sakari.ailus@linux.intel.com>,
	<wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 09/13] i3c: dw-i3c-master: Add a quirk to skip clock and reset
Date: Fri, 10 Apr 2026 11:37:11 +0530
Message-ID: <20260410060712.30377-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <adhkNYQW73yQ728h@lizhi-Precision-Tower-5810>
References: <adhkNYQW73yQ728h@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|SA5PPF5EA4322E1:EE_
X-MS-Office365-Filtering-Correlation-Id: 52b81259-b51e-468b-c161-08de96c776a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|7416014|376014|13003099007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: DgY+cdnIFQd5Ixnpj6BQ7iCaVOEZlt+z5Ajgz+c0WH1sqNsBHdHQD7VfCz0IbcPdJvQlj8K5R4/utkeFKMP7DDeAf+4rmKxCxKvtYptQd80lNIEvyUQNiaUoYFSno76sU0Py+UJwoI2XQxbcOFrNQqkKNJ0nQiOUiGopVN8HkLAJ5H2X+0kxybDAtb+I2sKTgFFmbkPmu/NaMXX7jSNPASZr3sjNuTecURcnlrZn/mbJ34G0D51eyRrr1cQ4r124e5gLkttpY8i9tn7OiULR5DDv6lIw3Rc6M/e0ytq8h12aipZ4fP+qJfQKcXBImXjQfHvQcmYwGOSGco9wBnqzMZr9LxDudHlXJRFp1G8tbPH8Fa+8//g90Dr+1N39QlV2bUu3xLmk1Jr/0QS4RCTY+4w3OI5jjbO1jnPwsTG3DUDKsURSOxrkY2wxzsmD4hS/nKMgqKaPqU+VXgwYLVeEB+RN+aH6bI0KseTV/wRErgKtdojk0Nf+4x1fsU7PgtHzt9hP4zAJVqAERwf2Y043XwSsLUfDN/PbglHCbNXYEcleENkFFlWL8XzLCSU7cJZenTHmeBAICrdLPCSMlbFuJkHiKCvvrmw32YwHKx+Yx8mL2cuoF/GlGxSFmrjzralfR3yg7okVvLaFqyVA9pFAsRpsiJV8tcDUW5059nZnvEZB2t8U/SmgtB7X1tJWnIJ+3hWBG/kxW+2aTPTUtPvybFGjxC0Vua5RCtG39nC8PCXbVYOhjVy3SHB+sXvVmlu2OHzNxTd3XuWTuyLy0kooVA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(7416014)(376014)(13003099007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dYPGxmlN8OeWEunMwsf5QXyo1mQ+GhfOFNxYN9ai2vn+ODgR5vS1HfnbkSUtONaivOdgsSeHlUDWDMcqPyxM6ZRX7QuIU8rs3TtD3SpqWttXkEl20wwdG6maVk03Aaf8rqlzvD7t/I/VUOXT2TZBFvqfQ8GtfYYPtJDr8MKeS5xiTmZ8ukrCYJhSg5yG4SP4biyn+5fM0Luulrs+8kzV4P2SADbXfqr4Kal3lVPjESjxsMn9+Ggr152o3Hdqih9Fz3Xg0IDwtj1RcNir+xQ+rmW++C7rq8Yv9DHTTwGHGJd4x/FXmmxhKuiqXgCYc/zhVmIJsYRv11RZs3EQPv0OzGZRnnlOlusta5cuM0fcrik57+Mt66/TlTOyaNzgDAZ3xMh0k19isS6kuODUAou+LUH1HKUUFDTb2ir/zT6dEx4CikMiNMXyzw+uQUNrN5+o
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 06:07:36.3569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b81259-b51e-468b-c161-08de96c776a8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF5EA4322E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_230744_795959_56C2FBC2 
X-CRM114-Status: GOOD (  12.08  )
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

On Thu, 9 Apr 2026 22:45:09 -0400, Frank Li wrote:
> On Thu, Apr 09, 2026 at 04:27:39PM +0530, Akhil R wrote:
>> Some ACPI-enumerated devices like Tegra410 do not have clock and reset
>> resources exposed via the clk/reset frameworks. Add a match data for
> 
> why not export fix clock at ACPI?
> 
>> such devices to skip acquiring clock and reset controls during probe.
>>
>> Move match data parsing before clock/reset acquisition so the quirk is
>> available early enough.  When the quirk is set, fall back to reading
>> the clock rate from the "clock-frequency" device property instead.
> 
> "clock-frequency" is legacy proptery.

The document ACPI on ARMv8 Servers [1] suggests not to use clock or reset
framework at all. I also could not find any proper way to export the clock
to the kernel from the ACPI table. The same document suggests to use only
_DSD properties, if to pass any data to the kernel.

I can rename the property to 'default-clock-rate' if that sounds good.
Please let me know your suggestion.

[1]: https://www.kernel.org/doc/html/v6.1/arm64/arm-acpi.html#programmable-power-control-resources

Best Regards,
Akhil

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
