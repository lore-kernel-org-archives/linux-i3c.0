Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE78DC54F54
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Jul 2026 07:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jVd7tLNbPPx2ptPLzLel/sbSpOzKMGxywGxwEz7swn4=; b=sdKq/cAxroRC6l
	gSxLEx5LB8KxFacQkZKJdzo6B3Ripc1g+Z6yn7iNb2+paBgKUYvPb3Rc6Ex1MXq7IGdi/nzJHoBGL
	rnqAnKmCRwLlo1lZXNg4H0oKk4AEDLF8iZFVQpTR+2sISkDg6yAh14CbywMS2CkzXSLGtpicRWFd3
	Kr3jYgGFeYVBq/QhievNnH+yCR+yC6VdDJqGDUchAQ21unK1SHPi7jwKkaIxYYE9S9AZrDvoHdtD/
	7QekNh/mCujOMKiTOQVqBcXbxwkR2U8WVb3g8VzdNg8+KaFytzxi+wYyQFL5KwhzZbGIwHqFDXEqb
	iHqqmEbtNqTLG0UE1FpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphGN-0000000BvaN-249n;
	Fri, 31 Jul 2026 07:02:35 +0000
Received: from mail-japaneastazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c405::] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphGL-0000000BvZl-27Y9
	for linux-i3c@lists.infradead.org;
	Fri, 31 Jul 2026 07:02:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHv+pw8lZYqMAB6szf0C+/D0WGgW36RII1zRaNzVKurAzRkfhSZnZvpYLAsdx7RaHNT6pOd4NV8UG0XACud0l5HNfdguUmdBWu7RO2pQHzdDgkEo/DyQv+PrWRNFw6Z2UsxuxF+G0lrHwLI37iKmXtUezfdahXZ9CwQx3NsOACwpZDlO1tp9Kd2vD7NgcVhjdgJmo/NtATnTtJDM1zZoQMVr90Wi8jUT8jM0OwuxbdooVGgJkcZUEPx0D/q5nvde0YGbdq+ar9NCMEZFvev9D+REvvJxn+hLPD58YCXCXWPJbqTl+JYDoXpBIqYQlBtoI8v86PB4u4FkIt/EXbkQgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yI6j034WU2lV2qyVh+7wHeC15f4/E+N8+jvTEw8u+Y=;
 b=uBmIjv4G7BWgvU2aup/vHdFL2bz21xXMTLcEqWIUsJh3MU5zRrNpvtmfXsH34sbLrmyCEN1XJ/rDIvH1EiqkadYi42DD+K9Di6ddME6PGvCbjuiDB8TT0yu0cGtzvam6FqPgGkvf1cHMn+gzCd/6Y/i5sswwQlwC3ZuZ6HYi7pbDghb8KXtpBEBUWW1kc/zrqaPyTRcljgAMBcaW0pZz16OuWOikWTgviJiec7PPp1Wigg+z5hKxhNC1VXEfuBuFwDFoGIREo2Bo7B8wXxuF7x5jwXp2wnZafxNGOMiTbORgW4czv7LxYHhb1CBnuhpBvufJy6stfYjPkjKkYAW7/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yI6j034WU2lV2qyVh+7wHeC15f4/E+N8+jvTEw8u+Y=;
 b=R1ZpLlh3LLqfjh2FbiHQ85ADerjF3YvN1e89+lgckLC6vrYbftlyho1LpJHMZ8BBMwc9gQ0ixz7UG7cKSBJKe1q5O/+o180AN+dDVJG3YtrKOIrgu+LkXKXHdAwX0j9S0wZwJ9F60lF8Hq6NcHZ56uf6Rse+MYjumrF8b61Rpyg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB8552.jpnprd01.prod.outlook.com (2603:1096:400:138::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 07:02:18 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 07:02:18 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	claudiu.beznea.uj@bp.renesas.com,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: renesas: Don't register devices when ENTDAA times out
Date: Fri, 31 Jul 2026 09:01:46 +0200
Message-ID: <20260731070150.2519825-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
X-ClientProxiedBy: FR0P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::11) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: 91cab213-43c9-4220-b443-08deeed1a88e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|23010399003|1800799024|38350700014|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: d22/hZnVVcr4USoKdA+eaZnlJ6DwljWNETlVcloaGGPltZjQQ8aIA8EYSo6TZ+i3UFU1mL6xVawybtbWX8sLeMdJga0AYtoM2pKxKjIHuq985nhOIFydxayM6FOy+bcJAXFoRRqKgV9rBeg1EG7YKLxXc1G6J2Bzq9i0mV7Vj2VxQZ6euosYNnax1LqSzSr2jK35rZs6z5zzM9yHOyzr9akHjTbrWx74GayFqGPfZjhvPadcNQeIA39RhTP3GiDTo/7raqXoBm474hPsHiHOfzeu5ZSNY4vfy1whwzxWfrbXSweHn1sMrTibIx0pwCa+mXzsqwmoY4x7BJ17ratw0cuuH9Oq1xqAg7wmIhneXTjJ/AFtcSntkN5gUUzSJ0AXJT+JiTTmOoQDMGYNgoOA5L/66PABfoViAArn0gZGfytywLEL4lFbMRaX48a4lFzd1/iaYpIJqoLQdEY0fC7YP89Uy9MVpWZnJaduWsVrGoJeQgArcLrgu18gcS4/eNEMMUFi79Muvcq4XFDIFuRVwwbkxHSZQKf+Yrj9QB7Ek763+exIZuMd5G9Ba2O5xkVDqhAE/zFjiDU4AsvZ4+l/vpC87BeO8ELxi5C/QsKNEm8mrlSGhzg/WgUqRZod5BgV8FTEq5jCSRbVV3+xl2JS9HOxNmAegP35yd4XLMfrGY5D1zTpdlSrx/RCHOODRDeDmLVzSq4LnRJpD9TofztHSbvGFZ5JoV1jtPU0j5OabTs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(23010399003)(1800799024)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Oi+XW/yITdns9HLzFh0gCcbEBf7Wh6ME2VZuDh0yYumG1vxKncfT9TVxJT+M?=
 =?us-ascii?Q?B8nMyJ1bzbE4lmoG0DIJO5TRRG6QAV7dTxvER6j4ngxqCSxZtVhw6jitooQc?=
 =?us-ascii?Q?u/81UBankTqORsXRCNHp8D6sDpQi13sTpfzDgUrJsnmsj/m962pC8NqT/xqp?=
 =?us-ascii?Q?cLO5JK3mSuuUlDzMphDHESVjGvssagliEc/imwsvAaBWbNyhqvsIUpni49b4?=
 =?us-ascii?Q?Zm9Oi3IS+FHuQSLtoswTG6jLfCrioRFfBzS6MktL9Ry3OKGS/gP86M/OFQVy?=
 =?us-ascii?Q?ht4frgewjZTZyLwdv2vIQu5h6bCJacViG1SuMstVSWw0R/tUWiHZzZQ90WBj?=
 =?us-ascii?Q?kKwXeCX3usSVC5OzhUSRPD6Xpl0BOsqrIiKy0rZydNA+OLf34gqL+fNy9eqn?=
 =?us-ascii?Q?UHj+NcUqqMNT0YeP0+A+/3jVdJSThQ/TPq74pXrMUnbzDXs2fnttrG04BnD2?=
 =?us-ascii?Q?sCX5nZQNwMJ3PwgJEYk/fy4CSIbUlye7PLducAQjiwZmQjpOzRhEXa/b8XhH?=
 =?us-ascii?Q?EoHxrl0qrpwBhgL04Zin7s2wsgLQmAUrkEA04gg/3xlgMmfftKMnKkQyaX3A?=
 =?us-ascii?Q?YRO1yvKivtEw5iwUyt0+94l3XHkgSkDy4jUKGNXMfOtwzd9+SrKHUS50vocp?=
 =?us-ascii?Q?pY3B6WMWc5lJNv6EN4kvyOwkE/lJ7ED7OKD6oz4bQ7yTURgZ7SZEW2MkYqy3?=
 =?us-ascii?Q?uN5/AeZB92BVzqMjBPMckVEslR9m/8bSU5nG+k4t/hwpZUJT3LMmXRxNqAVh?=
 =?us-ascii?Q?U6i8o0HPUlevnuP1Fx7um7j+llB/ecN3+JlsN7va4/RX6iOQS7c8g/uuGZiX?=
 =?us-ascii?Q?FQLk1n71Vxc7gxGidYxkkycaNO5FBymoDRnuVEC4MpBmlQHPVGC78vruu9iD?=
 =?us-ascii?Q?WiOnsZW+DR3IF+LBsGxRo9hzTo2D9ueYrPbsWFh9DUje0dWUkD7FaQvZMUle?=
 =?us-ascii?Q?uDDXuAmpPmrIrVZMNE7s4437YkdkVKtoZ9H2hUrtHIvKufk95wZV8OiQL04w?=
 =?us-ascii?Q?zMkA0l/2025Mqw5TxFFaY9QgmrJMoHumqNC39vFbWqqYit4TqeK0rS1+Ifu5?=
 =?us-ascii?Q?lIdY7z5Lh5n/KDqwlWvPYiQinXTmEvbm+5OiGeIaX+rmjEZoc8nn8gxftVRH?=
 =?us-ascii?Q?4wCrGW06xKpsuGJHX+8rx2NPi+QF/iFJzoHXqxZ7p+75FH87mYuIbcA+Q7Im?=
 =?us-ascii?Q?bfZHN2Dk/Go6L/F5LEaNzbiAvYfYTJ3Voc7dYq99VPG7ViAdW7gRJWiErKyH?=
 =?us-ascii?Q?fI/fZJI3j47f4gmoo4Y8eOe9Wd1e49625Vc2OE8vV+EMPMMjlXs4CJsKLgtd?=
 =?us-ascii?Q?v/7K1apJRm3NBW44MJ59TeAqkeUfhHMT29Bs+wKhPOOFjDuy9CBqYieGNzvK?=
 =?us-ascii?Q?ekZIEqmAN1It8PJFn5JXiWo5gsgAHHUqDbiAY5kPvxmBeNED1dkduSy5h8Oz?=
 =?us-ascii?Q?KJsvE/nxrrxpj9NCuorzGODDEAJSOSiHrVGG5kCnW6++Fn4GCXBiSUGirsxx?=
 =?us-ascii?Q?OVlt8+UWevUApW5/YaIwqDCDM8QFiCMtDDJf3AXvwL2UCAMqaTmSLQTdK4wy?=
 =?us-ascii?Q?j67R4PzvFuFLhiXZQODOC6zzdXlbDnQRJNaPqxiCQTMlWyafTl4kTTFut18L?=
 =?us-ascii?Q?mB0xibkSRuWqfNCxxUXiGfPLBkbrMwO07bXx4qScTzvMfWzuSMeTs5XruRp3?=
 =?us-ascii?Q?sCPo0nhNte8BEhfOLsrn/apmcJncIbCGLbrR9RPotQWOYA0sNyRHa9tMBRki?=
 =?us-ascii?Q?OI8dkX9gMK6qRd3GOyLc9X8ALvJZ3Y+PlqxdlthLlJqg9+w2mRtt?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91cab213-43c9-4220-b443-08deeed1a88e
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 07:02:17.8972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PuiAnv3zFFaYuOwF3n6RDeTLiR6YcsI7Hf+1zOS8XP61mnsPTF4sNTgeQNM00cQexiELwHrdHqPfLLcub6z7Lb3zgdnq+Ph9pZ4qeY2T4UNvztNiHWcL9MdEPd3JhE0l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_000233_584751_F32D0C07 
X-CRM114-Status: GOOD (  11.76  )
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

renesas_i3c_daa() derives the number of newly assigned dynamic addresses
from cmd->rx_count, which the response ISR sets to the number of address
slots ENTDAA left unassigned. It starts out as zero, which already means
"every address was assigned", so a timed out transfer leaves that value
in place and it gets used as a result.

On a bus with no target connected the ENTDAA times out and the driver
registers RENESAS_I3C_MAX_DEVS devices that are not there, each costing
the core two seconds on a GETPID that can only time out:

  i3c i3c-0: Failed to add I3C device at address 9, error -110
  ...
  i3c i3c-0: Failed to add I3C device at address 16, error -110

Start from maxdevs instead: no address is assigned before ENTDAA runs,
and the existing rx_count >= maxdevs check then reports an empty bus.

Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 2b501f31e874..f4d9608978a9 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -685,7 +685,7 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 
 	init_completion(&xfer->comp);
 	cmd = xfer->cmds;
-	cmd->rx_count = 0;
+	cmd->rx_count = i3c->maxdevs;
 
 	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
 	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
-- 
2.54.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
