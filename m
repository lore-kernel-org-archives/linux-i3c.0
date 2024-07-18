Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A05C52CD9
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Jul 2024 14:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z1Ec/ENdSCf05oMb2Ab+2NLIJLiqfSyNX0iHK6QglOk=; b=MhQ0UiDxtuWOnw
	LjR/obJlq1hVg3L/2gmOg4uxFyy0BCWBGJK+QftLIvFw+NFoYYnUgnbBkDn+/z8jk/P+aEtODx1+m
	Cox8JZw50KUsAHXlHLU1ug+bz/bg8dcV4Q6lcoaj8xfpUVRpaeoDdoyd7qu7wpRwqRiAgLEnVr3BZ
	nD7IBVvJd7nE70+XqNpj02K4ufQchSsHqVNDoh8xrWaLTJQiDqJM2FsagX4vXyk79HxgAxOaTkb1h
	DW0Lty6qhnpim+8sxnF0FsQNUhIp5dep3dtOD8Ghi+vbnXKZhkCiHY9XXezt+g65xaT2hejIEuWjp
	9aukkaKVSIw7boUOSWMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sURnr-0000000HE4K-1uOq;
	Thu, 18 Jul 2024 14:08:15 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sURno-0000000HE3u-3wKH
	for linux-i3c@lists.infradead.org;
	Thu, 18 Jul 2024 14:08:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7wyBGMYTHVBxD3wy6fMQeyUb7f3n+gCrSvQe+aR2d1UjG84yUdL0WUZsSFbIMA93zD3+IfaQUyAJrNn4EDmM8hXG1DRRzfgVsBVe4qRA6pyqfkS7m941K4B3s15Vt3ohzNw51izM4xAKXAlO+vqE1qFMEGkWGacnhSIqX27X/7XQcZpiFh9kxiyQ+HzhAcz6SOxrq/na+UjfPf0HklUE/ZGxldlWYLlFZuehh0RNVm2R2qqaNYZ1uKCfV3B6B6yH/ilGHbJjD0t59GEyMv/dvLEXR4OIP/u2xfdR4l5X1N2Chkmn/UpLshLN+5cE68UBFqMlzTyFaavFfcsCdG1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6c7TKg6MxpHpJIUjekMz3GNFFBs79nWaXO62Uc5+Lc=;
 b=B216P2oCTOxVDgarbm4yvq5CyfBdNYatGhsqJ+s72KnjQ9wrK/My8oJXcPtjlz3Ev1uLtNtYxo9U9uiLOY4Qni9XemMyunYz97ReSHFxfuJiu1bmJ8F7005WIOAUh/Z0aR/Jo0VsPaI7ux6wyoY7ViLD5/nEESCebvFJn2NnH8DchJjXjHS9SEgYgX/afCxqlT7BytKzQtgkpflLYpUxb2CnrRPa3+mTaOdtWra9KUndOY7VMHsrisdVYLDIEEB5W01iCBdtUJgJCyYRE2cgFNl/8GXzmNVrWFNwjWlq6mtr4J2eYTafF/kqYLapsE6hDpNZzKkCq+sbwLwJnT9mbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6c7TKg6MxpHpJIUjekMz3GNFFBs79nWaXO62Uc5+Lc=;
 b=Bo+qDR7IqtR9dzAmn0824lCzDycH9I5pHuCqzJdbJNImnqf4BalmSU67o5I6dldS3MLumRd4YKZSH4obXcAGp5DqGeoy/nT24aur8X2TQ3NYWJqAEK1UrHyIlh2ZaudtcDR53wrQjoHudbVMhELCLwJk8sbnzhlFw8lx38dUTWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9407.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Thu, 18 Jul
 2024 14:08:07 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 14:08:07 +0000
Date: Thu, 18 Jul 2024 10:08:00 -0400
From: Frank Li <Frank.li@nxp.com>
To: carlos.song@nxp.com
Cc: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
	alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH] i3c: master: svc: adjust the first broadcast speed
Message-ID: <ZpkhwIoyMj37EZIT@lizhi-Precision-Tower-5810>
References: <20240718091329.3788619-1-carlos.song@nxp.com>
 <20240718091329.3788619-2-carlos.song@nxp.com>
Content-Disposition: inline
In-Reply-To: <20240718091329.3788619-2-carlos.song@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0109.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9407:EE_
X-MS-Office365-Filtering-Correlation-Id: e177aafa-2cc4-46aa-a130-08dca7330c52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6EWwjQFrs1jCDyNsN4j4DykfiOwlhn/g+hKhBS8GNBlcZ8gCU8LZwg38e3mx?=
 =?us-ascii?Q?oGKwfmkhmEvaldbTHpRgTy1X2O7myOnneXDqygKt6S4oiqDjLPqcMLaM2ptU?=
 =?us-ascii?Q?PtOWdMlKgT5TBMzz+DdFVs3wqhyxL9C7HOSl1xcWX6F9a+1kluMVrOJ7f+vN?=
 =?us-ascii?Q?ZuGfsEFlC2CHEIf1H2xIDdxOFSUtch1ZIpaU9woozJT9cthqtW/U3MAUWsXQ?=
 =?us-ascii?Q?tXrujpvYIJzOEmmiujquDja2kUbgWK5EVxCIO0Cj+1RGYp3E6cRTIvtxcnnK?=
 =?us-ascii?Q?T/Uq+XG7RHY7daVzTY4PSNNYwO5B2OK6sIPxdQze/cNkp7a7sd0IeTrZgRIS?=
 =?us-ascii?Q?rO5/Zg8hIQqWzb4FDnuwYBpdGBekKhACoqM9e+KBiBRkyfPAGbRotelM27rG?=
 =?us-ascii?Q?SH1idta2t3AlHtfYRMxkI2QQTf396du+k5k9bqyyLuSroZLFlDqSQGcFpoMY?=
 =?us-ascii?Q?ApZNjOqSdhcwp/CYoBo4JW6MPQ6tTfB8P5uLfy3QlchGjOIwJ42V5RXCQ/v+?=
 =?us-ascii?Q?TckiQsj9VNJQ2j4eEGO7l8L852ANdn5HDbPvM+S9uf7dsmPtfyXUhcjjF0WP?=
 =?us-ascii?Q?wCZMqWmsD+OMZdJl+9bKYicLFXQJ9KBkNj37f7rRf4KdmUHn3OZzFIapu2gI?=
 =?us-ascii?Q?WFbCp0imqyHlhl7HOVNvR3bSSdxAtMWeeyEi9twgja1xiie4MSwBXcNtdCfH?=
 =?us-ascii?Q?lLNluJZKceBfAuJGNZ2Djxmr2qR6/RN1imKzdRNOBT6irbKQqJpzMkWL84ZL?=
 =?us-ascii?Q?HuMHhvux0k8VBxYBw5UkCbLduKSmEXsXlzCAItyNJOLhOfTcuHIqDhMt0pM/?=
 =?us-ascii?Q?YEvEj80CCo5q3U/J6cXPVA7NOxcGLV8fPGZvTGGHLZ0WAr9SqFTmvsBHCURF?=
 =?us-ascii?Q?uc0yLeVvslr325WVAM6evg2dpwIptIpw/GdjS0wjnqxGQ42Eacu05rKfMns5?=
 =?us-ascii?Q?mLv/LanvcMikVtUxIvNctJnZclvIHj+niY1vcELiYp1vZhpd0I/ORSth9RBo?=
 =?us-ascii?Q?0+rewtr96X4hUjEyVtxo4BSuI9PivRCqB16pVbGdaWZJMmlk5YoD7JZz0QJb?=
 =?us-ascii?Q?Aa5TaoLOegEw1v2iAqLSgNHZ0BtkV074jlx2Tb50qxbaXVcoEtf8h3AoVaW6?=
 =?us-ascii?Q?KG1HgCnAH+IkN6LfQMjahioCecVYkop1jTG+et6eP1Tq/oTl8ncnH0qYowQg?=
 =?us-ascii?Q?vwyl48vYDqP/4u/Nktm92B3Ww7yc/PT04JlD/11qFCyAm4A3FvApDlzF/JuE?=
 =?us-ascii?Q?dpe1hqQu6H/o04K+SSQrCBr2QbN6K/fgNfRrp8OlDAYyZ6eKKUsy8KLoHSB8?=
 =?us-ascii?Q?YcYGAzynQnB4NuF6QAVy8OT3p2ctRnNUJRTZ6Z0rNwaM/bSnS47fftonTbgt?=
 =?us-ascii?Q?oVy3rYJVczzpWmw9LS7mKw6khBsrkcLlGPZQXlU2CAMgrJs2DA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QrV9fhK5j3Y8KUD+QZTyvDfacg6qLUnDk5d3uxhznI14z0kAq10V2E2cVcoA?=
 =?us-ascii?Q?Lxl9CKaUbA2gHZJmzX8QMBaPamnqJaK2ZIcfikkW2Grm4trxUWkI83Mxs8BH?=
 =?us-ascii?Q?Lajam6pCOH/gzMuu3qguBdn+XDZESdGWpnwEfT9AoGtoDsuYTX7wlwXGXPIO?=
 =?us-ascii?Q?+r/v2Vt9a/hhUcAVCFKHLmMh7d+ly/k5P2FL1cNTiD2zfCAQvKeCEdNgOHAi?=
 =?us-ascii?Q?4U6Kxc2te2utWaz5jS1fH6RgSFkeGxNNeiQlSxscMdqbmTePeELwcJ3spF13?=
 =?us-ascii?Q?KqyYU58tQb5+E0VdsKfzaGa7OLBUmXGQUVI2Ju1u5aqQXyc7vXg8AwgbH28S?=
 =?us-ascii?Q?7WrCDj+e8LQuGsImOwMpSgbZ4rOmphrD7L2UIUAaBt3gb3TbDS+qOT2Ay7+D?=
 =?us-ascii?Q?e7SBPHoykL2s/hBxGsAkDBj8l0r1RpnphDUeQXhwA1ngeOxA2jOr354x6wHH?=
 =?us-ascii?Q?AW5ou7k9o6mahs8MP4UKOWWz67Ss4gHuXzbZdeTye9zmGHgEJ1oUzlXQt5yD?=
 =?us-ascii?Q?3OjNfzRjYkgG3eDitrhuFyRxp3cb9EX2M1MDfzEj8gh8lDCXESrolZ1kFv4B?=
 =?us-ascii?Q?1ZX8hqy0Hn45vsoTms9m0f+ZoRgGCk7jFAv8EKwr7kmrY8DZ/qRj+EFldqZL?=
 =?us-ascii?Q?rPR1Ut1rfMvAekO1x7yFk4pMyhPl7k0UKAdbMYwtkRvTArJg6AmeBar0O/K2?=
 =?us-ascii?Q?aLkfGj18GZ5iLRLTyWJ6qoxHJLC2aFj2ed/9TKRhKaNpEqZ1YozIZCtlSvgT?=
 =?us-ascii?Q?Jn1gDxrfTzir3r+fxno3Cq3TchagXwsoeRG3IqDRQqktIxg013K8bgakw8Zl?=
 =?us-ascii?Q?QEM/fajwu2BLz+XZ7YP0ApzQ9ewe+dWjBkZMpnHpuLCcF3HzeGxtEyEo6wpE?=
 =?us-ascii?Q?fyukyzpC8SyGBpPpjA/d+i82R1/C+Ax3T+LiKSES59CyrcmzmKspXcjHZLas?=
 =?us-ascii?Q?iVeeZ28JrlJQabt6prIZIRTnZ+q6ddp0evIdK03ojkIXaiJC7o6kA5xHdQ3y?=
 =?us-ascii?Q?5kn2IyZlNd74iFKF9Wa89vvXLJslAOTfvNRygqK7jtHqzSpaJM7Ie0L6KUTL?=
 =?us-ascii?Q?f5f/ONIKIa1/yaOlYZ9RbAaH0a40TE99qJilZbff9d0BDN8fuqkSOdmhtoSc?=
 =?us-ascii?Q?xia7apscZyXs/rcqI6nUwPsPx4EHKxUwkbEY50dUyJczJq1puZb31wBUaKla?=
 =?us-ascii?Q?Up7Rtc20xsdgL7gy/wZCQJbA/kdl53vRgRCVopj+9oD23PM5ouMIViRj+QRK?=
 =?us-ascii?Q?V41aW1jOmzcYm5w6MPNhpV5FBrybE0wZJsPOaiItbR3KqY/dG16QJ0hjiIIR?=
 =?us-ascii?Q?Lt1EvOvgrxOdkt3pAAz3osHkurzc52Zu77r7Q3lLp9kuqN5/V9xWOdHnTJ0v?=
 =?us-ascii?Q?RGXiG9ZKGAA0OStK2e4aN94clBLcmU2zfqUmVttg3t1TF8Lp0duyCUUVr8H9?=
 =?us-ascii?Q?lnLTsDXlknMmDLjh5ETYJBvUEIDEPRBX1fU+ng0hEDIWIf1LF9bFKbfF6j++?=
 =?us-ascii?Q?COtl7BP/6MH0zO9ccprRhvOSl9MuGWjcu69q9QhIyUVUSR2pZGN0kHEBnKI+?=
 =?us-ascii?Q?piMMIAzz75BNv9gZnI0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e177aafa-2cc4-46aa-a130-08dca7330c52
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 14:08:07.3227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcFBMpTTOPzQsmgN1qWUlb+Aegs7u/BNVN2Fsfj336d0yxvNjzPTzoXi+qw1ckv4gDKh6ODU1pHCB4NZoymVxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_070813_009090_FCC1E70D 
X-CRM114-Status: GOOD (  25.40  )
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

On Thu, Jul 18, 2024 at 05:13:29PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> According to the i3c spec 6.2 Timing Specification, the first
> broadcast open drain timing should be adjust to High Period
> of SCL Clock is 200ns at least. I3C device working as a i2c
> device will see the broadcast to close its Spike Filter to
> change to i3c mode. After that I3C open drain SCL high level
> should be adjust to 32ns~45ns.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>


If you sent two patch together, it should use "git format -n2", need
1/2, 2/2 in subject.

If create patch seperately, send patch one by one to avoid combine into
one email thread.

> ---
>  drivers/i3c/master/svc-i3c-master.c | 47 +++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index 78116530f431..2d68c8d34089 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -142,6 +142,7 @@ struct svc_i3c_cmd {
>  	unsigned int actual_len;
>  	struct i3c_priv_xfer *xfer;
>  	bool continued;
> +	bool slow_address;
>  };
>  
>  struct svc_i3c_xfer {
> @@ -214,6 +215,10 @@ struct svc_i3c_master {
>  	} ibi;
>  	struct mutex lock;
>  	int enabled_events;
> +
> +	unsigned long fclk_rate;
> +	u32 mctrl_config;
> +	bool first_broadcast;

	slow_speed may be better?
>  };
>  
>  /**
> @@ -531,6 +536,36 @@ static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +static void svc_i3c_master_set_slow_address_speed(struct svc_i3c_master *master)
> +{
> +	struct i3c_bus *bus = i3c_master_get_bus(&master->base);
> +	u32 ppbaud, odbaud, odhpp, mconfig;
> +
> +	master->mctrl_config = readl(master->regs + SVC_I3C_MCONFIG);
> +	mconfig = master->mctrl_config;
> +
> +	/*
> +	 * Set the I3C OPEN-DRAIN mode to the FM speed of 50% duty-cycle(400K/2500ns),
> +	 * so that the first broadcast is visible to all devices on the i3c bus.
> +	 * I3C device with 50ns filter will turn off the filter.
> +	 */
> +
> +	ppbaud = FIELD_GET(GENMASK(11, 8), mconfig);
> +	odhpp = 0;
> +	odbaud = DIV_ROUND_UP(master->fclk_rate, bus->scl_rate.i2c * (2 + 2 * ppbaud)) - 1;
> +	mconfig &= ~GENMASK(24, 16);
> +	mconfig |= SVC_I3C_MCONFIG_ODBAUD(odbaud) | SVC_I3C_MCONFIG_ODHPP(odhpp);
> +
> +	writel(mconfig, master->regs + SVC_I3C_MCONFIG);

	master->slow_speed = true;
> +}
> +
> +static void svc_i3c_master_set_default_speed(struct svc_i3c_master *master)
> +{
	if (master->slow_speed)
		writel()
		master->slow_speed = false
	}
	
to avoid set default speed every time.

> +	/* Whatever, setting the controller to initial configuration */
> +	writel(master->mctrl_config, master->regs + SVC_I3C_MCONFIG);
> +	master->first_broadcast = false;
> +}
> +
>  static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
>  {
>  	struct svc_i3c_master *master = to_svc_i3c_master(m);
> @@ -624,6 +659,8 @@ static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
>  	      SVC_I3C_MCONFIG_I2CBAUD(i2cbaud);
>  	writel(reg, master->regs + SVC_I3C_MCONFIG);
>  
> +	master->first_broadcast = true;
> +	master->fclk_rate = fclk_rate;
>  	/* Master core's registration */
>  	ret = i3c_master_get_free_addr(m, 0);
>  	if (ret < 0)
> @@ -1250,6 +1287,8 @@ static void svc_i3c_master_start_xfer_locked(struct svc_i3c_master *master)
>  
>  	for (i = 0; i < xfer->ncmds; i++) {
>  		struct svc_i3c_cmd *cmd = &xfer->cmds[i];
> +		if (cmd->slow_address)
> +			svc_i3c_master_set_slow_address_speed(master);


		if (cmd->slow_address)
			svc_i3c_master_set_slow_address_speed(master);
		else
			svc_i3c_master_set_default_speed(master);

will be easy understand

>  
>  		ret = svc_i3c_master_xfer(master, cmd->rnw, xfer->type,
>  					  cmd->addr, cmd->in, cmd->out,
> @@ -1259,6 +1298,9 @@ static void svc_i3c_master_start_xfer_locked(struct svc_i3c_master *master)
>  		if (cmd->xfer)
>  			cmd->xfer->actual_len = cmd->actual_len;
>  
> +		if (cmd->slow_address)
> +			svc_i3c_master_set_default_speed(master);
> +
>  		if (ret)
>  			break;
>  	}
> @@ -1346,6 +1388,11 @@ static int svc_i3c_master_send_bdcast_ccc_cmd(struct svc_i3c_master *master,
>  	cmd->actual_len = 0;
>  	cmd->continued = false;
>  
> +	if (master->first_broadcast)
> +		cmd->slow_address = true;
> +	else
> +		cmd->slow_address = false;
> +
>  	mutex_lock(&master->lock);
>  	svc_i3c_master_enqueue_xfer(master, xfer);
>  	if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
> -- 
> 2.34.1
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
