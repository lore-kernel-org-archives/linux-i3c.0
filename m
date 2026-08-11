Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E448C5CFCF
	for <linux-i3c@archiver.kernel.org>; Tue, 11 Aug 2026 10:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jvI6kftRU0REawRtIMCeTqMU98nZNwC1IzZOoPMUSrw=; b=kn+2VTYkV2AsMQ
	Eo8JVNykFceE3Ib48wcWVJ64cHieBRpZ7X9G37XDAkbXwJlY7l9YKxk+CH+4/PYfPq2hHdMCJzSZg
	nB0Z9NEQ8MrGyNAnb8HXTkklJvFsFtCMw1ycF2mXhFgk4QPPQQSk7faU1RqD47RInONQ7nHiLjJaL
	bMp9LA9UT2pluBOBwtzaYZwdw7hhKrRsZXa+XjPhYz7WC40y2xd+Y/FuTbH7Z10WBrqgdfxVEqysH
	spfsDUn/AAq6VtqxFJc8Pbapytjs9qGz0fIogtgKH6cCZ91NVgJySGbQWBv6wbO/mF3yBuroWc7X0
	YP7jpKbODYjgLOAj+B/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjsr-0000000DrjC-0eTP;
	Tue, 11 Aug 2026 10:39:01 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjso-0000000Drip-2BhN
	for linux-i3c@lists.infradead.org;
	Tue, 11 Aug 2026 10:38:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKlU7oh6v6k7WVcbaQn45aAlTFkibYdKBdo9hUDZbBFU2N2VuoG7cmIBiIUJdIiNaKHin3edLldN76wywSFT36DUWpvMSHsLPouvE7FFhX5GUCsmtUGygRmWsDNmd35zJhQ8sTG2puCzxGLKfamRFpwiQKZQHcBsBkVpw96ZUAJX57KNEd97jy6VOqy03NbLoM3xq7GU3LxZqdxNrHMY4BKzLUdVEeQioB1Aif5h3/ZTnVb8KwdeGr8/MHK4YZoMFnjWGUhJ38o0FeSAZbL9WkSDLhgE9oyRWf4siFsBlypgl8hjRghva3sRdSTQANsW0KATqQorb5RwXHlFNuXMdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9Q1iuXxjIJhwUntgx2OVtYS5bLf16fnKqEpXniz1HQ=;
 b=ZD9Sfph4jz1Oh0HtJbV1WDyKk/Hsb4lrHq3LlzSf+vgSP0+dGFwnEYmby6BMb1UyMA6cDQ+tcCkNxa0DigZcbWldRRRysvb4qEsR/kdIsKjjA3jm4wSLkkBR9FPYqFh+2XxM4rTL1nBGkllvC+v80mUoARk2ykErYGVQgTf16ST+HMludsndzAkWnI55VPnU4nri+MwAil3pr+q4+kwz+RlB7U7/1RJwbB6YiCE2O7cYd7xvb8h+shr1+O5oIcnR4EvjkqWlibws1dPCjZ1DRc7xwpO+7V4vP7BVRtSprJTjAonc5VE59qBgmU5YfGxFJ/t+nGKYfz4SRcnG58MvWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9Q1iuXxjIJhwUntgx2OVtYS5bLf16fnKqEpXniz1HQ=;
 b=A2XV356/RY+WhNrHrTYHCp7I5r5r1llECK0V6DUg186R3OIZoillIN7akk1054b8iCadcRBdkRLWyet+0h1ehfdc2QeUuzsinMYQf2yOgXR8ytPh/l6g7nDwxeUANKmpfOstsBlXYCuNUoSICOmAiDONMvF1VC0T3eWCVGLp/NWiHSycmymv9Y/3Z9cCdCsybtswZMp/aFY+vydJiMMUbsyGchsSi53AK8FTT/XmgEQEeFz01O1RGKKFrF3h2p4oHv5mODebeB4VPqiqjT17iORyT3Z1W18bl4BvWUVxUGplFd47yDFTQvD4ruoBAvLoEC39gskXVcd1nlfM857qQA==
Received: from MN0P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::12)
 by SAWPR12MB999268.namprd12.prod.outlook.com (2603:10b6:806:55d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 10:38:53 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:52e:cafe::6c) by MN0P220CA0022.outlook.office365.com
 (2603:10b6:208:52e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Tue,
 11 Aug 2026 10:38:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 10:38:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Aug
 2026 03:38:35 -0700
Received: from 82875d6-lcedt.nvidia.com (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 11 Aug 2026 03:38:34 -0700
From: Nirmoy Das <nirmoyd@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>
CC: Akhil R <akhilrajeev@nvidia.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Nirmoy Das <nirmoyd@nvidia.com>
Subject: [RFC PATCH 1/2] i3c: master: Emit firmware modalias for SETAASA devices
Date: Tue, 11 Aug 2026 03:38:10 -0700
Message-ID: <20260811103811.3380073-1-nirmoyd@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|SAWPR12MB999268:EE_
X-MS-Office365-Filtering-Correlation-Id: e2660ec3-7fda-4813-071d-08def794bc83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|6133799003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: KyUSXPWT6d1Ud+Zd81oYU2uVCeTLs7mmsQCyD7PB1hkEnSGWZZq4LYHNeos5klrtfX7PExea7v01YoccMYrU5fOUjAbwk3etGdc0SnSEfH04tkkZYS/60mLZ4tOQ1Bd5Y32JRdjI7BA5xTFyeh0gDpANDZd7w+fCG+Patzeqmmfk0eURhhUmJQQfbuDhAEk9aqfLbq8jTCUVHZ6h9MeLLwrliTetsjbY4ABwKK3khPxnT9EoaT/3GOV5W5Qn87HaQkHxBfEQ6/zCGy2EAbTj0S5E1WoYvA5piIIVytqXLBf+ZljaUY0qzVXQPQeRomcRvWbTE0XorL2xbYfUhy0PBqJtqlJ9aZwaaRQD1x1gulFKmzyDTTV4oVV0J+ZeDv10TkCGYQIdQmFl56bm94mGjOSIDkqSUb8WXC404dj5KimAlsfAyOFDcJliYDsL6A/CLlvGxvCqary11XgcuftcOczqGfkX4kLEBiHQh1MxHtBwVFJi2EpjxI7a9glTexAlK+2rJ6g5O81rmrwGTBLdY7aFx2E7t3GcMS6UiIS8Ox5U8PmWcV4Kstqw/aaLGnMkHJR6yfJu7pfU7TPPSubJcij4dv7JQsoINFNIn59t2K+3GknlisUmVd7sLwp7xghmoCj4aGdlfKFQOOF8nm+asIP5GH9P3E2jB/sX5aFbbtsMJOsrgq/NRobO78AH9elviM4EhO3Hep7h9fdTWsNgsQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: v1XRFor+7USYC05XNG1pfPUFf80XEfrVoBr72OxEiLlP4BnfMmshWZiwCuuJ7cqc/3hsZI+KvU4vyJy5KGPRPeDDNQPMD0HzNmUIO3N1RLabuKJO2kjnMeH4JqA81KG3eZpTTgIG3diIKgn4asff6OgfzU+iycOl5/Ix3UKh4smywEGmp0dE0G9rWqLeMEX8hSIyviq1PE1EpDFOnYaumDi4fHS/6HmzOJzKy+aDywT7+uEOZy5iwZ8CiCzCuvFajCBMQLfwvkS8kZvSACU1syHGEjP3jGyPDG+148jjERJ43OwES6oajMI+mxRAijxS1Afyj71IDsCKOWuKkWkQVyGfgcxcMxE6RFeje9Mipgo6Yw+THcEQrCXgwOlJ0vbVqZFWLmmI3pP2aYmV8dXwYxMOGIajEMSl3kmQhNdJAA9l7JW7pEzR4yclU9X9H/YU
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 10:38:52.1331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2660ec3-7fda-4813-071d-08def794bc83
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_033858_594126_7CBAFFBA 
X-CRM114-Status: GOOD (  12.02  )
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

SETAASA devices are allowed to omit their PID and device information
CCCs. The I3C core can match these devices through firmware descriptions,
but the uevent and sysfs modalias paths expose only an identity-based I3C
alias.

For a PID-less SETAASA device, that alias contains no useful identity and
cannot trigger loading of a driver that matches through Device Tree or
ACPI. Such a driver can bind when already loaded, but it is not
automatically loaded for the device.

For PID-less SETAASA devices, emit the Device Tree or ACPI modalias from
both paths when available. Preserve the existing I3C identity alias for
devices that report a PID and as a fallback when no firmware modalias can
be generated.

Fixes: 3456baa2110c ("i3c: master: match I3C device through DT and ACPI")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Nirmoy Das <nirmoyd@nvidia.com>
---
 drivers/i3c/master.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index afcd7a21a3e66e..922da77cbdf324 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -283,9 +283,27 @@ static ssize_t modalias_show(struct device *dev,
 {
 	struct i3c_device *i3c = dev_to_i3cdev(dev);
 	struct i3c_device_info devinfo;
+	u8 static_addr_method = 0;
 	u16 manuf, part, ext;
+	int ret;
+
+	i3c_bus_normaluse_lock(i3c->bus);
+	if (i3c->desc->boardinfo)
+		static_addr_method = i3c->desc->boardinfo->static_addr_method;
+	i3c_bus_normaluse_unlock(i3c->bus);
 
 	i3c_device_get_info(i3c, &devinfo);
+
+	if ((static_addr_method & I3C_ADDR_METHOD_SETAASA) && !devinfo.pid) {
+		ret = of_device_modalias(dev, buf, PAGE_SIZE);
+		if (ret != -ENODEV)
+			return ret;
+
+		ret = acpi_device_modalias(dev, buf, PAGE_SIZE - 1);
+		if (ret != -ENODEV)
+			return ret;
+	}
+
 	manuf = I3C_PID_MANUF_ID(devinfo.pid);
 	part = I3C_PID_PART_ID(devinfo.pid);
 	ext = I3C_PID_EXTRA_INFO(devinfo.pid);
@@ -314,9 +332,27 @@ static int i3c_device_uevent(const struct device *dev, struct kobj_uevent_env *e
 {
 	const struct i3c_device *i3cdev = dev_to_i3cdev(dev);
 	struct i3c_device_info devinfo;
+	u8 static_addr_method = 0;
 	u16 manuf, part, ext;
+	int ret;
+
+	i3c_bus_normaluse_lock(i3cdev->bus);
+	if (i3cdev->desc->boardinfo)
+		static_addr_method = i3cdev->desc->boardinfo->static_addr_method;
+	i3c_bus_normaluse_unlock(i3cdev->bus);
 
 	i3c_device_get_info(i3cdev, &devinfo);
+
+	if ((static_addr_method & I3C_ADDR_METHOD_SETAASA) && !devinfo.pid) {
+		ret = of_device_uevent_modalias(dev, env);
+		if (ret != -ENODEV)
+			return ret;
+
+		ret = acpi_device_uevent_modalias(dev, env);
+		if (ret != -ENODEV)
+			return ret;
+	}
+
 	manuf = I3C_PID_MANUF_ID(devinfo.pid);
 	part = I3C_PID_PART_ID(devinfo.pid);
 	ext = I3C_PID_EXTRA_INFO(devinfo.pid);

base-commit: b6e56fd8c8a8ac7992868a28702192372ab04015
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
