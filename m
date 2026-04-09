Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E22DEA3C23
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Apr 2026 11:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o7M+u4qaVDCdDWlNydD6/q9qWbYlfBjXamgVF7JjdbY=; b=pHe4RFEkDoGJwt
	G3zilgGwYEymQQR0G/V0L0QdMCrDdwnnJ0C+dbNmEpX4eOsG6FlkuNdaRT99xVLCMDk6balhDCx27
	A7BgSPfHm6qKHWuuRkcAsPuJLDHcJk69K16g4WGJjOsRDx6QcVrJUzZH5/YsvCrirdDTgJCvBeR4S
	o/pTa2C21guAF7KXXBa2rKdWASCEbM3T+3HoOIDfgspRJQYPJ0O1PrU+OFoRgAtx6ySYI/wsw2s6t
	ZbbBCVRWZ6oEVxiUNLEmN8M8QyeRPuXr9G7HhXvblQIkIZ+2mxH29TirOlHJFN+Z4X8GKpKO9oUiS
	qCMpHldDlMiFRu6Xs9DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAn9C-0000000ADig-07Je;
	Thu, 09 Apr 2026 11:02:06 +0000
Received: from mail-eastusazon11011005.outbound.protection.outlook.com ([52.101.52.5] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAn8S-0000000ADSM-3efe
	for linux-i3c@lists.infradead.org;
	Thu, 09 Apr 2026 11:01:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lI6CrAR+8nwVKhWjJKswUT6nw3f1frU+lilBnlMa9DoyAtUkGkac5ZCV73yXpAaGX58ytJrFlhLQueNJkDsLhPJLWQrbiWF0ml9qlcMPRjOXwUvIWAvqqG6+pLzpvjnievmprtbRtOxLseLe2JEEegatxrmojSBuBU4ZTN6lmvbOmfrxnSPutIIKlqvaLMb+qpHeT50+fMwzQ3XJKI2KhXN7tdGvLeyfdLadk4vwlrO8ocCsAW+5sGNEE3lGLKSrVQ9zDldbDx2bGU8tpuVkSxfrHiA4ELj6YIlruwgXWPLHB4Ty4dk3xnS9ieG25KjZXGAVUqMTx212IM03ynPjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuWTPDhKYHIg4NfGpvEGXzM7ZSpoohxJ+5vTCC5irws=;
 b=JjK3KSY4QYyVzEuBi9ZXJAWvi1bA6dXWXkEH5KOcb1cmb3UAL/quDfyMGqo2gOBI93aoTngjXtKD6YopKPYoFtu5w8rDiSvq0r7IvonmtRlbYlyJg6OAAEESFT7TYp2BxYNUFDBIS8ng/NdFHOy2L0JRfTpiAp3fmclFU5PmmRqhJ+bse7NObiDPdyj7XapXaNjKUyrLZaP+S/SMC/ClsjHyvi5OlvletNzHIlGbLTMNk8KdvG6HAL7ZBE40L+EAF/E3aM/8Q7CLCtdp9jLVFtMzDd1AJUDuLSJJqnSi0B0JQcbB+4mKljUPJTIjM7ydq3TT/RasuVNQyTSHHyjwyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuWTPDhKYHIg4NfGpvEGXzM7ZSpoohxJ+5vTCC5irws=;
 b=oc7lJ9GEX3ql3rU5rjP2tumRD0DWhpqxnqxak0v4/5UaeoCh0yZmdiURFoNQWt60HPabc7wycD/7UoaglPjuxhvHJZ/fWQ8MTJn+EK7Gl4N6ytkoXU5UDz9fOFRjanK533sXE47oJ5zDA8lPtBaFCS6ic4PK+M2HJLGzyT50kjB07OHlCosb5C2pa8mDKWcUdWD7p6g6zAzs75aAZAL4sv3NH2rExzUUH8LNx+lufpZH3PPq+cuEhOYebiqut9YTPu8Bjkefp5oz9eB7aIB6JIClpS8Yh+jSN0DF6d3Md5Ny3qPkywzubYTmNFVb27stpP4VWvkLpSRzIhmyXFvRFg==
Received: from CH5PR05CA0017.namprd05.prod.outlook.com (2603:10b6:610:1f0::7)
 by CH3PR12MB8711.namprd12.prod.outlook.com (2603:10b6:610:176::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 11:01:09 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::e) by CH5PR05CA0017.outlook.office365.com
 (2603:10b6:610:1f0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 11:01:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 11:01:08 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 04:00:43 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 04:00:42 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 04:00:37 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v2 11/13] hwmon: spd5118: Remove 16-bit addressing
Date: Thu, 9 Apr 2026 16:27:41 +0530
Message-ID: <20260409105747.48158-12-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260409105747.48158-1-akhilrajeev@nvidia.com>
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|CH3PR12MB8711:EE_
X-MS-Office365-Filtering-Correlation-Id: c334abc5-dbdb-4c66-745c-08de96274e03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|7416014|1800799024|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: BKclWvFuUOJ3QICdjpQJ/YdIe4JZb0ChZNp/JEFoBeiP9385+Zdl9ZH2rVhGOcKTNEfxF59AsK0dpAWfn2FgzN/bRAd1Fb1QEvqC1Jmm4T9ds5TIirA4DMboCY0grXrJJpol373JMwv8YUx8J5Z3TVJeoIxxaEt0hyxjpJl75Kkp+ooe3VHd2em/o0MAdR93krNjjO1PM06fqyd6+jybBtGcB+s/GawWcZzRX3QN11rpBLzeTUyWk0b+d8L0++EWUa6lPWGG77oJ2Vqs/D95kqurIhYUrVkyMl569Pm7Q7w0aqlVquUSL4dewAgDjRgQB+L0HINCi7fRaA5326Ls3mDLoVm6hO6oRA/VhqMxsVJAjo8SnZUdMq3sWIsWC6riUH9n0mDv3PFdqzeCe8qDAQ+LBF0UXftzCyeiEspLzYDzOSEnItbd2IXj3jnstEWpTv7Ooutv6qpeOMfRLQR14zWiq/+sGZo9z7DqyG22DP5q5RGaXEIGeTAAH5i7f6Qww0a4c2ZiOC1RxiVldXYrZwqXMAlUfuDobMlyRc6iafCZVd/W8miLzcrBhDgnabPtsBn6UruijqFS+WVbtccgpLbnrqYdxVvc/sRF/GQo/Rhu8fRmRQI0sudMcX2zCpSwMFDAg4miBcB4yyRlaQwWkocUjt319Oi8a584xaqGRSO8AHPBBl5EdxpvDfGCv1lMBwDqzbfmuqOw+Il14TES4G5mM+Qb2WvUD7OLRODAvle60Qv6WMZRDyZhyOGAU3X2STfmIHGIZkJNfDwe97/IooFxpQCAZFHOtnjSSkyH51Y7mm3LpmhpWZayIxkvXQI2
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(7416014)(1800799024)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PwzOF3HxX+g89+0evZSDg0qSTu1YVz6DzGCpfFl1j2ik6zPHIsVQqSCyG4m8sOFMkFieCXebvJvXgC2QB64IK68YBMf3fhOxQQRJXZlijb+XGrJFTNkTBJbeLAuvbObcEcQsxCBreRTPiVgh/lXR8ZfCtnd7SsgnOS6usAsKPHcoSgjSiO5II/v+/RFfxm77YSNwkKS5TcQIrNA/OcpBjd3yAm6qRxUY4QFNS1wJW+ksBh3UHhAVZoZH5/PYrXM2Y92BApXcTADa6rdlkcL4jatn9fvK8PVPxlE7wEjMv/Y/Ui5iPUp+GFuCdmgKDLPzm+UlvBuM5uiL8LD5xgs9vWAk+auvJWOSslCup6+83j7WVPFXxrNJzjAj+pMjscLdeBtMgx9DcWrMuIuKjRMeTnP8fzCiK84mPFVkycSP4iyD8z6aeozWWvYhp87UWKyn
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:01:08.8338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c334abc5-dbdb-4c66-745c-08de96274e03
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8711
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_040126_445632_68390668 
X-CRM114-Status: GOOD (  24.07  )
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

The intent of introducing 16-bit addressing was to support I3C, but it
turns out to be that I3C do not require to read the Legacy Mode register
nor any specific encoding for page translation. The testing of 16-bit
code was limited and there are no known users for this feature. Remove
the sections which are there to support 16-bit addressing and prepare the
driver to support I3C appropriately.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Suggested-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/spd5118.c | 79 +++--------------------------------------
 1 file changed, 5 insertions(+), 74 deletions(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 5da44571b6a0..8fdde35e68cd 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -66,9 +66,6 @@ static const unsigned short normal_i2c[] = {
 #define SPD5118_EEPROM_BASE		0x80
 #define SPD5118_EEPROM_SIZE		(SPD5118_PAGE_SIZE * SPD5118_NUM_PAGES)
 
-#define PAGE_ADDR0(page)		(((page) & BIT(0)) << 6)
-#define PAGE_ADDR1_4(page)		(((page) & GENMASK(4, 1)) >> 1)
-
 /* Temperature unit in millicelsius */
 #define SPD5118_TEMP_UNIT		(MILLIDEGREE_PER_DEGREE / 4)
 /* Representable temperature range in millicelsius */
@@ -78,7 +75,6 @@ static const unsigned short normal_i2c[] = {
 struct spd5118_data {
 	struct regmap *regmap;
 	struct mutex nvmem_lock;
-	bool is_16bit;
 };
 
 /* hwmon */
@@ -348,12 +344,7 @@ static ssize_t spd5118_nvmem_read_page(struct spd5118_data *data, char *buf,
 	if (offset + count > SPD5118_PAGE_SIZE)
 		count = SPD5118_PAGE_SIZE - offset;
 
-	if (data->is_16bit) {
-		addr = SPD5118_EEPROM_BASE | PAGE_ADDR0(page) |
-		  (PAGE_ADDR1_4(page) << 8);
-	} else {
-		addr = page * 0x100 + SPD5118_EEPROM_BASE;
-	}
+	addr = page * 0x100 + SPD5118_EEPROM_BASE;
 	err = regmap_bulk_read(regmap, addr + offset, buf, count);
 	if (err)
 		return err;
@@ -473,15 +464,6 @@ static const struct regmap_config spd5118_regmap8_config = {
 	.num_ranges = ARRAY_SIZE(spd5118_i2c_regmap_range_cfg),
 };
 
-static const struct regmap_config spd5118_regmap16_config = {
-	.reg_bits = 16,
-	.val_bits = 8,
-	.max_register = 0x7ff,
-	.writeable_reg = spd5118_writeable_reg,
-	.volatile_reg = spd5118_volatile_reg,
-	.cache_type = REGCACHE_MAPLE,
-};
-
 static int spd5118_suspend(struct device *dev)
 {
 	struct spd5118_data *data = dev_get_drvdata(dev);
@@ -519,8 +501,7 @@ static int spd5118_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(spd5118_pm_ops, spd5118_suspend, spd5118_resume);
 
-static int spd5118_common_probe(struct device *dev, struct regmap *regmap,
-				bool is_16bit)
+static int spd5118_common_probe(struct device *dev, struct regmap *regmap)
 {
 	unsigned int capability, revision, vendor, bank;
 	struct spd5118_data *data;
@@ -537,8 +518,6 @@ static int spd5118_common_probe(struct device *dev, struct regmap *regmap,
 	if (!(capability & SPD5118_CAP_TS_SUPPORT))
 		return -ENODEV;
 
-	data->is_16bit = is_16bit;
-
 	err = regmap_read(regmap, SPD5118_REG_REVISION, &revision);
 	if (err)
 		return err;
@@ -680,69 +659,21 @@ static int spd5118_i2c_init(struct i2c_client *client)
 	return 0;
 }
 
-/*
- * 16-bit addressing note:
- *
- * If I2C_FUNC_I2C is not supported by an I2C adapter driver, regmap uses
- * SMBus operations as alternative. To simulate a read operation with a 16-bit
- * address, it writes the address using i2c_smbus_write_byte_data(), followed
- * by one or more calls to i2c_smbus_read_byte() to read the data.
- * Per spd5118 standard, a read operation after writing the address must start
- * with <Sr> (Repeat Start). However, a SMBus read byte operation starts with
- * <S> (Start). This resets the register address in the spd5118 chip. As result,
- * i2c_smbus_read_byte() always returns data from register address 0x00.
- *
- * A working alternative to access chips with 16-bit register addresses in the
- * absence of I2C_FUNC_I2C support is not known.
- *
- * For this reason, 16-bit addressing can only be supported with I2C if the
- * adapter supports I2C_FUNC_I2C.
- *
- * For I2C, the addressing mode selected by the BIOS must not be changed.
- * Experiments show that at least some PC BIOS versions will not change the
- * addressing mode on a soft reboot and end up in setup, claiming that some
- * configuration change happened. This will happen again after a power cycle,
- * which does reset the addressing mode. To prevent this from happening,
- * detect if 16-bit addressing is enabled and always use the currently
- * configured addressing mode.
- */
-
 static int spd5118_i2c_probe(struct i2c_client *client)
 {
-	const struct regmap_config *config;
 	struct device *dev = &client->dev;
 	struct regmap *regmap;
-	int err, mode;
-	bool is_16bit;
+	int err;
 
 	err = spd5118_i2c_init(client);
 	if (err)
 		return err;
 
-	mode = i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
-	if (mode < 0)
-		return mode;
-
-	is_16bit = mode & SPD5118_LEGACY_MODE_ADDR;
-	if (is_16bit) {
-		/*
-		 * See 16-bit addressing note above explaining why it is
-		 * necessary to check for I2C_FUNC_I2C support here.
-		 */
-		if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
-			dev_err(dev, "Adapter does not support 16-bit register addresses\n");
-			return -ENODEV;
-		}
-		config = &spd5118_regmap16_config;
-	} else {
-		config = &spd5118_regmap8_config;
-	}
-
-	regmap = devm_regmap_init_i2c(client, config);
+	regmap = devm_regmap_init_i2c(client, &spd5118_regmap8_config);
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
 
-	return spd5118_common_probe(dev, regmap, is_16bit);
+	return spd5118_common_probe(dev, regmap);
 }
 
 static const struct i2c_device_id spd5118_i2c_id[] = {
-- 
2.50.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
