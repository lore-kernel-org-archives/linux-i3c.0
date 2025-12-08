Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F099D3B7F2
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Dec 2025 15:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pP+5INMDtsFdgfFh8tBWqNJ87z61/4Mu9N0vu0cAYlA=; b=oiF1pcDXbT6Pke
	SU0hdl0GQxStpk43YSMBSMFq03FgIHlF6KvnJEUNj/NemoXiM0o+4Hebx0ziWmSOhCcTZ0tagdBK5
	nccq26uDhtcg/KQmcvLa0VcSy0sZLNDCVTK7wwnYsDfVcT3DenCtOxKFc9sVmNy5dKLTxwCmLwQyq
	B8T1fRnP1NbMeh8tv3c8KynhR/X1P9mG0t/+moFFYk3MwttI+NJK2mgQPt3ElIGhbmSPWPqh1hnzo
	7Erg98ia7CzHmQCcvvWZIYBxK4PaqpLvt986qbb3fQSSdP1DkB0+IuxOdouk0Owy/toEEN0M34nRJ
	WUEfuptrU51U2fzOVfTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSd7P-0000000DEdz-2vQA;
	Mon, 08 Dec 2025 15:25:43 +0000
Received: from mail-westeuropeazon11011055.outbound.protection.outlook.com ([52.101.70.55] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSd7M-0000000DEdT-2q55
	for linux-i3c@lists.infradead.org;
	Mon, 08 Dec 2025 15:25:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQhWettj13/Pb8ovFyr4L1kIKzfQpiYMvC4+F07kwwu8sfPIqrXpK1uwTexuimIfVJOee2L4oeJrOqTXJ10ZXvjpHAE/tnzOP4Reh9q/LcGePTNIpw2VWwNef3mia24XMLLsFYpfrOjzcFf4Gnz3ZkXg4c7bq1AyqiYxUtey/aCiHal32CZJG9gVYexkyvrHY+zzxskzrx0jexS0EZh88lVfiWkikAbP5mHYJn5CG7+PnDibq2tC5a+SO53gvSO118QGxgIROAGWOF8LtX4yQ6vt2sB8vxFPtftpcN00DMhVG3X8tAzg1yexSco9Y7DbS56xi08Hv44FHMVRBrMUTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+2tfvVSSkiUJag0Km7QG9d/+MwGcaPJS+EJkCjCinE=;
 b=Ov4TrbOUA6xx3gVMijzp3hzJtoiED9VXjoolZm56Q0pax5b+aiWRHfMQS9xEpwXIBeJPJGBoV2dK3eCl/8uc/Yg0F7kJpVJFSxiNinS/X+lWw42X9MEFRPbEg1TVg3epi0691iCFi9mmGHnLVrMgmG/PDqatTYdel6ana5URCccOk0nC91YQyYoAUgwQ0rKYPOu26cuzFcHwCplXMARxtIn2GqkIrfBRFA3GfCMh3cDml9pjMzAnovJw9sIHgCiiMhjGhNkG/LQ5EG/4ELl7c28VO12qxhHMNrHHR6J3lcjTWRSowfl2v3oxQJig8/0O13tRH2LfO7H234uMpJlXNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+2tfvVSSkiUJag0Km7QG9d/+MwGcaPJS+EJkCjCinE=;
 b=WVDV5yvcDwSsbQgZox9rY7mXjE5LHj2dUix0onoYbNwTgK6ouD6lfu5T2r8WSSxyb/1wmJseF7ijRbRXajCF+V72GFQoStaxEcNFHMl7LKAbP+NT05RjQX9bz1IqfKAPm1VngL1WVs9fOE3FxchlT4MGhp6ehiozMBEqB7siWzyS33oBvZ9lmaU0PCdCcJ53WOqoqedslsiU1eWihTrZ2aUNwCL1N8iuCqsseAOl/WDsi5K/W7cPCDvTs8dcKjl9vK/ZfQjSjIHfxsjLeYSBCV6GBswN3QPKC+0F1OQ63Q0WV4C3xfqqaG7xoRSpxDPf1gHraIzNPXiYsefbRIdM/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VI2PR04MB10977.eurprd04.prod.outlook.com (2603:10a6:800:271::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 15:25:34 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 15:25:34 +0000
Date: Mon, 8 Dec 2025 10:25:24 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/5] i3c: add sysfs attribute for device NACK retry
Message-ID: <aTbt5I+rVoE6/w2M@lizhi-Precision-Tower-5810>
References: <cover.1765177110.git.adrianhoyin.ng@altera.com>
 <39c0289a838af7e6bbc5736f0d114b2e895556b3.1765177110.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <39c0289a838af7e6bbc5736f0d114b2e895556b3.1765177110.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: SJ0PR03CA0287.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::22) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VI2PR04MB10977:EE_
X-MS-Office365-Filtering-Correlation-Id: 381a1083-3d31-4af0-86c9-08de366e0809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ULXwReZ2GIRqJEOXLGL617c+6+pawTuI1iy1r4TWX3HmXCUi13IC1tVUx4bt?=
 =?us-ascii?Q?XH1BEwawZ9FrSWxYEvbR/JoHTsZX4rHCKHzqH+gTcBAjue75V0LJrZSOrs2g?=
 =?us-ascii?Q?O6mAvXn8X+vUu+clYzqbl6XD+iwtiOjDv3kmqXXIEzoNfPW4e6TQ4+K33hJF?=
 =?us-ascii?Q?iesbAQLwocwW3fB7BR+68vtjkUDXt77M5fJVNiSxSOLClmVf43DwDdjpVK31?=
 =?us-ascii?Q?CQ0hbtb/QUnePBsFcv5TilQ65X9yKXuXTzW7K0ghX1nH4PP1ZQzTl94qMCJJ?=
 =?us-ascii?Q?ykyWJr+r/pSUMIHEWOpiGPabPgBxsiSAM3lJM0cAfOXzdz1P4hHCM2uxzWlp?=
 =?us-ascii?Q?cHuv4FeTj/D9KN5N88TomkfQ8Edrm8AwT3/u0S7/ToWxgAJXFtbfy9r0/x5C?=
 =?us-ascii?Q?YVFvHNyihHAl+xy8WhEJV+pnj3GhED4NyDH+R0Cnq1KBqwsXsMSZp34ye+kz?=
 =?us-ascii?Q?13yKkOi23K8EfRAtFSfMLY4u9ZlN/2kVO6vgJpqahAdXGwLMZfSNbeU2Zk9N?=
 =?us-ascii?Q?6t4Ef7T+asWJoCu7gOZAcP4q5yx27lzJaob4y+g5DcBEHgp6R5YzGPz2EiL9?=
 =?us-ascii?Q?3Rd/nu1jStqQ/nkN/AKhh5kU95wKLevf1n+65nwZpZ7cAFSPyMCUjLnSr+Qe?=
 =?us-ascii?Q?xYZC7mlr2F2eegAmrbx5CjNudag/CYGigLfB1Ky5uLmroDOBPK5v2vVplcFD?=
 =?us-ascii?Q?2FvF5bLzRMLGeezAfXf7iI0OdgByEJwGvOY9xirlPQTLFuc5Urp4eKFmo9D1?=
 =?us-ascii?Q?ZA7qElS+ZZix8Satq3cabqIgwz4I1LfPvSr5w0Zd9Eno8FkO52ePSp9oTkNz?=
 =?us-ascii?Q?TkSkJSU6/o084sIZQXGtvabt6T8qZa5kpIYbkQfUZe1gGctuzRFRMoJlbDZ7?=
 =?us-ascii?Q?vaypkOxqgUh26xbFZmWC8R1CK5BhTSTsFkX0+i6txHM2jOqopqeD4bzoRiwY?=
 =?us-ascii?Q?/RHn1m/3S9kds2OLPUluL8rkB6gHEdmzNjHHmGa3JvW74/TML+TI/ZSY6DcL?=
 =?us-ascii?Q?QR9i9OHrVHKg6S2rm63hpsvwmX7guLs97QMzwfBYInU8wrDKT1kS5PkvlFrS?=
 =?us-ascii?Q?1ufEwVaJbscYD52P8kfxTa3N+nvNtCFQx2KHMo+v/XSdihm4R4ivAu6v6y48?=
 =?us-ascii?Q?tiHBkbFef4oasKgtCPZUZh2XKADFKBe0NDNIG9yPVPKiA2n3GANu+1/pzPEA?=
 =?us-ascii?Q?80/o2KKvOl0SfQpP2b51OKseP6SsHZI3OBjSV8GY5kh4IPZPPwS85x5S7sPp?=
 =?us-ascii?Q?/CVh8mT0tCEidKVCXyqAV9yh3xpdwt6ygA84NkBMMB4sr0HbczD9wU3lqgnP?=
 =?us-ascii?Q?6rzwPC/hxjrEbAompAnShnY8zqpiSB3pNoGuBvy8Bm+rJTWWt5S1HZF3QOYX?=
 =?us-ascii?Q?5jMweV04+LtZz9eJ9jjyA2/RXMVXRoFvTBbcFkg3K1wMHBQefBT9I/Xi2LTt?=
 =?us-ascii?Q?owfz9nkKEXTT0QnFjkvsBEgfxctVHbAgKdosTDfl7oi8wSxf6pPD84vxJc+S?=
 =?us-ascii?Q?Yib4X2D0p9AN1RprN5nEhk4y3p6ITHx4SP0s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oUIphDFNs6ggiy+KDjgA6YHbpq1I2eRVnUxvmGvc2hPNwQ1z+jNw5ft/NTvR?=
 =?us-ascii?Q?oT17Rh6OqZcCioxkuMEZLcW2EkTP98AZrsFuhEotzARVE2V9EPL+VXO0EQBd?=
 =?us-ascii?Q?4K7murq8lX4IqT5oyDbOnLrWLEg3MEjNOlbH5IxLPe2qrWnlYeVfOoNzDsu3?=
 =?us-ascii?Q?3enVgPFfmKcksomnxfUAZHb2Dsjgi5oY+8I1+vq6g0NUUgBECr5pLrIfl9De?=
 =?us-ascii?Q?WjHG2//l2o4IFFCAylnteqYYoGGDxv5vbrshw+6uPp/IoF3GRSHzlRNvzv2N?=
 =?us-ascii?Q?zbXp67cWymR3kokfcyZPfPjmeZlAXa8bMCwKvPlz5acOSXFgXKHx8F3TxqZU?=
 =?us-ascii?Q?F8wVL4UlQKgMGqmqRbm9Lv7Cs/laZer5m5GNL7npxqCGAnfb06G9FGvpMW0m?=
 =?us-ascii?Q?IHoqwDfEZZ1pBcSYbuJzc31Hg3XV7ZRoB0/Nwf7gNFmyFQuY7D2G8kn2zjuM?=
 =?us-ascii?Q?pc3ihgOGcMVoU53d1b1P22Fne5gYTU2ga57kshQhXVJlF9ltcYvRnPgB8/3d?=
 =?us-ascii?Q?jwffEoEEBsR/1pK6ZzRx0m/BCnEl1In+NS8OoRibB1Ny4vrDonmAGyasZXwp?=
 =?us-ascii?Q?/rZfD3Ge+r6DGvS7/RPPKzk6voDrHL2ItM74JwNhEkMgrTteE4JDRX25GYTP?=
 =?us-ascii?Q?oJau0tAiU+fEgO9+cTj7XSZ3SI0uFgmzjt9wdHIs7G5hA+CLbv8JqYj/CtPZ?=
 =?us-ascii?Q?LiqtjWOXnMTKscSqjAZzv7ctPS6ZIAOrgLhgW325ul6+7Cg81krqXy2bESIi?=
 =?us-ascii?Q?8dghnWVlvbXAqtjv6QHRbQw1M6X04ocSYyCzjgbYaBiasRnmJJZTS3eMQUKX?=
 =?us-ascii?Q?2VfOZfy6WY0b2vs6bwt+mcdqZ4pGJ0+t3IDg4c91mYVh61thIrwcrdyicmp0?=
 =?us-ascii?Q?2zM35JaVtsAmVhbfRdjpCrltQZIEXxnMnh41ZvDvrVqJDE2BQC5fqIsOV8XG?=
 =?us-ascii?Q?b6JJkVbQa4cuDfMZ3qrqvoiw/ulmDh+Cj7mMsxw9jP33TTtf4sq5jpKv1dyi?=
 =?us-ascii?Q?lVsVvIdRpI/u7or7rdjZLNzULgBP2lDYkwR113Q/Tu0V3WJ6o2AkDCWIV4el?=
 =?us-ascii?Q?DG7Nk3uLMXaVO/e6Y67r9hiI8BTsuQMn4N7jwpLDaIGMwRMvCPNC6egizhEH?=
 =?us-ascii?Q?VSYSoH3OKpgKV+yX119XXdsqRxkdPY1JiF+LOSucMTGWj4LjaLoOIkkCgVkh?=
 =?us-ascii?Q?adMCrYx/qX1EPjyayw4eGWZL9P7WTAQx8CKuxgdKGSJmwcw21O4tB1+f/i0s?=
 =?us-ascii?Q?AuoI5c96aspcCfzZZsjegpTHd103xjQw1bRVRSUzLy0s53cn+PwasqVTfBSo?=
 =?us-ascii?Q?RyE5IX8VYn27Vy+vJhhQ5evYm9T4dOnn+K+5hLVg++MRN1y2CONHumBIOGcx?=
 =?us-ascii?Q?DahLvEVlzLXOtbnMfscwCFMHSRmodvrn3PjKenHJeYwVXRvjUe0K6TgzgZuc?=
 =?us-ascii?Q?X6rLwXgGOTMJGzUcc97fYOMz4TVEH9sFRe6pD08lSQEWsoSFDC9XEFm5geou?=
 =?us-ascii?Q?+PBrADNNn3xVwmow1uVQ9+xy6oC2waXPYHAmaWOMfgVqwd20+1U7bFg0L447?=
 =?us-ascii?Q?swWP3LEWHSemu7EGciqSowyc9YFcQ07II0xpPDOz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 381a1083-3d31-4af0-86c9-08de366e0809
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 15:25:34.5635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1exNbWMa+BcHxCTjJ0sPIBWmsoVTl2uoo8xbKhCjAh3XZi3zF3PBrRGWOjS8RdI+lVjvISi6FJ0uKWobVN7uBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10977
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_072540_764008_8D1E255E 
X-CRM114-Status: GOOD (  22.96  )
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

On Mon, Dec 08, 2025 at 03:11:17PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> Add a `dev_nack_retry` sysfs attribute to allow reading and updating the
> device NACK retry count. A new `dev_nack_retry` field and an optional
> `set_dev_nack_retry()` callback are added to i3c_master_controller.
> The attribute is created only when the callback is implemented.
>
> Updates are applied under the I3C bus maintenance lock to ensure safe
> hardware reconfiguration.
>
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c       | 38 ++++++++++++++++++++++++++++++++++++++
>  include/linux/i3c/master.h |  6 ++++++
>  2 files changed, 44 insertions(+)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index d946db75df70..2903725bee03 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -685,6 +685,38 @@ static ssize_t hotjoin_show(struct device *dev, struct device_attribute *da, cha
>
>  static DEVICE_ATTR_RW(hotjoin);
>
> +static ssize_t dev_nack_retry_show(struct device *dev, struct device_attribute *attr,
> +				   char *buf)
> +{
> +	return sysfs_emit(buf, "%u\n", dev_to_i3cmaster(dev)->dev_nack_retry);
> +}
> +
> +static ssize_t dev_nack_retry_store(struct device *dev, struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
> +	struct i3c_master_controller *master = dev_to_i3cmaster(dev);
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	i3c_bus_maintenance_lock(i3cbus);
> +	ret = master->ops->set_dev_nack_retry(master, val);
> +	i3c_bus_maintenance_unlock(i3cbus);
> +
> +	if (ret)
> +		return ret;
> +
> +	master->dev_nack_retry = val;
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(dev_nack_retry);
> +
>  static struct attribute *i3c_masterdev_attrs[] = {
>  	&dev_attr_mode.attr,
>  	&dev_attr_current_master.attr,
> @@ -2962,6 +2994,9 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	i3c_master_register_new_i3c_devs(master);
>  	i3c_bus_normaluse_unlock(&master->bus);
>
> +	if (master->ops->set_dev_nack_retry)
> +		device_create_file(&master->dev, &dev_attr_dev_nack_retry);
> +
>  	return 0;
>
>  err_del_dev:
> @@ -2987,6 +3022,9 @@ void i3c_master_unregister(struct i3c_master_controller *master)
>  {
>  	i3c_bus_notify(&master->bus, I3C_NOTIFY_BUS_REMOVE);
>
> +	if (master->ops->set_dev_nack_retry)
> +		device_remove_file(&master->dev, &dev_attr_dev_nack_retry);
> +
>  	i3c_master_i2c_adapter_cleanup(master);
>  	i3c_master_unregister_i3c_devs(master);
>  	i3c_master_bus_cleanup(master);
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index c52a82dd79a6..5a03e5aea6c2 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -462,6 +462,8 @@ struct i3c_bus {
>   * @enable_hotjoin: enable hot join event detect.
>   * @disable_hotjoin: disable hot join event detect.
>   * @set_speed: adjust I3C open drain mode timing.
> + * @set_dev_nack_retry: configure device NACK retry count for the master
> + *                      controller.
>   */
>  struct i3c_master_controller_ops {
>  	int (*bus_init)(struct i3c_master_controller *master);
> @@ -491,6 +493,8 @@ struct i3c_master_controller_ops {
>  	int (*enable_hotjoin)(struct i3c_master_controller *master);
>  	int (*disable_hotjoin)(struct i3c_master_controller *master);
>  	int (*set_speed)(struct i3c_master_controller *master, enum i3c_open_drain_speed speed);
> +	int (*set_dev_nack_retry)(struct i3c_master_controller *master,
> +				  unsigned long dev_nack_retry_cnt);
>  };
>
>  /**
> @@ -510,6 +514,7 @@ struct i3c_master_controller_ops {
>   * @boardinfo: board-level information attached to devices connected on the bus
>   * @bus: I3C bus exposed by this master
>   * @wq: workqueue which can be used by master
> + * @dev_nack_retry: retry count when slave device nack
>   *	drivers if they need to postpone operations that need to take place
>   *	in a thread context. Typical examples are Hot Join processing which
>   *	requires taking the bus lock in maintenance, which in turn, can only
> @@ -534,6 +539,7 @@ struct i3c_master_controller {
>  	} boardinfo;
>  	struct i3c_bus bus;
>  	struct workqueue_struct *wq;
> +	unsigned int dev_nack_retry;
>  };
>
>  /**
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
