Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0874AC4451C
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Jul 2026 04:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29qsB5ttXHZHq25LNnI3pzOAqDS9gI6RjZ/MUTcBI9k=; b=qV7rjspNsHjfR5
	t+y10bqeU1Y3mE3+THb0ShkNeRk/BdGsipRUjxxu6EUC4sbPuK2ECYwQPIT6LeLmUUD0lQM80aZkk
	HwK6FxFQt9oAI5pw7vU3ePsN2iIVwU7sA4ozXlvdB4o5XZis+btBUJ80l+4ATN5PMx3S9Td/WBtwj
	kmTqViA+Vwl86rAg62I2vFnotVqgR1HF5al/Aq5ASurEHM42IIYiNaL5Qnr2JTDAaW4I4G1Z0yd+m
	s7c+9F0M58Na8GsRC8yFzu30aEaBZFIgM27ukLf+5NKOxf5gTNqtEL2pvshND3rDp7up6m/rGHnY9
	cjmiKmNTcoh0H5NeqTKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm1oD-00000008MPs-32eM;
	Tue, 21 Jul 2026 04:10:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm1oD-00000008MPc-0vVn
	for linux-i3c@bombadil.infradead.org;
	Tue, 21 Jul 2026 04:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=unGLf+Uxex8MrwG2kOJpiBdUwqjgd3Iqf3Br6rTj0JI=; b=kiheE7+1oSwoHFGky0FexAnmOU
	S+HXBMRGgIE15IslxSrbclxtUAe2vRSetNsiHxCnqKoSwt4Y/1PJr/npR70w5xxy9+kuYoFWcjRkx
	SCyEmRFN8STok0AeIWiFhkThSYob1jAQUf+CdR50GEBIL/7+KcWbAKORG462H/kr7ag51aSSZ4wlG
	/mTsJ3PAvJknfSswWWVhzw9DeoDWx4BF0fdCxZeEJqF9rspjxBznMidhUKoZrpC4kyLjOD3tq3uwp
	cjGpsfi/D1zFr6QffF4mYO70pQQWTeTIJyUU6jgcNFtiwibS9UFqtA18VG8qyavkOF5FkQCRd5x8g
	BI/n4wcQ==;
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wm1o7-0000000HBhr-0A6l
	for linux-i3c@lists.infradead.org;
	Tue, 21 Jul 2026 04:10:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJ3So4n+DpXhBm+P5ambA9ZZToMe6/x+uL/ZA2zkzll+buGfKbVWbTlGgTOHWiRfx/mPL4PbXKKfB5Ku2OCHdr9H9w4HhT5Ll1ELGlPWIqsVkEBs5lNVPEzqORprYfpPkySJ9YXYBF6Vwhww73NCvhhGZp8gOwmSoqdfD3hXvZWpuPTqQIX7MR5IPhZtEBosiU9xE9mT0HuOytZ4Bfdb6ExMr4ODKRoy59OaRBC5u7caWxs7UAjsCvcvCT/sADHyzgLy+yeMkmKaYnugZ6rMaLRViKcoUOIzdWu4a/EF+iRGnGRi0zPLqu9oTKxkqM5kAKDwtDiv4EA+J4xql5Prmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unGLf+Uxex8MrwG2kOJpiBdUwqjgd3Iqf3Br6rTj0JI=;
 b=vwFnJ/G0pAV0yHYz1w2j8hlOkmkZubw9x6oN6gfeM6aBacRemz2PMdm2RhxsArCxDwE1jLMv2k8YUKQ66o9vYG6EEUbZMKYouyc8z5GWcqIC9fnOvP6FeFzRQWf9H74D+vLOVeNImfEPvyuallt6LuDTTsq06/UdUfxcTlZoLQWjAJrNzYSpiUMRUzTq4bBM22Dlx/wCzaDHCH7s/nnLp007O4wVoPTx7She1ROVHfw6z78F4MQSPJBx58CXrxrWnPCmpNJD70HrRJmMawrHdFGADRVVNbRHN4Qzdl6pgM+0BhHTMra2jNf3hLRBs8sy0aRFOs+tQjNcxZPbH6k98w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unGLf+Uxex8MrwG2kOJpiBdUwqjgd3Iqf3Br6rTj0JI=;
 b=KJgufUkRmOrGoilcEDkELcT1VBmgUVPaHmSMPDilYyQEJqDopOHesdyeaY+o8bLA4wlGKDb8/NiEcI/UcvyMD8e5Pu4Lp9Ohtb+7rfOLiZB+KDLDEcm/zJMYCq/XMQ8z+UrU5XOQJT+/AHC+iuqsyiFp/nuQH8/BvigYpftxKRSWPOj2VK3oQLp+8W8XQ/zpTE/svafBILFFssmzSptnt0m/y2rpab/sVLK02nvd9oxF5OL2Eco2I4nRArJSXIWUSGSeDHbZaIEQNCdk0ih6v1NFVJpW8YiWSmlieG3cVKmi3N+N57ZMX3SLfox23SmkRueH+bj8d9kz/izUwDyhrw==
Received: from MN2PR08CA0008.namprd08.prod.outlook.com (2603:10b6:208:239::13)
 by PH7PR12MB6882.namprd12.prod.outlook.com (2603:10b6:510:1b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 04:10:04 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:239:cafe::1f) by MN2PR08CA0008.outlook.office365.com
 (2603:10b6:208:239::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.16 via Frontend Transport; Tue,
 21 Jul 2026 04:10:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 04:10:03 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:09:50 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:09:49 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 20 Jul 2026 21:09:45 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v6 07/12] i3c: dw-i3c-master: Add SETAASA as supported CCC
Date: Tue, 21 Jul 2026 04:07:55 +0000
Message-ID: <20260721040805.1696503-8-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|PH7PR12MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: ab9c6609-372a-47d2-2ee2-08dee6ddf10e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|82310400026|1800799024|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: Xi1WjEM+G3zdYnVDyvpfV5glWfQDjvgtwd3MhWCS1PKg5zF8/nxjrMuyCPGLerWdCK68xRa+R25yCYQgtmcLN1moi79dFYt0vziQJPSbQ5+FhR5SIgV60kRdX8FT3eFzChvq0TzpDk5ik/GMVUz37p7itIuxmEz7gUGvFRyL77x0Xq7u+DZqp65nteCXUwa2nd78eGzSaTGcoRuQY6VkbLHWU/6oHUdEZGRm6QFaboCzm4DiP0jvheVsuLl4IVb+TX9mTYdc5AkXlUXb2IpXqtGDyys14ImLmRZH6KqDEUyGoufjYayay+mTJd8Ke1L/V2lrEGyoTSOK/O0DAJfKYxjEpi/8USPjhV8G4kOBXX0mdDv8H20mg8PPhDUGRWTMSrdRCGzXOORyDFxcsuq4/eYt2i3pt8xsE1fTlUX+WasorCl96aUUzQiecXh2Tg/TFl07wrXN+TMRhoP6aYOcQgjZAndMwXZLPvKDV/vcFrsvgAONvAvgk0Zejcp6Z9Qe/luxZnrODvoZDYtEF0jvD9syUT+wHeoqsTCBXzF+0rP5R9gYJYA/RuJXvbYBU6HbSD/Sk0BACi+2GEQ5kqyN4K3TqiBfDzmhXo5JKOqKKVeurZ5pa3AJCGKL5zYGx54Sm/ZpTgPGlFDZTaaizqnpLaPDoWGqiQausuJjL4CxsxMvdQmAnttZuIWC3CntSwMIbHLD5hDoZjNDPQvlaX5cBA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: T78rbpwLC9OMj4LM3lD5e4Q9s/Z8QHE8hchFkL+lgwIvzur3UlwOrKaOTCr3KlezY3gvoOuZIzmmukPqoCozhJxOUiQQch4yYiPAoVbYwBWNb20jzU64W2qy3F8yfNwAwwMHBMJpIlohBqhAYh3U8tj58XwyZLRjjVZEbjS5H0vW7UYWqr6eBjlga6cOBlN0Li+SrjiqPd3+/U2vQ6JeQ1wcnwpyjXW9ri7N6qKkXciH8Fj9xpYY+nVErhgAScFwILgTN6z32gZzXJ+sMg4PAlzHCjIbuBeHGaep+8uDiOOgoYP82YpK/NqHcpu7xgmyw78iGUPKS6qGpv4xCZ6AB7HWsrXJ6wMRU+Ng3ON8dbVyGKfiyHkm1s1b5Alg7esdq5uZVrohKN/E5TeYENf3JyqTvfFpuuCO3ytAyCO1jUtvZr6h5+WMD4WEI4XICnMp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:10:03.7774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9c6609-372a-47d2-2ee2-08dee6ddf10e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6882
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_051015_581750_41239EE8 
X-CRM114-Status: UNSURE (   9.12  )
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

Add SETAASA and SETHID to the supported list of CCC commands for
DesignWare I3C host controller.

SETAASA is a broadcast command that assigns predefined static addresses
to all I3C devices on the bus.

SETHID is to stop HID bit flipping by the SPD Hub to which the SPD devices
are connected. It is a prerequisite command to be sent before SETAASA as
recommended by JESD300-5 and JESD403 sideband bus specifications.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 2f8c0c4683e0..29030fd9594a 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -309,6 +309,8 @@ static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
 	case I3C_CCC_GETSTATUS:
 	case I3C_CCC_GETMXDS:
 	case I3C_CCC_GETHDRCAP:
+	case I3C_CCC_SETAASA:
+	case I3C_CCC_VENDOR(0, true): /* SETHID */
 		return true;
 	default:
 		return false;
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
