Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED3CCA0EE4
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Aug 2025 18:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qN+vcJMPwxMFnxw2mH2C7vrba3AvgEP+dgYTfOahWPM=; b=En1qJ47CLYi53l
	WzL6s2ggpGPAHGGvPDLo5txtCmlQwG+HDtd+N3Z/QDHvkXETwAJlBn5hpeMAJqp4kyvvzRNW7trli
	1lLY/mRdi0RR+y8LjKcYFVJvo4009lzh8DwHLZGFzvDcbUe+5nLmtOjSmpy2HnBtHe6nY5Z7QMOYX
	8VHV3El4wRDM+MLf7kNhwxJ+wpcc8C+mTNla1xmRgMDiqg/Zwclm30MLNNFYYiqLRQQ9TIB6X6qwC
	dn1rgB/5AsUnf0Delv6X6pkZ6T6y6QByFCzbFhyd8GOl4SBzR7JHCYOKfFyFIlhHa5X+uvccOEbfN
	UScBTDz+a/xVZT+HbsrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4uL-00000008Oqb-0hTY;
	Mon, 18 Aug 2025 18:48:37 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo2k4-000000081oi-0Lig
	for linux-i3c@lists.infradead.org;
	Mon, 18 Aug 2025 16:29:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gL725TOrZh8sQrz9eU/8e0AS8rDOhVJRDDfHq8RMJGYi3iieAM5aiKVC0vX6O3q0FWxz/nowoa1LQ33Rja3CkgGAETyS7oVSZF0ESQmhRyMQKJEQUAhBB1JLSmQm0fNI9lYZNPggp3YKIZU/ohkX9gOk2W1yBRp9y1KhNHbXOgf9TLb4w5gyvBO793kaqaPdcGzsMirTokuJf6NwzPs6Oq5XrVdzkuIxVXYnK0XXoN9lrP9YCMzCFZSSctfB7U+LUQ+U3gmxlcROiayTziwlzf3he2rdmhNWqRvQ296RHZL0RND+bEIdSXOGNwXIDe6frNuJafOe0f3SVC9JjmBWqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rDZIzO1ncC4H4NKLElYqauAwkiMgoEezei0cphFqfQ=;
 b=CpmmDyV6Lg6YGsp7xuYzW49RoduLskr4gSC3F9CZ8pdFf7Tkcc7KeINJlZQqmDOzGGqamUh5fyINGweqb7WtJfhVRbMRr91qBvQNsFRHXviR8yraJN2hqSV2GuHJtJEsRTzS0mjLlmPQydJSsENE47Z1WLHQNyTOi3o2zIyWRd3kJzxfxbAdpirhCumhtD1iK8s0VgWsFt+5ds6vy1AJdDp+krrjjv7um96cmrdgQgh1vd1cuDWds8DW/BFrX0Llj+ummuERRawp/DQLyGMy4az2c9ufV/E1naFE6UpFx3e3KXpesjxAH4+nWMmx9X6Z9mwkcIMpyyBd19YFf486Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rDZIzO1ncC4H4NKLElYqauAwkiMgoEezei0cphFqfQ=;
 b=BSEzsz3A3UhfKYLnRNPk27TfUnvJBln9cdfnldNPrmmzrA8g6IEtFdYCoo1m/YiYa/2jWLwF85SUxNJGFN8vQwryAMue1BfZ7yMB2s+PpKzBDtCO9xer+9JNIcS1mZEahm8b7598jNpM27qByfrhvU3G9MCD4PcDYtm70ti3RoH63Am3fuFWfpgxXIrfZE9l5J1ZtoO29c8bSHMgEmCiSufvG/O65K0pA/lIqznBdLrSRPRAHM76bFse27MSKY1kH3uvA04//bHrn5kN6UCJikcb7JvMN1mCsr+qbZVlFUsO9llBKntvMevt0Klp3R/9nNEuRHBb3mxOtqHCaNrR4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8827.eurprd04.prod.outlook.com (2603:10a6:20b:40a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 16:29:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 16:29:48 +0000
Date: Mon, 18 Aug 2025 12:29:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v2 4/4] i3c: mipi-i3c-hci: Use own DMA bounce buffer
 management for I2C transfers
Message-ID: <aKNU9pyHA//wNUhL@lizhi-Precision-Tower-5810>
References: <20250815141242.2013767-1-jarkko.nikula@linux.intel.com>
 <20250815141242.2013767-5-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250815141242.2013767-5-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:a03:338::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a7b461-26ec-49c7-dc3d-08ddde74732c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TmLY/a+g74o4v8fGNNz+EPlfg4Tne7uo5pQSikcg+lOUWB/LJ99fX6i9AkC4?=
 =?us-ascii?Q?EI1mXEFoWHBqnOHXBTtL8KGg8k8R21pPVF1P6WMwAEUgJQwdkVWQWjcqxQ3p?=
 =?us-ascii?Q?pl36t2NoH91Fb6/Dy0j/36/lIOl/QfBSV6DZteDoBtgyVAIWvmB87q/cMezG?=
 =?us-ascii?Q?/AJev0qkU2+/noVNMzlKDMpWJGOQsj4uHftDkewgoky/iDfBjQrjHOlFZUBh?=
 =?us-ascii?Q?yGbD7eGar/gR2aAITe3Ek89uxQZWUL6FXLoPqrpKdWd0iZ0me57c1uHsCmZy?=
 =?us-ascii?Q?jein/7RR9Xk+d80QwjPxp1EaqMTbvUYoZxSxsTeU1Vgqo0401G4KgHBkGSh9?=
 =?us-ascii?Q?WA1HVif7325KalQR75jpZQF3awsRam8T/kZ6s6JsC24dWGeIUvac/Vdq0vOE?=
 =?us-ascii?Q?tijpvRUtGPr3n8dNyUQAt6zrRdsCYY6dCAYjbywD+A67J2jL21wgZpQTSXtB?=
 =?us-ascii?Q?pbZ1bSAg9a/mEfnELMIEqnI+SR0f+pIOoOBK1xy0gSt2QIfz08mhL64jXd/h?=
 =?us-ascii?Q?qxfwMedkQcaTNRduW6ifl8LPixaNdnglCdE6Kume+V27vvHgf9gEv9hck4Cv?=
 =?us-ascii?Q?fQWyvrNwUO8CGqDdfd8PtJXIfS3tmRaV5NCP4Kve5OQNTN8QTxLDmZ87PgtR?=
 =?us-ascii?Q?vPOuNLhRyQSjX1YvL5k1gZoLc/bY4XtufoYYa6/rrNLku6h0h+kXlX+uzNwV?=
 =?us-ascii?Q?VNL1brXZiCcajic24J0YVDP34WfH91RL1EyYS5VuwrdFFMI3+rVfgdI8e0+A?=
 =?us-ascii?Q?2DGsLxfjaKyu1cmikhpy+Q9nkkGIXpfDCIWedpC3bxeoDCRoQe3CszngPKmc?=
 =?us-ascii?Q?OlDWznSvlmaM1HEEkLbcVvdTOtIujhzJjjEhRGGY5H2iZZGR28Z5yGMgd5CY?=
 =?us-ascii?Q?OLIUBqt8AO873XJxRR6FEMknfFpoCiDScisNwffDPMQ4FrEgPX+wW8jHszPZ?=
 =?us-ascii?Q?hbRIPv3uw9cI82DK62SYKGbNN4nC/gFiP7ctxbpii++PlKDe9KuFNSYFKQVA?=
 =?us-ascii?Q?TZXJMzKOhLIwM3L15OfoAf6oAqlUiWD9BnF9UODEP0Z3y2YMDtPNYwUBUYsr?=
 =?us-ascii?Q?c52mrjqykRvmKgD89djqk85dISbD2474VWUXiMvc51vEN99XbH5THIgv8c70?=
 =?us-ascii?Q?i7b0t7UnRI4S9kqdT5RUgF3jJwfD85Bw9LMPt5NMYjT2YYwbkWcK5q1a+x1Z?=
 =?us-ascii?Q?UVVdT91HaeTIIMjKqI8exYDCXQDstJuXv4WmxfykYyeWkq7whZ71HCeAfVSo?=
 =?us-ascii?Q?2Cl6pH1JscWI+HTb/kdibCHLgBFupT9BfEVgVGCccXDUXoLO2S+tMvmmC7dK?=
 =?us-ascii?Q?Ii6JoFrG7YlWaqdwvj6Rx2flF7ZwD5FyAKciPFVOrkHL5Oc6UOKUXxRs/rBC?=
 =?us-ascii?Q?5mfn4uaPmdYohJj2K7aHX0c100Kk1PIss0e1z9SVQND95TsIa6c5p78BS/xD?=
 =?us-ascii?Q?Bg3nNJkFcFA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9yftcRXPncBdMEOvEPja64+JFMIQ0gMudP+eOOi4RfVB7zOD8wefIY04PS7J?=
 =?us-ascii?Q?AiWP4eyjVkLEsgP/xFXlrH0cDY1BEPriB4IX7Hk30OVzTp1M8NwPuSxZQR/b?=
 =?us-ascii?Q?eIUcywWepFHOAQzyQq5DGnGxjiOApPws21tM7FUi8XKne0mtpoGy8hAoBcHH?=
 =?us-ascii?Q?H3Z1gqFTTawK0hpBMMYutkX3bcHuir/CxZ1rMarP37OY7U4g47xq9GZkB/RD?=
 =?us-ascii?Q?8gFL/bSYH801hv1BilkzeGZP34JR8pNL7aThAn5G8xTIkRPcqPLIqLYmlu1O?=
 =?us-ascii?Q?yXOHdDeP6p2NBl7WWAIYatpzI2Ks0W0A97Rug2VUPW8JWXnxoksyVj5gFbTb?=
 =?us-ascii?Q?KOzTjqAyOyXLQhCGplfxaILBfkZpQLOUMs8XQWaKnXHw0dSz2iy/UFAr+Ss+?=
 =?us-ascii?Q?oirSq3BRc/whppP1UxQx4aWvej1yPOMCPSQPWUESZ2qz3FHG79kmmeVttMN4?=
 =?us-ascii?Q?d6NNQGitd9BKl2K9LY1Tw8JdpIK97azn5izT2R5XuBaPAcfg+gzgv8YUDB3j?=
 =?us-ascii?Q?1GhTl8BkVWT7VAgpe3CbCGif6S1WhCjCZFiQDgi/F7V3j0k0tFY/tUIgXGAG?=
 =?us-ascii?Q?Lt7w5JvW5VOKqFwItza3O4cJrkWWUc/daEV4CXF0gTlToMBIqw7EI0uOJGhB?=
 =?us-ascii?Q?C2bGKjssN4vEmiyn8qTS/VevAhgP8kBo6LNdgw8P5FVmZWfuF0QH+Yj4eQnA?=
 =?us-ascii?Q?VthDHYiLaT/+crw4ZTzt26rDDZ2Fz7fDzpfaqfxsz1NYC0EgBbMX5nM/5UI1?=
 =?us-ascii?Q?zG8tEvr4nCh7a28ePeyrbb5+fVe76WukMPcJsjpDD0D1vLH4KLMI/QZYebMP?=
 =?us-ascii?Q?sYbarSyX+OznMK1bmnonmoKC5Vi5++WVjzqattoPr5g3ONAV3wQbFPjH5vAp?=
 =?us-ascii?Q?Ry/cc/fJBsZEusSTCVw8uunhMZewMIRSJ/wqxO57Tno+syvDtiDMUlZRVAJh?=
 =?us-ascii?Q?BtsKH2vguD4962oPjmLNWR6sepUN/Hy8KBZpZBRRtPOa5gx8j0UUl2ytfBC4?=
 =?us-ascii?Q?QrWZ2oV69Qd0womgYjnBM2MWRdT1f3SR9MpzFaBTA8AU7XM/GM6GZs6LCr++?=
 =?us-ascii?Q?yWxJRJ5mMKv9Og9Mbmy9BitJzTX6mMoN69lflT6wjiU3OmRdxTTHLKn3cBBR?=
 =?us-ascii?Q?cqah6MCKD3M42T8+1+dEzbiTgBJlkv9z7vcYwnuU6A9iSujD6sc05iwF6K47?=
 =?us-ascii?Q?ABgDkwsKI/2fWVEEMpu3sHOuJIYdiC89h96zObtlLudKL05m7nvGPzS64yZQ?=
 =?us-ascii?Q?CYWtMJQsITyyMNKWH1Pro274aNsm6Qmk6EJD4NrEkdSA28kpoT2QzdDDb4Rp?=
 =?us-ascii?Q?0F9Wmfw/PFRAev0iWB6gLII3XcNhLvE8WxUp1ay8Qk+5fUYALDt2aev3su+P?=
 =?us-ascii?Q?NYkXaJldznm4UgbzI7cu7SRyeUOV5rEPUiwJd8wGBd8MUF5UK9zP8EB1Q4Ec?=
 =?us-ascii?Q?z8KjKMAH9jcp4lFNk/txxdCNym3xbR824y1R+C5LByMhrkoDcSVVLOrCn/oL?=
 =?us-ascii?Q?6h2ZwIW1iPHxQU6afsc/H6QPbm3x+nf97YU+El5WhZBotfERJWv7mfYSiiXL?=
 =?us-ascii?Q?IclcCqUmPpj3q+2dMVP2OMXKRtxtjkQJbQgYn/Im?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a7b461-26ec-49c7-dc3d-08ddde74732c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 16:29:48.8388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pddoJhZM1xpMB5xhChjXidAb3QS35I2QXPJ5+Kak6Hf3ZrdlKFlqXOdOIVz5wSfi3kL7MoipDZNkZxDoxPgwVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8827
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_092952_121391_DAF24DE5 
X-CRM114-Status: GOOD (  18.70  )
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

On Fri, Aug 15, 2025 at 05:12:42PM +0300, Jarkko Nikula wrote:
> Stop using I2C DMA-safe API for two reasons:
> - Not needed if driver is using PIO mode.
> - DMA transfers needs a DWORD align sized receive bounce buffer when the
>   device DMA is IOMMU mapped, which is causing needless double bounce
>   buffering in that case.
>
> Cc: Billy Tsai <billy_tsai@aspeedtech.com>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index b2977b6ac9f7..7a467ef65787 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -348,7 +348,7 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
>  		return -ENOMEM;
>
>  	for (i = 0; i < nxfers; i++) {
> -		xfer[i].data = i2c_get_dma_safe_msg_buf(&i2c_xfers[i], 1);
> +		xfer[i].data = i2c_xfers[i].buf;
>  		xfer[i].data_len = i2c_xfers[i].len;
>  		xfer[i].rnw = i2c_xfers[i].flags & I2C_M_RD;
>  		hci->cmd->prep_i2c_xfer(hci, dev, &xfer[i]);
> @@ -374,10 +374,6 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
>  	}
>
>  out:
> -	for (i = 0; i < nxfers; i++)
> -		i2c_put_dma_safe_msg_buf(xfer[i].data, &i2c_xfers[i],
> -					 ret ? false : true);
> -
>  	hci_free_xfer(xfer, nxfers);
>  	return ret;
>  }
> --
> 2.47.2
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
