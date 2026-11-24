Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB167606A322
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Nov 2026 06:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3vbXX+sN;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=R3LonFfL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZHA+gEQmqeDirOeT/zMEcT+Qyb1S1mWQXzdYf5DpS6Y=; b=3vbXX+sN23mU00BGACL7FiqRFJ
	uV1cYHXofsfXsPysi4L9VshAN0ofvaoJcTc0n0Qa4AOZSgs3KRZ4f4Tlhywj8Er5E4FY6niijNxA9
	pAF2tH+cwLDOP7Ztg+RMiSlaNnYH5hbflMt0xMr/cKtyQIYuJVJopnBEUyOEmswdOJ6h8/Bs7Isk7
	FHx3qO1ZVOOe3E1jAgJ5Qd3dhZE0W5REjrFw6m3tCuqZTqUWwZtd9SKIlldh96dHGJegMCA6PN50S
	E04+lb99G9ZaH2LThMXezfQt1OcrQXUWBNLkiyAOMy46x+BGcCdFGqJAK/3vcIUvbgPNXOjVjn5or
	FXz2JDNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVjiJ-00000005dX9-0HqR;
	Tue, 24 Nov 2026 06:09:12 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVjiG-00000005dVe-1u3i
	for linux-i3c@lists.infradead.org;
	Tue, 24 Nov 2026 06:09:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQoMiijj8szQ5QRPmdcy8pmh8zZiPaC0RNE4gNG/QjsNGj08l2mTbR0x+Y444MscJBZdXiwxEszjcNHeABsWtEzwRDk/jN8CUZpIecxNUkP/9IZKwbqm2XV6LMSWxk7KaOgiFDTA37/OLfv+MmY9sIOPGogxMUeRqQBS4h9JxEtnrm9dD+43b0RTjzgJvqVbfyAgqj99p3uymSWuy8p2UagPP7Nvncu1xY8iQOtaG24XR0JfZ424dNHIQp5+vMVqwnB6x8Kc9C2CCQzHdeMQE1w+K11yyoRQikqMl7yXTVte/kYOTUbl69sAizcCcYu6wInMuT92dGmAFXd4nixX+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPv2u2kiXvTfNtFCxjRMPkV0w7LcCSbWrLhSDzgkpaA=;
 b=GOZijLy5t35gVHH9oyKuVUBFxOoNefZDCQmT7rqUvFSVsdJc7u/TFaLBoiGpLPXb9LQyNJtBfw0tQryB7TZk7MjCqeOaF4Xmq9OTjTR8ySxFgoD2aAmeQ4OlEVP+vnO45uOCaZehPF8OmNssfsGEl6cvaojYLd0ZrHZkBjJhKr1p+XAMktFgfElxxE1xKnf0t1pgC40tIcr4QeB24nNGF4owWMpHN9BTYEJIWPM0IklYOO7SnLiXkkAOQrcUo8egIPzfhnwG8ZJJLxs1HPxg2mxDcyPpjjfGi6qEgofdlWqiDTg8XPfccmLvHsJdrZbFMKZcgDfEznKa0qsHyYjWHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPv2u2kiXvTfNtFCxjRMPkV0w7LcCSbWrLhSDzgkpaA=;
 b=R3LonFfLy2TenZtCNq5kD+VP5/yy/y3br5cooUy7ehumGBcvVfGzYTKtXMj4S24p1F8fT8mNL+Dg6/ZrtTu3QS4wJq3QDKsivitlQlrrQhE5ohZQRgQA4cAn5wPGPQk1K/jNgCDAlgpmbWNnlzZyTD40kk7WYAJrDyLGznYhA/4=
Received: from SJ0PR03CA0022.namprd03.prod.outlook.com (2603:10b6:a03:33a::27)
 by SN7PR12MB6838.namprd12.prod.outlook.com (2603:10b6:806:266::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 06:08:57 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:33a:cafe::13) by SJ0PR03CA0022.outlook.office365.com
 (2603:10b6:a03:33a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 24 Nov 2026 06:08:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 06:08:56 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 00:08:44 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 00:07:10 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 00:07:08 -0600
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>
CC: Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston
	<matt@codeconstruct.com.au>, <linux-i3c@lists.infradead.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<meaganlloyd@linux.microsoft.com>, <git@amd.com>, Shubham Patil
	<shubhamsanjay.patil@amd.com>
Subject: [PATCH v3 1/3] i3c: Add helpers to get the maximum transfer size for a device
Date: Tue, 24 Nov 2026 11:36:49 +0530
Message-ID: <20261124060651.1987454-2-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124060651.1987454-1-shubhamsanjay.patil@amd.com>
References: <20261124060651.1987454-1-shubhamsanjay.patil@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|SN7PR12MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ebf8036-7c84-48b0-dab9-08df49f16c50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|22082099003|18002099003|56012099006|11063799006|261102123227099003|261102130727099003|261026121527099003|261021121427099003|261021123027099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: gI/fr0f6KYQ0KVKyMzaxUBtCcoEfOKtHZLudnQPeZYPvVxC1Kuv876nLdSVaXpdQU8DQ90DRt36mAsl2IX4WOvy13ieHeYLHS5L8RTJmEdOT7rh8E+j1dzTxBC5xYnHnoVGluF30R3YV+KvvDEC3sPxDTjk3rq5PdCZFr7q4oNC3aArskNXhcyH2V+G1TtJnlIWFpy0Z6NHPNd2T/4g3+5MVzCsA+rDZ5uGktyu+gLXg1ap3qUvASlEpgANevGFwHFCYjCmiccAy0XC9UvOyaqQ/te7ZQu0esXLAGxeGhRySWmaQaurJN0Ib2CkwXNTyx4TU/7se+8E8V+2yfpnCDyy7ZWND2U6+wNzIsOZwGFgF/2991Efj+hR/7adi8XX5Zq/Um5VNCPdDSVOD1xQrrpzs7G1wlJHYwlrP7rH+xECNjaINeOs5AZk2ppJmNbaSQwsCl0qfk6f7bbuFkOPaV+o4uQq5PfNZGV0++w16cVA1y3vgUivwFqMvolqRPeojHLanVIkTuSd4DYnW7bHKKpgbGhX3CtcOTqDqyK29k96M8kC42Mxw5oEtBVAAI/0RKEpTCWEGYRIGqn6ohh4iX37OlciaAPc+hdONrabvJcf8dYyHAwreFxVLiIUJ/YeWTZeqWAY2g57QdHFe4IWax8Q4RIMIFNu31bwbVvAEis+wHALCdZozepZbmpxXXPXNFVCrlAGKWRnwWYFX0wtosg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(261102123227099003)(261102130727099003)(261026121527099003)(261021121427099003)(261021123027099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MuU+NPs7sbYLT/VZpHPah83vt9GHfgpaWh/I7WMJ3uFEKOogwBRq6B0hMzAyYaU3HwscGjvdNKXYL9Il6WC6KIfOmFkbRppNLs08Cf5M8nSwPdaT0DHES64GFgw2cGLDe4wrlzIL/MxogOgV/dW5+tAphHc48bUjiDRU/fXHiGBE1Fqf8DL2Xl44LJszJtgVmgmO1cvp7z+aEn/neRXI4EtrHo4Vf1vbIpmgp03xkm7lFu1IM6Ahoj66iQQz2WuThb2JSJbAOheu5Vwbr4IsNxJ4IExItSEUrkf2mCYgvbqqGIYcki63Dnc3r7V517rOFge0W3sYngwmd7mqtax+u3LllhWpHYYMkTGgyeGfZ0lIBbVPXYQve6xc6L1HCMR2TVPltIkgZG8VG98WDu88tHGmL5QBCfboQFs4G0P6zqDNEM5ZRsPx3upYW6DLy185
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:08:56.2365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ebf8036-7c84-48b0-dab9-08df49f16c50
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6838
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_220908_613229_ECD40691 
X-CRM114-Status: GOOD (  20.34  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A target's MRL and MWL do not account for controller transfer limits.
Add max_tx_bytes and max_rx_bytes to let controllers report these limits,
and helpers returning the smaller nonzero target and controller limit.

The limits apply to a single message; batched transfers may still exceed
controller capacity. Return 0 when neither side reports a limit, leaving
callers to apply their defaults.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
Changes in v3:
- Rename tx_fifo_bytes/rx_fifo_bytes to max_tx_bytes/max_rx_bytes.
- Shorten the commit message; no functional changes.
 
drivers/i3c/device.c       | 49 ++++++++++++++++++++++++++++++++++++++
 include/linux/i3c/device.h |  3 +++
 include/linux/i3c/master.h | 13 +++++++---
 3 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index 4df4682af150..93adf4c74004 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -9,6 +9,7 @@
 #include <linux/bug.h>
 #include <linux/completion.h>
 #include <linux/device.h>
+#include <linux/minmax.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
 
@@ -106,6 +107,54 @@ void i3c_device_get_info(const struct i3c_device *dev,
 }
 EXPORT_SYMBOL_GPL(i3c_device_get_info);
 
+/**
+ * i3c_device_get_max_read_xfer_bytes() - get the maximum readable message size
+ *
+ * @dev: device the transfers would be directed to
+ *
+ * Return: the smaller of @dev's MRL and the controller's receive limit for a
+ * single message, or 0 if neither reports a limit.
+ */
+u16 i3c_device_get_max_read_xfer_bytes(const struct i3c_device *dev)
+{
+	u16 mrl = 0, max_rx_bytes = 0;
+
+	i3c_bus_normaluse_lock(dev->bus);
+	if (dev->desc) {
+		mrl = dev->desc->info.max_read_len;
+		max_rx_bytes = i3c_dev_get_master(dev->desc)->max_rx_bytes;
+	}
+	i3c_bus_normaluse_unlock(dev->bus);
+
+	/* 0 means "no limit reported" on either side. */
+	return min_not_zero(mrl, max_rx_bytes);
+}
+EXPORT_SYMBOL_GPL(i3c_device_get_max_read_xfer_bytes);
+
+/**
+ * i3c_device_get_max_write_xfer_bytes() - get the maximum writable message size
+ *
+ * @dev: device the transfers would be directed to
+ *
+ * Return: the smaller of @dev's MWL and the controller's transmit limit for a
+ * single message, or 0 if neither reports a limit.
+ */
+u16 i3c_device_get_max_write_xfer_bytes(const struct i3c_device *dev)
+{
+	u16 mwl = 0, max_tx_bytes = 0;
+
+	i3c_bus_normaluse_lock(dev->bus);
+	if (dev->desc) {
+		mwl = dev->desc->info.max_write_len;
+		max_tx_bytes = i3c_dev_get_master(dev->desc)->max_tx_bytes;
+	}
+	i3c_bus_normaluse_unlock(dev->bus);
+
+	/* 0 means "no limit reported" on either side. */
+	return min_not_zero(mwl, max_tx_bytes);
+}
+EXPORT_SYMBOL_GPL(i3c_device_get_max_write_xfer_bytes);
+
 /**
  * i3c_device_disable_ibi() - Disable IBIs coming from a specific device
  * @dev: device on which IBIs should be disabled
diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index e30ea2cb13cb..cb3374e4f9fa 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -331,6 +331,9 @@ int i3c_device_do_setdasa(struct i3c_device *dev);
 
 void i3c_device_get_info(const struct i3c_device *dev, struct i3c_device_info *info);
 
+u16 i3c_device_get_max_read_xfer_bytes(const struct i3c_device *dev);
+u16 i3c_device_get_max_write_xfer_bytes(const struct i3c_device *dev);
+
 struct i3c_ibi_payload {
 	unsigned int len;
 	const void *data;
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index d58070a72a49..08a26aa9c164 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -551,11 +551,16 @@ struct i3c_master_controller_ops {
  *            context (notably the resume path), and is skipped if the
  *            controller is shutting down
  * @dev_nack_retry_count: retry count when slave device nack
+ * @max_tx_bytes: maximum number of bytes this controller can transmit in a
+ *		   single message, or 0 if it has no such limit
+ * @max_rx_bytes: maximum number of bytes this controller can receive in a
+ *		   single message, or 0 if it has no such limit
  *
  * A &struct i3c_master_controller has to be registered to the I3C subsystem
- * through i3c_master_register(). None of &struct i3c_master_controller fields
- * should be set manually, just pass appropriate values to
- * i3c_master_register().
+ * through i3c_master_register(). Except for @max_tx_bytes and
+ * @max_rx_bytes, which a controller driver may set before registering, none
+ * of &struct i3c_master_controller fields should be set manually, just pass
+ * appropriate values to i3c_master_register().
  */
 struct i3c_master_controller {
 	struct device dev;
@@ -580,6 +585,8 @@ struct i3c_master_controller {
 	struct work_struct hj_work;
 	struct work_struct reg_work;
 	unsigned int dev_nack_retry_count;
+	u16 max_tx_bytes;
+	u16 max_rx_bytes;
 };
 
 /**
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
