Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C80D1098792
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Mar 2026 14:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXIp7Al8GJy148o4kYy2xfqdkeFY4f98yoss89iWtyo=; b=C2tlLf397m6LrO
	6SqGazRMiGmR9xLtQyXuVnb2+0Px50hnPwAtfxHD9orxsVcLcSlHZyh5C0NvawDyKJ1pp3zQJuo4s
	z4i9/rXRlSQ51GUwq4x6GOsa9OFzp+ItqDpRSuLIM0GQN7oQkJNCBk9rSx5E0qtgjBugM5sxi1wIu
	PulQbUO7cBWbuzGGGtNtyw3PM2dNo9GSTSOC/Mk73feQR6rIde+NPWTj2srybxccwyV5pW4zEDZk5
	hxX51r8DoqTCNitiamojPsMa06gSpf0jRF8Mbzu90lUu6cK3MRSFYrnrOxOQ6cMDFv61xEbJlHl4d
	OsHxJa8eUjojB816uAZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3b4h-0000000CxTR-3Mxr;
	Fri, 20 Mar 2026 14:43:43 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3b4f-0000000CxSl-2LLV
	for linux-i3c@lists.infradead.org;
	Fri, 20 Mar 2026 14:43:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFgfUbKrVYtdRT4zEf+6QyYM4YYytJaHWZbi7Jd3JKmJo1wS3SsUr2OZMDaGqJVUUz5FaOf19lwlyUqsd3XtIhK9sLhlMmWGAq8Sw49vivDY329mYta/c81teNwMU9YEh6/CMKZuZ5tSK9IZx4lRQbF9U3GvR5K1jBKq2H1Sa3QBTqD+VOeDlbz04xi+PG5oXmSQMe5I7brfh/4T+PsRVY4/GTnyeDmy5HulNehPnZqh1XrhjlAK3KSjUfh4HBe8ozS9UVNs0sf4L/6a2afgFb+suVB90em6vJl/ZQBRMtmMwGY7ZvpwKz27mK4gkVuD5A784IrQjrVsOQFk8cJ2HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70aiAhrJecqG+nNNpIDC7qKbTvrpS+c6l6DG5ExvMsw=;
 b=k/ddzmPymYXB2rszUE5gZkjQvMt3O9+WKKN7UMJPmT+JxjZzYicnNH1urwp2izgG1Y07rZh55/V98UvD1DGD29YB4xhpEWkQxItQC0X5UZaWpVgGdGzxLnf7aEbD7hsuElBoOP+XbzadA6bLbdJxYTYprFI2yBtnL06S1JKyDH0MYqVLP8cnXDJtq+hTTiAhRQcIEXrYsfl3RyFG8QB3mH/JNQnRVVCtB4zrYEeWIf6yLklcJ0VTyRz9m8uVl3PanoTHIxto0xBzNTWbd0pEja9lcpMyypKPToa+79hWV3br4I08CRngAyrFh0bb4BOD20ZpyXAQcYXRwD96htvIBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70aiAhrJecqG+nNNpIDC7qKbTvrpS+c6l6DG5ExvMsw=;
 b=EZvBhkDx+fR0YGt/XirTrL6VDOzMcck9kq6ODNiSrMJkpDdCZ/PR7iBLXQ98l4DPDbnS+JfRWszJcR/1rqsIdfpAVLRHCxIyIGVUsS1BeXXtLQoVCbxw02wNsn1829GzVWL/ujX9igwaO/6O3HiOulB8nS73y5E7tyIP4KuC7OVvJEkZDpcFAvAhnWNVZF0oePvfRKRXlppL7mRvuvl7rY2ksXlfBhqCMMWu+M6KPDCFWjmvEXPlBiUObCY1cNrHCO4AOnVk5q8o1uaEByzZqu5z9s0xQQmFvLvaNfld2JA24mBuHIVWtDwnRHsp0LFY7hftjdt0RofK6mVDL3osDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB12007.eurprd04.prod.outlook.com (2603:10a6:800:314::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Fri, 20 Mar
 2026 14:43:35 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 14:43:32 +0000
Date: Fri, 20 Mar 2026 10:43:27 -0400
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i3c: master: dw-i3c: Fix missing reset assertion in
 remove() callback
Message-ID: <ab1dD-ZgPoANHsg4@lizhi-Precision-Tower-5810>
References: <20260320-dw-i3c-v3-1-477040c2e3f5@gmail.com>
Content-Disposition: inline
In-Reply-To: <20260320-dw-i3c-v3-1-477040c2e3f5@gmail.com>
X-ClientProxiedBy: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB12007:EE_
X-MS-Office365-Filtering-Correlation-Id: dec78a80-a3a5-4dc2-3556-08de868f0f42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|19092799006|366016|38350700014|7053199007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: cyBBQl8DosH+3tHr3JGT8OtUl7+oz3HcKLX3JmgAqWw+1DmNzN5+Q5ElYy+gKHmIW0x+U1XEfl7X+MLkl8poOOij5hIP/O1w1X69Yxf0Yl4tb4KST/HgzM79b3XoJaXd32gtzeZrJ1HSb3vXVMsiWikXedt2GhasDaCv9m/riTHxyGwpOGPeqtelQ27qd1xP4JiIBpj9JxqrnnNYI6PtbhLAiKipfH6Or8wN2MpUMK8mfl2Cs+3rLMwbYPpGysMybWzldoQteyOCg9E8xhx5mxZDYHdsbVjYOMLmvQ/DnySh6pROSUb+FriCqsxbYaPfMqTYl9BVVbthqZVcHgfB8hUGFhI/7VU3SyGldNFPXRvh7ytzkLLi63QQP3KL9DyRenIm1u5cEa8JwYj2uJeCsn73se0SUOfhNYN85XHSd4SllHYaYT59I6U6HiLKKeGjAPvCPnCWV3o6ACIQ5eMdW2QhZs53SmAxaVfLK/+X49jnbNgv0nXzvlrKDhRCoN8nvkg67dd2jmDUFaHGf0YlyhB4HJXxURmmJ/aZvPSP8cDW7hgRwhdIUr0BV4IEuWNoWiUzdPhzFlbavhr29XYMxqXnUn4/Ju/yHORC2Xw1PLihqBZuEtvwlCqtQ8Au96kpu4eO2tIMTRBezHNBapp0Q2RzwbE1YLKzT7DRmSP77iwQxAjpz7w3wzL5ZArSSHb5/Jx6mdX9DLnJX36ohqLcucif29/tGVwr78AlTmXy6owfQjSSKr5bZd70AeLgpt7Po/eRDmsfUVw9XQm4aFDF1j4KOkaiIkJccmsB02r5H/U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(19092799006)(366016)(38350700014)(7053199007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ax4BbIAvRN0IOGrs29aU8bFYnwYJENY20vZh8VQ+rAJ3oZO2Xym2HB+qRKyl?=
 =?us-ascii?Q?CfGPFS/MSuTQWzgbosvQTTzpccqr34xi17oEDkwPd2/UxJ2dX/dqxYJPwD6M?=
 =?us-ascii?Q?InI5fw3qQrEhNce3TFjxNzsXYwU6AjBJE8LvVkVgYgmbeHFzgY/lCq35aQMK?=
 =?us-ascii?Q?TCOKkQ8cvkoJrWqgwkmubgnsPM1ZSij9BYbeXATXrhILxpUXZIn7QVX1akGs?=
 =?us-ascii?Q?1qu4anf2yQXY73jygmlIav/cxiBNrG54FIDQA3Jw95p2iQEIoxBPzBTKrpOs?=
 =?us-ascii?Q?dBC+0HLmK4JnwCV07Z+nH4G72RRL3n1/ON+EnlRU2kzjluQ+JUSzyUEUk4LW?=
 =?us-ascii?Q?QR0NugZxhbLZpFRzEUXkraYKr82koKwRNkJkv8nYWl+LqGgwt5K3RAeFQZej?=
 =?us-ascii?Q?IC0Pj5RH3IFs92XyaDuP+H741k7ZUFWKKpwjaiytfw4YmKEw9S3MTziwGLkY?=
 =?us-ascii?Q?M2RwkMR0tYuf1Uj5gEUVnKdGFCoINiTPNSjx7aWbhLWjqNJ9i57q/13JwiKd?=
 =?us-ascii?Q?itmbo28SZDSpK2Awt+S6E9vPE5I/p2QQkdG2e23tMhT5uNKihm4I6GICWjiT?=
 =?us-ascii?Q?KOvIKrISfIU/gT+/hp8Q3vfRp/PvmJoECMABcO0PYzLIYXE8r2Ru8XG3lSTp?=
 =?us-ascii?Q?WpYAa6KBTsoE+xWKpRnlL/6wariQ1yAv7hu9amLRxIGdHttmST1MaXkjSEx2?=
 =?us-ascii?Q?08ZOA3Ep90pn/lqA4OfgMIiMExJLwcifb6XR5O5F2yf9OWWgmEbmLc9B8dTv?=
 =?us-ascii?Q?ZNOHWgpmt9+jYZaI9rAH7Wa68LoS7fVuirA1x9JKJk6znOJEWCfjZ7g/85p7?=
 =?us-ascii?Q?RsSmfcDR4Dl6HO8TWwi+XZrmap8ku43DUUUKyg1BE45TG3MXdrunNf0Uhg7g?=
 =?us-ascii?Q?zPt1M9evlwrlc2krHbU4SVnFTLsrvinELQnmamn93vqWYKxg2NeDR7El8D2x?=
 =?us-ascii?Q?3NfKpgVXvJsKOiJDoZ78jU6TbbHlpRAWrWaopCaNQcu2XuPIuyxY75AyUNqP?=
 =?us-ascii?Q?gZIKs6py70anGMIKY1D333eR6bqpEtuMcePn25fjC45mCNN1rIcCRFi/2lEa?=
 =?us-ascii?Q?hGiOOLBFekpDtlmjxFtmUpWamwJ3bJdgbF4Vy1h0zPVzm9PyZyl4p+3alCHG?=
 =?us-ascii?Q?I8RMcj52LZzkp5HuHY+H+r3ITte20QHqDNQaShYPulvIkIojrFgVj1o53zTs?=
 =?us-ascii?Q?RfrtJihf2K/+tjNCzyzU9EYnKQH3sTj5vToMR1/56hFvNe+MLbtt5+PqHGk4?=
 =?us-ascii?Q?qEnAut4yXTTJSJs8/PYUcCz9bXl8faeOCj1phjXsH+S8DHWEwHYnf5d9wj5d?=
 =?us-ascii?Q?g/ji2X1uxrZLwBD8texT8cBibLoh8adTIQXirrKgIcxCkU4S6KgTxIitSNk3?=
 =?us-ascii?Q?HijTLuNzUaxJ2SpgovhJhB3HeF4hznT7YhqS6PStjlAkrx4Bvm3yih7H4ioV?=
 =?us-ascii?Q?3GbLNu1zwDPWUv/oBGtjSjfUb1vYdixgm/aiKNQBbKWnwI/UynKB5b4xZiIL?=
 =?us-ascii?Q?8O53qy39yc48jTFrSOt5DtZY/XtXxllxkr+fOaBX9xrxUEL0O1dchGkfamzF?=
 =?us-ascii?Q?LCU3iL7DKgXZaL4ZoVxsDtskzorFTzhAYYrGj0NuWd5F9o3TR24rapZO7sJT?=
 =?us-ascii?Q?ntYPWi5eGKSCZHYZB5es7N4ZN+2/GtfV0BHdkdmT/ogjhzJz2Tqfq2D9MKIV?=
 =?us-ascii?Q?fyUqDF0Op1p3b6zwnAup2UWVuSFiuvecDpB/Czpt1kfhl0It7cy4UyfnXgCj?=
 =?us-ascii?Q?Y82qcL8caA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec78a80-a3a5-4dc2-3556-08de868f0f42
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 14:43:32.8874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +GKxY4UXNEqEaVi2vKHVbApdTAAbLW8xHrIUxpImaePzJyIWx1DyWxK7UGv6ATwGU0035Q8x0Edt1OCjzaABGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_074341_601473_4419B549 
X-CRM114-Status: GOOD (  17.99  )
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

On Fri, Mar 20, 2026 at 10:18:02PM +0800, Felix Gu wrote:
> The reset line acquired during probe is currently left deasserted when
> the driver is unbound.
>
> Switch to devm_reset_control_get_optional_exclusive_deasserted() to
> ensure the reset is automatically re-asserted by the devres core when
> the driver is removed.
>
> Fixes: 62fe9d06f570 ("i3c: dw: Add power management support")
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v3:
> - Fix the format to pass checkpatch --strict.
> - Link to v2: https://lore.kernel.org/r/20260317-dw-i3c-v2-1-fa57e6394b1d@gmail.com
>
> Changes in v2:
> - Switch to devm_reset_control_get_optional_exclusive_deasserted()
> suggested by Philipp Zabel.
> - Link to v1: https://lore.kernel.org/r/20260316-dw-i3c-v1-1-ab41904fc780@gmail.com
> ---
>  drivers/i3c/master/dw-i3c-master.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d87bde3f7700..d104807cf74e 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1606,13 +1606,11 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  	if (IS_ERR(master->pclk))
>  		return PTR_ERR(master->pclk);
>
> -	master->core_rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
> -								    "core_rst");
> +	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
> +										"core_rst");
>  	if (IS_ERR(master->core_rst))
>  		return PTR_ERR(master->core_rst);
>
> -	reset_control_deassert(master->core_rst);
> -
>  	spin_lock_init(&master->xferqueue.lock);
>  	INIT_LIST_HEAD(&master->xferqueue.list);
>
> @@ -1624,7 +1622,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  			       dw_i3c_master_irq_handler, 0,
>  			       dev_name(&pdev->dev), master);
>  	if (ret)
> -		goto err_assert_rst;
> +		return ret;
>
>  	platform_set_drvdata(pdev, master);
>
> @@ -1671,9 +1669,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  	pm_runtime_set_suspended(&pdev->dev);
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
>
> -err_assert_rst:
> -	reset_control_assert(master->core_rst);
> -
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(dw_i3c_common_probe);
>
> ---
> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
> change-id: 20260316-dw-i3c-e7a36bc90682
>
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
