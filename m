Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1494BD3EE86
	for <linux-i3c@archiver.kernel.org>; Thu, 22 Jan 2026 15:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qlqThrdfQWxqQATlEfAh5U0fFImbI8kqoooxZO4Ifo0=; b=OhrbY4poEYgLaa
	cYHFoAazS18ggSpifQ/5M/a7UPHEOh7xSlYtE34Rjsu4kKlPaOwjVGtLn2E/sc2vbNp4QW6qWUy9C
	68BE2n9RJolpnrZhg8qT/3ei4iAvLVh+Vpth8l5WYNsbyr8RwZFCK4P+X+N0DquWUsp7rExHlzkJy
	eMDxL4hrbk7pcUVkpy5Gxr03XqUE24Iq/WdHXaDn3GZKQxp9deRNBu4W6UpDtbRqnISZiiCSbM5P6
	5Km00jtibcIyAB4ErZ3iMvav29foMLnkpQ14StVkS7FnR5yyD7DLSxQDvEpS7PjEqbdMtpVwBusm2
	I6IPQhwosNzx0HbRwwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vix46-00000007N7s-3BZv;
	Thu, 22 Jan 2026 15:57:46 +0000
Received: from mail-francesouthazon11011025.outbound.protection.outlook.com ([40.107.130.25] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vix43-00000007N75-1khz
	for linux-i3c@lists.infradead.org;
	Thu, 22 Jan 2026 15:57:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/7V0wD5Oaw4wkegYnbvH+zg9PnstuCTc59/9jHObGJDW9lvAimnL1buAsfSu7n3DM1aN+bO7kDQ60Rou2/KYc/Qdu9v7Hzv5e5c/jP+sG1fnUE4c9+Wob1XsOR6IC/wlyoN8tadDyKBtJFUKxBMqIo5dlXoHjUKHFwc7O9ItVoe4OJSfbNtvDFY0kBSjzLYTEFq1CtDmFfLY4/vB666Kg+ImuHizqS4mHqtfYjH4HhbKpvGtE1zaS5tH35jJEs/vcswCwCdUkzaQwC/3gMqS9wZuvsHQLZS1AP+NRDBVXoxnDLLC4MDQkZOkUi8ybhCqCbG0ZxaC5MhZ2vxmx8bug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oI824oiLKUYDYfa3So50ZsPB1rvM5Uqq/a3o2IWT8tc=;
 b=SlGg+k0pDE8pairLC3ViIn8SldnJed1/yOR9bfttt4nLqKW8/oK1B7TgA8TR+k7oVjvPFmP9Jcwa1CVCIYY0SP+amHFuiOLhXYJGciHbxohZDAPT7Pa2zR9rn7+JCvfLWoGIMTneD/ZNMG/QbacXVvxu6GQ7jv/V0f+9X+FpRWj5j7BJlQMLgmFwcY93yWSquS7SqOhbt9YuD9CWqe68glh2S4oNIGL/gcpHXunm2TG+GcQIWlHArQUtiYvKBLgZfd9ZHL//PwrMIOJpDGV34HFXIXJeXFVePGzhlAikqjjmFEdt0gVwxG+1sQobgEQIAAJaZbhmNC1k6/NL+gLtaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oI824oiLKUYDYfa3So50ZsPB1rvM5Uqq/a3o2IWT8tc=;
 b=LBuBt3A+LabKitwtHb7KNBg6JH7iGAwy+BSFhd682qgDgg3TgP2mnJifz7HRK4q2MDeCKGakp6ncbU9LlsKcipe1PzTghQUG2pPSu+SynrbRtJzzvQJnzrUtSSarsg7d8cu2k2mJMW71AB9Va2ZG/T1GG5wZEiGbbjd3HZLlcVmoLKAKHzCL9MNCLfVQ3tRfOl4gPNMjMpmZdZ6CrsjISoPXO7yc5e0faRocH5TiKRndu70jvU8iFe2Tudmw1zOUZ/QqA15hVZmrf5qy/T+9YH3YKZ6GUnpTmK+nE7dKxYPt5KOmHTapzvkU9K4ZOP88cPudgZg/tUjR/z8QDNIc+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PRASPRMB0004.eurprd04.prod.outlook.com (2603:10a6:102:29b::6)
 by DU4PR04MB11984.eurprd04.prod.outlook.com (2603:10a6:10:61b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Thu, 22 Jan
 2026 15:57:38 +0000
Received: from PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd]) by PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd%4]) with mapi id 15.20.9520.009; Thu, 22 Jan 2026
 15:57:37 +0000
Date: Thu, 22 Jan 2026 10:57:32 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: dw-i3c-master: fix SIR reject bit mapping for
 dynamic addresses
Message-ID: <aXJI7NWd2KMSuvIt@lizhi-Precision-Tower-5810>
References: <2362f68b74f2a2d930ca80131d573f4078e2f425.1769047347.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <2362f68b74f2a2d930ca80131d573f4078e2f425.1769047347.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: SN7PR04CA0070.namprd04.prod.outlook.com
 (2603:10b6:806:121::15) To PRASPRMB0004.eurprd04.prod.outlook.com
 (2603:10a6:102:29b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PRASPRMB0004:EE_|DU4PR04MB11984:EE_
X-MS-Office365-Filtering-Correlation-Id: 19eaa978-9303-4edb-acb9-08de59cef726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vaBwq0vFpaUHwiVHc4gWB/51zkjg7TfFSuMSExa6YK2BJpT4E86YMIDtY2aP?=
 =?us-ascii?Q?7ercQZrsQQrYKFBLdFbzYkWUPxiv7C15rTxWoW+0gWs2gqcy5lMp0zY+Vgi7?=
 =?us-ascii?Q?FNTQu4ZrsoK8MJKu/NTwPjIQeVT0/f+WRInIYIIBBR7Uv/NYbB00mID7gRwu?=
 =?us-ascii?Q?ub5oaAKvhdH8Z9i9j8cQqpLwaM20ucH91YLfghMzH7h74RHgqDzl1EU+8obt?=
 =?us-ascii?Q?xubwTZ9cOK43IczHkj/LUm0mQe7I38cWZ457FAcxggm0m7r9TAsd3auA966D?=
 =?us-ascii?Q?KmHfZc2fa4mEGVkNzPZsiiipEWWpBevXkWsP8lXi8VQmuiWlqp+NFts4IMHk?=
 =?us-ascii?Q?tcZVm/lNEM95fxXixMq3wZ/3IjxZ2jg3fxI5YrIZIv3sK1c62Yv4zICr7bVy?=
 =?us-ascii?Q?5fx55JpDNTeGnC+JKb2qB6+qzsNjB5de90vn01BRUwvZ8W1AzibfBaNV62Fd?=
 =?us-ascii?Q?4UcntCh41sweIAHsFnFlK238ioToc2HQWWoI0gxnRiAzPm1C/yRnGo3Pchr6?=
 =?us-ascii?Q?kwiOSOmts7uN+EXMKLRWi5+4HUwMF1ZUPFNviuzdOOuhpreNtJ2F1lbNGqTe?=
 =?us-ascii?Q?0LgEhWLxwCp4nWUvv5zwIrwcjICYBrS+kf1Lfv+BAhYgHJDl1FyuC3siHAk7?=
 =?us-ascii?Q?9+icuLl7WAxm0VR4S3aFTg9hYcd4bJL6r86I5IktYS8e1Kl1Y/GSGhUnnmGN?=
 =?us-ascii?Q?c3IRBCYBvSQhL54aEtFZYOeF/SNKWtOjHgrVemKmbg2cguyqiteXPdYGP1KM?=
 =?us-ascii?Q?+ieOEOTuNZPhZPzy7bhwOOxvIFO5CtWnhszBMtKzRnrSth2Ec7A5NhaQCpVK?=
 =?us-ascii?Q?X5NI9nXGIaNXHhbBni/xuo9CndaI8AfKW6DbG9cogZtPKbvCwKpsq61EBBDy?=
 =?us-ascii?Q?noXFtUXgpbljYiqjnlWgDf/atpGN0W9XCIRNd+gl1AIgCerVZT8jIPQP1mmn?=
 =?us-ascii?Q?gTFJhlZTXzcEvie+mLQYPMWHTBL1MPbTEqdgqEphXphxn6g9c8xWImApwmmZ?=
 =?us-ascii?Q?6gy+l6FeirANyeBfr31j8fuhR3Awr/l6yJps0K9MlIxPfpoaCvE7GuU1F44k?=
 =?us-ascii?Q?gB8wPWvtRoaw32yhWB9HwHDVcvJ40p3Xk1KzQ9OmaR1Qt8qb5Sx+uHYz+r4p?=
 =?us-ascii?Q?Cd3nXL/HtKU6ACxRdGBWLeEFwYoTRNjmGN+OD3qgc9KIsJjo2DZFWuuyQvhS?=
 =?us-ascii?Q?C55ijkrSdygmJu8EPkoFWSoTX4xZDvxdQY4H+TYfQ4wlYH6p5AfVhP//tV8U?=
 =?us-ascii?Q?RnPl4qGTG1YsE4XWHHtKwL9Co20e2hEv6XJlPyP2g9cNORMjIBKNUKYYHQh/?=
 =?us-ascii?Q?kG/ckxRMhgUwcgKKpjcsDBVL+lbLceZTsi0A/0g7uZwb3QYlO4Z94baWSnfJ?=
 =?us-ascii?Q?tPGcMb49nFaUm4wWmdTLIkQdYmyDqmtenBnUdyoxI1srFtLeOFXGFVl1SsMh?=
 =?us-ascii?Q?KpfZxs0ItRxxJF5IsuPNn+YgYmdFncNut0WE4ZfkMYCYYY7E6NrcflKqQGnQ?=
 =?us-ascii?Q?bILPLgZsJusPhIU8lzuZrN5DAyaVubWmLsP655qfclWRlWCkPdaXqeL5WNeJ?=
 =?us-ascii?Q?sibvfnRsZRXaK6nYlpvCZyeSwndlR8xrnvOsIOqZOkTBPrg8IilvzCcH3svg?=
 =?us-ascii?Q?Q5I57MiYtiFcZ954zzl95h0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PRASPRMB0004.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wAZ9RXb751wS7h4jvqRBjI9dzWpji1nrnvL5XIvLgdlSMMNWRTsLguQvBpwJ?=
 =?us-ascii?Q?5o8KLnkIyx43VRuXajfEH6Pt8sDB4JEFKlOOL0xTmZ0J9cBjqjN1K8pQBcfM?=
 =?us-ascii?Q?wXdJ10rDm3O1YhfF5okO1lNOlpO5nPpy9u8ISWGbA21H1VlyptiBnMihondU?=
 =?us-ascii?Q?ARHnuRfgFkV/YMa1mO9d/+Bq9hoPz0Hr5PYQuxtz7nIvyVKxKaUbRmsaUj0T?=
 =?us-ascii?Q?NbbEcIFTGNdrYWLnI8i9YygxVNUENdVRSlvD6UL8EONNLFlij8wQy1z76cwV?=
 =?us-ascii?Q?DFNfVdgnS+8eS8MikZgUyU+LrHK4pqxRoYmlMzttczATUNtS6K77gyUp82c+?=
 =?us-ascii?Q?wCGEX72HfBdMwbXFI7nie4aGTS5R0b4sHlGzswes1ipTtxoZilJ18yCcOcRk?=
 =?us-ascii?Q?mVeAv8kxD2n3J3BiTXyBD5EdSu+romC/P178HePc+4AAv5VYheik24ATqBKf?=
 =?us-ascii?Q?933F9oUuWpDHl2k7dlWQHemrDGy4srXLS2tplJEx6sDdLkaXyzNdM2gX3kZe?=
 =?us-ascii?Q?uiqJ4xUtfRupSgReLjm7bNglDrQaagUiPvRAtMtMBr2V4+xcpW9lbVbAUtgc?=
 =?us-ascii?Q?OJIRll84fqbnzpD13CZXuEU1InykX0UVpOn1HOs5Dw75gK8O4hDiyzFYl7fY?=
 =?us-ascii?Q?iMmx/TauPhTpkPYZ/dW1OHcv9/ry9u9perN3iB0TyzF0WPENITVm4Q3Lrw9w?=
 =?us-ascii?Q?1q1vwkIBhp2T49QuEUtxlQwCtKf/aNTDkuF8oqor664Ggf+tbAjVkhqnnzHC?=
 =?us-ascii?Q?Oad20I7qnhhynrghiuE63wneWacVgbBQafZhCD3ZUnIY6z8QOhVEtDYXvLpS?=
 =?us-ascii?Q?bW3hVlZkKRpcwb7+2jj3DPL7HW4BTq8m9F3PxDVKwEUJPf+/3Zk+ZmindETb?=
 =?us-ascii?Q?2YECLu2/zs3NsHFzITJVleNeysL9amZKrasor0AHi2TfRnBkz44KkQo/apW9?=
 =?us-ascii?Q?lGghbm9uqmuW2pBkPfRYJpZIAWr+AcZ1vwMEo89pze4izHfldd5+JjrKZ+h9?=
 =?us-ascii?Q?UZ6XnHeZC1JPPcZhV3B989WS+9fzB0n2rBcWFpMEPrnnZ1jocoEieDAurXD9?=
 =?us-ascii?Q?j18b1E3/pBce1H57x7zjAsY6edvDCXLOuzAkGHHP0DgoOzchS66aTouQUJST?=
 =?us-ascii?Q?FhpVA7mfkZeqS475QKNGZH1sB74VOm5P1+714vJpPe8MWAAtTpnUYERpJSiT?=
 =?us-ascii?Q?0sTjMlJ9rThQWk9pxvkW1ADghq/XYJxR3KksTbigLNLdDm6COaGBI6ffyk+v?=
 =?us-ascii?Q?3XOHxS6dNk97yi6wleNd0xqjHiBE24A4Cisyu55Iexw/4FTYZM/pmx6r8587?=
 =?us-ascii?Q?HcchDxB1rxyz4teUvNLvsN+UruR08Pew4QsgsSuawlbevXa+31zQkLuP0AOx?=
 =?us-ascii?Q?5JssZIOP4FikgbyGY+nXmjlfDDVYh4JwhP3l7xWiJ+afcqO16AjOfj/HB21N?=
 =?us-ascii?Q?agVWzewDjAFXn9/t25F4nh73qoL3X8lf0X9U4A9kp/KZ3UB/wgKrGxCNuwba?=
 =?us-ascii?Q?2bydiV5tXF6JEiD08UBigXRQZ7xKCzPn57pEDMDtIzdy51XkN8Ug09ehNT/G?=
 =?us-ascii?Q?7ud13sdjs1tsgu9ILkKe7nJL2wexJrERXI6Fjz23xD0WVIpnHvE6tndeP9+T?=
 =?us-ascii?Q?yLLJAT0dtAd82YkNj6vesaTnlr14pol4DigQQvIptsIaGtShSpkffW7coNpK?=
 =?us-ascii?Q?C7LNWpxF+TQ8hZHnt3g6yPjJrgLZeic58X8m6HU4wCJIov7Y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19eaa978-9303-4edb-acb9-08de59cef726
X-MS-Exchange-CrossTenant-AuthSource: PRASPRMB0004.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 15:57:37.8924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jJEb+Ws6ZxPffHQSVykuHvfJUu02pTEt+xXMx33NmYFmL077M9TFq39wggOzeyQq7t3KJqRhxp+VTF+KiUYJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11984
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_075743_503832_0D091344 
X-CRM114-Status: GOOD (  26.45  )
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

On Thu, Jan 22, 2026 at 07:08:15PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> The IBI_SIR_REQ_REJECT register is a 32-bit bitmap indexed by the
> dynamic address of each I3C slave. The DesignWare controller derives
> the bit index by folding the 7-bit dynamic address into a 5-bit value,
> using the sum of the lower 5 bits and the upper 2 bits, modulo 32.
>
> The current implementation incorrectly uses the device table index
> when updating the SIR reject mask, which can result in rejecting or
> accepting IBIs for the wrong device.
>
> Compute the SIR reject bit index directly from the dynamic address,
> as defined by the controller specification, and use it consistently
> when updating the reject mask.
>
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 31 +++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 48af00659e19..ea2c13c97c0d 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -205,6 +205,12 @@
>  #define EXTENDED_CAPABILITY		0xe8
>  #define SLAVE_CONFIG			0xec
>
> +#define DYN_ADDR_LO_BITS 5       /* lower 5 bits of 7-bit dynamic address */
> +#define DYN_ADDR_HI_BITS 2       /* upper 2 bits of 7-bit dynamic address */
> +#define DYN_ADDR_LO_MASK GENMASK(DYN_ADDR_LO_BITS - 1, 0)
> +#define DYN_ADDR_HI_MASK GENMASK(DYN_ADDR_LO_BITS + DYN_ADDR_HI_BITS - 1, DYN_ADDR_LO_BITS)

DYN_ADDR_LO_BITS and DYN_ADDR_HI_BITS only used for *_MASK. So

#define DYN_ADDR_LO_MASK GENMASK(4, 0)
#define DYN_ADDR_HI_MASK GENMASK(6, 5)

> +#define IBI_SIR_BIT_MOD 32       /* 32-bit vector */
> +
>  #define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
>  #define DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK   GENMASK(30, 29)
>  #define DEV_ADDR_TABLE_DYNAMIC_MASK		GENMASK(23, 16)
> @@ -217,6 +223,7 @@
>  #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
>  #define DEV_ADDR_TABLE_STATIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_STATIC_MASK, x)
>  #define DEV_ADDR_TABLE_LOC(start, idx)	((start) + ((idx) << 2))
> +#define DEV_ADDR_TABLE_GET_DYNAMIC_ADDR(x) FIELD_GET(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
>
>  #define I3C_BUS_SDR1_SCL_RATE		8000000
>  #define I3C_BUS_SDR2_SCL_RATE		6000000
> @@ -264,6 +271,14 @@ struct dw_i3c_drvdata {
>  	u32 flags;
>  };
>
> +static inline u32 get_ibi_sir_bit_index(u8 addr)
> +{
> +	u32 lo = addr & DYN_ADDR_LO_MASK;
> +	u32 hi = (addr & DYN_ADDR_HI_MASK) >> DYN_ADDR_LO_BITS;
> +
> +	return (lo + hi) % IBI_SIR_BIT_MOD;
> +}
> +
>  static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
>  					   const struct i3c_ccc_cmd *cmd)
>  {
> @@ -1246,11 +1261,21 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
>  	unsigned long flags;
>  	u32 dat_entry, reg;
>  	bool global;
> +	u8 dynamic_addr;
>
>  	dat_entry = DEV_ADDR_TABLE_LOC(master->datstartaddr, idx);
>
>  	spin_lock_irqsave(&master->devs_lock, flags);
>  	reg = readl(master->regs + dat_entry);
> +	dynamic_addr = DEV_ADDR_TABLE_GET_DYNAMIC_ADDR(reg);
> +
> +	if (!dynamic_addr) {
> +		dev_warn(master->dev,
> +			 "<%s> unassigned slave device, dynamic addr:%x\n",
> +			 __func__, dynamic_addr);
> +		goto unlock_out;
> +	}
> +
>  	if (enable) {
>  		reg &= ~DEV_ADDR_TABLE_SIR_REJECT;
>  		if (dev->info.bcr & I3C_BCR_IBI_PAYLOAD)
> @@ -1263,11 +1288,11 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
>
>  	if (enable) {
>  		global = (master->sir_rej_mask == IBI_REQ_REJECT_ALL);
> -		master->sir_rej_mask &= ~BIT(idx);
> +		master->sir_rej_mask &= ~BIT(get_ibi_sir_bit_index(dynamic_addr));
>  	} else {
>  		bool hj_rejected = !!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_HOT_JOIN_NACK);
>
> -		master->sir_rej_mask |= BIT(idx);
> +		master->sir_rej_mask |= BIT(get_ibi_sir_bit_index(dynamic_addr));
>  		global = (master->sir_rej_mask == IBI_REQ_REJECT_ALL) && hj_rejected;
>  	}
>  	writel(master->sir_rej_mask, master->regs + IBI_SIR_REQ_REJECT);
> @@ -1275,7 +1300,7 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
>  	if (global)
>  		dw_i3c_master_enable_sir_signal(master, enable);
>
> -
> +unlock_out:
>  	spin_unlock_irqrestore(&master->devs_lock, flags);

create new patch to change original code to using auto cleanup guard(),
then add this fix to avoid goto.

Frank
>  }
>
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
