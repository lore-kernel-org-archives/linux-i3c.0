Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ABAC4451C
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Jul 2026 03:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vFdM13zPlaSOMw1I2VFOqWswKPC01/ByOVqHJXqZdDU=; b=07EhqhDpBxGbpu
	YGnARnJOKQ+uHdgKeqGJjTaFpCJ6lK+Nne4r0/BcDli8WZcOAr7O3N3GArw5kyyfg1pSnqvb+7xPn
	9EFHHswo3lhglreZ7Irkb2h752oCtkA8njDkWMlK9Hn7BlvwRIBSPhESfXmSbSIWjuXQbGUbpm+BY
	ajHAgnIP3lnbdIGaWw0JcTyq+pIZ6JQgCXEjUALysHY/jyv3JrTQyHF9qlQ8GZ+yv1TpiE8nXIIwr
	O1/5pcPy/86iOf58xSjSLsV1/7RSb1XrrM+0s5FLH1jM9Be3erFk0fhEeyZ1cz/JG3Q8/mAqiHGO2
	T+ABBTcbhbfs8JOvDpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm1DJ-00000008KCR-2gwA;
	Tue, 21 Jul 2026 03:32:13 +0000
Received: from mail-southcentralusazon11013024.outbound.protection.outlook.com ([40.93.196.24] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm1DG-00000008KBk-2w0p
	for linux-i3c@lists.infradead.org;
	Tue, 21 Jul 2026 03:32:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CN5lYpnjZs1Xcj7kZDaWryzHnl9fQ9U89J6miGCn9fPmALnUoUq6u+dwbo7iuxZ8EaVnkeWuPfhgdor12ajQQDm1PJbcmeNBoEBywO582P+bv5aKw7f+/EpdR39lLuxCHJDNx1vHZfwcLk8ht4RQVCiy/odY1B3gxjYW8wAe3+sNu13E7Xk1kfVyxVo+0C0rj354jOQpq73T9eRSGQ+XnGwY5bUziEYHtsYBp4DqjJavLoOxESUVCUPGmlLRCFcQw7Sx5vODgavHBPNYt0F0DtqbtaUQGXVWnQvRltJb/17IrSFR43Zyp92KyD0j4QCLjv9oIKQsUdBM04KdtNWq4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOz/asXIkA+cpSwE/AyxF7n+7m1ziZl3lUrzDx6uSaw=;
 b=j0bXGsIkhoLZvpojuuRyg3gynsQxnhSCL+nhQg9aYJRX0GOYscJ7gN4yPUQCKG9oDH4w/FWTeVzLZbP9A0hAVhQqbAVp0wHHaXF0QdY+EtW++Aw7IxXeTOh3MFizqcbYYrDfR42LmMXYPJ2d5B4eSfX9FcDOwtk7Zkk8cz2Sxw464i5k43wHLSzkVEfCYeir5xxCfCSTW7dQkQ6CEQKlYvuA+qaEIJQ+7DuDwgo8AN2nqTxNVu7C2/4h+J6GKFWiM1vzTDfhu8VMGvAfG8+coenOoCNcY9AdfDjHC3xSZYmn3aMiMR1U3OhomN9iwPLcb+OIVdFkv9gNTamdKff58g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOz/asXIkA+cpSwE/AyxF7n+7m1ziZl3lUrzDx6uSaw=;
 b=j8kCcavLPAG6mQ3DPLFAWdri6hBG0J3q+kdLJXhxaVE2j+pX4owRHI4rZTC/h7VVQBCqv24hvyl7DKxv8PuGPP4mYmJxcjtx3LX5O8NybpFVNRHYN6bw1xBm0RgKsBDcueqOniWcMExqapjWoj5mmZ+WQI0uZe0nZSJElpzyMfvBScquMW4fuyE8rQ/djMpnl44jWHpQFurJyCU6GnM5NsC7WHbjCoUm1iOK//blMeWXyhil1tPp02BJyYeqpl9LZfqySSRcXKbJh0QrJJo/z5crMhxyk7Phpaeb22qt/QZPk+MptYistRt4bqvBv4EfNo63KTciGZqcUVkBDTYehw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DM6PR03MB5052.namprd03.prod.outlook.com (2603:10b6:5:1f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 03:32:03 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 03:32:02 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i3c: master: dw-i3c-master: fix OD timing for first broadcast
Date: Mon, 20 Jul 2026 20:31:59 -0700
Message-ID: <20260721033159.11789-1-tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
X-ClientProxiedBy: BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::17) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|DM6PR03MB5052:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d94940-66df-4461-49f5-08dee6d8a123
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|921020|18002099003|55112099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: KqNcD8oLOz5J59A/mp13QXrB4QzOa5sO0sgJTEtfxKrCoHjxNL9kVoMBY+dnYzSu5NyzHTAxDOahhlT7xv4znEMyZ4ch/hyJUA/4kwwsA49SovIdJojzfJt5RcjRqXwm0/FQM9ul+HCgPe3MgTCruS8xgdVhKnHrepGIq9X4//qccyWGhJCCWpMiI3rqnBdFjfBza6Jl8SAVGaF9R6oICmoqYgG6J3B08CWrkVzBKeWsQ7zk8T2e60XFqyaLuwtecJQRcoZ/SAe0exnYDaRzp1jzdy53GbkgXumyudNJ3Tso5u4tWKDcvaqvbGJWQsHOMVeeHw9IcsFEnacfY9lEYKX8LIjJBbSNXSXDvVIFPQHe1LamUWCJexQOnVjSZa0empmAc0JRQNMzlk0fR5sOxkpIqAu1jtHgyPTrmCw5Fl2VvZ4K94131T8++47uc59KtzPQN3ko9HuVHAT0/nZKM2GoUdcucvkxkkxQ/P0BaETu7dDR8rsib3kn2/ihPtE4S95OI0tSTVchQMYPlO6OXi6hl7/vuAOMZ2OJiTplP8VEHt73ythxB50JGxX7HS0QJ3zka257LuD2waojtI9ikIuNeGEUokqJ4vVKjwz8+iRXmXOi1b5rXwqiCgpXjY6hXDDSP1E3z83+JA2Zpfcf8gU3M21g5c2eLLvK7DdHAC6tMOJ6C0R3g33Vd4gpWjGCEmJb6FPQz+J+FV/Vgr0nkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(921020)(18002099003)(55112099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZMTIQZ336732oJH2cagJpb4jBAlyjIZL7uacG6iTv8NFSWbBSs9GtSvIMXvw?=
 =?us-ascii?Q?PQULjBkIreBGXyQi68iWtCa8L+r7R+7bWoaGiKm7ETdFez+EyvDQcIv0fPU1?=
 =?us-ascii?Q?CtcLl6dV/O37L9JechPf9SDZ68b6mLMiX4j4VULArs0003lnZq6sg8w2Ypbq?=
 =?us-ascii?Q?mOABNnFgD3Bd+feXoSRO0R21qVUfCdqWoSU4T43yY11Yj2rVtM96bOtfk76H?=
 =?us-ascii?Q?mEVFahjs+ySSmukmG4nXy4nxejXMvC4PWQTucuB1f8Aq/7gJFon1R1ZgwgVM?=
 =?us-ascii?Q?dQ9Lgoa3YbM72XnvWbquepCP+7WAIJBuVITMtijPB1DDrjFRj7EQnKgP5q+e?=
 =?us-ascii?Q?otgcylFvDSOQX9qYw/hNV3kY9VJ+RhEkU0Qvp9qxRUDnFFjXWyoUxTdZUs/R?=
 =?us-ascii?Q?umLPuyfB+lbDOVqvx30YPFyVQaK5tqNEFkX3YvGERXUs5udpA2B+tbDY/ysX?=
 =?us-ascii?Q?jHy3R4FeELkPUej1ZfW6oJArGVMVzO3ncOnjrApEmofDn2I3oi2py2SJi49t?=
 =?us-ascii?Q?N4pb+YG5RpEddoKCknNMKG9gIF9UM6uRFoeGdaeUtbVvBSWOpUwBWWy+bxB3?=
 =?us-ascii?Q?tm7DvY4YZnaIUqNMJ1G3g5FsRTUy6iCGC7y2zN+eb0gsri8Y6FV2Z8OSj/ZI?=
 =?us-ascii?Q?AAF6YYgXqDWpIvU1AgXjBkAvVbZVvf4lfKJUQ5bkOvQZRcLHE+x7HPmlidYt?=
 =?us-ascii?Q?rUecgf4iygh2iicKZYjqc1BVPx+oE5UJsAMFwEvOrjSHV1RET5AO8Ab06fCM?=
 =?us-ascii?Q?49t2mJMDSwibesojroVPeJUhjoJqc/Wfp5Y20irAFPi3OBobu/k35XavG5Tk?=
 =?us-ascii?Q?rlul75E6StXrTZWYpLXPWRpcVVJMnejCr7cj9Glbhh56+qgIW6LaTaq265CA?=
 =?us-ascii?Q?emg4HvCqQ5TBvgplSFtcZfDCcAmaCg+V8JgyP87T0+v1d20WkCiYSgTg45+5?=
 =?us-ascii?Q?XgzS10Wvr+aIJbIEMIIqMDgljYWlfpFwn3is12PBG8ox6sicZSMXQ2jiQi5t?=
 =?us-ascii?Q?j+Uzs9tuXKJLwA5ToU7OH4Kp3rD1FDvkLYa6hBpnLF49c7F1TNZueui3rZe1?=
 =?us-ascii?Q?W/iEd20acSwP61BMPab5hu3GWiN9E60AWdGqj7yfgqvrjT6toJMhP51ipA14?=
 =?us-ascii?Q?7vBCEF/AimGY2jhd319RaLRICm0X5mWZ+bXFMQs+eHdW1OItsH2oVdNxGJFp?=
 =?us-ascii?Q?bOxUE2gdHGQNPzCPGCg9VxgM8uU9sEIwp08dE40FtrL5T4Kw2gk3OLkoVcb+?=
 =?us-ascii?Q?ihaGCxfwxkB0oOdIdw8+oLxgH4Aoi0VolN5J7noLaPxixzZ1KFFhSV99FG8M?=
 =?us-ascii?Q?1BzzZnSoeRjHQlU/wxqoAQvKM8fGnK6vELVfDzFDvb2/gZvcoDbLu3lHGp0H?=
 =?us-ascii?Q?wBbzIfX2//QVDuLnrSp++mVtzAWtr/SVHCklTOxon59yqS5lUJZgvtjrEceS?=
 =?us-ascii?Q?jybo7Ghoq4tBmy8vIey5c+fXBHgCpZFjOf7V3RbJRabtfKfm/V2nNGDdsMtX?=
 =?us-ascii?Q?BV75HL49KuCmVaXpcA5Sr45soQ0XYbYBrDGoMiF1XIjiwatiSEl0Mm7bcZer?=
 =?us-ascii?Q?fQIiAxuuP82h3Lt/ddFCHMKEVulsreBjgvNMrajk+hxQk7YLn+ATAnJj5uUm?=
 =?us-ascii?Q?xk/UYwhYvl3hSuCm92xRtWLByEn70xoRJsrygMOLzXYKTohyq17FYBuZqDRK?=
 =?us-ascii?Q?BQjLOjgj/nUPwb9Z6G+oPWItJqRAd0Iudaxd84KulboKVvbOK3EuqHhvH3UE?=
 =?us-ascii?Q?6ApwfRjLqQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d94940-66df-4461-49f5-08dee6d8a123
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 03:32:02.7687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THSCEeOWr80xC0agZIZ5Y4UFCef3h+wEcsns3IDyk0LP7pc4gNWVj3NRnQqWL8KrfoVGgt5AyUyClbEMgoN5xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_203210_795272_A21627F2 
X-CRM114-Status: GOOD (  17.39  )
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

From: Tze Yee Ng <tze.yee.ng@altera.com>

Implement ->set_speed() so the I3C core can switch open-drain timing for
the first broadcast address per spec: I3C_OPEN_DRAIN_SLOW_SPEED programs
tHIGH_INIT (200 ns) before RSTDAA, and I3C_OPEN_DRAIN_NORMAL_SPEED restores
normal OD timing afterward. Cache the normal OD register value during bus
init and use a separate od_hcnt for the slow path so SDR extended timing
remains derived from the normal PP hcnt.

For AMD_I3C_OD_PP_TIMING, cache AMD_I3C_OD_TIMING as the normal OD
baseline and stop rewriting OD timing in send_ccc_cmd()/runtime resume so
I3C_OPEN_DRAIN_SLOW_SPEED is preserved through RSTDAA.

Use PM_RUNTIME_ACQUIRE_AUTOSUSPEND() in set_speed().

Fixes I2C devices with spike filters not being detected on mixed buses.

Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v2:
- Recalculate od_hcnt with Zephyr-style formula (Sashiko)
- Fix AMD_I3C_OD_PP_TIMING interaction with set_speed() (Sashiko)
- Switch set_speed() to PM_RUNTIME_ACQUIRE_AUTOSUSPEND() (Frank)
---
 drivers/i3c/master/dw-i3c-master.c | 80 +++++++++++++++++++++++-------
 drivers/i3c/master/dw-i3c-master.h |  1 +
 include/linux/i3c/master.h         |  1 +
 3 files changed, 65 insertions(+), 17 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 2f8c0c4683e0..2a383e2163d4 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -554,6 +554,13 @@ static void dw_i3c_master_set_intr_regs(struct dw_i3c_master *master)
 	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
 }
 
+static void amd_configure_od_pp_quirk(struct dw_i3c_master *master)
+{
+	master->i3c_od_timing = AMD_I3C_OD_TIMING;
+	master->i3c_od_timing_normal = AMD_I3C_OD_TIMING;
+	master->i3c_pp_timing = AMD_I3C_PP_TIMING;
+}
+
 static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 {
 	unsigned long core_rate, core_period;
@@ -592,6 +599,18 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 	scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
 	master->i3c_od_timing = scl_timing;
+	master->i3c_od_timing_normal = scl_timing;
+
+	/*
+	 * AMD legacy platforms need fixed OD/PP timings. Cache them as the
+	 * normal OD baseline so set_speed(NORMAL) restores AMD values, and
+	 * set_speed(SLOW) can stretch HCNT while keeping the AMD LCNT.
+	 */
+	if (master->quirks & AMD_I3C_OD_PP_TIMING) {
+		amd_configure_od_pp_quirk(master);
+		writel(master->i3c_pp_timing, master->regs + SCL_I3C_PP_TIMING);
+		writel(master->i3c_od_timing, master->regs + SCL_I3C_OD_TIMING);
+	}
 
 	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR1_SCL_RATE) - hcnt;
 	scl_timing = SCL_EXT_LCNT_1(lcnt);
@@ -786,12 +805,6 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 	return ret;
 }
 
-static void amd_configure_od_pp_quirk(struct dw_i3c_master *master)
-{
-	master->i3c_od_timing = AMD_I3C_OD_TIMING;
-	master->i3c_pp_timing = AMD_I3C_PP_TIMING;
-}
-
 static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 				      struct i3c_ccc_cmd *ccc)
 {
@@ -801,13 +814,6 @@ static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 	if (ccc->id == I3C_CCC_ENTDAA)
 		return -EINVAL;
 
-	/* AMD platform specific OD and PP timings */
-	if (master->quirks & AMD_I3C_OD_PP_TIMING) {
-		amd_configure_od_pp_quirk(master);
-		writel(master->i3c_pp_timing, master->regs + SCL_I3C_PP_TIMING);
-		writel(master->i3c_od_timing, master->regs + SCL_I3C_OD_TIMING);
-	}
-
 	ret = pm_runtime_resume_and_get(master->dev);
 	if (ret < 0) {
 		dev_err(master->dev,
@@ -1484,6 +1490,48 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int dw_i3c_master_set_speed(struct i3c_master_controller *m,
+				   enum i3c_open_drain_speed speed)
+{
+	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	unsigned long core_rate;
+	u32 scl_timing;
+	u8 od_hcnt, lcnt;
+
+	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(master->dev, pm);
+	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
+		return -ENXIO;
+
+	switch (speed) {
+	case I3C_OPEN_DRAIN_SLOW_SPEED:
+		core_rate = clk_get_rate(master->core_clk);
+		if (!core_rate)
+			return -EINVAL;
+
+		lcnt = SCL_I3C_TIMING_LCNT(master->i3c_od_timing_normal);
+		od_hcnt = DIV_ROUND_UP((u64)I3C_BUS_THIGH_INIT_OD_MIN_NS * core_rate,
+				       1000000000ULL) - 1;
+		if (od_hcnt < SCL_I3C_TIMING_CNT_MIN)
+			od_hcnt = SCL_I3C_TIMING_CNT_MIN;
+		scl_timing = SCL_I3C_TIMING_HCNT(od_hcnt) |
+			     SCL_I3C_TIMING_LCNT(lcnt);
+		writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
+		master->i3c_od_timing = scl_timing;
+		break;
+
+	case I3C_OPEN_DRAIN_NORMAL_SPEED:
+		writel(master->i3c_od_timing_normal,
+		       master->regs + SCL_I3C_OD_TIMING);
+		master->i3c_od_timing = master->i3c_od_timing_normal;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int dw_i3c_master_set_dev_nack_retry(struct i3c_master_controller *m,
 					    unsigned int dev_nack_retry_cnt)
 {
@@ -1538,6 +1586,7 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.recycle_ibi_slot = dw_i3c_master_recycle_ibi_slot,
 	.enable_hotjoin = dw_i3c_master_enable_hotjoin,
 	.disable_hotjoin = dw_i3c_master_disable_hotjoin,
+	.set_speed = dw_i3c_master_set_speed,
 	.set_dev_nack_retry = dw_i3c_master_set_dev_nack_retry,
 };
 
@@ -1728,10 +1777,7 @@ static void dw_i3c_master_restore_addrs(struct dw_i3c_master *master)
 
 static void dw_i3c_master_restore_timing_regs(struct dw_i3c_master *master)
 {
-	/* AMD platform specific OD and PP timings */
-	if (master->quirks & AMD_I3C_OD_PP_TIMING)
-		amd_configure_od_pp_quirk(master);
-
+	/* Preserve cached OD timing; it may be the SLOW setting from set_speed(). */
 	writel(master->i3c_pp_timing, master->regs + SCL_I3C_PP_TIMING);
 	writel(master->bus_free_timing, master->regs + BUS_FREE_TIMING);
 	writel(master->i3c_od_timing, master->regs + SCL_I3C_OD_TIMING);
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index 28e9348f2153..17ad817d1f8e 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -46,6 +46,7 @@ struct dw_i3c_master {
 	u32 dev_addr;
 	u32 i3c_pp_timing;
 	u32 i3c_od_timing;
+	u32 i3c_od_timing_normal;
 	u32 ext_lcnt_timing;
 	u32 bus_free_timing;
 	u32 i2c_fm_timing;
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 4d2a68793324..eca79ea1598a 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -259,6 +259,7 @@ struct i3c_device {
 #define I3C_BUS_THIGH_MIXED_MAX_NS	41
 #define I3C_BUS_TIDLE_MIN_NS		200000
 #define I3C_BUS_TLOW_OD_MIN_NS		200
+#define I3C_BUS_THIGH_INIT_OD_MIN_NS	200
 
 /**
  * enum i3c_bus_mode - I3C bus mode
-- 
2.43.7


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
