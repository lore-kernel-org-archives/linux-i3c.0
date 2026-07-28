Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625A5C53219
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 07:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29qsB5ttXHZHq25LNnI3pzOAqDS9gI6RjZ/MUTcBI9k=; b=4d5FEC30MWX3+S
	Oe6ez7dXdhUQyHEh0g7C7nwTgLh2yvEVs/3mB8EVVWLmqSC4e1GhVdG0IE4Yrip52Y/T72pUvHbuY
	3xR6Fw1MUuB8G7la5X7Ltf7yeRPLaepVQosq+bbs7h/JMHKDjweCUBc/bizZ7G731BYads3uC8M++
	reQPVoqbAD+S9JVj/OH/SueS6B1x0RO0lzERyf5JhwlgpyAp7jHPpShrQMFeiZBSFYt6o+xiw+Nu8
	QXtMAON1NUG/kX2XcUKnTPe+H5F7AI4eBr6h1hRbK+sTi64E9J6xiXcFfamjprQbKIsHjRst/fmYO
	fjYXfg8/Dko+da6KkVwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobpi-00000004bIy-24MS;
	Tue, 28 Jul 2026 07:02:34 +0000
Received: from mail-centralusazon11011038.outbound.protection.outlook.com ([52.101.62.38] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobpg-00000004bHz-02Mo
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 07:02:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fg6Re5tx/IbI4e+nm3EQq/HvivM6RzVHUhRshDq3Vwx8WHk1+Eu0x1pIdwLnrRevI4VYkS30Kuqf5AX3xP5P+ifR0u4q+7NgbGaNplDbWMPoocJse47hA22cMrUe4DofTHJ5yTE+y1OE/HtPrCjGiCrhFownPO9JAbtCUNehMR84LqfxXW0aW9TksP7sa72pHvP723UVFzxk4MfcCkF3hpMf/GBx8YidfsRSjVVPcX3ar5JLqrbvIWqFA5f0hfBo7hL8gz9F7jPdy8v760bEGAVL+qUAp1mj8dBsAz/lVCDo6KlZ/CgUAkS13ZMyVkQQwTABendyqjPTkscZa2c2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unGLf+Uxex8MrwG2kOJpiBdUwqjgd3Iqf3Br6rTj0JI=;
 b=yuvk19ivayShbCTldETyt1JdA+L+fu8NfZdN5NDJaxtPdv7mQDZ5OXzvW36CZ1w4/t49bYd0+lDMqHoCuPoxNcBkk4/5NuQ++7YcoMU5ZtqmqO9Q2RhKGMzrttB+APrZs1OR9+lErnwMf0K3PzO/W+V6EotIGOmGbYIGzLMQjgvBAVfg4Ed66ugNOlLVbk38tNvS1MjwF10BvsOMYatT8phS8Xa8HkPHd3YQx4qBbPT47HlgtA2lxO5VpPPPhffhittEod9J0ThOsfkaT2eaqBuG5B5ZMUGLQqE7UxoK5+5hTA6J7FTKlb8gaxh9ZXPLY+xOcbzkCBIu9iRTyAR/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unGLf+Uxex8MrwG2kOJpiBdUwqjgd3Iqf3Br6rTj0JI=;
 b=sK//moHBu8EGg3qKOjXK4v/sDKJzef49/uIswOoQUYSrANlu7V9oaTf29fwOwxeWKHigXsMtyMmBW9whufKxsxsixzGs3iKI2BTSxh6hQYxOySvpGj0ueQD0lb1ek/77FNDsafCuuXoQfHJNtwpbpVGO9OMwWG6A4MpCbpSm74hijQPNrRsJLTMnedvOU9wZB8gp1urJG2Pjxpq4PqSc+/POc3y0D6v4+DYyg+X1YOcCQlmn1Usd6UayaB5v+m8djKD9yibVMYR2CKrWdYppyKYdzGxheX2P7aK5LPcQkMTeWkDz8twjvJVmDGX9trSOiYTsM1tPsYD5xnV8OqWuLw==
Received: from MN0P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::11)
 by SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 07:02:23 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::8f) by MN0P221CA0004.outlook.office365.com
 (2603:10b6:208:52a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 07:02:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 07:02:21 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:02:06 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:02:05 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 28 Jul 2026 00:02:00 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Frank Li <frank.li@oss.nxp.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, "Jon Hunter" <jonathanh@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v7 07/12] i3c: dw-i3c-master: Add SETAASA as supported CCC
Date: Tue, 28 Jul 2026 06:59:49 +0000
Message-ID: <20260728065955.809445-8-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728065955.809445-1-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|SJ0PR12MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc72c40-069e-4906-44f7-08deec762bef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|23010399003|7416014|82310400026|376014|56012099006|11063799006|3023799007|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xTF6JjRqwcfKenAg6bzCK4gcdVdSoVvsoulsVaMdITdvFOrK2yEcDXuwcHwUvQ3j2cSheil50/QTWMnMO0Cx74uXXMMCFn3iN8nfcPM/BbIbzmQNQUDklCliTPdCBNjV2mk3jZMox262njhOTWQbFVZahPIRuU9q0FpJ9n/ybEO6FvEAjqxThdhJB0Pkj+giackQBY74zqrq0oz/K+D5rwzKyiCf7BZ5h7+vclRgtdgoV31+cA1eCH5WCAzjAIA+w9xLbUXinGxFGNXeanLDcworN0G9ozpAjjkFVqSPeOQfDE6PgV7BXmY44U0jTADHu5D+GQwmfeMfVsJyNZ8WJ6xAxzBZqqN8HoK4cAMpYEcLeVqBRESzqzGgbqQn4ZPF0t2WmFyQ3FxxNB+DPniIHfxnfm4UAmFvmKXrdoYXXpsHGzmuAUN8YjAdhYFDaRA8MKPzjDQ/5ymyqrVCH+kL58pa8k7YXNLEBlp6JDYQYzTZ96n7fJC7BeK7oqbLPpD6URH9r5esWR6ghvd6644SgX+gVmRYWk5Vw/IiHvlZ/82Rm+NXKpq6SAu1zfu77xJplpjtb1qgd0pLmjNQINlkcNFGENmWRNHbpBqGFbDah4jjksuqsXz6oZYAq4f04TxGoN0VpBQbYeGQQwGIqYeyNTmtjwts/KbAqSvlvRhhyE6JyHSObfNgI7bUDafYHYVFcfHgfK0D94x2tV1H6vr7iA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(7416014)(82310400026)(376014)(56012099006)(11063799006)(3023799007)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gpwsFXG9nLWOOItWN+nhDWkrZRJ6/wfOFrBAaTqnwTjN6Ap8Vmac1WD8W0DtSKH3wSPyYFso2cO1AYwI9teNxIwc70EzKEARZ7nlPpe3vkQjZKu1q4vqv/B61fq13fReD87WEsrE/Xo/wum51KgB3H3Ig1NfM5feKYXBTuvgyQWcVhkf9O/rrDM9Ko2eY42DctRFN2SVONxEoSV74JeXCodYyzV9x5ONDUbHUTJjtpg6u4zdV26tL22uoNkZ0NLR39h+4cr43q0LJgQJfShjeEq/EEwjex4wf7Wsj0fDRJtagExQrHROohPqluyCm3JvN1DcRu1eGrPJ8UHTtEHi01sWsR3LBRXZibqcF91JmUjkFCu/43VVc5hbMGYGfIfq1GYZo/z5H1dYS8Z6EGBlE3zoV/XmYlicm1kFIkHxfoku5P1udl1RxOfUFP2LWTFL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:02:21.8782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc72c40-069e-4906-44f7-08deec762bef
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_000232_051905_9CA1D7AF 
X-CRM114-Status: UNSURE (   8.71  )
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
