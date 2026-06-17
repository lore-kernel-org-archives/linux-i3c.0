Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12676CD98ED
	for <linux-i3c@archiver.kernel.org>; Wed, 17 Jun 2026 20:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZQ9vcMWDqcYXnm+GtPGhfs2ASqsrb2NgQXYYCMjNaw=; b=otxBh9vc95CX6P
	9VWwD/DvZVVTxz057sORnqxtuhjqSmFOqwpWCy/GkjHUzd7X7iovETD+dprFwZn1zCTJoj9BdhPNw
	C5VS7coXMxzXE5KUljnEaI/SekUCsh2TdmyeLps3iy0u8d7RW7d5Kvjx5L8HDA+u17/8hMp+tymVb
	Bhr331UZAfmd523w6jFCnwPs6bI1w6yXQn60RMprMadzjLVRn1w0yGcgi6pWEytEJhXuaDc08GT0q
	Nselka+Dz08y4tCkAZrpYBjNXGv42NltK+VfIjvbBGr8AQjpcEMaE+ARTIzisuO41AZnJtxxWcAOz
	4zuLpPQBHoHTqAqBPJTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZx76-00000000K8H-3N5D;
	Wed, 17 Jun 2026 20:43:56 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZx75-00000000K7s-0FjC
	for linux-i3c@lists.infradead.org;
	Wed, 17 Jun 2026 20:43:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1SPEPfos67gckJl6O4diaTOcXgAYo/cAFBI+ntcx1B0YWwh8Q2ZP63aatT++3E57y5BGJ6S5gw36ISYgiVrOjKvuoj1dBmHt7Ul0Z54HdDz0zCDH5e4YUTMueTtUhwOnrnET7W8GV3wUDy7PC+UxpdZKAoiKkuZn0e2KRE5ng6ZUrOEK4LCHed12Do2lNK44jLecTfRctZ6RJpyvssi4AeOS8za40bQKiDMukwMJQ/PmI0G+f9QTWKdC3wGy/oljVGUOxKG4DGu0V/QpO238+e2a4JVv4FpFWedDxC7gHmeze3K8nxAy4l37xYFCbTXH2FxGB2XoVgdOpEjOYKCDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5a9wcdJV6e3Z60cqCTXDDheLjwEF48R5fIdGsMt908=;
 b=uLNiZqckL0IaazH2hDue5qzFgFhsQWNfq/uH6eopgq7yeWmoV7W6MsxtI0pe+HyJQTm9qST5h8Q27VsfA/rvzx/ExsIhRWolsHreVKmMxaCNHM5rlPp3jtq5+21li1NVVzMrFr0471iK2bMDpYaHzaL4Ntgg9ZonpVIvDKMW55UhsOy90Y5gsED6jXBGNYGy3J1QmFMEat8Jhcq/hrLh2w47Vdp0gpLqwWVGX+FimqZvtgZqHGR6VZxrSf+D2rqKZV5u9wsIcFX5uYDvpZ69ZXJ6wgwv8zTvfmKVIMLCWLkhfFDifrBkwiw1dHm7bVMG1ShHsCK5/VskoV6yUJNLog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5a9wcdJV6e3Z60cqCTXDDheLjwEF48R5fIdGsMt908=;
 b=tN19K4m9h9zXah5s585Rgh7UYqVuuCw/J9VWowR1WAvggpf15wKNyWmuPKXhotsVhf/cN6E7IBIilRAwkt1Z0GXSETI4Hh8XW5r8/+CKHWcpD8ElXK1vuWLDbYGy3ejvrgR4QjZu6ePOcH2cxxmzHStN597is0pCklwUtbrasb/WVVNHuOcGiYkZAX0nCPOFzpJzBaXOJb6kRVxYDSb+vbPmAg29udZBnocnE5tW6K0nPDUfz/Qzsodlf4h2GmQMpLGLyCpapumk03FF9bHlEtArDIp79IAdjeSsgjmGa4z1KhL9hlVuaks0l6JGoqDqwAEsS1L0/ZSTDbDTO6BIyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB7179.eurprd04.prod.outlook.com (2603:10a6:10:124::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 20:43:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 20:43:50 +0000
Date: Wed, 17 Jun 2026 16:43:43 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn,
	stable@vger.kernel.org
Subject: Re: [PATCH] i3c: master: adi: initialize the lock before enabling
 interrupts
Message-ID: <ajMG_yuwzqGhjaBD@lizhi-Precision-Tower-5810>
References: <20260617150138.628578-1-runyu.xiao@seu.edu.cn>
Content-Disposition: inline
In-Reply-To: <20260617150138.628578-1-runyu.xiao@seu.edu.cn>
X-ClientProxiedBy: SA0PR11CA0107.namprd11.prod.outlook.com
 (2603:10b6:806:d1::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4f74e6-074b-4c70-8d4d-08deccb122b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 5fR8uoLwj7iwhYQzkJPrKPVIBDV+CUlsDhz3xrPy3SdkX7SqKAtHbEVgWlBSvs5c3lGkcOOd4Kz+knPD3I91FB6R+m60DCxrynCEOYYJAoC0ONGfMKCTxeSdDpC7/Sgtwbs81HQ5xHMO27JWCamvnNRDE31sBva5b0a+OMPLYvMaeIltaSvWttKaIsVIGA/GR1ojyQEAaOhU507yPmGBbec/g7kChcVur6+9EBtLLZit6L5EUaBGSxzo210QIrFoec0IrcRzUJySUSe++KfkT/5dI5JvevO9NVWosu8CIsOvgSO5EuGmKGt5ucnFJ7Y//LCIJISoS9BD+FXmdn4UnkdwoanlH9t6mniyH00S+8o+JGX4IFmF6rG6Dst1727vLnsug5jBirVsSBGT+wBdEiy607DygQmxK7+wxDt9s3reHOYoxCwadLSJmQXbYgMAqIZdo+90ZTBrUa1LhFmDohbfEFiAD1ZguglNbUsxHf+Wxb6M3AeM1NyEI6yO6mjp3j7zXFiv/C8LMxSwqLmCMcfaFpd4Qdbn2wSVPCG+P5oazE40AO0bAfMS6akZiL6kXWUYNmZc4S4/wfzWmjXzKBaZiz3LJAatqwdTUpJ65rbRkytHfqimuU3rrpyp+rMqoPDlE++djSq+c21vUpjgTdruj+Acz/lEMKl0cWSyhO0+/CRysNEtQoggxIu3y8ji
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zyeR4XzPBpUoaLLLIOuImMhU+QeOpqcITiW0xcl2YuqwoO0tJgwZCDBuSj0t?=
 =?us-ascii?Q?bmAGOK7Ds0f5SGUP9gfbOoPJIUKrDgyv399lVlrZSbhwIu3pib3Jv0coR+R4?=
 =?us-ascii?Q?rWkESbflwFKt278+n3pvF8YI8xCyuIglf9g+x4C/a4jgk5EEz7zDONo/1ZLj?=
 =?us-ascii?Q?V+UGdYJMWiJXWo+WAKl169srxafC3VpenvxauEwtd1e6lvzZOXp4eLjFSpSl?=
 =?us-ascii?Q?8pW93AnBpB4z6K/8W/wkt1xzuo1psB0EH0F+KO9b0QKjuvPLMrLfNczeNUXG?=
 =?us-ascii?Q?rkj01bgQl9dE/R1YVEE/Kq/Fva1nmC/7/4M4e85aGPci21GX4h4ZnH9siJhP?=
 =?us-ascii?Q?UtnEQWbo2wuE/Wxi6e1/ecl7pGYFa8emizWeVtiYeW+hQIKr+a5H5duMIi96?=
 =?us-ascii?Q?A+t3MEWL5ZaAaL+exTH5lwDLi+rORYIz99of5ZIobPn6niFz9Lo9oB0iN/Yc?=
 =?us-ascii?Q?8Z2IL+t8P0u4w2jlBGeMB/aGvyKv69ENCKWCHzmQHm1LvIG+vnGwMt7DPvwE?=
 =?us-ascii?Q?hM6XnAxc86RdI47VLxMAeYHtJCgBg63AosO/1SfPmJYeYsMJL5KCG+EIm31W?=
 =?us-ascii?Q?OdqYio4kPdvstz9+IF0zb2suiWJ9CdSO8go2RkrsqkellmP+qNiDnGVCOQKN?=
 =?us-ascii?Q?d2VMQKlB2/miepKQZGm6FPTzTTbb6AvfOFNi+pVScGBJGKMjHXTdn7ZP6lCY?=
 =?us-ascii?Q?DFMhl5fPvmdOcm06EghLiMcBc0NkQtUPA2NZsdZ8RMqEuwOf6S9QrlxD3Fx9?=
 =?us-ascii?Q?vCwJ6IFFNBaTMlePLCmpV2Ik1LoW1rZb5K+ku/f/ZZuR5ftDVahnJuWm1PWI?=
 =?us-ascii?Q?M0iuJr0dnXySudmVMdo2Cifzc6NEg4W2hPbKCGhzQOzR+L86meDXJeQpwjLU?=
 =?us-ascii?Q?8zhxhjSaiqlBPI9YgSp+cENU/UGrv3H98c822m/q2pfzZ5cpWhH89MLYY9B3?=
 =?us-ascii?Q?JRcFMWEGr2RNg/PPhOnWuOI/YfmwhsYb85KEWYBMpraMF+peFFTzMwe0TF/L?=
 =?us-ascii?Q?XyQBQIrShldY/y90EidJcRstWIAkINRpRklYgvy0cVisMZ9uv+lAMMQeKFS0?=
 =?us-ascii?Q?n5ZgZD9UJffEw9VGvq+SJ4/sXWL8zsGpU4xKqWmdxV4vgG7+kj5u5VZTz6m8?=
 =?us-ascii?Q?N9QWxXnSya7SoTnQIhIw3cor1MVLhDHVKtf3pvJCcgBKVPluQKyj9qYWNX1o?=
 =?us-ascii?Q?sPzq6zbxniivNiqjVTwLyvSZxC8dabNgZI+jTWresfY2sgtJxMWDVm8IYW7/?=
 =?us-ascii?Q?HgX68A3HuZfoEo6NtAMnfNXsXUIGNQi7a10gPxQ8IQHr8h7qV8JOId1Q0fhp?=
 =?us-ascii?Q?wO5/un049RmTBwJuIv8z7mwAHrw7g2TluEdo6Y/7P5rW8Fr1L3Vwo+kgkN8G?=
 =?us-ascii?Q?fXJ1mbQAkoWGsuE38SRVOUcZRWr54gk/7tvTNex4mjnR85Q/Pg6DLsgHWyMP?=
 =?us-ascii?Q?Qvm7CbQn3B/zQwWeDVl/WvdS81e+ezXdxez8E0k+XgdzQUNBM3pWD8RdTyF5?=
 =?us-ascii?Q?fCodUmXjS5NlZASgU0uUXfqzEQdl1pSiotS9GcE+jCQvam/8+9xsOJd1hTyZ?=
 =?us-ascii?Q?mbNmjuUtqxLYSQ4GODu5/gU70hXiE6dogTzZU0YOoSdaZ1B1e5bpENkzukQy?=
 =?us-ascii?Q?hkDDLiudih806nzv/lI4xKvE5n4ZwRrCUmsFw4SSJwQDIewtwukQM4o0RodJ?=
 =?us-ascii?Q?s/s4mRrZlRSjBqpW4ATqp8fSWuvVB6XbxJ+ebJvU4UbbGC2bs7fHrdOTE8Fw?=
 =?us-ascii?Q?zcKI9JwiWPbQD6cMOUeUCCMUc6B4IJnahSWP45BL+0VElEDTwvvX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4f74e6-074b-4c70-8d4d-08deccb122b4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 20:43:49.9464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFCM7MKPQllS/d3jX2gRCdDQmzF1De7N4JYS1rj5XffQm0UKBeBUTUCGaD+moPXies9nli83xRGHFX/Gposo8mTkDqcevSOSEJv7a9ReoZrutU8d5myD4zIFBgM/lXgm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_134355_127071_E460998F 
X-CRM114-Status: GOOD (  18.28  )
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

On Wed, Jun 17, 2026 at 11:01:38PM +0800, Runyu Xiao wrote:
> adi_i3c_master_probe() requests the IRQ and unmasks REG_IRQ_PENDING_CMDR
> before the controller's IBI state, transfer queue list and transfer
> queue lock are initialized.  A pending CMDR interrupt can therefore run
> adi_i3c_master_irq() and take master->xferqueue.lock before the dynamic
> lock has been initialized.
>
> This issue was found by our static analysis tool and then manually
> reviewed against the current tree.
>
> The grounded PoC kept the probe ordering and the IRQ path
> adi_i3c_master_probe() -> adi_i3c_master_irq() -> xferqueue.lock, with a
> pending CMDR interrupt arriving after REG_IRQ_PENDING_CMDR is unmasked.
> Lockdep reported:
>
>   INFO: trying to register non-static key.
>   you didn't initialize this object before use?
>   lock_acquire+0xbb/0x290
>   _raw_spin_lock_irqsave+0x36/0x60
>   adi_i3c_master_irq+0x32/0x56 [vuln_msv]
>   adi_i3c_master_probe+0x5a/0xf47 [vuln_msv]
>
> Initialize the transfer queue and IBI state before requesting and
> unmasking the IRQ.
>
> Fixes: a79ac2cdc91d ("i3c: master: Add driver for Analog Devices I3C Controller IP")
> Cc: stable@vger.kernel.org
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/adi-i3c-master.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> index 82ac0b3d057a..cf873d46e10f 100644
> --- a/drivers/i3c/master/adi-i3c-master.c
> +++ b/drivers/i3c/master/adi-i3c-master.c
> @@ -967,17 +967,9 @@ static int adi_i3c_master_probe(struct platform_device *pdev)
>  	writel(0x00, master->regs + REG_ENABLE);
>  	writel(0x00, master->regs + REG_IRQ_MASK);
>
> -	ret = devm_request_irq(&pdev->dev, irq, adi_i3c_master_irq, 0,
> -			       dev_name(&pdev->dev), master);
> -	if (ret)
> -		return ret;
> -
>  	platform_set_drvdata(pdev, master);
>
>  	master->free_rr_slots = GENMASK(ADI_MAX_DEVS, 1);
> -
> -	writel(REG_IRQ_PENDING_CMDR, master->regs + REG_IRQ_MASK);
> -
>  	spin_lock_init(&master->ibi.lock);
>  	master->ibi.num_slots = 15;
>  	master->ibi.slots = devm_kcalloc(&pdev->dev, master->ibi.num_slots,
> @@ -989,6 +981,13 @@ static int adi_i3c_master_probe(struct platform_device *pdev)
>  	spin_lock_init(&master->xferqueue.lock);
>  	INIT_LIST_HEAD(&master->xferqueue.list);
>
> +	ret = devm_request_irq(&pdev->dev, irq, adi_i3c_master_irq, 0,
> +			       dev_name(&pdev->dev), master);
> +	if (ret)
> +		return ret;
> +
> +	writel(REG_IRQ_PENDING_CMDR, master->regs + REG_IRQ_MASK);
> +
>  	return i3c_master_register(&master->base, &pdev->dev,
>  				   &adi_i3c_master_ops, false);
>  }
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
