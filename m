Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E6DC54F4C
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 07:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gkwHuGU8wxRAFbZmm/Fq9pWsbV/m7gFPomoHuCjq3Rg=; b=JETodqhPY+Ds1+
	minVD6o41tdv8LUr7FmxKpdUrOEq70krByDbUbLcoTSOKFRmLJIcprWeBr7YJYV+k1rYGYPdQMS8g
	DO7dn8akYT68btYU/eR4AfeBrvqPuoCvkFKFaofKQsrtmwyOJsQfQXltLnU6Y7H10n7FrNedt3slb
	eSOvbsHnA62PuSSxGidfECVtBEyqzyB8PAb2XUnYkAJwABSX3STkiqV2tispROQmtsh8UA78nk3i2
	KOiY48YHcsbC9+pfynCGtuzF4y83sA8ke4QArqpXP5PdsxunvRbY9luw8Fta7Iuzse9TL5wqd+JHz
	FcVbh7MuUSOApcAz1GVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobpf-00000004bI4-1jiX;
	Tue, 28 Jul 2026 07:02:31 +0000
Received: from mail-westus3azon11012030.outbound.protection.outlook.com ([40.107.209.30] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobpc-00000004bH1-27sO
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 07:02:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgE4bQZw3G25ywOSAf1PI+E3MGLrTMPt+fSbYkAp/aCZhSC/8dnSOagfy0mNinKoa9V7zs9kKx7aQsEzulqApgoo2atkZSHpMEe3C1y821FmhK2WO986tKi/WiuK9duaP8AZJOesy+KOqK3xEWHLFQCFIcCQNsNjvXeWmiLr0iqBz1rHfdc48Oi8wRT33clumYEm+2jo2H2+tH40m28Nc5FIHoLoysQ/ky7AuEbD25Gf1AGDuiF1cvNEDhFbqQHR/U00OeJI0SBwZ5EeHfUDcjdDWT5CupUO+wjA1iTFUMMPYHzQt1yC6Qobubnw/T8tTKenkOnE5HvKV2JoTm2rIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEg6MVvO4jysNgNetE6x6/4t26NeMMhOuUHGcvaiQ1s=;
 b=fHzDCiV1wQEOqJCkc/1e7R/bLBF4gzBEtgI3Sj8t5yjdLlLMiuzrXWmHawpGJf6gOya+V0H1Yqf1plpi+YwbSFhxcSAQ55sTFnGni1ZuNR504qVsXdlPzE+6oS9gWTWff0pX+f5+3V2VaQ9/2RB9Z+qOCIGBOQqoPnFKfcxJKAU9vug4lSnHDRxUklr5UqPPj5ewJR27mi8J/Douzt1ZtFr36OWaA1jxWUMQUqV5iuagP680Xs6snU+rM+z969PDnZN/E+ZUvETRgHlR8yjkt2nFsC0Uk73t9ZwZyzUtMPKB+xs6MsxHbrGSOBYuAof/IwMf23isJjbHISX4dQopNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEg6MVvO4jysNgNetE6x6/4t26NeMMhOuUHGcvaiQ1s=;
 b=Y4g6pwwr+/iETTA0on4qm1OKejhDlEhEcvDA6/QbQFd/lEu6PEtryL6kQuMcslfy486nXq/MTk8DXrnvIStBZAM8COz1njLridnENFpBNlfb66W08FtsfFtvDxAwRPNXpXgaM23XZx6AhWET1IaR6Nu3pNMT6U02WV0CRLuMhChguun4njSq6HuV1OEBxOMWHjzndC/TbJrmLQWQAb193WnIB9EEp0SCJXaDRPdGnQs1GFZiQEOEG+TD4O9W21Dp8nl4jwM9uvvDC8iA/Ha8H6IPUYY/zonGxMOd8SgAXi60AlB2UFixz82yNR/8/Z3oq93QGo9z1W7KQv3v3B4AOw==
Received: from MN2PR01CA0041.prod.exchangelabs.com (2603:10b6:208:23f::10) by
 SJ0PR12MB7006.namprd12.prod.outlook.com (2603:10b6:a03:486::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 07:02:13 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:208:23f:cafe::23) by MN2PR01CA0041.outlook.office365.com
 (2603:10b6:208:23f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 07:02:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 07:02:11 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 28 Jul
 2026 00:01:56 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:01:55 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 28 Jul 2026 00:01:50 -0700
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
Subject: [PATCH v7 06/12] i3c: master: match I3C device through DT and ACPI
Date: Tue, 28 Jul 2026 06:59:48 +0000
Message-ID: <20260728065955.809445-7-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728065955.809445-1-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|SJ0PR12MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: ca1c1329-cf9b-457c-a88e-08deec7625d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|1800799024|36860700016|376014|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: EvP0BhQOnCbmsQlTWVOIdGzVBTfGqDwF/DZpvk5ShV0IhEvAzrlF58iJF8Uh8q8yWb0F2RlCB96dENnh7wEQwgmEu/VAlqyvg4qZ0RLX1IKruRqX1+Pq44ETZDqawtmnSBzz0m9yRJiTseZ/6ULyDhA9CJX4nSYTjv/XdrAzELd4iAI8ael5vrpy1pd4JFb6hA7OhuJ3Lqkp3Gt2FMkObBiYG8l6nap+lZ0npPmGIn2GurpRMi9VSPcPlin7F9BFQKcq8qXWbZJAW93J1cQoJI6WNCiXN/5HblOtkR0/W6XbzhPFfoF+PG14fZ/Dqvuxdeui6LdJqWitZr2KE6FB7bFaaR5FFsmDBeGS/HldPzElaNEwE57Tesa61fSR00/a42bBlMwpwddXww0U21ZdONdCD6sfCbqBW7nuWGb39WcFSJuBDRt+Ri6psYEEUHsiAoqDR0ng5a6CRGkkN2rbk7M2feRqEi6jpSfse2zT9d36oAkkA7KDFSnmcjtqS1h6gO9PXFHKN+LGk3CVBLKRZ+zs5ICY6+2Fg0mPhEI1YTnsWTlwu5ITLQNfyLL39TetRREtvlcwVye8v20EYTAmPAVGL6j3Ad2q2LGVboQqDaI6+3URBTUcmjF2gDX4qG6lSzQ/+F4Gsz7ZvfL/Y8sG4c+j4S/T3HSgD4gmY3sFCvNLTAWaw1uP6XlWFLrKqsAWIUKA+v5lqkL0zgEFkKh0zg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(36860700016)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EXAcV9eb+RVxpJ7S6SwbhWoKeUbf9FmoL0k2AVOYEj4Gtg2rfUuOS53yPT4WubODEf9cRzGjhBIaUpxb3OKhd+q5u7ozfmCNu3200k8GlCGwQHKHxR5SxDfdPBU9bMHuDcw7gSnHRqiiWPOu96sdZzWdbnbOZlvDlYnEY64ccudn26xZ4EaflxS9kX6mDp0y01SaY6Jn3Bb5OuhegjtYaTPEjDohRJcIpy8SNhpLRQpsXKzHJZI1WU1k8dWmcAz7dJFwv+Gj7malXoPdoydZTqsQnOkIbq5HMPQQpVuxPMOXM4yj20/oTMR+sU/EiiU3IcsoVbIxxBnywXJZ10wlF55+jcanFW5wWo1/BH9qmre9uGIFvUcITT7oLBxiA22CpaHe6R18rfMXh2WmaWZ9DYLQWgQVKAzpZlUX3gksnlAYySS5641cJDAscVyXw8ZH
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:02:11.6242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1c1329-cf9b-457c-a88e-08deec7625d2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_000228_562877_47B767CF 
X-CRM114-Status: GOOD (  13.36  )
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

SETAASA-based devices cannot always be identified by PID or DCR; the
standard I3C id_table matching may not be applicable. Allow such devices to
match through Device Tree or ACPI.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 488177d95e48..f94e2410d37b 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -19,6 +19,7 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/slab.h>
@@ -345,15 +346,32 @@ static int i3c_device_match(struct device *dev, const struct device_driver *drv)
 {
 	struct i3c_device *i3cdev;
 	const struct i3c_driver *i3cdrv;
+	u8 static_addr_method = 0;
 
 	if (dev->type != &i3c_device_type)
 		return 0;
 
 	i3cdev = dev_to_i3cdev(dev);
 	i3cdrv = drv_to_i3cdrv(drv);
-	if (i3c_device_match_id(i3cdev, i3cdrv->id_table))
+
+	if (i3cdev->desc && i3cdev->desc->boardinfo)
+		static_addr_method = i3cdev->desc->boardinfo->static_addr_method;
+
+	/*
+	 * SETAASA-based devices need not always have a matching ID since
+	 * it is not mandatory for such devices to implement deviceinfo
+	 * CCC commands. Allow them to register through DT or ACPI.
+	 */
+	if (i3cdrv->id_table && i3c_device_match_id(i3cdev, i3cdrv->id_table))
 		return 1;
 
+	if (static_addr_method & I3C_ADDR_METHOD_SETAASA) {
+		if (of_driver_match_device(dev, drv))
+			return 1;
+		if (acpi_driver_match_device(dev, drv))
+			return 1;
+	}
+
 	return 0;
 }
 
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
