Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5399FEC0E6
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Mar 2026 17:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ujft3Hs1/paCDjgTIDUDwZn8DEqv8bDRTlBrYAdg6T8=; b=1R19TehXZbu+nZ
	9PU0B65vSn4jlBf35XGWGKtUue1mgpxB+xiNTUBP3b9fkbUvZ4V2wQOIWBFSTW4Q+/BGDJDhxkUZF
	mH8AzKoZHAzKAfQ3l0ddQSrnzv4NIyk9O96VFrdQK15GoLqiHQ9JZ2nMLFrJLy4uWx3F0BktbNhO8
	OUJQKtL7BE1VjfgyOSq3dr5y/ySS6GfvA+uOMLVxMqAXwL3/PjUVwcxE1acERUIcEQlQT+WdtZotU
	w+X5xz0Ez8Vlr0x8/b0l6BJBM7LPN3hDUMffhfbzPLfkj8+3of66p0sFyajB2/O9d0bfPeSK58KbH
	yPTrwnIDolUjzu4cwTnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55Su-00000001zac-1g6K;
	Tue, 24 Mar 2026 17:22:52 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55Sr-00000001zaI-3zYg
	for linux-i3c@lists.infradead.org;
	Tue, 24 Mar 2026 17:22:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1vgjd+P/Xpy4aCva3RBYCh5ZlOIUJkm1IEEcGBi5GWORW1RDPNLRITiJqvgkaf22+Cdc3ETfHDWjQoLlD0nTJn/lLVnmfagE2R0NqQV9e2kyHQSkRPLf35jsQrsfdUGDZxJXXIZIQ2CaSa1rTUNGaWLcL3fruY+2SpyNd/w7oukberZtIaOe6SEwVK1ExhGe55ci5tCgrihDL+ADUQTGg0RW1aAUXqyR1MSqkQ5LOiDqTQ3CK8kKFgKFOQRMt4txQ5DuokCZKcHoi0N3Gz6pKFV3VjZpKqtCCLwxIUVmNz58PHemPYPbM7kt9xNc6yzf/bN2QKG9wgZxlJ+8zoiTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e44Bi+hnTC9Z/DjGZmffh7y/+KG5uB3gr/HdEQjzUVM=;
 b=D9Uxy9TfeWOQTrMwym83ic3wLWw41WgLd57L7BeruzU+T/o1HZ9kKva3dtIDFm6rpRpD4e8ZIaB1UVJhZ4yS5DDwEyECcm+nhNgJibtcfjnB4bhPrSSX+D4G2GBIQjC/CAEqaNHOq/PCrDD7uStQpW9NSx63pDPZCD46hvuZxwFbj7ztH2Pg4iPY5J6+PVJ0jH6MUQgodBSX+/+8W+AqaaNpP9fUw8lDqpECjMDgWdqu0q8YDIWuG+j4mLkO/7G3oaygL1F5o5tVEfBnK6r5VLpwzkjd7+OdL7DYHFGfHTqUWwWPPQw+T7rwo7quuaZhtHmXVUakwgjdCDJjzCGa3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e44Bi+hnTC9Z/DjGZmffh7y/+KG5uB3gr/HdEQjzUVM=;
 b=hmZl7Egm0rWwcgSrUpMxLz0FKCLv+/kaAbu3HW+qZlksA/q/Bg21DUzfj/OQYlECQOITY5ydBjo9EP8pEzAuZ4i66zucqmJDwJuCfuV84Ir7JgtbXADmBIn2XjTIpUGdZz48pjQKb0SrET6qlFvX0WDwlNNkua1sWOOo8FSaINRQe4tCGWmEgQyCJI+JdpqmP6O1aSqbif3A+XQzjzntjRbWj8Np0p+dY/lxqbDVC8k5RsEkwB9I0jMVcibCIw9PytZ9Hqvi73btHc0HAcgiboXLNCs+B1zRgJgKh7jg6b5dgK8Nu457w4zUsjqWMK0/5rpk4G0BaoLZvytIfmafDw==
Received: from DM6PR08CA0035.namprd08.prod.outlook.com (2603:10b6:5:80::48) by
 CY3PR12MB9655.namprd12.prod.outlook.com (2603:10b6:930:100::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 17:22:42 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:5:80:cafe::5e) by DM6PR08CA0035.outlook.office365.com
 (2603:10b6:5:80::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend
 Transport; Tue, 24 Mar 2026 17:22:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 17:22:41 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 10:22:23 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 10:22:23 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 10:22:16 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <alexandre.belloni@bootlin.com>
CC: <Frank.Li@nxp.com>, <acpica-devel@lists.linux.dev>,
	<akhilrajeev@nvidia.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <ebiggers@kernel.org>,
	<fredrik.markstrom@est.tech>, <jonathanh@nvidia.com>, <krzk@kernel.org>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux@roeck-us.net>, <lkp@intel.com>, <llvm@lists.linux.dev>,
	<miquel.raynal@bootlin.com>, <oe-kbuild-all@lists.linux.dev>,
	<p.zabel@pengutronix.de>, <rafael@kernel.org>, <robert.moore@intel.com>,
	<robh@kernel.org>, <smangipudi@nvidia.com>, <thierry.reding@kernel.org>
Subject: Re: [PATCH 04/12] i3c: master: Support ACPI enumeration
Date: Tue, 24 Mar 2026 22:52:15 +0530
Message-ID: <20260324172215.31540-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <202603240843279c9e8b90@mail.local>
References: <202603240843279c9e8b90@mail.local>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|CY3PR12MB9655:EE_
X-MS-Office365-Filtering-Correlation-Id: ed63bd4f-0c22-4b0c-4bb1-08de89c9f461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: YtYgX4QqLVx6KszpDLHCk/yIFztDUw8MMaGaL15XlEi0776586u9MIWwdgTWlF3YmBre1Hou/fne7E7YFBTJtTHKRJp29WfEfzhsmymO3sbcOhBmF2P58uxCyfr2c8/bmDqCovSdxrP4h3HNDHjslD2Buy+lOA51O180ECABVbWGPztos7IE/Bs3JuLh3Pn3z6eYSNiAfkcOrpBqFwjQoV2YeT2fl1MJK90n9qX1VqlSa4Biff6yNrxY/Ii4j8hLb4fTGgkk7ujSseRy9j1AFDcI1iqZx9W0iF2WGuoZ3xkdEOGN5xa2TnOaXt7dvtfyytWx0kNloJ9vVN9JeV/OI3QQYZo7bGrZ23CrRuzI4pcTOK0bbiAEy7w46BFmcdGYgU0rKKlfSA3oXr4Yek5SSY+2nv3FNu/JnXR4vs/NryMIJCE/obXKanJ4Vylan13g2eo8fFfmXEkyvvZA4v/s+eGuaIDJb7qpVPjnchFz2Kaz8zZWTWk9RIfzGYanP3ELRIScJhqdqml1TZVGLdNFVgCT+BbR9LGRpLyO60stH2dkXuaXAvB0Kdo0xeHTwFVxh3eMWXpaC6IpqGaWcYHvMtrs6+pvrB849ODg5XU1XlIeXpBlfurhyrxQUjVP+zXZRYSGE/V2YEx5QavKv0CInTrZBtP1TjZ0bH/ZnNbNrLOOckBTLCAml0wedEIEhdK/USZGH9050PfANixUCN4YGEU2r3CqjCytIDtzaFIIwhh8i2l1wetkpCwKCXWwcQsXZ9nyx7uqtn/N7+Kghn5Bfw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Or6ssy8Ks6m3CBwDmXq/tL6nh0qKA65g+oC7q4IVbz1yqGPtt/s7JDhEpbwUA2OeYbENZm/HiZVXtJfkrk1gW3ea3MiwPsWor85jRJt1xedSzb2n+J9eyZ4JTLznax1LH3nbfYW5RJMEVGrUh4wJub7POGI2JdrkFedpIQozyMJ79SaezvurwCdusfLokju6v/syfIepdFr1mV86FN8Nra3rN6Nk+2bCSU1ObyhpRJYzE21m9MKxaHyd9BFhEo4Kc2OIMvEF6jIIsCPugprYtqoXRldWSNTGWo+JnSyV7ZAJiiO3riX5QJCuxSugELzvE0nvKrRkCOr8i7QY76NhjwqJOWAt9lPcPBeGVtNQdhn6ytxSnWc0YCa4biyvYMt1sSwy80DtQAYMcMzHKQv9Eiw/zE9KTAskQOxMiYRjrLnfG0BBJH8erDOOnKufzVZJ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 17:22:41.3517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed63bd4f-0c22-4b0c-4bb1-08de89c9f461
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9655
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_102249_993762_5405DE76 
X-CRM114-Status: UNSURE (   7.39  )
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

On Tue, 24 Mar 2026 09:43:27 +0100, Alexandre Belloni wrote:

...

>> #include <linux/acpi.h> is added in PATCH 03/12. The functions' prototypes
>> are present in acpi.h. I think the bot checked this patch individually,
>> or did I miss something?
>> 
> 
> #include <acpi/acpi_bus.h> is behind an #ifdef in acpi.h and your code
> is not.

Thanks for pointing Alexandre and Guenter. I also noticed that we do not
have stub functions for a few of the acpi_* functions in #else.

Looks like I will have to guard calls to these functions under
#ifdef CONFIG_ACPI.

Best Regards,
Akhil

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
