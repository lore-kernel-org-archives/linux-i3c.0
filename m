Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B367CDB47C
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jun 2026 10:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qXT6dDf2CnP9OicZqwKI1yJSajNPipSIEfQfE0vEB7Y=; b=rpHwcLIf1VZa41
	d9p0NpvIOmSyhwCMQfAO73H+mb5U1DfL2WmZcsi0p7sTqoESUJTQDRzseVbPeD10IHrVBF3tyk4xr
	5Y8vulg3DKW3NQxQw4giaSYlvdKL2zKlk3urFuO7Al7U+e5fkQhx1xjhfvclRt11dls45SIbA0XMQ
	XOe33Im3XArqhRtBysjItwU20MXAvgjmjUYnaIhkmIgkL0Agu8AXWCPjObVEBc8VVHBKXzLLz2b+E
	O4o+rYQZfY9LKT9rOOTGWf7ke3FBayay4uYYppn8VNGyipD23DF0pFpxCQMr0QtFz+43LWSrcyZCB
	5QBJPCjrjRbURZG/Kkaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKku-00000007b69-1G39;
	Wed, 24 Jun 2026 10:22:53 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKkr-00000007b57-18XB
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jun 2026 10:22:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSLSY23usZRAS97pZ68vonZbTWj1FMYQr8Pfvofl/8xu7CA6WroV2eQHdYXINda0ga9L/tXU4LHQZOp8Hg2ljLbP6ZwnhaeET2kJRICSsk36Yo5jfYob0uRqizAhwh6YxJWg/piM4ZcdfLFRq56+GHJA7550QtvYxRcNWUhO9nSZrTMJQZNBUUMQhOSFAWUNFg0WP/84Ia0RCHOBIL77VuhdEg8DQ+OI5zVcU6zze0FP0Lzgl46EYeKwcBF8QxtYxUCUmH85c5gFsYGR5SNVQJ8c24h9+mbO1N2HccTjXLoPdEv4D1yzsNOrZuFKkT5uRL4KI+Cx10cCxWXwuDBUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9o3LHgMobZ5vATvWePlAuCkfutTJt8MSpWFRnC3+oG8=;
 b=P1t6jCux0Gf5DtG4HeFRyqRjuLHC4mBCBC0IOcIQze4Ccn1195G9uHMErDCUueqfcP6xAAfKcxS0uH2XAy/Hsszpm/Oj6ZiNDkpPz6zLOvjY0xjEZEfC98j3k1y2zfVXub5pq7LUnf6u7MA0dHHvQw9Wmg+AdXCJCE1cflPh1tVfNBSXymxIwTgWm/33nPQcYhzGHLk79s3HNiJx3nqrkF8WRoUoOPsurLXJ3mpk4QAORfRLZWIa4rHcE1+ymWOk+1tPFQzOB9C9v+6iMFMjnBOsnOxx9qk4RR7Z2uLMb5g9VF3r5uLr2d/wyjl7kLGUXo9j4Mfnc3z/Trtz0WXf+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9o3LHgMobZ5vATvWePlAuCkfutTJt8MSpWFRnC3+oG8=;
 b=UHW/b8MLLIVpZUmu55RgKv6jYypQG6G1qN8O35pZpF+sjuAVu4tWsXYxEUHrghmh3+yB3wRjsBNKYQx4P7rPs2qMAV27i8tW0CelxtORzRhw5HOtsK7tS7QSOcUZRqXtgKt3N3NVl2j5puaX4TNMXVs0TGDHglhVsuIsq0PR5BtDtiBrOwMQhrfmPt8dN2oqPVyGawQteS4ROhJ9O0EB7wej98DzYukGU8Wrq+2Y8d89ALBUt4pHRtByZhkQawld9NsVlOgbgTecq8Om02y72PVlqVFXkAz0yoI05mYaFImjpB0qq+waavzeuRvfqU4Q+vm3D0rJ7MmV5Ovaaq33wg==
Received: from PH8PR22CA0009.namprd22.prod.outlook.com (2603:10b6:510:2d1::25)
 by CY8PR12MB7516.namprd12.prod.outlook.com (2603:10b6:930:94::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Wed, 24 Jun
 2026 10:22:41 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::50) by PH8PR22CA0009.outlook.office365.com
 (2603:10b6:510:2d1::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 10:22:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 10:22:38 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:22:19 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:22:17 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 24 Jun 2026 03:22:12 -0700
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
Subject: [PATCH v5 00/12] Support ACPI and SETAASA device discovery
Date: Wed, 24 Jun 2026 10:20:54 +0000
Message-ID: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|CY8PR12MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c391520-7ea0-4553-185b-08ded1da8465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|23010399003|18002099003|11063799006|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 5BMw7ziXKFf3KR6uxT4wG6AG1Y17vsAOGtLfp9lLGKLhsATuoAVSC2jEr3/TjRvPw9UwlW9AAxMtupW3jqQ+36RhodJqPjBAOk/kCyH8i+Ox9NIx9b9DX6AGwkGgsGj3BW9cX5nBs052yhRf/yAhluBQILtiDHISNsT7XD+V4bMEzD3ljE8vjfrmuIYr37gI3Q7iXJlEZ6ZU9cy/6eZ0w3QLfYvfTMZlOrp6cFo0U4UlbW7DHW7EaH8WBF2XApRlrIPVF5KcBMKYDUch9FsMkN9fHFtbOOmUDdGLH1ycCpasmz0o2hNnD/XvjQ7/UZSfVP7Kbos3zj93TQP9geVZ69H5iGRjpDGsvryoJyxF8wlTWfNrb53vO+B/em/tm/NrvzmepbohQrLSAWrr4X4LlDLXnJE2IM5zoLcighii/pzKQmkgee/QIfF+aIIrJ+rYBB4YMYzFLtSVMaxWUBj8WCAZKY+1N2EU6gKtBz8A9MfzqMl8voy9PnGR9OGb2ETau0NPiQ23zD3iVaeHtRiy7g1IcVPndgPOf0CVtLEaHYjCrPbtqKUnYnjX3YrmEZ+b2tMWGg2z6REZUWJnuZVLMFWvw90cy+743Rd+rWg4EgBAkvFikTV2Eg13749tvsAjscZoLldkOpfe6+JoidGhKpGrCeR6SD4G0FJNyquS9C4xHhH5I4m/ju8pHFNlf3Y4eZ5uCvOWQGowAkxmh7P7bw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(23010399003)(18002099003)(11063799006)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MFZ3EC7BVMuo4QyJkCKCxcRuqhlPzD0Uk6X7RiwohakWdhkJn1XAGlRkbg5BavbkmRKL457hc1T5HU49gsni7nNGp0jKsqQVTCTudVEpuS8U5/yjvTpGVy10iIAztdTPFlGGORfz2DNNPxZ1qhX4g67pxBK4UK8Gy1CijxscWfWlI6C3zJ1AbjO6fQ742Gk00j2r2AG3kiXrlRIaUORRUdNRZcCngeBr3fEFJQOcPxCkn27bc1aE6QU7scKu+NqUWXsPp0aSQ6Ach6v3HicLytFmo1ASwCsCueeAaDQ5FRB+KJB36V+LH87nMCWlti4MF6CDK3OO5oPFhLfnU4hjc0w6xRqCUWlFMbE+9Hd+qcvT613tzvy3/hlLQG/X60GrAGlU+yz1URvCUoPD/XHcQAzAxdelJo8AxBQUvrWs+u4d9RpolmY+7byDPjwu9KsO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:22:38.6108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c391520-7ea0-4553-185b-08ded1da8465
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7516
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_032249_322144_F16AAA34 
X-CRM114-Status: GOOD (  15.18  )
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

This patch series adds SETAASA device discovery to the I3C subsystem,
enabling support for SPD5118 temperature sensors found on DDR5 memory
modules. The changes also add ACPI support for all existing DAA
methods like SETDASA, SETNEWDA as well as I2C devices on I3C bus.

SPD5118 and similar devices on DDR5 memory modules differ from typical
I3C devices in their initialization. They use SETAASA broadcast CCC
instead of ENTDAA for address assignment, and per JEDEC specification,
are not required to have a Provisioned ID or implement standard device
information CCC commands (GETPID, GETDCR, GETBCR).

The series enables describing all I3C and I2C devices on both Device
Tree and the ACPI table, using unified device property APIs throughout
the I3C core and the Synopsys DesignWare I3C master driver.

Please note that the series modifies drivers across multiple subsystems,
like Device Tree bindings, ACPI, I3C and HWMON.

v4->v5:
  * Free ACPI I2C boardinfo when an ACPI child without an I2C resource is
    ignored.
  * Issue RSTDAA if SETAASA device attach fails after the static address is
    used as the dynamic address.
  * Emit OF and ACPI modaliases for firmware-matched I3C devices.
  * Make the DesignWare core clock optional and use "clock-frequency" as
    the fallback when core_clk is absent.
  * Keep DesignWare pclk, reset, and match-data handling on their existing
    optional paths.

v3->v4:
  * Clarify mipi-i3c-static-method bit semantics and assigned-address
  * Add I3C_ADDR_METHOD_VENDOR
  * Fix fwnode reference handling while converting child property parsing
    to use unified firmware-node APIs.
  * Align ACPI child enumeration with the I2C core for multiple
    I2cSerialBus resources, ignore ACPI child entries without an I2C
    resource, and populate I2C modalias information from ACPI.
  * Update SETAASA handling to use the static address as the dynamic
    address, skip device-info retrieval for SETAASA devices, and tolerate
    M2 for SETHID/SETAASA similarly to ENTDAA.
  * Reorder DesignWare I3C clock/reset to include optional clock in the
    ACPI skip clock/reset quirk.
  * Add prints for missing ACPI clock-frequency and SPD5118 I3C
    device type read failures.
  * Fix grammar in comments and commit messages.

v2->v3:
  * Fix maximum value and indent bit list for mipi-i3c-static-method.
  * Move I3C_ADDR_METHOD_* macros to dt-bindings header.
  * Drop ACPICA commit IDs, keep only the Link: tags.
  * Revert the change which proceeds to register other devices if SETAASA
    is not supported so that it aligns with the rest of the driver and to
    avoid the issues pointed by Sashiko.
  * Rework multiple commit messages.

v1->v2:
  * Added patch to remove 16-bit addressing support for SPD5118
  * Guard ACPI calls with #ifdef CONFIG_ACPI
  * Remove CONFIG_OF guard for of_alias_get_highest_id()
  * Mask mipi-i3c-static-method in the driver to select only valid values.
  * Proceed to register other devices if SETAASA is not supported.
  * Update commit message and links in the description of multiple commits.

Akhil R (12):
  dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
  i3c: master: Use unified device property interface
  i3c: master: Support ACPI enumeration of child devices
  i3c: master: Add support for devices using SETAASA
  i3c: master: Add support for devices without PID
  i3c: master: match I3C device through DT and ACPI
  i3c: dw-i3c-master: Add SETAASA as supported CCC
  i3c: dw-i3c-master: Add ACPI core clock frequency quirk
  i3c: dw-i3c-master: Add ACPI ID for Tegra410
  hwmon: spd5118: Remove 16-bit addressing
  hwmon: spd5118: Add I3C support
  arm64: defconfig: Enable I3C and SPD5118 hwmon

 .../devicetree/bindings/i3c/i3c.yaml          |  36 +-
 arch/arm64/configs/defconfig                  |   3 +
 drivers/hwmon/Kconfig                         |   9 +-
 drivers/hwmon/spd5118.c                       | 119 +++---
 drivers/i3c/master.c                          | 382 +++++++++++++++---
 drivers/i3c/master/dw-i3c-master.c            |  36 +-
 include/dt-bindings/i3c/i3c.h                 |   4 +
 include/linux/i3c/ccc.h                       |   1 +
 include/linux/i3c/master.h                    |  20 +-
 9 files changed, 476 insertions(+), 134 deletions(-)

-- 
2.43.0

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
