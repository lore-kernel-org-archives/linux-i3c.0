Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6525CD6E55
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jun 2026 02:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K2N4CX9iHFQVjRKEsQ++vSmlitCx/mldmBijzVoJVFU=; b=GRlc4RstcJLC2h
	wFRBEDsEUNchBqWmdQifLkSdh1Ry2Jf9PkxbVlTU2SSCewiBrr6KG/fVtsELlDHP7APk83gBq6TPg
	btzalIvnkrrR4gSYKkhnxIaR6NWUNlVJUrn1er44Cp2kq/Ey4m1jHXAauB+fUuMLX/VzRirfXeJkA
	8vquuopV9yY38Rf+Eb3k0zXyYTUrWTgMCREgebjbZj/Oxbu3NXm0Vo0sf58Jdx9NQj3Q+1nCa6jj/
	38irI7rOP7KBChXLCuHY2D4K0mWLIjVR1NNpWbc0Sz7jOxuLI+tUwuJveHS3q5HmHdQsjCkuzfJIl
	Dup4VO0Qyd5EMDB22spw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUFJ3-0000000CCYv-1rhu;
	Tue, 02 Jun 2026 02:56:41 +0000
Received: from mail-westeuropeazon11013066.outbound.protection.outlook.com ([52.101.72.66] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUFJ0-0000000CCYZ-2W8l
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jun 2026 02:56:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXgUohasmcj3v/wqfBuixS42468YUtfarFlpFAKFOlWJPmpITzaqQ4wWAZNWnLv2rce/wD6hr01UrHP3yUAqqN+v6VP2kw+P9E7fNHfeKqpRIdl4UYuQF/KQW36LyAS2IrmxpzOzUITlg9eUg+qm1/8sgcLRoxwGgXtEudaSvKNFntvUlTFXqd9bFe0sYHPbSQPOQ+CBnfZo28fIhXWTRDvhkKWuuEFoQlrXA5KG46jVXfGPp50+BNzlQMDPxLsEwfxdWuTWcpVA4Lc3bWVq45BIyfz6IxpPzdVNzES9y2kfTTcskbtjsLHD63dR3pYDKMr3kjAVR7KxaO2YlYxIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mf5pe+RHhRzBAf1DRfA6iDUT+XTgFXpxneDMS6huqJ8=;
 b=xDwtVfEXnYjcneYrzg/SSpMidDPLCnxN5S5cntxtOb8e5g6aMCKww7oZUBmxa0rvjJXjR4ji/3L3a2KCycjBVAofR+aN8MF1Od3QkDcsYp/Qw8TwhGrnCefZP8L4/tCWTyNuDI0/0lDQEAL5S6ukIHNDsHnsLEqvHhl6YNydxshKk8raP7SqirT/ewDmiM2SpnmhyRBTUXZFAINuWi7nVmksgklsd+smC67yM3dYoxVDaolxbYBcGhnZf7zaWikPHxzxDh+fbeUf1ZalWoEbR03tlFvhm1Zuvs56GYikijkSvQOXEX540yQS4NGAIyKP7sCHxYyEspSZ1mrHyYqY4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mf5pe+RHhRzBAf1DRfA6iDUT+XTgFXpxneDMS6huqJ8=;
 b=dxCwxPPZm+2MpmVc5TdlkciIhJuzynHhbPesOHn/dlJ2980kakShGreHbqAWhrDjDFsenJdZxDBgm75pSmax5Cizz8qggxMzaxsSAdE2KrFcw2nWWc/QVnHw395Xun57F+iMyKs4/rZE0vCuOGj4B0Xh4zyTtnUSyHv7cTeYyjqpeQMkAET0wD5S5OGEq8rLjXovBVrgir9Kn+IQkD8TZ12ll3hSvrNnFOr4jdhr91DKZKEYNJsN4mFIWSjv2d5jiTgYuKTs7Qggl+gbQ90ai9hf0OshLbrp/DlV2ZJ6CsiUahMj4A3kqug/q1n9b1u0hPWXu7OTNsiCrfpwL64yqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI2PR04MB10690.eurprd04.prod.outlook.com (2603:10a6:800:279::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 02:56:32 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 02:56:32 +0000
Date: Mon, 1 Jun 2026 22:56:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 11/17] i3c: mipi-i3c-hci: Add DMA ring abort quirk for
 Intel controllers
Message-ID: <ah5GWrOqdrTp7gZ2@lizhi-Precision-Tower-5810>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
 <20260515162621.57719-12-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260515162621.57719-12-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7P221CA0020.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI2PR04MB10690:EE_
X-MS-Office365-Filtering-Correlation-Id: 03c885f3-29ab-407b-6d68-08dec0528d45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|366016|6133799003|22082099003|18002099003|11063799006|4143699003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: QZLhGs6F7YtQqNbk5e3TZOE6HAyr+WgjFRDNCuV9k9Ol1h8OQNPG5wjswt0mIlc3FQMIbL3ylxIFAAck2dK2ZQpjMW0km8AlR/V95rce1QMuguYjboYlBYtUln1agIXggCS/lmpWd/4tXScqPaxGjgCASVLWtOzlsPBRLU79u7VeDtVSjsW73fjsaFWNBKYDur6E1sJ5IntOkKZyesXjrELHxh8MqZAHI/XvROax5ymJcFNP6VcJ5cOqyMdlyRzzfigm0BtEDBi8bbfWVELGdfG37r2TZGJqjRVbr1ntL0TZW9yoE+HEPIczWRVMlRfQfqkH9rYNd86NOT4iDDwsXPI/lxI73wen/O1nP6tRW+C++FHwXZx2k75z8m3g4iUsWe30NvkhkeOhTNft9tPxniC44U2tNYSSWEiL1fM4/OntqvWybtUyUABCQBGPBspvjgTkTpvQMRz/lno2lFsz7uXEWCPS/QjRo5YPpGLUFPcMPVMByIJ4R08vAUqTH2J0pSHDqt/svUFhMIvrXtN8IQ8JGBBL9IXgFefrvr+Eo/sRfo+l1o1GJde6+P5qsb2qWH60h420mlPb9tXNWMVZzZuJkV0YrRHwwbjISYCWvnL1l7qzAms7t8L7NIY+HP7Bx0Acm1YZz/rWeXHs6HtRmj5myyyVNE9w843dO255NwMQrLG5oZJKJWgx3ru37bhh4y5xat4Ew2K4igUo7bN/kRcxSNpSTJscMSBQ9AgH8TxzMD6oNjk/TPu0z31wM+v3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(366016)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0nN+1ub/rcAKWoYNMfHW3ULZ40YgH0IV2wHLbNGVxltC8OgMe1IIUd1WQ7tC?=
 =?us-ascii?Q?URQWmu+VR6hMP44Aa++elCovWNILY+fvtrcPp2mkuwckQu8HUtOeeJ5HDibO?=
 =?us-ascii?Q?Nxl2Vw+7nUd0DM1C0sCo9L6yPVi+wfDZCsOf5UbQ4IPrZF2NMI9EikAYrRSq?=
 =?us-ascii?Q?KbmdmV/SWNYRVK1lumijy3SHdNrPiECfO6DMv6FZjHnqKNc0nIhbl5Tw8cuE?=
 =?us-ascii?Q?L1Ea4EAhkCvDTk74fOTJVUPmwW9Oj3lkjle9+l23814IauqBOWzTUX39tYuu?=
 =?us-ascii?Q?9ums3QyYNPenk0w+DfPT1XVp3qjxFPwwIVJPAQBJTW9oklJAiWTs5OFOfQLl?=
 =?us-ascii?Q?3XRMZCmG1F5ppZ2aK5wEXVK1fnq8DuJ6w3K3bYV6gz8JaCKQQSeDAZvSO+RV?=
 =?us-ascii?Q?EIIDveSnFAGTEEO6YSSz/zFt07Rsdf39UZH0lbnCdFvL3RPJ7OevQ7hLtuFJ?=
 =?us-ascii?Q?PXeQH5GRrJVy/1mBWM9IjKTGDxSoucCiEMObZ8ast1Z94JpfPImnJDqkdcSf?=
 =?us-ascii?Q?1oXB+TMTKjE+V8AbMy+6FzfIa/yob78EDaB5TvUurIAq3dI26qQHFrf6+VW7?=
 =?us-ascii?Q?4qC9PIMs3+5VAKsRfZvSiBckWZjGEUSGOT4xEcfMUnF/IkRvJ8qQ/nxVEg0f?=
 =?us-ascii?Q?2N64MjAUtrBXfUGd7NIOQVqHEFHbbq9rXgube2TD195P9Ro6hLTQ/94bwLUj?=
 =?us-ascii?Q?gmX09wzTq6jgFZQQDRcTjbpbNZ29LioKcaw6ikcCqd1XV5ApD5I0Uox+WvhL?=
 =?us-ascii?Q?6At0KOjU+I8dEpb+KKC7Wium58D2JWSisgnWIEsynQc20cFUVE4l6D8mnS16?=
 =?us-ascii?Q?ZYsW6jIB3eXzAU+Qh9I+cRx+rJr08a5Aifd1FVlzLPM5szaVVHajMQ6FWLCI?=
 =?us-ascii?Q?YdALyoTSPoCFLSzSjLYqWzcAXs3ZZqp35NIYfRofXHNERIOjX/qh7ZLLwduK?=
 =?us-ascii?Q?GLxSwR50M9YxUXk1jlJ5fG5JxdzgxoZfQcvEKph9e58MoTyX6YsP4nytR2Nk?=
 =?us-ascii?Q?pDKK1WMgoyYY6cNI5aDH7vzoLSrDcq/6b7fuLoKiCmYxhwwlkNGV7xpGdx5c?=
 =?us-ascii?Q?LvAh2BHXu7ns06e3MLE9C/q7x7+1VTSb4Wj7lnam2N/+upWv//hidSujMpk7?=
 =?us-ascii?Q?AYq3PhXTXEXn5fjgv7EOK2C5Jj1O7Wo9kzO+Tu+kFNULWSs7U4H4JJqkLy4S?=
 =?us-ascii?Q?DALSZgS3n4/0sWr/qMqpylRiltJlm5k6E7YVrAYSG2rO80MNwGRl/YDLNqiZ?=
 =?us-ascii?Q?8UKSH1d2Cdy84pVP01vqtfosOELj5ZBN7gqpZNJ7q3sxt+9lvXRtfjtV3YRc?=
 =?us-ascii?Q?trGcFASpO5frSufl/Agcg5WavqYkitUtx8Aln0Jc+yKhbW5NoiWbDeJftF/c?=
 =?us-ascii?Q?XfdmDTIiGI6nDyWqfL6+cXsN5o4zfDxDCqgVco6R9jXXb4EGA3nXzw4MHozq?=
 =?us-ascii?Q?aHbvk1cYhjdsoc6UrFHkkpz6n1EYdtZre1QdBuUF8XGNPhqBMe5o9B/ME0uI?=
 =?us-ascii?Q?0D1egdaGxeVmVQz3svQ4/Zjw3kscCzhv0W41G2nxDA1pa8+xfBFZPkzn3Iy0?=
 =?us-ascii?Q?MGZduZVlPbvu1N5SmOmSb8IDDa64RGm9OeXQXVBVrVmRRlU9/upniWUAdh7I?=
 =?us-ascii?Q?YT5bdmcidMygQ7L38OgNsg1TptVl1+mJYQEHExQnp6SSKhkacUMtgf556bo6?=
 =?us-ascii?Q?a7T6wDpozIBBFEYg0hw0zQTefQTymblP0KOcy+J1MSm/NVd3dVr9mpWyfz9j?=
 =?us-ascii?Q?MlHbRMNPug=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c885f3-29ab-407b-6d68-08dec0528d45
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 02:56:32.4739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAwX4JG4NTHHXTvnMd4RRGRotnUXQSe+MUkPQbzGQNogsO9BXAi8C7rPt758/HP7Ar5P64ADQ42zv4TnyKfD9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10690
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_195638_670454_54C3C95C 
X-CRM114-Status: GOOD (  25.57  )
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

On Fri, May 15, 2026 at 07:26:15PM +0300, Adrian Hunter wrote:
> DMA rings can be aborted either per-ring via RING_CONTROL or globally
> via HC_CONTROL_ABORT. The driver currently relies on the per-ring
> mechanism.
>
> Some Intel I3C HCI controllers require HC_CONTROL_ABORT to be asserted
> before a DMA ring abort is effective.  This behavior is non-standard.
> Introduce a controller quirk to select the required abort method and
> enable it for Intel LPSS I3C controllers.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>
> Changes in V4:
>
> 	Factor out hci_dma_abort() into a preceding patch
> 	Make hci_dma_requires_hc_abort_quirk() return void and
> 	move quirk check to caller
>
> Changes in V2 and V3:
>
> 	None
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 18 ++++++++++++++++--
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 17 +++++++++++++++--
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
>  3 files changed, 33 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 770235ad6b25..8274c84b16be 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -231,7 +231,20 @@ static void i3c_hci_bus_cleanup(struct i3c_master_controller *m)
>
>  void mipi_i3c_hci_resume(struct i3c_hci *hci)
>  {
> -	reg_set(HC_CONTROL, HC_CONTROL_RESUME);
> +	u32 reg = reg_read(HC_CONTROL);
> +
> +	reg |= HC_CONTROL_RESUME;
> +	reg &= ~HC_CONTROL_ABORT;
> +	reg_write(HC_CONTROL, reg);
> +}
> +
> +void mipi_i3c_hci_abort(struct i3c_hci *hci)
> +{
> +	u32 reg = reg_read(HC_CONTROL);
> +
> +	reg &= ~HC_CONTROL_RESUME; /* Do not set resume */
> +	reg |= HC_CONTROL_ABORT;
> +	reg_write(HC_CONTROL, reg);
>  }
>
>  /* located here rather than pio.c because needed bits are in core reg space */
> @@ -1053,7 +1066,8 @@ static const struct platform_device_id i3c_hci_driver_ids[] = {
>  	{ .name = "intel-lpss-i3c", HCI_QUIRK_RPM_ALLOWED |
>  				    HCI_QUIRK_RPM_IBI_ALLOWED |
>  				    HCI_QUIRK_RPM_PARENT_MANAGED |
> -				    HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET },
> +				    HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET |
> +				    HCI_QUIRK_DMA_REQUIRES_HC_ABORT },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index f2d33068b8df..f9023cb3c5a2 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -597,8 +597,21 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>  	rh_reg_write(RING_OPERATION1, op1_val);
>  }
>
> -static void hci_dma_abort(struct hci_rh_data *rh)
> +static void hci_dma_requires_hc_abort_quirk(struct i3c_hci *hci, struct hci_rh_data *rh)
>  {
> +	reinit_completion(&rh->op_done);
> +	mipi_i3c_hci_abort(hci);
> +	wait_for_completion_timeout(&rh->op_done, HZ);
> +	rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
> +}
> +
> +static void hci_dma_abort(struct i3c_hci *hci, struct hci_rh_data *rh)
> +{
> +	if (hci->quirks & HCI_QUIRK_DMA_REQUIRES_HC_ABORT) {
> +		hci_dma_requires_hc_abort_quirk(hci, rh);
> +		return;
> +	}
> +
>  	reinit_completion(&rh->op_done);
>  	rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
>  	wait_for_completion_timeout(&rh->op_done, HZ);
> @@ -630,7 +643,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  		hci->enqueue_blocked = true;
>  		spin_unlock_irq(&hci->lock);
>  		/* stop the ring */
> -		hci_dma_abort(rh);
> +		hci_dma_abort(hci, rh);
>  		spin_lock_irq(&hci->lock);
>  		ring_status = rh_reg_read(RING_STATUS);
>  		if (ring_status & RING_STATUS_RUNNING) {
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 01237b12d32e..97c31a315a6e 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -157,9 +157,11 @@ struct i3c_hci_dev_data {
>  #define HCI_QUIRK_RPM_IBI_ALLOWED	BIT(6)  /* IBI and Hot-Join allowed while runtime suspended */
>  #define HCI_QUIRK_RPM_PARENT_MANAGED	BIT(7)  /* Runtime PM managed by parent device */
>  #define HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET	BIT(8)  /* Do PIO queue SW resets after DMA abort */
> +#define HCI_QUIRK_DMA_REQUIRES_HC_ABORT		BIT(9)  /* Use HC_CONTROL ABORT to abort DMA */
>
>  /* global functions */
>  void mipi_i3c_hci_resume(struct i3c_hci *hci);
> +void mipi_i3c_hci_abort(struct i3c_hci *hci);
>  void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
>  void mipi_i3c_hci_pio_reset_all_queues(struct i3c_hci *hci);
>  void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
