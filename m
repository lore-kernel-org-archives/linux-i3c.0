Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501B6CDB47C
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jun 2026 10:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29qsB5ttXHZHq25LNnI3pzOAqDS9gI6RjZ/MUTcBI9k=; b=LvYIvFIjhzJzqC
	1H6jq6DvkN7BcnU0WPdJRpNkSDef8jO4j84LxdAKcsleymYyTQ6PFzs7F4m4zi/SV5P0P4AnNF+fU
	s8gIi9u4yJT+185Gxk4Ln3k8QZ+pn9AB4tOozkQLDkKkNSu2DD8bGYjzjGxw/VfdGx+7vbg/tbsJL
	rnzesYg+n0OSuMh1blZvnxPDJbkAfU6aFMlxCp44HmaJey+2Pk8+odF1XusyA1IsO06uogngks/by
	riIO1q9s4WLQQ+GtuzFPqc0gTSuS3XcdVyje8IjmkEnvIuKIWIU/NR18CY5nJTeXLcCuBlKMQiTPe
	0n+6bcilqupho8k7ZAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKmH-00000007bQ7-0Ei9;
	Wed, 24 Jun 2026 10:24:17 +0000
Received: from mail-eastus2azon11011014.outbound.protection.outlook.com ([52.101.57.14] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKmB-00000007bOh-2ZDB
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jun 2026 10:24:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qI+WjhoPmhutgWzB9tNu4p6G8v20o3jj2yPwf6K6uuaK07Gtpj8eTNuMVd+1XU818wBTNHXpEqOrfiC01yTGYhS9dUg4APFGDRsSBTdJxm8qXQ9VVhQG1tVfXcvnhwNX1B3PelTb8k/CpKvjuEiHAleLqWxInLK72pPtQlcD7c79rGRaWmzqKIeauBCWb5nnfMWXx0R1M0BBn6Vo/CRkPnRbQ5kaKbjsge0O90EAv8jUERwOry7/7NxNMXv380D5O59bLO9H9Axm/loqAwUAYZTyhVUOyYXqz4kDRzayMq9D24nuDxew8u4tZl+w7ng9J9ok8xfalb7wEJoxx1aMLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unGLf+Uxex8MrwG2kOJpiBdUwqjgd3Iqf3Br6rTj0JI=;
 b=nkUnHPH1YSg7daci0uAHRjDhKUzP5EbTNFl5+0kU2hino5BDY/bAkSEnPuDC8tvvPSAhe5uGicgvni/ZbEFgSXvf2/ej2lzN82IZlzXrEFqiAJEnaPpbwoJ66E3wI7bDY0VWfBRcOll56epfPrm9xtQtH5rdw/a0hHWJWjhwFTVVqLbyq9ycP9xeYwedYK66TgVS6KOF0QJr+dmACS9hVvuYhTO+x7GrN5SGzhvTFmI45cIU+TSE35OlWuoD0hn51I+uBDFINU0lNnYCo7kac0V8iaszWuNIE8VJ8Wm5mKls05sjD/yG2vDNQxA0s+OYEF6nCShOom4iakInzobhTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unGLf+Uxex8MrwG2kOJpiBdUwqjgd3Iqf3Br6rTj0JI=;
 b=KUGe2m6M8V6Auld9vy1Ws2mWlbmkTXrgDnbzffMY3AlZ3lQQgehG3B+0Tljkhe6wbiCKuHpKHBSTLHZbUdFI6NAZmdvOPlwHFiTyVIGqzSjOi+juCZaV4EI7pqfAdQL/SGaWW0WxdRHnB6cBxlb3G5tW7XpYy7Ms0fKu/v3S9lW/ss4W5bpWFVj4KN7oRciIUwCRTYvSJPi2jUBTdt1ZeXC64JiqJVyqmQ2D7CQRKeV376UslRDV2OQxMmWf5LpoPcQkckx0ZojGNGEj63d/fIv3VxvzmFRUVNpCO7s7rrXeSTROFmiyF3n2FdhdfcXgos4ffnpF7lUDNRXb00H7xQ==
Received: from SA9PR10CA0015.namprd10.prod.outlook.com (2603:10b6:806:a7::20)
 by DM4PR12MB6110.namprd12.prod.outlook.com (2603:10b6:8:ad::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.14; Wed, 24 Jun 2026 10:24:02 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:806:a7:cafe::61) by SA9PR10CA0015.outlook.office365.com
 (2603:10b6:806:a7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Wed,
 24 Jun 2026 10:24:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 10:24:01 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:23:47 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:23:46 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 24 Jun 2026 03:23:41 -0700
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
Subject: [PATCH v5 07/12] i3c: dw-i3c-master: Add SETAASA as supported CCC
Date: Wed, 24 Jun 2026 10:21:01 +0000
Message-ID: <20260624102153.1770072-8-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|DM4PR12MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a701d6-f15e-4e65-7951-08ded1dab5e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|7416014|376014|1800799024|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 0aly3J3Nbb1FDvp4e+XxAOxSgyMinBW+4nc+M0lMCsZUxMBXuq4K3GQczifgWJS+u7yeoX+RyocMtly3VD2EVH5SD9QH9QdJSZpCvxUebLlf2HfvFWPeyl5UEa90knsKRXYfsY0NhT9ZvEkwHLhjf56HzXbehxE22F7Wht0yMr3fR9sYbM4e4cJs3LcX8zYI8HrddHrUbrCJ2Hvs14vv4i28A0NR4ghtdOGOgewflzMndiKLdZH2Tis/mZpeuIeYS1tDQO01gsZlBgX5ZwlUf4arMl4N9HNI7PnHm2iHXITFu4HxbrQISS/b1gnaaW0emX85NPaUspYtHe7DwBfKv3+JVUHEwGTxJk1JW1Sok6sp52OFVxTJuImPqBJqZ0XARKqcUjkklrprzSyo5gsSOpRAM7biJfAYTcwAINyYeStQwPGjzbCqmTP4sJnAGxB7nRNcaNEWqjXdgO+n06FyW9OcrgJlfZ56ExB85mSJLdUtFqIFAELsDMi3ErIl/nbWmpmkSy4+aQfzqaaKnSDWXaFsM+ce+gHMPQB3JROedFdpZn1+ugpoxB5bF/WaLrQJawseORPKA8PDHrJDt8QZAEP/6kSaW10o0x4OxVsYCrL8sbA8RoL3R++xT4G25BovO11bvGYSRRYM18HVKDOpfc+905GzLeK+LaI3b+BmYubp+fCXSlZ799os5cFCjSMiYeFk/GBaz5S/+diXJzL4WQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(7416014)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lloOJvxRlmsZxQZ3jCvTkqF6Y5WaM4P7Z890zf8eaYxDcX/4g332hbDVF/94T0zrmDff96kKmIaHVuy+yQsinyF7umEqF2Odr+pEe1fegwZec3R0Dr3LSB+A12Odi1h7NM6wTqnlLqwSAfYZrdvciu2WUghOvLyI+1UVUnd/1+GHRphlUHJ0T0KsxapvblIkue8SUPWUNlMpMyu4ZbqI6CGe+ej26jhBYfRBPa5hl5MSQ4vH0l+KW7c075pK2BafmOaWcPUiYoWsNZmLQpinwEbfUqvo+zms3m7e+S6iFsRxCzZF9+zecjrVkAnkdiNLs0W0DRitgP456m2BGd1XJEjOqcEpqM8N9+PAWGK9DE2QLjwkwp4oLIwEj0n6uHdCNWXBk+7Acz/r55h4HA7fIqhn0Ia8HvoQLKHnmUrtj5dvD0o7LlQnlPKf/74FvOcl
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:24:01.6587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a701d6-f15e-4e65-7951-08ded1dab5e7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_032411_675288_68F8FE99 
X-CRM114-Status: UNSURE (   9.21  )
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
