Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F716CD8CB2
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Jun 2026 08:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mB0yxHF9sJHYOuMZJxr8GOLi9v/F5R6mnFZqNMwn2a8=; b=ILVYWBPoZ9rZLG
	6BjBt8jG+a1DUw0cedEhzfGdKHUZ5X1Xy33RrQbojMDcdF8cHzMpbr5ZvX0kuWsDOQnUJQ6fTM9d8
	o9KifBhaWcd1NHecWe43ExMYO88To1+UVoC3c/ghOzm0bjtbd84y/gY4lzPJw3dPgyiyMR0P+P0Vo
	QSU7G+ru0qVXcn3ZpCe6eqNOUxv6s+dzFgAkhjlwyFIkrKSUHGrMv80LC3EYhc1NhrHPl8wl4iAbD
	a8k80fU9b23K0V6l2kaPiC3NoQe0NhEtlCR1vLE9xL3SJEVmV/nzWcFC+on0scwJfiQ4wvwSqRumZ
	3LmbuKmbqaSbljv9sxlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXE57-000000072Qd-0c0j;
	Wed, 10 Jun 2026 08:14:37 +0000
Received: from mail-southcentralusazon11013043.outbound.protection.outlook.com ([40.93.196.43] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXE54-000000072OI-0aQF
	for linux-i3c@lists.infradead.org;
	Wed, 10 Jun 2026 08:14:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6b3FCneoungOa2WqInPLu1kTO8ZHW9Do+njv7qZmyfLN6vRomYa5V4/z2pTSVyrnp8875b0cJQaGLIxoEJ9YxO2KkeBG2LC+auVqrHCK/TM1R2aYIvkY6x4zkkgUG0iLc7GjZd0jnQjbi4OOReh+b7B28nJ8+QIT3LG+WfMqu1/dmYDtAkPOjGCLZ15PNC0TI0bPiLOfzzE551MQvjrppmkEOqhhR9jtX84ZwaAwvuVEjDVs5b4vNRKKLjsCPAHSMyABd6s4XjAX9/fkevldyDtPMClSxJTUpNHMR8FuZ2c2PDv8i4D5TnvBrCixzpHZwfek7wMIgCRTwzyCh00UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PaaoODFlqHVl9iYFSHXI+CBKT8P5uJf8EJEemem/R8w=;
 b=Wqrz40n1++Jsn0yNAUUKyBJ4p1xFlpmVDcC9TCLxdLKpsQ49xdQ5lFXNuznw9NBE0jg8PxU3+s29ipKl0DXaT+6V/DhBx2wrNHEm7oEjXe4aBCj8UJtEiBaTlXUJr4/V418ekyqpzcGwOXVZObHNSMtdXTZgknbStNYW6ZxbpgtxhN30z8xgy5vyxIEXmcUGwm00fZHuLsI+JZSSIMuit3MFLoL+jDdVkRnhKqWu5a+ga7zhqxNdlf9GXZE+aiiIeI9PiGKrP+zvfdF0zTKV8J/IDIiwbSKAXOTyY45L5QGV1htZVXcPUfAKJ17OYsVKsLiUKXlQr8PeoBkyoU+sWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaaoODFlqHVl9iYFSHXI+CBKT8P5uJf8EJEemem/R8w=;
 b=HKteyfAZ3rmnydpB2Y5ytTGRMDdjNBlgSTXbxWYTzgEj75tfQpGFtdjwPrhP0z4V7HuEFG6v3rFc/PR69hv7IqJKcgmHPU5ZmjtFKFtfURV9C1LjEhXUvBBUucnGBEMIWFZZ5Nfxw9Ywtby4ynDsdSQB/JejoEG18ZSdi0yWQCQJd8/tBQIfKD+s6Cm+MfecJP/aPB1pQ3hESGiphvwmROOQODGTMkbBUmB93eA0t6kQVc3yKSvharJdOHdLOPlcSnu2LBhNIkv5mZxM+LhKQaQydy96QWxK7UDmdhukmWSLt8ru7/3SGT1NkemJzwiBdDTHS/fSGPv07fpV8Z5txQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5951.namprd03.prod.outlook.com (2603:10b6:a03:2de::13)
 by DS7PR03MB5528.namprd03.prod.outlook.com (2603:10b6:5:2c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Wed, 10 Jun 2026
 08:14:29 +0000
Received: from SJ0PR03MB5951.namprd03.prod.outlook.com
 ([fe80::f285:8376:68af:6acf]) by SJ0PR03MB5951.namprd03.prod.outlook.com
 ([fe80::f285:8376:68af:6acf%5]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 08:14:28 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: master: dw-i3c-master: fix OD timing for first broadcast
Date: Wed, 10 Jun 2026 01:14:26 -0700
Message-ID: <ebddb8b62eae92de0a7eeda93cb18213c677ae96.1781077653.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
X-ClientProxiedBy: SJ0PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:a03:333::23) To SJ0PR03MB5951.namprd03.prod.outlook.com
 (2603:10b6:a03:2de::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5951:EE_|DS7PR03MB5528:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ce8261-2a01-4e10-9acd-08dec6c84ab7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|921020|55112099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ILYAXJfSBqw03tOut+s9bl+223N2M71FrUqT2EzeIqInglaU9MMJfHm79qaNwY6E2x8Tr8XeDgxV/7oZ3aaGipG7QJpaTXnopBi+ny8RfZbmpczP5i3XEZGszOv9kWi/c2mKaWl1tSjzbTQ5d4e/2tuXTZevn/mBvoZzpVkiuk4sfcd2s2Dg9wtvUZ3o7QGL6Uy/gCCA32Fby65e1sZ9km1f1jhh58vfNm4PRH841iCEG1K18p1+fOhVQw1JUFabw88Fm/naD4Ue+8zalFGlQHeXuo/26zngRjQKsvFn4u2rpSoQVBNTE3v1yUtGYKywMwOS3f56mjxWAUKP4BgWaw/c1xSfwN/n4aQo5kUwLVjawoxUMxAb8GK2eSaByf4vnUgNeFvHlGiQsT4KTsRoQhxbt1/Z2bpMCkhtfbHN1kRGwfbiDrM/vpsNhZSAJFTTMkgaoYbJfeW0OEKVrLvI1kW2tr10+ye++djpzFm7s3SpyU4xBOfliEiJ/zxU2hbgj9n7R/tOL2baEHYK0GHEIJJGTE+W/yZmCBIYlc/CbbavHFZQB/XkmsGot3hQ1SC8J/0isZgiKxvjjMOPkrL58qBpSFLH7YxqqkJE4HEtYB9s1pb35wYEtuX27natyltdHYKEzHzFVoSsmlijzCK47/WrWRdOXGQZLl0Tu8EEgd6dA1llyJCipMAMQeUU4G9XObFl3JhE/dFujN52AcfaA9KDQAJmibgfR8JnzTcOR34yGPujbNSiMBOiOc1L0iAa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5951.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(921020)(55112099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lv2o90RKwQd+aarC695lWKJfhjAUVsMl7neOwDCdPFixmws0QjDDTqMMljOy?=
 =?us-ascii?Q?q1HgmzkBAmqBrwu3z7yNXeX7fPjOsG05EJ7ZkYp5Fa99Uzz8t23SdQqRxAwU?=
 =?us-ascii?Q?dBaZJtEq4TRYt64jGk35jhcEdjyrLtbmghk8uQZfsdivxqcgYgaWtqyfPaEa?=
 =?us-ascii?Q?SnS7f6I3Jl3cDkTYrAihlxl52x9uPBHxmWaTC5lvzwQGgg2Ggpjc2r3Kq4hc?=
 =?us-ascii?Q?l9a+FbP75ydty119sf6MpjS9GFeJTObQwZKQLGg61kjOwX1/MS/7KLSVKUio?=
 =?us-ascii?Q?DGITc4XPsOoHE1hJTCOE7WrvOqS85x76cZRqf2Iw33n2FpwdDgfIhLVg8KsU?=
 =?us-ascii?Q?hyNCEoFeNJzXh2nqdu/nllc7DLYihPdga1Iouz/s15yr6nP0oCFpd0Vpt4+4?=
 =?us-ascii?Q?QqbktcQUlLjfHszEfoIasdVSjm00zHkSfkt6jdwE1rqxkk+ti7hXGtQFT0EI?=
 =?us-ascii?Q?u9dlZYqAbKqoK2DFCtmXR4mgIKQlt+RRAK80oAquNONqHFAi02QqYRlcWBGW?=
 =?us-ascii?Q?BAFup0x/oQ5ytMOc/stawPvQBg0jhEowyFffrIDqAnMcc1qGuZBN3zbmvWDG?=
 =?us-ascii?Q?yKFsXx94+AbwzrFCpNJcLRLbsrkAnnHJGad2FRS7W1dR9jGjSaBa78O3NGTY?=
 =?us-ascii?Q?VWKhWQ52MAWBuoXpMnNTNsDL0KJ5rc8UrobjrGofPrTRrTH9ukyDVa4qOXEp?=
 =?us-ascii?Q?93TUBasRDEXIbCxNG4LMQOebmgZ56EMdSMvi0/5P2fUCF7S4KX2Yn5G2w07r?=
 =?us-ascii?Q?0JF9JmmQtT3QMH6joUtY3H5EyQS84PI6N3vycXdk1kHuvUZqbneilJefup7L?=
 =?us-ascii?Q?TDgDt5SMA8Y66c5iRt//wTJEuQc3CDf7K0vhnf0aI5KixwDEb3/0BMbg9O+t?=
 =?us-ascii?Q?JHadPSVSnV7uDzUYBoOI5mOMFm2Ipoi8rEwC707ZUL+vQt+WD49pF42avQTb?=
 =?us-ascii?Q?EYKoElYNO2M+WPgPdRLuiHrZ5yVx30nP8rj4xhhknFEkRJcjDqGKQGd/sUWK?=
 =?us-ascii?Q?ykYc5cBfxdHRhGqsDh2MG9Wc4QM0sNmNFuKFbox0DqqlxZIzhWaBeTv3HDSi?=
 =?us-ascii?Q?GUOivv764zbJmN0J8bj9xcgDO2od5W4+J2H3Hm+/wbCXnvBb1Cpj3KJyH6fF?=
 =?us-ascii?Q?8uGFaa0UJG3pAt8c+veOnio3cQdzvPMvENpSoxJROd2ZYNfEouBYURKPeP91?=
 =?us-ascii?Q?GR2wCgJ83rfN/KQKtsOwX4b9lcckUTDwi94Mz6NKZuNk/VLaoLHUsEmC4pdC?=
 =?us-ascii?Q?HvLsUAYWasQRx4ffKBxitdVuAuP4CS9jLjW4C15Eojn0leR9dtlxrdOrrYZ7?=
 =?us-ascii?Q?E5S7YaHex2POQbYYItNRmhjozdTlMSfRN7s2Hzwu7Lli5ZCps7CIjnEMyukW?=
 =?us-ascii?Q?tLW8iEz7TzGHtNvg0HQ0n4hHWRR6QO6N3p5hikJxWsWgn+0tmtb1zuQ30WdE?=
 =?us-ascii?Q?aSEhVmGFxXJjZhRHT/fOyrCpsPMzKV+7HJ1YhVnohvB7VnpjQ4Mgx6LSVXq3?=
 =?us-ascii?Q?xeR1w8Pd9oO1Xl00PBkpNAu1RFD3By1qqeOIDQwi4RizmJnRN3JFOcFy5/bZ?=
 =?us-ascii?Q?zQNKExv8sHqUc78o+k0wFJ5q8qD379bB1Q4Djtk6IvwdTz2iPQfL6wLTYWgw?=
 =?us-ascii?Q?dWglI2vOheJOc3d0FmjBDS0bAm9lNBhubgt9I1rPcVynpLZQJjijbMW7xeao?=
 =?us-ascii?Q?h2DMh/78Blk2U2GVMeeDle2KOiNO3y8CTzhvac1x7QHTtJ2gRoN4XevIOATR?=
 =?us-ascii?Q?8GIFNiaqxA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ce8261-2a01-4e10-9acd-08dec6c84ab7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5951.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 08:14:28.8257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hweiYRrRGvtFxwAYPOdrQTAV+jqOVQiYLdLctfXPvtIrNJKO8tMAscPnP/F7aZOPoYYo7m/7AcJgWu1TCTlUhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5528
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_011434_195341_5C9CFE22 
X-CRM114-Status: GOOD (  13.65  )
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

Fixes I2C devices with spike filters not being detected on mixed buses.

Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 53 ++++++++++++++++++++++++++++++
 drivers/i3c/master/dw-i3c-master.h |  1 +
 include/linux/i3c/master.h         |  1 +
 3 files changed, 55 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 655693a2187e..dbb801910b3d 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -592,6 +592,7 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 	scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
 	master->i3c_od_timing = scl_timing;
+	master->i3c_od_timing_normal = scl_timing;
 
 	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR1_SCL_RATE) - hcnt;
 	scl_timing = SCL_EXT_LCNT_1(lcnt);
@@ -1480,6 +1481,57 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int dw_i3c_master_set_speed(struct i3c_master_controller *m,
+				   enum i3c_open_drain_speed speed)
+{
+	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	unsigned long core_rate, core_period;
+	u32 scl_timing;
+	u8 od_hcnt, lcnt;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(master->dev);
+	if (ret < 0) {
+		dev_err(master->dev,
+			"<%s> cannot resume i3c bus master, err: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	switch (speed) {
+	case I3C_OPEN_DRAIN_SLOW_SPEED:
+		core_rate = clk_get_rate(master->core_clk);
+		if (!core_rate) {
+			ret = -EINVAL;
+			break;
+		}
+
+		core_period = DIV_ROUND_UP(1000000000, core_rate);
+		lcnt = SCL_I3C_TIMING_LCNT(master->i3c_od_timing_normal);
+		od_hcnt = max_t(u8, SCL_I3C_TIMING_CNT_MIN,
+				DIV_ROUND_UP(I3C_BUS_THIGH_INIT_OD_MIN_NS,
+					     core_period) - 1);
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
+		ret = -EINVAL;
+		break;
+	}
+	pm_runtime_put_autosuspend(master->dev);
+
+	return ret;
+}
+
 static int dw_i3c_master_set_dev_nack_retry(struct i3c_master_controller *m,
 					    unsigned long dev_nack_retry_cnt)
 {
@@ -1534,6 +1586,7 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.recycle_ibi_slot = dw_i3c_master_recycle_ibi_slot,
 	.enable_hotjoin = dw_i3c_master_enable_hotjoin,
 	.disable_hotjoin = dw_i3c_master_disable_hotjoin,
+	.set_speed = dw_i3c_master_set_speed,
 	.set_dev_nack_retry = dw_i3c_master_set_dev_nack_retry,
 };
 
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index c5cb695c16ab..c814087a6f1f 100644
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
index 592b646f6134..c7d7448c4cd7 100644
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
