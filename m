Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5388CD98DA
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 09:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qw+fFo76IYgC3fwgE/R+LPVZb0sNr4jtcffDU1AkEgU=; b=jJym4HygpS6u+W
	sYrpbwO+4o7DMnWLy+1t/K3eS49t1JgmVi6ypxz26zMva7FsnCc/cd40X2IUYW48qWwUYvppRSK4S
	alEy/2pAi43wYu6s/nKQjRhTOqgDrH45XLvUnm8XmhwQ/aSeBIXiLSyRWLEMCKOXmj6CvKmSRhmal
	PuFq1NFwfbcH0J8Aj/bVIBN1NKn51/0ul0gQ21w5xQmj+fSLEkIpt5UBDQb5PdHxD53hIeOAIRxVQ
	T6mSwZPYYBUZontOJb3al61126eWjf0N5usCSGOcu8lGGkvvG0IWgSGroy+6eI/cvoIy6n2vA2ew3
	VjOHdAL+skUxYUfq0gag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQY8-0000000FYX1-2L5j;
	Tue, 16 Jun 2026 09:57:40 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQY6-0000000FYWJ-1fyP
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 09:57:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yStAEamEb84ot3F0zkmPlA/esiV3tUbpOrmLr7VQCyp2dfswn/yOS+NGpPnIS+EqJnmfHHh6WgcBxXt7EpGceI6JRHBc1Fil77+IlUwgLhk25F2DqEG18UyccHA0owdSQZjIhuSPwz3y+PVQaue7JrDNhNEAqX2ZK7hRc0aO/k0sAo6cbWjkWH3a1YT0I/aeZKksqGA8V8kIoEnes92XpgS/XMXse6xlnFSy2P4jSQxdj4WAou5ZFHAWU8LW0no/XZ8jcsyski//LwLIMj1b7QIbPuHpXiSeobsmlVHwEj5zcCJltSoY0ECBU9z7aRNw2RgJciidktoeSNBUeTepdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeSRTK/Poczz+CYtJpBOFiHy1EowJp3dR3tgxJDLunM=;
 b=Gi40i2lqHSIHl+5AILt/vkwAwElUKO7W0xyugPc3TWqTknsTwOt7GgFusZAhe/rAf0+DjfFEHS6+MOHA/fcEHu+oRHXUTHqxlXRrSqHiklYDT7jPrPT68Za4qxOioNZ5/pLT+uUA9/B2ir7nJMYpFoZdYHmGG7R58Hfmp8DgMaUqjhPLox9TYrsC/5MjQqwZsGrEUF+Fte/E7JQqy/USHlpGdJXiL07gUg58QSRnfoJ60WtGc4XcyyfInaV8juBasQOBvD7tFOXA5S/pTdHah7g/H5elL35bCMepWoHmnpIYVVkcBK7Z2ArVwDr+2J29UzvMcVHqUuj3XaVnpHxr6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeSRTK/Poczz+CYtJpBOFiHy1EowJp3dR3tgxJDLunM=;
 b=AFOa7oCoaOQVcBXWNIRoGcWZqpZpup8CtSiJbza/5vP4nrjkypYqlwJxNSXbWxcW3gzzaw1/n6T0dMqVAP4PSzqHjYZ4clIdUCNboex59ByOxru9iyuJ7eRusm3keHRiE9a8YZRxQu5idJv4P3HzDlybsYzbO/cWxw0jeGiOOLK96Fn/t0oStGNlGF3FOsBYTtc0mDA4LdUEciP9TEWc4ZK93rPxLGdHRgNhCM9QN+tS5c2X7E3+tvckMO5ZmIIcAo5HAYPt+7qQkvY6YsZy0Agxrwp9wwhqBfH519UypZErXzRAqgIk1S8NDTnq8NCEXb53XUCuY0hK3jdRjPyF4w==
Received: from SN7PR04CA0198.namprd04.prod.outlook.com (2603:10b6:806:126::23)
 by CH3PR12MB8281.namprd12.prod.outlook.com (2603:10b6:610:128::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:57:28 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:126:cafe::92) by SN7PR04CA0198.outlook.office365.com
 (2603:10b6:806:126::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 09:57:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 09:57:28 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Jun
 2026 02:57:18 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 16 Jun 2026 02:57:17 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 16 Jun 2026 02:57:13 -0700
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
Subject: [PATCH v4 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
Date: Tue, 16 Jun 2026 09:54:26 +0000
Message-ID: <20260616095429.3947205-13-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|CH3PR12MB8281:EE_
X-MS-Office365-Filtering-Correlation-Id: 8200d7e7-fa6d-4fec-1de7-08decb8dacbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|82310400026|36860700016|1800799024|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: wysSJf98UXry3CG2AA6ClRSuJWwpdrLe2ZdmiGJRUG3uS3jGEaLwQ3BB1nCiKVunoKIB8nK5FtWGVgjJz6FVuhuWZLTogQiqDa9MoI1THE6U3qIu6LkQZcUuKUmJZulQi7ekfht4jq/Qq9qUDZkjqrg6CuJDV6FW3mLgPf06BfHaZ0+2nNZ9IDa7+JMNq+H3aW8Cn4U6Q60BUQC64GvaiTk+kPNAbpIJdlcoHNCLCokvsZ3kuNTqeb12MFgqiTC6TMUPg7D8xf44FO0UTOKRki2R6HfwmlOxYs1RG2ESTnMU6buWzzQpdjL6Srrzk07dvpeqYiX1DxniFXz42kfgsofEMF79bDZu0geKocdB48+uFUooaM2DTy+V9x7yWHE2/bGidcOwkliKBAmKDvB7gGf6YliKFfuuRi8DGeGMgj+I0BZ3pGQ87568LR1DbEDGokL73FmJb4jhoVSY8HUzEbQh0nemYkjOYlYMZ/AH8vfrNwSkmi0rMKsoQPaTIq4DDWNE7fEXTrEt1AZ4g1ufM1laenKwindKCCUxvmrtMGZK4QA7JkWGCDizJICZldzkNVddT9K04r03eqqlDTd8OPKYZ4UQenmtb1IkcRiJJ7XzwxojvQEY2a8xAFxKbJzu1cC/SfngSlIFb3eyvNVGgEv+T6s6yoHExFrGH+/+lTRZYYw3HnYKs0wbsp6w5qAkisib0cENv7+fBjLgHDSO0QTJDUekLYh2UIflXAiIWGk=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(82310400026)(36860700016)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BTd7xtZ9TEIkA6j/TJWfTN6qEWG3e1VoWEEjZK++uyB491OQVl/hwmVEL6eOE3X2A8bmWNzT+BfomfSHdHk9lIxwI7bg5CuGDzQ7QEGt6Ln90wBnxdYaT/rjrIZayLCTZoQofpdOyaRwDu2b1+V4Ak9WSSE4pR3yx+M4lpqXfcGqw4QsX2qmbKJYF5DQcmobvtQuwnIsCJ7lmMSMVMQkqF13q+HKA5QMfkVxU55agYP7TjH46ChRibuoIZQLJslZaEwOeqmKWy3Wf82r3dLJVHnNRDiZd1TTCGmO+jA6XZEpAD/3fRYXqq77s7PDlulAY1KQBTNYoJo0DfR/kDEUpRUmohl1DFgPGibbnkkWtQ8sfxWPtfnIDcnFxsw4gHUqP+SHnBNzAj6EzAHev+S83yoQ48KGxjQcuZ2ApqlrHHdLw/UoM3tgUIRLm6DF4Y8A
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 09:57:28.0707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8200d7e7-fa6d-4fec-1de7-08decb8dacbe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8281
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_025738_462127_BC946303 
X-CRM114-Status: UNSURE (   6.49  )
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

Enable I3C subsystem (I3C), Synopsys DesignWare I3C master controller
(DW_I3C_MASTER), and SPD5118 hwmon temperature sensor (SENSORS_SPD5118)
as modules.

The NVIDIA Vera CPU uses SOCAMM LPDDR5X memory module, which contains
SPD5118 (JEDEC JESD300) compliant temperature sensor. This sensor is
accessible over the I3C bus through the DesignWare I3C controller present
on the SoC. Enabling these configs allows monitoring memory module
temperatures on platforms such as Vera Rubin. Vera is an ACPI-based
platform and does not use device tree.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e6ae93e533..65d9eb56e978 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -640,6 +640,8 @@ CONFIG_I2C_UNIPHIER_F=y
 CONFIG_I2C_XILINX=m
 CONFIG_I2C_RCAR=y
 CONFIG_I2C_CROS_EC_TUNNEL=y
+CONFIG_I3C=m
+CONFIG_DW_I3C_MASTER=m
 CONFIG_SPI=y
 CONFIG_SPI_APPLE=m
 CONFIG_SPI_ARMADA_3700=y
@@ -769,6 +771,7 @@ CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_AMC6821=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_SENSORS_SPD5118=m
 CONFIG_SENSORS_TMP102=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
