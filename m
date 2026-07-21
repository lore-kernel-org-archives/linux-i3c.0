Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853DAC4451C
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Jul 2026 04:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvql9pUiWtDs8o+IWo+jK3TBDYNCxrAOGapZpMbK3y0=; b=Whi3fhdhvZCINy
	afDlClBOXm3CcL2tAn80d9iIbLEnPcOghCYGJxlUr/maYypOg81aZdR6G+M4fkm6QWKmMc7oOtv5P
	J9hOwfgw+tUvDytYf6OsQKcdAZRKSRPqZLKkriR2qDW0bf+lWU6f3aFRMOtB4IfuL8e6hzjz6HOLR
	0voHEyhla+8rGL0pGZoaPOB9/ZXTM+LZjArsj2atnFHYBdl68Mw0c0ySGccmtIPhZJsfOVNwD3w+b
	u0OrGotwk4xdYfIGan61f4mDRrs/auCLSIT8xsCbXJ1UKLSkVgW7Ip2xbzLMCnIBWKij0Dku4Oac7
	LZ5L/ER34SRRNDU2SErA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm1on-00000008McP-0olT;
	Tue, 21 Jul 2026 04:10:57 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm1ok-00000008Mae-1n4X
	for linux-i3c@lists.infradead.org;
	Tue, 21 Jul 2026 04:10:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMxPiDhsb7hcFyQrbmXC8REa/T9FdOL1+75QK2mr6PcEuSawkq1ZECRZ91SbzziPwhwcO+PufuVU0Sy4ia5kaFYKWwmuPj95mo0Woft+iVL5IAw8jtwnEi0ipehJIhOTc25lNtKvbnm2NSYuzh4kZyUHF+YAx/78DuHpeFxfZ0yTR0hLijuWdPE3HzJpzUbM1t9MEg1+eAn1DwZx62Lx9aFpaOPDei8m6f+7/IslLELTQikK4bxywWUspZNEkik61yvY/hxCeiAaKnAOjKtfBEqDaCxN4TbrF1XCiA8rOuY5GpepX4NsT0ZDIyURXFG/qEaZ6qh35ZHjFWbUg3f8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqPh08Oisk3mf8bmTDDy5gMxs1iAY/8KvvgWhFxFrRw=;
 b=cTrbX5Dw1HtATmFLZ9Um4cDQspQL+C5sRNQSyu/eGlRoUvK55WWTQGqOrW5vVyc8Mz7GMfPbqYfLsIL3jAiNkWQeGJaMYnCaGmVGwl4XjqWycyNvD5ysEw1BTnBnjjAbiwgIVZUkxcdqistvh7UzhitaD44e3cV1FP6yOkoXxK0BPD2zled8hKA1KcLjBUZ61JrN8103PDCZS9xIR8YlkJtVJ2iP+7mYwHWHVtWvnMSen8NVar3iGLLpHfUqCzbk6qRZJRBv34/560q3NdWndBvb249M6yfD1d9QJypQ0NzxkEb/fqx/peh9EsislilPQRkIvWPRaozpGvvbX5nm1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqPh08Oisk3mf8bmTDDy5gMxs1iAY/8KvvgWhFxFrRw=;
 b=fJusGRtTbIufAmegcPmDVJESDJoVs7/qdrdN6bOzQDd5NNxQUcMYl1ZsJD3i8ZGJC3xM3UcWZ0KtO+KHUxASFdkNrGNM7likuYHuNDdSmMEF7T+jVZCsJoLj2gKIbilAHYQJIVuhdeMnOotnO1y/3mjwAQI4nA3+UEfMZXLpu08V3fkK7YdFXQLJ2/Rw8mWPeXiBsfDcNm5Cpc0r2Ifi3pjOL3J5P4r7GQJjWpIRJ5wkyne6Fq8L3PMBAlHedACM1DvxEzdapv4tMsvTRkSQpH7jibU3Dyw89St/VMNnHFdMfXp8laTVf7js/17LhX0SQbPywlNSlKae45TK1H5p3Q==
Received: from MN2PR14CA0013.namprd14.prod.outlook.com (2603:10b6:208:23e::18)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 04:10:50 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:23e:cafe::5f) by MN2PR14CA0013.outlook.office365.com
 (2603:10b6:208:23e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 04:10:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 04:10:49 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:10:31 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:10:31 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 20 Jul 2026 21:10:26 -0700
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
Subject: [PATCH v6 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
Date: Tue, 21 Jul 2026 04:08:00 +0000
Message-ID: <20260721040805.1696503-13-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|MN2PR12MB4390:EE_
X-MS-Office365-Filtering-Correlation-Id: d4375b26-b1de-465c-b4e6-08dee6de0c44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|1800799024|36860700016|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: WulHnFTjsoKFJnRgLzZxANrDKO8lIIIYHn/A3619sdQxsrt2kp/RXy6dRQCgnAgRWRL6hx7XVmzfQtl9OfZ6Rmm2WHDLTRhOTMT8q+mixjHiRKbspNgFf1cDun+1hVC1q1fAKTxualYvQ15+2JM/FfjPJV49pMI0DXjs4xVKXXBU+WSz4ErNwp6LAVPsewPlkm/mZRbUxK4kGn7Ss+m8sn9RD5EUwjBJMBUeAM1CwNbLeEFnbNCt/GWhJhsw4gX+CnxhvlNb4F+7IW2442DRqFv9tpkXRuN7s/V4jKi8uGvP+CEtv3qerrkRQ31flfegdD/mYVuX6oZiTg1gQRrTmPKvwNLHNqBJzEcbf1oJ6eS0kih6qaYN0cDTa4co+12+ctGIZ1ggWnuOi+rDhOVojJQsvtVpsWMtZolNgYD+HsztQVoxv1ktunICyje+Ro3PHpuNGRoFUYfXVExbj2eqzsVjC/PMXwu9+Vx8rSkvuWSfsVHITmNEPkmsG5m9kYqP2BDfFqvubxDqGo7MEJ+S09dhihZgiVbSNy0YkHpgQktyZRnqFffKmLCabGaAkX+ciYQQzIvjpdnrnTm5kpBVZH5DGL3hqjbgPUSmKGsl6xb1nnhE28UzNsRri7rA/dxgksaahIDwtFKcIVDKFzJdkyow2gicnAp9IjOnknrLTEbOzpp1jrnlBZWXjDXLksWPyjIPCsaNEqRjpx47HEpr8w==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(1800799024)(36860700016)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UWd9qwz3zy+K3uhnDCeDWnsqx6kjlwaTWKTH8TgDEqyeFwLgjNzj83b8Xx01fctYSjR5pKAzXr9nFwVZxDqge9jdyX0NCmyIufHGDqH60GhGpFrVNSCLDIrrb/8Skg37nAmMdBupUujmXVf03j7QEhHeuEWdf0cHj5NnJRMThfiFYp36pEkN8rAdWrNiJ/uYLDZ9BbRet01JNM2/+GGkwjt5cwzRAuUZlvuUvszG2nr0JoiHmrJlpevh8mKqO1MDls0KinIzgceXVVmwMkRp8ryorxmQTzobDxy4GKVUhA39NBjAl2LdVGrkqITvCCVHk1XIfwSsnHRbHKUOTCVuYtdTh0IVg8r8cPpChU41h7G62fVxADIBGAxe6vk3OCU9ohZPg6wis4/4D/OvuZvfknPr/GvNrrU5MZ05SaWXkJCtsjO+uN743guIjXHbKUHY
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:10:49.4264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4375b26-b1de-465c-b4e6-08dee6de0c44
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_211054_471227_6FAC3129 
X-CRM114-Status: UNSURE (   7.09  )
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
index c267f0906460..36a7cafef3a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -639,6 +639,8 @@ CONFIG_I2C_UNIPHIER_F=y
 CONFIG_I2C_XILINX=m
 CONFIG_I2C_RCAR=y
 CONFIG_I2C_CROS_EC_TUNNEL=y
+CONFIG_I3C=m
+CONFIG_DW_I3C_MASTER=m
 CONFIG_SPI=y
 CONFIG_SPI_APPLE=m
 CONFIG_SPI_ARMADA_3700=y
@@ -768,6 +770,7 @@ CONFIG_SENSORS_SL28CPLD=m
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
