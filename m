Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43797D116F3
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Dec 2025 07:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8eG2kAB1g05PZOL1oRbG8U6jbgH8k5k42XY4k93Xa7s=; b=nxlb9vdIqx9f4g
	rhWB6VwdMGFv8K7Buzn+nCJ/hiVG6NVqS5X/YBvF16JSK9JXQqzZxTt/P/Iuc2ogOAE6fkpuqrDsS
	D3F3DNhgEi1PsDh/GQyR3t69x9XFKteLIRpFWce8oGb/lv5XLAgq1cHe+dATakCRWCHqSQkDBAdk2
	b8Ng61r+4yQvIi0iq5zd73ODuoCCpJrg06H/TXvQo39kCETyqRgxnD8Z78qA58Og5xuQB/9oaPJ8M
	PNkegBFBWDOGvXiz8w7owP1swDpVzhcWe2w9ox0tomUWfu9uQoTBvUrSrmAaLDhk3ftiC7BjeFQil
	dNTdVzLoypPmGl+3PqiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhDG-00000006Flj-04zM;
	Wed, 03 Dec 2025 07:23:46 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhDD-00000006Fkm-3VEX
	for linux-i3c@lists.infradead.org;
	Wed, 03 Dec 2025 07:23:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twwJTdOjenFScgWQnKoKaSGT9tDnkL8g/SyCUkUk76ciyYx07We8eYTT4q8hehJGMtqMPXKGmQflMPmwf5/r+Uvir96fPaZUW7QFBAlQyGkq142o6hU2rlMnYJUoZoReCOjjxkRCtHQwRqYFJu/Ly9PSfcDYw/YyW/jxVSgOVqpk4DM/loM3TiT98JR/psldqIhuYV2makBFkHX1oN+IyqIRpbPHaCX09AKpvj6zB4ugJYXVvtO7h6TzMN4e65NRzbVIDSW5TRBRoXFAmQCLC37XKO1rDeCYOR3mz1HA5ze631ZIxQt05wkyLJZ35c7yT/sBSfUlgKOCKMQHkJ7nKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaEm0zOzBn21jy0g8I48vBFSxKXMaKvwGSbcmsiaP+4=;
 b=wUxy7xqE0ajtrg/lDP8sB7LdbPBFmBc7ZvtxeHhfHHVq7ZQMXDV3eNsoFCUC1meLAXqwGU4Sm0SffFYesDW2myAXm+/5Thhp2morwFLkZrhn1HHqt4CWvehuypg3MILD/G/Eleih3zL9CJ4i+7pO0k/PC3Y/Dh2ZGW6h7C5znXbZQBKEDKmsGSZThy5zH5kXIOXF0oJML21Te9FEe1hsv3sbyjk18RgkamcHmOamhYDZckPsL73w/QE7mG5e053OV68xFX8QEXhtNeHn4Xs6X1ZeHon2Am0fcXe0b9sqBy6WPiYS6IOfCQDA1uq2KtvkrzrZrW2JkT+y7Qr3yXblAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaEm0zOzBn21jy0g8I48vBFSxKXMaKvwGSbcmsiaP+4=;
 b=WWyXxKO+y0PfCqedpveripDMidqAYLlc/6an/uERU+HdCa441qNFlwJNsHFji6u3uyl/ZgMcv9ZTPehNI54nK7Hx75IJZvJYT3LxuZfbwnJROEASqB9qowBNuafWmyIoVzT9Ftsp4aG3juhkOJzuDFB0okFv62uGKDMZ03PSrc8wqaHdxBZJpZwXkk355CC6vVlRZpRvc5Q9kxFs141hKxkicFZQc5g15paFg/jVAQBJespsesdiJLcX7xt/uanRjIgH2RkBLsvVzZTYCAF582zEXBCbj9d1zywkczdKnu4J8FEdm/cnc6gTWc5qRaWGgWHN8aoGuOzss1w2OfX25g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 LV8PR03MB8140.namprd03.prod.outlook.com (2603:10b6:408:297::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 07:23:38 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 07:23:38 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v6 1/5] i3c: add sysfs entry for Device NACK Retry count
Date: Wed,  3 Dec 2025 15:21:02 +0800
Message-ID: <35bb0a3cae4664dc423ef57a1ef3ebcb378bce00.1764746266.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1764746266.git.adrianhoyin.ng@altera.com>
References: <cover.1764746266.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KU2P306CA0025.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3b::16) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|LV8PR03MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 743ad811-d5ab-4908-665c-08de323ce079
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1G3d/wiPmwZwPf3insmHo1A69LC9jWA1PU10At/DyLku1L/NvpWUXXLAxk40?=
 =?us-ascii?Q?DhpkhELGJca+8mKbcdyog7YzPqF+1xZD826zlZrCuj1dnMk8ajAkFfaFDs/B?=
 =?us-ascii?Q?3KhiARLHHrJkDr2zp0dVQyRp8yd1Fpvzz1UTtuwO2T75TeA/HLlNZ9jeKKPN?=
 =?us-ascii?Q?kdQ8ktcffBLiUvg81j3SEJnjeu9cybMi/veTEeTtprS+ZVKA/a28dK0xWeE6?=
 =?us-ascii?Q?nsH7Hj3doHmnuMQH4X5iaPz+os4ueGOhhUtfhCi1wZXYzzK8gLemrY03iD3P?=
 =?us-ascii?Q?1ZNtMY73qDYDYNbv/dpg4r8d0Ckr1394LHZdnt8NdaUulGNQJwyC60GJDXtw?=
 =?us-ascii?Q?VKWXWIvsGfWX2Yk0lPJbarji5yTD2d+p8l85nqnwTZjMLury5Xoej52AhMEH?=
 =?us-ascii?Q?I8HoAmTUJAbrwl/dWuXCgH3uvEGbF022TGtjiSHr9G0rwi4wlislkna6JXEO?=
 =?us-ascii?Q?vNJ6sIBqyv5JUWnXIOvutEn0Irpe66pfeqU+e3hD/0oDLwQzsNsNGzJ70K+m?=
 =?us-ascii?Q?7OfQX/47vaLgc6q/eSZAr7HTScBrVejw/rk8x+CobLOMcODkLUG8PJshthC0?=
 =?us-ascii?Q?/cT+VqtRu6Q27ZyDPEyppWnUThg1psHSXnlnw5LRoMDEtjy8ddEf7AmN3S42?=
 =?us-ascii?Q?pT39JLDEdTrsw/roQFuw4n6PM6s0vNi+FTw3ERo7PRc7gPC4L5E3g0VXyyDI?=
 =?us-ascii?Q?x4DOukQWw5RiIeghCq4nV+4rsssvNoRAh/GtOTF4itKcCMacM4iPsm17CnrX?=
 =?us-ascii?Q?aTL+9U0+E/O4qD5OpFLjM9RFekScOMYCef+4elL/HaeTVl4tNabbNg2hw0er?=
 =?us-ascii?Q?OROsdQLPJeq2jqzdmHMp/HLpUxW4RD5/FKqpN2RlAt8ytl41dauVi9oqz0RF?=
 =?us-ascii?Q?TusmmxPc+KDKAShbxZuqmwiZZWXRsUjsf7dsfu/8GOfxQR+6aBjUUrfD8EAd?=
 =?us-ascii?Q?yj462zpceqm7O/b9jPQXJ0l7CmLbrmBsfFbBxtCDx7d/vaNGUfOS7VPDLX/8?=
 =?us-ascii?Q?M+9K19l8wKlYvcxbWNKgSPK1NanKcz5uUMSDz1Zl8z9By/1gTasqnYI782Hl?=
 =?us-ascii?Q?vZTxJ96A62kBSX0AcohMML+xwom/z24QXUOOuND2Y1k8f01FKlJhwrobprkl?=
 =?us-ascii?Q?KPMkkea/xfOvDWPnesAojbl4qX/5smegEY1kmDktXqucxwG9+Ga+GcsDRHsB?=
 =?us-ascii?Q?goqqH4WUDfXu1I9mY8YtYEg0QOzmiLdLnc+V4G7KqqWRm+BbPU8eu9V28JET?=
 =?us-ascii?Q?MLAfi0sEDvHkUML4eV4f+fnRbJfUJSuj8qW511ztbpt04v9LuhdIcjfA5DA4?=
 =?us-ascii?Q?ZuZ0iXEM/nYFZ13JLyNVnTkZlqzcXsGPP23QNYu/gCDbvgYWmuxEUMJ9GjeY?=
 =?us-ascii?Q?C1izONFefN930vvTDh8zdAkQfunoPt4NJBn+YYsOp0X+50n93fT0qoZ3teDT?=
 =?us-ascii?Q?vXUg6IZHNuB9GypAcnAQsYDa5fYoYbxq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4HgpwtHdGHSB4oYWiV4W4jLRjijp7Vd+H/9Q1Kwtq1sjIzMe21DnROBm6kkG?=
 =?us-ascii?Q?nW2vsm4EbVHKSv81RhK2kEye/CMc0l7wuZiHmFmCXj62kzqdRhqqDD5rkJEs?=
 =?us-ascii?Q?S++o69TFSkP/m+dmNycvBkZXMH3v5C27EYomcV/23pgsRUY6HzDYPTOcWlR+?=
 =?us-ascii?Q?TobF089xPLIJhzJfprY+xoKjzkM+71nx+r08Dx0prM1gd9en5rKgvQaBbJye?=
 =?us-ascii?Q?kE9qkcqnEmFixbwiTnmyfsFro3cyPi8iIOhtKgEoPF1ABdmcUNTy58pIdBFT?=
 =?us-ascii?Q?4kDnMEp/OtNk3yaOfKiI4Dw6yYlxWzLHLikkz64g7qoV4H/o/FrPFInInyAw?=
 =?us-ascii?Q?eKopYcOGDT9IL6yZz7chwjIvCkCWlAp0cjsNr+gD4zQ8Hb4d0TMNwZk6FHXo?=
 =?us-ascii?Q?tAGtcsVnsR54k+iZUnk/rnUPbc56lDorp/A+YWNmLK1Wd7J7slUzOkDrxeIU?=
 =?us-ascii?Q?OeOud3OsiaGi1Xs9IbfsHUzbOSIl3c837uHM8nX6D4V/1HVxjKcYm0uD0rlN?=
 =?us-ascii?Q?0AhdGY2VCEOu+vQNNzysIcV1GH+fX2KAAyiMX9b8WEMwTxOm1eN1IdNRtPUY?=
 =?us-ascii?Q?LzehZhE1dvgiqtIbc19PdonVlc+Isblz6rx0aRufSh/b6OekKgOtkc5U6/eD?=
 =?us-ascii?Q?8IhJyo31cdawnCsS5iaHeh2u1A1Uk8N/I49iapw6YC3QCuGiUp5TZ9fK+fjp?=
 =?us-ascii?Q?KNW2KnCnfJf73OJS6IgrTT1C9vb90w1PmRovBO8zr7iFPxbQbbi4R1oRhALu?=
 =?us-ascii?Q?+nsgIuC39ht1IK0BKXTSrW6cDbQZ0iHo4i+KoSsC0XZ5LFZsCH5wOviLCLhu?=
 =?us-ascii?Q?R0KhQyMuwXPBo9tCq1sWr8/vb7420NL5/cHUUROqb3a2MoRiNzGAYun6jV/2?=
 =?us-ascii?Q?clj/hMMwGLddt+NaDev4s1b59rwyGwdAdky+EkJPnjalxVeCml1r0qBtmmSD?=
 =?us-ascii?Q?HxHJu4dTSPcc4Bw2TeEsV1lLOr9Wst2tiss5JHf7r4y4CnhgzM1xXn6dj3gr?=
 =?us-ascii?Q?Z0TW9KgbNTy/VPvmVXI7Nzd7PetYmrGJcetYmeL1FAThI4Q3drJWbPcE5ZoM?=
 =?us-ascii?Q?vgCYhKvHrl69vqighQGndsP+zbdgmdx1iG5RRyUKxEzlsoe5szbxOJiVHi8o?=
 =?us-ascii?Q?lD0zI0lMr013HYPXgr/NfQhAZaE7lmHL5aoMvvswlRyaEsI8DLRnBbmXa0w8?=
 =?us-ascii?Q?C0WKDfTGNEkSaGr8UHAhPjStKWaQYxFsxQ174pgEwPjH7jftnSFPTh2PLjq4?=
 =?us-ascii?Q?kOMVZ21b5s9IeDcEyg9PtL7m1IZMW1P92tc8+2ri0iNs4SFyGWbtnK1nud+2?=
 =?us-ascii?Q?i/cXrUcRDqL/q4yWY0SAbZ18UOr5liMsWmy3IcnLm9nbwCBzGN746qKt6J8f?=
 =?us-ascii?Q?X7YuCNZsqvmDO9l+fYDGck74QUsGtKCh2UOdaE9zC1OESN46uLHuvksNwfoC?=
 =?us-ascii?Q?3+VLjzU3u3Y/7fA7LHVI+m4IizM4nHEiLeo6rAcYEQdZLi9jLGyFGSq7c3tM?=
 =?us-ascii?Q?tco54QBUuI5c3t+2ZbIVEqQ1mY+9dHYqc8gOTquqOGt1nXx7IfFViVm5xtX8?=
 =?us-ascii?Q?4qU5C/2fQx/CJWQXriyQR1DKu/X3JbBQ0HuOZqbj2jfAp8erZUUhzWzpP60R?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 743ad811-d5ab-4908-665c-08de323ce079
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 07:23:38.1725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SvTKUyWNX6jzfzXoXGwcshLylcdgjKyNMAmz+9bawflSnbkWcaQGVc1fZ6/X4pPhYrnoJ3T2VFyho6Huen94Bs7Z2xKooc7BQMYIhB59tgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB8140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_232343_867933_B50326BB 
X-CRM114-Status: UNSURE (   7.87  )
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

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Document sysfs attribute dev_nack_retry_cnt that controls the number of
automatic retries performed by the I3C controller when a target device
returns a NACK

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/ABI/testing/sysfs-bus-i3c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-i3c b/Documentation/ABI/testing/sysfs-bus-i3c
index c812ab180ff4..0b8a0c223f4a 100644
--- a/Documentation/ABI/testing/sysfs-bus-i3c
+++ b/Documentation/ABI/testing/sysfs-bus-i3c
@@ -161,3 +161,15 @@ Contact:	linux-i3c@vger.kernel.org
 Description:
 		These directories are just symbolic links to
 		/sys/bus/i3c/devices/i3c-<bus-id>/<bus-id>-<device-pid>.
+
+What:		/sys/bus/i3c/devices/i3c-<bus-id>/<bus-id>-<device-pid>/dev_nack_retry_count
+KernelVersion:  6.18
+Contact:	linux-i3c@vger.kernel.org
+Description:
+		Expose the dev_nak_retry_count which controls the number of
+		automatic retries that will be performed by the controller when
+		the target device returns a NACK response. A value of 0 disables
+		the automatic retries. A max value of 3 can be configured. Exist
+		only when I3C constroller supports this retry on nack feature.
+
+		Valid values: 0-3
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
