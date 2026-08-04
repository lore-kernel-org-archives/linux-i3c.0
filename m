Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEBDC55172
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 10:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFYuDT8aVv9KxsVr3iaVr99BT+2iEIa+0b5yZdRGeCg=; b=kk6vgxGnUxg+xi
	fcpsG2ImegIS+JEZcYnmcxKwYTg0IRLSO+bJlnqf8n4Fijfcbe7pEdZgmKeiKH2eF7Mrq8wbBQ4zu
	1Zue+u4LP+ykukzOhkLH6BuwZzae9No6VCp5yEFdUR1Uf5OsqKPYD8yeiwXKMYNs/FJn+6Ewugn2o
	vzaip6ZfD9K3hMeOq/KNcfOY0kXDkzF2SZ1ttid4AFFvnAGS6QMA7TkkRGYAFwBiEuGz9UmXz5REX
	Ol7m25GMKjjUJ0oORJBJng9XZe9wJMD52GWVpthFLE8zkp4ftSHz/PwXqSY/Ma8/YrKjj+IJNrKkR
	UWXcIIYkSyKQD7/eOLQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrC9s-00000001WnN-1S68;
	Tue, 04 Aug 2026 10:14:04 +0000
Received: from mail-southcentralusazon11013044.outbound.protection.outlook.com ([40.93.196.44] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrC9q-00000001WmX-0tc4
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 10:14:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqhNoj49/qRwNII30w0oEcGjsDbiLGmWjUsyfCvWjiomh8wahi2zmp9ZPFellV2YEQF+zm3qH2DUf8YI7e0tCLSb/KXfsXeA4lyJlma0tw3rtFK0S7mr+ZlaAx1ad8CLzeNKZ3pbAsszmn4mtL7NJI49uo7TH7uKMkriFUOVijaizai1GzvA+cx7OexG1IM35RdBdc6RJjmhf9ZnlZ7PUT1eMc06wVlwdQzAfRm9Eyoce+/hSL2oYk00k0D522TGfF/pKC4WQmC5vCzIpw6Eiz/P6b0OXte63JOYW00GrUiqKoqcdG5nuemdSfcbN7PCoOapnhHbwhBYKqFzArqX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u03ONxPYKfKnAR15K8uSlEqYVMj6IuyVyPSmp+8yqGw=;
 b=nbEx2wmwERJzI0s11zyCdpyrHBaok4/ytmxpvFemuQdAfzslC73MewjLvD+Ri5XrW7fFCx+VsKL5TC/yy9fwysuTTVJYSli1/2XDAtv2yKs8nxBVqoxbAC5Qa+Tkh72kp3DPM6OoaE1tXD/fEgaL+CAXh2VOpC/VUmmoLtvmmeaXsFBd7BBs1mRMVzNhGrLDPMpy0K8lhheMzTXWPLmC0Ma2wkF6Yg9RSxPfoj1NVCpz+snuBTPwQ5JD387eqkfzvjAn7MjGUda6jU7R6T4rQwIgOIFe1AeeYPECwR7nbh24wnffn3kwRJN162YXhe9JRpLKMY7PelSacJbfwWVhRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u03ONxPYKfKnAR15K8uSlEqYVMj6IuyVyPSmp+8yqGw=;
 b=BPalbaSf4H8tMvK1GM+3QRFwq3BBcTxys0cdi9PMLLtZ6hKm3PZCACTDnFIdbOzHB7G/RZ7/sKpEq++NsMvb6x62zgNhHYQpm5/L7buNB3u1N+S3kHE/8tiL2rS9AH8Fopt7o7FIyra64O9PnwANnP9OjiyJBLwhprbWPGx+aqF3GGGG/Or7As/kLFocHaQwbRcJcP18ZoH93WhP5HqHYS+n6Kzs1x0pmCZBNaz7d3S4IxrVF7icJJ/nP6viK2H79ScyN0ZY9zKmXfM2NTjV1xx5EDuWml7k/aOKILU0mEkU34RIOcyn24V/WxAooRJkT9OdYwMhb2jRZyYq+y9tkg==
Received: from BN0PR04CA0197.namprd04.prod.outlook.com (2603:10b6:408:e9::22)
 by CH3PR12MB8852.namprd12.prod.outlook.com (2603:10b6:610:17d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 10:13:52 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:e9:cafe::3b) by BN0PR04CA0197.outlook.office365.com
 (2603:10b6:408:e9::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Tue, 4
 Aug 2026 10:13:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 10:13:52 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 4 Aug
 2026 03:13:38 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Aug
 2026 03:13:37 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 4 Aug 2026 03:13:35 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>, Akhil R
	<akhilrajeev@nvidia.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Sashiko AI review <sashiko-bot@kernel.org>
Subject: [PATCH 3/5] i3c: master: Do not release the addresses when reattach fails
Date: Tue, 4 Aug 2026 10:12:59 +0000
Message-ID: <20260804101301.2975911-4-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804101301.2975911-1-akhilrajeev@nvidia.com>
References: <20260804101301.2975911-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|CH3PR12MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: d6f44d16-d1b3-4ed5-cc19-08def211159c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|18002099003|22082099003|11063799006|56012099006|13003099007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: hsDDr8wYDn4T8OE4+O/RHd+0E3zL0vULA7d8/xlMEUnnMkjIbN2ST+3evBmAIWfPgi0MZX1d3yjgIrVRboxKAsDeMHBx2nDtRiEAcUCd0pyGAKT7awt9n5SH87PQtL7NuXa+TuKkCLipbyD8mf+Rk5uI3tsGX1ZaibroivX8n2HtOsRXk/EOA4teT6/agPfCjzZgO5badi5Pg8R0LGP2XDv9/VVog+6yCgZTJaEG5I9Pl5oGk004zoCsDl0FQYuvkLDtZeYbulThD/Z2N2RGjB8p9k5bLJYAN+DKl2fV9XjPD4x8gBQwI3tqAat3mXCrF7FObz6srkd1Ge0rSYJg2ihwXuWFpSTf28WgSkwFpf9i2TBpJ7IaVcJgvrpsO6eTbDEXmfe6/zY9JtOo8YBHjSljZ5YRu3CytL+NVmao0Wm7pC/LgURXstWm7MJ0Da6/Sx4g3mu5nVmmLkceeRb9eZDDryKBPdAI7s1c3cNAUmU/vXlhAVZFh01Snhuy1OgVWSfe8rrVpVV0ti2Bk8WZxxM9gbvuqrU+rg64Ctz/x58Hp2opdWY71n+2I2lR8gB3EYFd2uxjtHx8+707poYaRdvQhenU6Q4D2OxhWx2P0g0INt9N/fEaGrSTWxep6mjdrsFoeedStGSmvsxRoA0QrnyMa8Ds+EgZFe6FlB2QYZicqSAITRl2exmDTnR5zNH89B5UAGuEeaP9/H4l/vU5DQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(13003099007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fd9i1qI2SNjgpLzHwSusSVfVfODgl+AaCeQe8tMWR2YcW8eiSXflGbwzAt0FGth/cyrkvjj/8kodSfDdxXnK0oleYx61Q1OrjXvUWfNz40gxjkEI93J2U45Hl6yF/SvjWwDpssaFQkiDIhw9YX4NX3nY0l0gPBX/1WSOW5+7095kWwYI5ZP2DYyX3fzeEe4WwlYj+S7ovz2fCr4IkvwG5kWr84zLtXCgzN/4NIcUYSc85sYvYm9OWTkNL4UilYthw+ixMPCLizfrTyEtulFCzZFhq+LJ9hadOAvtAwOVwEqh5UkunbwUYbqCXj2xnzAnQJbrBFLaeXW9waxWWK08kiZ4EqGfZKNC0sDCm3nizGf+rl+kpoyzGMssVK7BALRXQ/ytBrn2/BaX6nni4NH47A8OJD3pon7bmpLKPkbrqFjEJ6MRDUUTjJMpFjYWv1Ol
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 10:13:52.2293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f44d16-d1b3-4ed5-cc19-08def211159c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8852
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_031402_254023_AF3B61D3 
X-CRM114-Status: GOOD (  12.95  )
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

i3c_master_reattach_i3c_dev_locked() releases the address slots of the
device when the controller callback fails, even though the target keeps
responding to its dynamic address on the bus.

i3c_master_early_i3c_dev_add() cannot take that address back afterwards.
It jumps to err_rstdaa to reset the target, but i3c_master_rstdaa_locked()
only accepts an address that is marked as assigned. It rejects the request
with -EINVAL and sends no CCC, leaving the target responding to an address
that the core considers free and hands out during dynamic address
assignment.

i3c_master_reconcile_dyn_addrs() ignores the return value, so the device
stays attached and in the bus list at the address that SETNEWDA just
assigned to it, while the core is free to give the same address to another
device.

Leave the address slots to the callers. Those that cannot use the device
any longer detach it, which releases the slots in
i3c_master_detach_i3c_dev().

No in-tree controller fails its ->reattach_i3c_dev callback today, so
there is no known trigger for this. It is a robustness fix for the error
path only.

Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260721043058.C02B31F000E9@smtp.kernel.org/
Assisted-by: Cursor:claude-opus-5
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 568788e4cdb5..23557ca2df68 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1944,10 +1944,8 @@ int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
 
 	if (master->ops->reattach_i3c_dev) {
 		ret = master->ops->reattach_i3c_dev(dev, old_dyn_addr);
-		if (ret) {
-			i3c_master_put_i3c_addrs(dev);
+		if (ret)
 			return ret;
-		}
 	}
 
 	return 0;
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
