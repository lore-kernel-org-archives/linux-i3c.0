Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA116C77B75
	for <linux-i3c@archiver.kernel.org>; Wed, 17 May 2023 03:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8qxQxhOiqvkGo5QgahYyI0etn6RX3mEjtjhFuD9MWNw=; b=0QA/cVF9XmFv8G
	tzjIdL2ShzQciajDZBfWWwHIVXEuE1AI6NQ2Z9j6vfEHXhGB/7yCWCr/iZaK29ccjQQXcqIO4D4p/
	qyblOsmkw4DCi21ZVFdxS/wt2Zqafq64au5vFWyGsggmS/ayMKQHfcRly2wP34b9TPdz1fDb9pswt
	G8HI1n2cf5GVaHfFs+w0Mfrx0Uyvr794S1PDbxzbJppOZiwJRjVE0t4Wm9w7BwPGttHwSroHJaWZ2
	YUBIRIxDKbwsYC5OIxP4GL5REDpjLenmN4nH6m1H5gVOfLJ73VzuC6Pikd+20pZv8QRMIpFtpXukj
	vNxx1UfWb+5EmqBuJ4PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz86y-0080pz-0H;
	Wed, 17 May 2023 03:46:00 +0000
Received: from mail-am6eur05on2060b.outbound.protection.outlook.com ([2a01:111:f400:7e1b::60b] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz86t-0080n5-2r
	for linux-i3c@lists.infradead.org;
	Wed, 17 May 2023 03:45:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqYGUiohrjo4MuYlZLw1JWkgvZ6XpNHFDxj4Ury70rJiOxKaUL4Y8D5CziwhJmIexwWbmXy/g0vOZXYsk+bIJnrVRHr0iMh2aO8HNa0n1gjMWbSfPRNndAxRGojVOXNYiXLSwgE82sCUZfzFYniJ6j9Gv6wUv0ZajVwcqJK051Eay9eej7XjsRA6PNEcLSoVwuLszjjjEE64B90oZEfxCb1nmrVWJoQ6ZqJS/5W3pn9p9WCnsKMVnUbHxf8TR7a1EmGFdyeRZz/CWtL2tvA4fv1/iCByUYs25Ovt9bqeh1NmtIK5lJXctP84Qf6a6NFMIgCV0EfuZvd6Sos1EGaWsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6UDB8E2n8bAgUVWPGnvbn8rYYpS/HEFe4VvdYFX4QQ=;
 b=Lqx+IB/iVcIMQ6vWjqKqMTNECWIEuYntv/iTSM1DqDywfXLXpOBCROvrZ6Wkp1YafBo8g1lxb/FoMwqygSYmDhZmk4poTTbrq0xuYIw7IJdIjRJBtieCQ2zA77EQWmFDAnN11uB/xSaqGhzH6ha+5iZsNoheaPv4twbfoJpm7ADur6xS918jJ8cVAphZt3hJi4zkfhmn7OZRaDySXAp8aMuT7puNXL9aR+3/Am1+hQGOnGVVmk8IIkY6wbm0vIleKYtvCn+Yq41VLvrqF+z2KEDWqS2dj9y/pZFG9hIlvIsQ5IhWe2Om8aoOCYSP4cBVl82yOOz01a3zpNmXR6sTRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6UDB8E2n8bAgUVWPGnvbn8rYYpS/HEFe4VvdYFX4QQ=;
 b=fJ1OZ4t+hKBH7HaQH5rLYgceoQjAXWf+PxJ0tBPfaI542EyV3o4k+ECAf679n5yvG4fvJYwuWTpprCPuBxl+5lb6Q+hV+gxoU0ElmZQsG10GvMGoECn/wOzcg/YRiXbFAtt+QreCpfxG6OpZ1wCPrAVdDjOZdpW3drjWjMcfWfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB5089.eurprd04.prod.outlook.com (2603:10a6:208:c6::21)
 by AS4PR04MB9243.eurprd04.prod.outlook.com (2603:10a6:20b:4e2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 03:30:18 +0000
Received: from AM0PR04MB5089.eurprd04.prod.outlook.com
 ([fe80::da0c:329a:5bbf:71dd]) by AM0PR04MB5089.eurprd04.prod.outlook.com
 ([fe80::da0c:329a:5bbf:71dd%4]) with mapi id 15.20.6387.032; Wed, 17 May 2023
 03:30:18 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: miquel.raynal@bootlin.com,
	conor.culhane@silvaco.com,
	alexandre.belloni@bootlin.com
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: master: svc: fix cpu schedule in spin lock
Date: Wed, 17 May 2023 11:30:29 +0800
Message-Id: <20230517033030.3068085-2-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517033030.3068085-1-xiaoning.wang@nxp.com>
References: <20230517033030.3068085-1-xiaoning.wang@nxp.com>
X-ClientProxiedBy: SI2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:196::11) To AM0PR04MB5089.eurprd04.prod.outlook.com
 (2603:10a6:208:c6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB5089:EE_|AS4PR04MB9243:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f798c88-08a7-48c0-6581-08db56870999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2gAx4Og7fbZ0B341wksdrzU/LvlUI4VmxsevfZWCMgixkqHe65pZsy24GnaNP2C72TkQG8PYQ3IsR49tJy+l2IXP8ZoMOZRJJFmwDCugAtyiUNdRuKd3ZoksI02z1G1iD/Pyz8kMVMsLY55rcIOJzOALB5MrI3iNXrzFti9L/00y69zr6vIbswReKAh+8URm3uxBKDbX2B1xF5AZ7X0siqD/IT+WuC/qM4dRxzvjCUZAgMFwOOwZmjHIOxXob+HBaxH0YHqmFzqIB+CdSHmBKyx60OjvB/+EhfhhaQ1uvEHWhiaAOjvka3JByhOhJ/yOSZSY54zB9AUxDG+Boo0kKpp5WmldL9vI3iPggiqQtqPN1Zkii/7xVTHRQZjKDUPIPNRSVLE9uzkBqFiLELvBeqrLoWaZ3uMxDqZr5pm65Y1X/VHaHYMq5er9cBMuZoZu7NSiPggbAKMNqbqTTToAjdMBHU7uNxxOApmtUdIY1RlXAn8usHEHfctpWuULL1Yybq622ZTpzmcOwkDid7xXOhFzkoYM2M7ANfUKFKqQQVXVOerY8qNPKorEOMMmTHsT6zHoVuunKs2/BG9llq9QfNhC84yrVD2xMtGGjI2olGDgY52rUBSgsNJJ3QDiwWaT
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5089.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199021)(6512007)(66476007)(66556008)(4326008)(66946007)(478600001)(316002)(52116002)(6486002)(2906002)(6666004)(8936002)(8676002)(5660300002)(26005)(1076003)(41300700001)(86362001)(36756003)(38100700002)(38350700002)(83380400001)(2616005)(186003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/3e1X6twGA+D8WWJ6D4bWqc6SwFR/NgNtk5uoGI04F1RPE5RdgWgS5G7Cq9g?=
 =?us-ascii?Q?BEhQU6rrwj5b46fZyUlwdPf6NlqKQcVxA7VvU7urSxI6g7vlMVYRjNSiiWow?=
 =?us-ascii?Q?Gg84qAFpB+che/nS/SmdtQeSAlMJQSELBwNzeIBikl1Vz5Q5uic1S0Qfvb6F?=
 =?us-ascii?Q?i36RdN1CHgOOVEd7ilPc2wI1wWXj9VardJHYcsKhPjoHjyvXQ8SoDmQgfSJJ?=
 =?us-ascii?Q?qYEYGsJAqhJMwFdjAo3VRqUF9WY2YB/DuUCj7z9lIy4jbGSKiO2+8qi7GnQ5?=
 =?us-ascii?Q?uNFxqbQeNd6MOyFq4J0TPCrxATbNw3CpBgvUJ4LQZMqSNY4pFm8Yx4q9yhcz?=
 =?us-ascii?Q?U4d74JGKZlifAwfoAYDwlaoBv/RFL6dy2Oz2Ai7eBhO3QbbKafwJywb8ffZS?=
 =?us-ascii?Q?fRS2RJ/6tQCXRybFiOixHyMop03+o4c9BfvOKb1ok/bRdec5wScgpRNndl8W?=
 =?us-ascii?Q?LngB4Lw7JVN2eeMIDXs0tppMCUt9X8MIlAhsEYAHMs4FOjA6+TdvJrR2nPwP?=
 =?us-ascii?Q?LKK6lmeGyfjujXIfbygeqNr4BF3IqB1FqeuxXPKzEnApLojM2NR3PpnsRItG?=
 =?us-ascii?Q?uo/z7i03JPKdnS0PrR2QDH4yhmxVrGs0ksTx2rKKEIR+yHcMnwwFMgpFWHt1?=
 =?us-ascii?Q?UPJ9VAbbLd1VVqKE+d7fszCOnYLpvNre8R1Y0LQFzBiBL/nutVN8nkxbMLyX?=
 =?us-ascii?Q?AacSN/vt6QGSuZ1Uy4rTaze8SNwfjqYE5e4n+f5MaXMS58q3N4iEgstPxShd?=
 =?us-ascii?Q?wQz0oLaxf95c78AjJxL4hI/9UilL5oRY/waLQ4HM0U0S77416+RGbPYuzRRy?=
 =?us-ascii?Q?r0gWwi8MBRQySt41fkvdcqzco7cgWk+2xsB5Nch4sJT5D/KddYB/mtJVYtq3?=
 =?us-ascii?Q?E/Ohh4GGCPyMwPeLZxtv52VcIMXY79C+xfJ7iYB364GbDpk87/nhzBW9eIIo?=
 =?us-ascii?Q?s3wjoOQGsV1jwktnbX5IuojHrLW1qN9HXLiNXE/+MSVndyhTcqpm6O0ciOO6?=
 =?us-ascii?Q?tM9hWNiJNfTtiQ33qbaWG7vePdddhgOK96e/A8Ss2rGZVyaaGnERSj1Mnx04?=
 =?us-ascii?Q?1Gd3K//TKCv2vW3Bbn3oBivpgScjicag81DQuOD0bdlK8f75txNlUdW3ebjq?=
 =?us-ascii?Q?HGJpQLuI1wmOulhLzqq9d8Gy8iv9/5QN882yagM67Qdwik8uAo3QCkOKaEdE?=
 =?us-ascii?Q?K7lVmOY7O8OuIGGgudGo1Ij/C2FiHdkf2Lr3Td7/F4yrOvgkpZnubcKnpVzl?=
 =?us-ascii?Q?T6aiQB+e1M1+wpwBMbtmHwaC5oOXYZ5TBRe6x+5FWYqgbrfTJ+Tgw7BUpxBb?=
 =?us-ascii?Q?CpZUnnUbEMpYVHpVay0vdNaVCkYDjEje1OcPKhp4XTtWaS92d9ZXMJipmlW9?=
 =?us-ascii?Q?YT2WyFmt4NebVVXs/3Mucq/pfnToqxETygIkDacZUjzsc8T7l+/9WnDm5g0u?=
 =?us-ascii?Q?+RFpmv/5vVi7Qs0UyltaF1MCuU1uPev9cCWSxEO8Cak/Zl/yjJrl5G3AF6Wb?=
 =?us-ascii?Q?LrB2yKx6Z05YWrpf92LFbc6M4S7hClqBrVFX6De5GESwvUJykRf9MQ4hqSVg?=
 =?us-ascii?Q?OMpcQXOZ+vZ9/VUwvKApez6IK044c6HOo6ySVdqT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f798c88-08a7-48c0-6581-08db56870999
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5089.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 03:30:18.6654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0HkL9oSnBKyOjYJX6d5s/UuLbVMDzBhzU537XSdYq/CbexFwsB6epwm6wdjA4UvI7d3DmxBnBuq8R0ZPjhPmTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9243
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_204555_928599_F0871816 
X-CRM114-Status: GOOD (  11.29  )
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

pm_runtime_resume_and_get() may call sleep(). It cannot be used in
svc_i3c_master_start_xfer_locked(), because it is in a spin lock.

Move the pm runtime operations to svc_i3c_master_enqueue_xfer().

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Fixes: 05be23ef78f7 ("i3c: master: svc: add runtime pm support")
---
 drivers/i3c/master/svc-i3c-master.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index bca3a4352ad1..4edf33ed207d 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1096,12 +1096,6 @@ static void svc_i3c_master_start_xfer_locked(struct svc_i3c_master *master)
 	if (!xfer)
 		return;
 
-	ret = pm_runtime_resume_and_get(master->dev);
-	if (ret < 0) {
-		dev_err(master->dev, "<%s> Cannot get runtime PM.\n", __func__);
-		return;
-	}
-
 	svc_i3c_master_clear_merrwarn(master);
 	svc_i3c_master_flush_fifo(master);
 
@@ -1116,9 +1110,6 @@ static void svc_i3c_master_start_xfer_locked(struct svc_i3c_master *master)
 			break;
 	}
 
-	pm_runtime_mark_last_busy(master->dev);
-	pm_runtime_put_autosuspend(master->dev);
-
 	xfer->ret = ret;
 	complete(&xfer->comp);
 
@@ -1139,6 +1130,13 @@ static void svc_i3c_master_enqueue_xfer(struct svc_i3c_master *master,
 					struct svc_i3c_xfer *xfer)
 {
 	unsigned long flags;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(master->dev);
+	if (ret < 0) {
+		dev_err(master->dev, "<%s> Cannot get runtime PM.\n", __func__);
+		return;
+	}
 
 	init_completion(&xfer->comp);
 	spin_lock_irqsave(&master->xferqueue.lock, flags);
@@ -1149,6 +1147,9 @@ static void svc_i3c_master_enqueue_xfer(struct svc_i3c_master *master,
 		svc_i3c_master_start_xfer_locked(master);
 	}
 	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
+
+	pm_runtime_mark_last_busy(master->dev);
+	pm_runtime_put_autosuspend(master->dev);
 }
 
 static bool
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
