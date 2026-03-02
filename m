Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18526EB362C
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Mar 2026 20:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q6BCPBUvYKJh0s2sfZFSDuuy3yLt8pEin2AIoPx4DUw=; b=fsRRIAdBF721Ih
	KS6VXFeaC8qEH3oW6ULSXu/q6zhcujI/3CkU1mqjxSTNLe/suNLf0znwoFelS6HvM4MAZMzRI6S6F
	cEpiVwWOFT3MGsuH+29+Y/pVdUueItlul6XfxrqmryPmX+gpcXihafGvc1ecgpyAI2O+n01yO2JER
	ak/AaVKIuZPtXyuISqiut6GCZ8sJvcNO8dZ7vJloQg0ktZQgtv0W4k97kW4CfVquAyVbS0bib9L6b
	zjjrVxOmC1iFH2tyjjNxOqIyFI2VgdumkjwZ8VLng8DQqtqL0N18IR/XPbF7V6e57bXz1bjc+jj4v
	aOkPz1Db1b2n3L7p1tTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx9md-0000000DnI6-3TXO;
	Mon, 02 Mar 2026 20:22:27 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx9mb-0000000DnHm-3zau
	for linux-i3c@lists.infradead.org;
	Mon, 02 Mar 2026 20:22:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QS0s0hz+uV774AYjCIwyaRZzU07T/MeJbZLS1RUw+x+o2PcdHQiIibN8rRZeTwjeMqBJk51DCn04CsaIW/nblByZW091DBvaKd/VaKzoVgkVCuKpyByl5s38ZlBUNlA+CMI0tnbsdiFv+VEV2IOC+Akl1gXC0Ot/WEQssqmPwWcYFYCdiZ4YSusCrBe/t3Y4rFaMXjw0VSxBZuG/4Fw1suqIBzSHg5quoLSsYFVC7MiBt2n6vvihHW1c3+ilQIymwkn97MpFLWVye8lId9gARMh+LX4fGeHpOSRfke48znTzik5WlsqSHXAfL/B5k6uts9jVlcatGpRDFA+dghUjPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3onOX6U1j2SB3lW5x9N8U0I8/fxLpKWDCapOiahaItI=;
 b=KXwg0I65RpKr3JuKoLkJ6wfiZgSWDMQlaab7KNcQmTJA+QnIT9OzvXzM+A5iBhU8T7C4wNXf7/8auEn8ALdPCmYq+CBtro2Cbcc8cjn9BaXtOLR0DmLxPs6oVLDrmMeizbV8hFWxwdhYTxZefzn3U+WzfX2u9ruNTRUvwwGGG+GfAr0cgLCNoPkzxJndB09iz7G97cTueuINxm13PK9kbrwDzgg2t1paQsZq5z3GqPG46pZ1NZ6WpW8fiUvVknCkMbybnSM4T242q+2Z51zZC4Df8tYVFN7Bvo6YxloX8GLpbVxmRPXKKfsoJ0341Ep3SWDD497J4ZeIKi9YD3MeOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3onOX6U1j2SB3lW5x9N8U0I8/fxLpKWDCapOiahaItI=;
 b=E3hoI4ml+XUAug98NPhCZl1rh8PbR8dDFVRTwjAjGtdPCcdP/QU2zNH/aFWy8tsQ7f5csrHVCbmXTew4XTZAfi/t0HMnKPYQK1WuYoJ6/EfMF18IuHHsxUAv8XuOjYAK5oyXBsdVbTQ5OMnRTtqd+2apoJQJMohugiy6EeNdb4r+hzvmhMYnGPvsa9VlNArifnEXcnEbrF18i+Be27Qp2tUmEjrD4r+a32VGQyBtv/GGryZHlkbml907vZXrilG5Sybn2+eK7z/CHjY9fqhtbQCiFp4OuITT16C71FQzBwUPURldxA7ysIJp+mONhPDRSsZxAaAI5sD16HKWjRFxtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB7130.eurprd04.prod.outlook.com (2603:10a6:10:123::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 20:22:21 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 20:22:21 +0000
Date: Mon, 2 Mar 2026 15:22:14 -0500
From: Frank Li <Frank.li@nxp.com>
To: Peter Yin <peteryin.openbmc@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Zilin Guan <zilin@seu.edu.cn>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i3c: master: dw-i3c: Fix missing of_node for virtual
 I2C adapter
Message-ID: <aaXxdjfwyZSx9oO9@lizhi-Precision-Tower-5810>
References: <20260302075645.1492766-1-peteryin.openbmc@gmail.com>
Content-Disposition: inline
In-Reply-To: <20260302075645.1492766-1-peteryin.openbmc@gmail.com>
X-ClientProxiedBy: PH0PR07CA0063.namprd07.prod.outlook.com
 (2603:10b6:510:f::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f540621-f599-4cd5-a76b-08de7899687b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: LI7vhLIS99lAZTfiFs74G9eT9Nzd/+XYbHdA33Ylab16+AufPlR8R3NkCpn8CUP4zTX1P1MnjR9qCj/g3mMipXgih/R3fyCL/zafd4J6xsODSepYoCQ3AaZLbONSZ/typ4w+bAKNt4FAa+qPe0wqpwZuBNsk+Sr4XU2bnRvU7i29S8WaF1qiMD05g0OceY7wWyYg2o3I57dmKuZou2I4JNFavcjjyZjtLJIMv3fkNgDhKTAQegPU3Eo2qUo3ZT7K0XzW2MuRPOx0oRAoqUwKcE+YX9AvJwdMGbGCN7H9PhaH7q1VGkd8AYpw3E8aVV8CqiW4tymqF0kVyhnSRsEz7Ck9aCAFQkMzARU+S7r2dzGUNSCU65UAbdZ0B01or3F1H3Sqr8alksH6Q8+UxxnqB+TIl4woAeZswILysxxg/WK/A+buBExvhVNhtoEd1xohP4DoesHpUKeHhKh3Z49kLOWAXOPXvaeo9lb7hYJ7+e9pf5IVHjwZEzYKKtiUC1mXAAsWjH2riApTr/8xajw1+U64y3fakfNX1alWcLrkVdaom7CvNpIwV3gHCviYICtZDAwxCoi0nXWL6zGjdKmXBIoXWkKiwPqdul3oPOFZTo6HwyG/itwpBAZ7ypD+AfVcR2WOpgtwu3nqfc1CaMVmMKM1EdLF62YL5S2OWHuP57EwsNMcgHvFybEOU+iUpeEB6q7DVoNeK8r7AlTDOa+pg3YkKbBl5il4JFmLt//T8X+oaIz7rMZTf8plgy2CtOzSGCduabvftwE5d96/XzaS28i6ZmmO0KPBC3gn5lkP0jU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ypzH4zqS45y70p1fdLdkaMbJdFBpmJy75YEXbyknz/V9TbIBOqyxfJydAilj?=
 =?us-ascii?Q?UJJB5MwLH+W7oRZ2fjylWrYVwi4mwYR2J84XbrM5xGJEep3sQYTCHd7AJ9R7?=
 =?us-ascii?Q?Xa2QrqviTfBq6Cxcas1rOc4dgM/l+zM2VTM8lg8Vyy/mtzChq465jQD3E++7?=
 =?us-ascii?Q?xtEPVrKxGcnPLcYn9TEZ+7nzh+g4MNWx1eUng2wHf6BLG23dDSDm7laQWGEJ?=
 =?us-ascii?Q?bfbwjkdWhHn85romvRmitWJ0pgOqGtSfCn0URrRfQONYB2Chetw1mdEPKkbP?=
 =?us-ascii?Q?1N9vQSTpzT7Gb5HBJCozKRu8XibgoPIRA4dPYEhkVlBrMwASl75jO/0CSdqb?=
 =?us-ascii?Q?HI7e3ag8rK125XJbD1uYOlp6nQP9On5l/ZSmxddL6NvRifHer3y/0sRl540n?=
 =?us-ascii?Q?Qsd/oFPyZjJhp0z95s1fxafNfE03RgZC5Cqdg5CRl5m82o5WrMaNRKUuPdse?=
 =?us-ascii?Q?8RM2NXt7RGxvxRKUf/cQh84scGOiemMFXCKSyBYU3DTcjczYTJ7NtOCGtg3A?=
 =?us-ascii?Q?MSKdJfobS2kJHvAQsenBhUEZSeiQIFEWc9/Uj0H2ttWcphMpEPOB17PWPQl4?=
 =?us-ascii?Q?M9co9iwnh2ai/7dymDrhR8Zhkpe1HVd95ONbxiSW7V91gtkrWXy7aHyOxcBB?=
 =?us-ascii?Q?9qsu6OefujG4WiPjCapFT5521lym38f2YBqDEFVAj3xFm06e7DidYGThsPzP?=
 =?us-ascii?Q?NC/h7WTB8UFmSynnzHVvz+vR7eFcUbyhporj/pym+gloMnAhuFNq3FriRLWD?=
 =?us-ascii?Q?XNWPRyF4VGcRjPHGo2Xdlg82PPFb4Jp791zI415ynIdDlg+DJP+iboirFcC7?=
 =?us-ascii?Q?+dhutHos9a5kxGCcFrsh4LZdzyfiyUfUrVTCnnTnqK8nHekLhUo5fRow23WS?=
 =?us-ascii?Q?MO6wHdIz8KSZJpHZRSIzKUNcrkErESFtPJBNre4GGPs1tQIOQeQgK4mgsZpe?=
 =?us-ascii?Q?cj+qQWRfaHrDyT7/gYHUnd4Wa8tDwLhIEAvkBLaAoQ8mTG6W3gcq8rhVyyMi?=
 =?us-ascii?Q?A4OadUVg4wWjlK9aVXUMM6JB38Cl1KI1v1V1AXgJEHqyIN8SeCdASh/x9AEb?=
 =?us-ascii?Q?Qe3qccQLe0nkdU6KwPGJtXUL6GimdjLEiyw8pCXH3nfPWiA7Aj+s2igHeycg?=
 =?us-ascii?Q?gp0AZyxJRAawBuSJKv/jryc8FOEw5uIGOy3ToSDy4lHtI7H2YyFKnhlYfQSw?=
 =?us-ascii?Q?AZSbu7tCZatzAwTmfbol5ykx9/uAWCug4zPmRvA0rnQhvA+a2xID3mPc0t7D?=
 =?us-ascii?Q?/QoF5Gu1zdXgNlXyfsuJIJ3C0Eh1L4LxUh6FIM5GjFq0zyfmwvG77LSbBazq?=
 =?us-ascii?Q?wVpVvJb9EDtIdTDhZynEGvTZKsBc3DCQf8BL99pUTIP0cJd4/Wyy7ytaO0CZ?=
 =?us-ascii?Q?AyoZDt4ZJno4TtnV/cKeiSnNyRrLjdbX/VIpW57WgZUNQBCzR6M1/ZdJqAVn?=
 =?us-ascii?Q?lentwsdraSf6qM2HrXMH7c+zP/vx4B0ioWWjVu567Dzjut7kDPgCeOtfu6AC?=
 =?us-ascii?Q?RvCGfiub+AUB8yha2+8wYdIJGAEoijXlrVngszzDBmzIBRjmlHSHeuDpyupR?=
 =?us-ascii?Q?vPttDc1LdY8e0hbuPpC1r58LB+khhitApU2QBrTQtOGWUrtnK9C0A6ScjIFb?=
 =?us-ascii?Q?JkwOgIZrYPE3r11bHxdV+vDx7cflW6veEts2OPMgsuJtSa5JnBqeRneQqid5?=
 =?us-ascii?Q?TnXT9aV5bSPo8dGtuDrtGh+cvyFkpDLJpISFJ2MlSvQYbUugV1FiDp/5yerS?=
 =?us-ascii?Q?/ymYb8M3/w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f540621-f599-4cd5-a76b-08de7899687b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:22:21.3158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWdC2An/tXcmveejrBxVCwLBQwgjOOeSpOu9x1YkwSAJLPRKFDwc7WH1hT0EKM//Hmp6jBn/Uc6qZYIDTeJGDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_122226_001480_9E4B5FEB 
X-CRM114-Status: GOOD (  17.17  )
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

On Mon, Mar 02, 2026 at 03:56:42PM +0800, Peter Yin wrote:
> The DesignWare I3C master driver creates a virtual I2C adapter to
> provide backward compatibility with I2C devices. However, the current
> implementation does not associate this virtual adapter with any
> Device Tree node.
>
> Propagate the of_node from the I3C master platform device to the
> virtual I2C adapter's device structure. This ensures that standard
> I2C aliases are correctly resolved and bus numbering remains consistent.
>
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Changes in v3:
> - Use device_set_of_node_from_dev() instead of direct of_node assignment.
>
> Changes in v2:
> - Move the fix from the ast2600-specific driver to the dw-i3c common.
>
>  drivers/i3c/master/dw-i3c-master.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d87bde3f7700..d334c217c7a3 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1659,6 +1659,8 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  		pm_runtime_get_noresume(&pdev->dev);
>
>  	INIT_WORK(&master->hj_work, dw_i3c_hj_work);
> +
> +	device_set_of_node_from_dev(&master->base.i2c.dev, &pdev->dev);
>  	ret = i3c_master_register(&master->base, &pdev->dev,
>  				  &dw_mipi_i3c_ops, false);
>  	if (ret)
> --
> 2.43.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
