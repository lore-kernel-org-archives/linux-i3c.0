Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F396CD8C9D
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 17:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2jBRvkx/I3QQ1JJgKJT0Hp3097BBMKH3V4FTBgGC8fk=; b=OtQZMcixEnq51a
	UdkCp47mkGVbRXdM0rvqhBD2yeoMAJqI3p7aKZwr+EUaRhlxm2zYh9RKB9pJ8EfEP9oa983vh0Sof
	OoL8WY1aZ/EThIuoYNmlMbFiZbpNZRt1pYQIgxBlRHL7HL3kLWiuHD9h9vq/skdmOqTOh+DasY6tT
	xhojPgb1oESiHMn7DQiGJgi0B8sTO6N/zHGHsWGZY/L287Vpmn7dbkMTFYAwFTv4urs2eZbkrON+u
	y1NGZ030It7ytb7+RXZ9kGz7qjZqu9O2/5bJi3EpLSqqm3V7SezOp2R6twzeN7ABN7Z5Rwunb7pMQ
	MV4UfC2JCNTLnGAX1SOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWe85-00000004Ds3-0XSB;
	Mon, 08 Jun 2026 17:51:17 +0000
Received: from mail-northeuropeazon11010021.outbound.protection.outlook.com ([52.101.84.21] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWe82-00000004DrO-05SA
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 17:51:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwfauaMjcO43695ktiXCG8Df61eWXDF6ehFvg0pl0NUaUR4zZPKsbHl2ouyfFoPhF3OD4PN+s3fRhGAZT7cnCMNmc3uX1ujkPWvtbyPMs+pteBEbkWNFy+e6bcTw2AYHZvEagPlS0nzltrxwQWvPjv6wGq7db4hH2n0VbiVmk/u8Utz4WP/6jFbgbBl4Tz5nQ77wwo1SwAjL+p3+2W/YYD4lsz2VJ0a3gVWBldVv9pG9P0dWMZE2H/pbLVC6K48tb9wSvphtZA3t8Mqao+LawVMBqzw/oqyqtDkDpVxAdT2NQT6N7c0YuskxX37IsjpaHX9IAcow85upzOUWjSyWYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLAX6ZkRvkhwxZCt3Gg/O7Tcf5HZPQki3mWp5X2WnWM=;
 b=lcChVhZjR2u3fXD0NEu62aF0QCO9MHIKbw7zFNF65YiZfCpG1vvUnSbNCSH+YoNnI2OYo8qmprVrFH0un6tvfQuc5HdlUuzAkCVgKGGK+HIXiYeB2+yvI1VXf7o9fOATqOPIkliUQjllg77EF0sOLekkAe2krBXY0OncZaKSff8PwKnKcGzIgaWi4Z9snvqVAcCgIIfAsD16scGLVn0cvGpbL/LUG3PvbNM1RmWrTQZ5O7P27do5zXrRNfSADD65HAnlr/EQDKgSf921I/QduKS2+//iSxTObuAA0wehJI1BP+H1bpXF0vT+HxXoMFmHiLHmxmY+p9NmCcZGVxyz+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLAX6ZkRvkhwxZCt3Gg/O7Tcf5HZPQki3mWp5X2WnWM=;
 b=qHiniMiNDYCqvbtvUfxT2DZFSS+Ap1mq2oW5ViFhG69RH3jnXI42v2uXOOSQxCesub90HuauD31wbDYfvNMpXVw/gHqX/tOS4/k7UkILuSsl0tbAWEOAhrxTVGJf/4sEXWj27YgwZN5d1ZpI/nBnLEpTA7uL2fQB6CJ5mGo/Xh2alhvKHSvU0HfDbmGukHh5PljRpKhLXU1CDy6z7+DTmj2lKDDRvuksCYwCuzOx5oT7ahempoApcD+vCBTZRP5xSgIjJ5BfQEWaDew1Nn5P/wLACtLhWlgPKxxvrglQcygXvlPwPPMiL31IU0WNhS8bca0HSd+xoZGL8xwXsyvtnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8194.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 17:51:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 17:51:08 +0000
Date: Mon, 8 Jun 2026 13:51:03 -0400
From: Frank Li <Frank.Li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 5/7] i3c: master: Make i3c_master_add_i3c_dev_locked()
 return void
Message-ID: <aicBB3YVefLdwBFG@lizhi-Precision-Tower-5810>
References: <20260608075801.16111-1-adrian.hunter@intel.com>
 <20260608075801.16111-6-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260608075801.16111-6-adrian.hunter@intel.com>
X-ClientProxiedBy: PH0PR07CA0076.namprd07.prod.outlook.com
 (2603:10b6:510:f::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e4fabec-1f96-4483-4e21-08dec586850d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|3023799007|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ZS4TvFv0esYbpALmha3c01F4I4uO3I7GMBXf5S+yhHmBP1WAg+fhEGZiDMNVnKK0efOkgDfT/iDyY/nCUMawRC+IT0SH0ArNvuCTPQfBgdrAhqJt0bBZ1jl1HfuNojxADe/NEFwRQSX2EDYhDcg+4nHR4Iif09szBou3gZbLT2Yb+ezJJgtnbOMsjg9AOVsOYh4GPlbtCqiFkcQRbWp51wn08GAZXs7kwohoIkO7L/T0pXkgkWRIhuE3uPX2pSQd/ZZl8WmAuR4rzkpTo9cuGBQpwszFwEhuKtIRHoXe5dupfJ7lfzrTIZruP0HBD8xgSNFDVhswl0gBLwg9mNfScDTtpmua8QVvvtriu9XvLzm3a5T9kdMp/4DcOo9eRbFTkv33dBcnIB9XsmBD++9puoX2R50o7fILaAFqRhDyMnaPN07RN6QhWcAMB4w+jCInfPSlc6kcA4a23e0q1vnnoBx5SFlwBXIKrpvO8GV5szgy6bTQwtfkdj6Z+XuWCn1gj0NvL6GkvbGpEWE6M4GeIvODwdSnYujIi1FdR3kEUDsT6MOiIe3g5x4bcy3XHa5bvUymLbHKEnd4eq/QD9YVYfclvdvN4utFzS4yDoMDKBAQDd1LB8Zdddev22cHdZQY2yev1JxPkJIZoLnVLgZbMPiZ2xZUNmr2f6pogGF4UuZnCS6RgtjtF5dVVj0WaT/Z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(3023799007)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lnx8EPvOhXeQPXrpVg5LY6qZbjEhG8a0UqgfjahucbqCjyUBZr4tKvF39RB+?=
 =?us-ascii?Q?PdfTAc/YfMJwi4qir/3nGXWSmLvJcxbk2ilKKqlH7WawpC+gefxDjGebZVL0?=
 =?us-ascii?Q?Q0dtnbobry7bsEpiLHU/ibVWHSJFp0NPhqtg71Pd/V5+Fm1qRcX6Pl3Wwlip?=
 =?us-ascii?Q?PgnZ4QKvkD/3gW1c8lY5HeGOhd/uDLBx77yGUhWfwV62J5aLZ3zbrMsDDOzw?=
 =?us-ascii?Q?llZBrqQjI0M7Y/043ABEUGJgLA/y1nxwVJv5b4rKbL9GIC2nS8dTxmuZSX6O?=
 =?us-ascii?Q?ITEJVO2wSNQjWMqtQ60aKToGgBNYWpW+APeHgwfOImyro7FZSJLL8kyxCgpV?=
 =?us-ascii?Q?SY9us2CorAmO+A+aFQADAUTBQ2o08qZMKoC51Fw0veBrhDPJtK8aGx4TZp8d?=
 =?us-ascii?Q?+1hJTe+UK5PUv/2GmFnWpwK1A//d+Ib53CAUKgRTjuTaGONF397Q9Rb/y3QK?=
 =?us-ascii?Q?9n5HCbBa6bjfe7jC5iCD3fmHIskzEBYyUpj/aAhFnYvHKXV86oGeamNaTmfZ?=
 =?us-ascii?Q?wnhB+Ia09zyHBWpD2bpMBveOHgCvmXjFdOBXYOcKzjNARFpc7tA3ttVHWz8W?=
 =?us-ascii?Q?C2rXasU8r1th0SnfFuPBP9fITdalvyYj1IYiVl4PNtO0PxS5vKSfX9kh9CLR?=
 =?us-ascii?Q?D692E/bTRzgVTfEdiVScC9um2j2qa/omcIULk22lZtPf7qpRgB3ja8r2Qnd9?=
 =?us-ascii?Q?5JlToLZy81MwkehHR1oVXgWFPHaPs5apd/5PWarnY2srKCA0loSY90j+tGH4?=
 =?us-ascii?Q?i+ASQTWVYXUEaOQ5PDYo6MijV5R8OZk5nFnYLvrFfMbVO8N3QcdYL4FTUEn7?=
 =?us-ascii?Q?nfZVIM+0aab8nILmXJ8/OybEZK/CQiFkbLOuKQvTQ5mebEpzKjxwDNw8Sdx7?=
 =?us-ascii?Q?13j4tggHkuQILRROXceLyMgYRnzhkxm5HN/Q+jyKRxvV7kIV7BZW6jC4QiSq?=
 =?us-ascii?Q?VtufLCFQzKOCkZGrRF2EoVfjta5RqtqP5FfXmvvaPAKxIA1fCfPUEJ26sKAf?=
 =?us-ascii?Q?3314xostzi9jUPhEJihTzIhq4wqEpWie/wVlwqJQJxZEXCi25N88MAH9OKRA?=
 =?us-ascii?Q?g/evwnPHqkmTc4REm61VJRfE6QEyOK2CHGeOWN9OHsEqM19BgDbDKY1nVQbk?=
 =?us-ascii?Q?RQa5uG7s9wAIM/McHugnXD2O5YmewOcUDme30micKJuY3GSdpbpm1mCqpTEY?=
 =?us-ascii?Q?xzCbM4MMwYryzcAkXRVXb2Qo9bcqitV5Bng/p8ZzcZSSnMGGfLOQsbK2R8GN?=
 =?us-ascii?Q?Qb8HCsrf+ePCbZY88XWEWNLoZ53HAWOcYrVdBiX1OwkewRjeGcLIQja1wCaI?=
 =?us-ascii?Q?SGn+DeF7OTiYDgyxJlq+wEc7oAJ8EKeyYcgD8cyRWW0ARqKLckcBEOq6yJu+?=
 =?us-ascii?Q?lW6K+rhn+tl54fCAti4wIR8LudkVonjXuYiuTm3Hfqt+fP7LMzIFelxQ5mlH?=
 =?us-ascii?Q?yj2o3sqmIZz/3xHMRXa8891mETWlxG7NKZjgUUMgBZh1BTWiPWPTjzbO4vVv?=
 =?us-ascii?Q?aC58nlPeZ7I/pJRiuQX365QPHCWlxRY/soXvtIlgDeEW1JHqq5lYP7pVXl23?=
 =?us-ascii?Q?YbJloPylj7mfdMjo/uqBqyyIsdqKXYVyxfcdEP6lXzFls2NLhBduokP/v3tl?=
 =?us-ascii?Q?32oWqnVhyZGqfnkEIJqLyanvmXspwUABBQZhibruh+sg45YWry/QKtFkl6J+?=
 =?us-ascii?Q?unVrMtdiOILX6LOw5GGR5y5t32wy+Trc77nKZk0JWiGG2HTsDHqAQcYWFpg8?=
 =?us-ascii?Q?REVzVG+q76ilrFlAoM8fYKTA1nXqzI6whoYms5k2InIQMBmX+sHs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4fabec-1f96-4483-4e21-08dec586850d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 17:51:08.3563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/hM7mP1pyVFvOXqrXqE0K3A984ZGaosMNvlLkYeXOsmH+8xvHZqsOtsY/RkQJ5m51GSoixLPfyLY5ILdy7ny2foPPH7xXZvflm9XpVxg7KhYGxNLVuLZVT7g0O8skKR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_105114_091762_4536DD4B 
X-CRM114-Status: GOOD (  23.33  )
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

On Mon, Jun 08, 2026 at 10:57:58AM +0300, Adrian Hunter wrote:
> The return value of i3c_master_add_i3c_dev_locked() is not used by any
> caller, and callers are not in a position to recover from failures in
> this path.
>
> Change the function to return void.  Amend the kernel-doc accordingly,
> fix some grammar and remove a stale paragraph.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	Re-base due to changes in previous patches.
>
>
>  drivers/i3c/master.c       | 17 ++++-------------
>  include/linux/i3c/master.h |  3 +--
>  2 files changed, 5 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 7b60b0c7f646..57857a3351c7 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2324,19 +2324,12 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
>   * @master: master used to send frames on the bus
>   * @addr: I3C slave dynamic address assigned to the device
>   *
> - * This function is instantiating an I3C device object and adding it to the
> - * I3C device list. All device information are automatically retrieved using
> - * standard CCC commands.
> - *
> - * The I3C device object is returned in case the master wants to attach
> - * private data to it using i3c_dev_set_master_data().
> + * This function instantiates an I3C device object and adds it to the I3C device
> + * list. All device information is retrieved using standard CCC commands.
>   *
>   * This function must be called with the bus lock held in write mode.
> - *
> - * Return: a 0 in case of success, an negative error code otherwise.
>   */
> -int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
> -				  u8 addr)
> +void i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master, u8 addr)
>  {
>  	struct i3c_device_info info = { .dyn_addr = addr };
>  	struct i3c_dev_desc *newdev, *olddev;
> @@ -2460,7 +2453,7 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  		mutex_unlock(&newdev->ibi_lock);
>  	}
>
> -	return 0;
> +	return;
>
>  err_detach_dev:
>  	if (newdev->dev && newdev->dev->desc)
> @@ -2480,8 +2473,6 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  		i3c_bus_set_addr_slot_status(&master->bus, addr, I3C_ADDR_SLOT_I3C_DEV);
>
>  	dev_err(&master->dev, "Failed to add I3C device at address %u, error %d\n", addr, ret);
> -
> -	return ret;
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
>
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index e2c831fb5354..f73cede87d36 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -615,8 +615,7 @@ int i3c_master_defslvs_locked(struct i3c_master_controller *master);
>  int i3c_master_get_free_addr(struct i3c_master_controller *master,
>  			     u8 start_addr);
>
> -int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
> -				  u8 addr);
> +void i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master, u8 addr);
>  int i3c_master_do_daa(struct i3c_master_controller *master);
>  int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa);
>  struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *ptr,
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
