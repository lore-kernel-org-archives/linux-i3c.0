Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94E7F8E4B1
	for <linux-i3c@archiver.kernel.org>; Fri, 17 Apr 2026 07:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=syTGd9CuHtDBUFICFEuaWYo2xAjsCyzN1pyAXCwXqcs=; b=rKKDPaOWNE/ojD
	h0NduVMk+vsI07FKdB0+GHJXDzKugUVduysZVsOlM9bF5Lh8FFDPgv+fzfCtsBO56n3/SJHsVIpTU
	pVIpu+YU//Z43s1auxyeJpRYf/dJfUBckrCjBr582eG/G40uccw1Z41Oni6Q/Bo7L5X4N6coT5ZmU
	ZZCr1bxesvHrLc8OLMrQxHaXCm2im5PGtWYRz2486DE6puARHrQ2Enc1LGzWZqllT6ysA/zKAnbpk
	XtcuIsrV4m2QRONIskU7uVU9q2B8bGzxD8I40E43qjYdLrAiaiix9Thp3dTUrOp5TSwn2K0DCcmH1
	e4ufgqq9RfYWbhdVXlqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdCo-00000003ZIV-2MLO;
	Fri, 17 Apr 2026 07:01:34 +0000
Received: from mail-northeuropeazon11010067.outbound.protection.outlook.com ([52.101.84.67] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdCj-00000003ZHv-49iC
	for linux-i3c@lists.infradead.org;
	Fri, 17 Apr 2026 07:01:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBupLmTXmNqVN0r+dFFDeG3S7m8FhoXwCMemGYzChFhp0fvgjut6/GxpApExE3/xdXlYDe5D77xIV3xEqDI21EA4Tk0ja0eTbbiwSa5Q6QfrZo4Hw9j1Ai6oCO15oVNUcjoYW+fzRH6qtUxzIbviL2B/OZzBdNoPGzFu2e5Qmmepc00Gn4xLjLhNnk3opzXuck+1MM0BcTsxbBJwIkDlYbtQqHN4sPbN7Y93lPFkEV27a9JswozVujRJBc/WAq+ITKlQlbfCre6KU/tOTZg66kUaP7g7DIuEPtUvbcKx2Y6nfo0uUjJpFY4BrsFiA7xPqVRyml2GqAPJNOg+1+2EnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tp3RIyokkEk5niTCbbWkU949KDqEk2TP2LBdfgunDik=;
 b=vO/XyfKVr72ZOF+r+AnntRkCSz0k0D7GG6+6wUEej+t6laqnEl7sL1DvhurM1ZXpcfuS1jZFlJC81Iv1BZZzgv86kClu05Xch36LDGxyNRRCnxtQuJ8w3nXblMSI4fLkncsjAUN+qonFwzgge38Qh4oKn7EJ2e9SqDY5N5+oFstBPGs7leDr9f7Vu2KdnUC3f56DSoeiMTpyjteRFOI1FTwzMrmfx/5/1oA4hk0LabDtCxEO1gIoQ+2eYYwCpkxtlksHiWKLe8hvIWjgp1dQJ5MxvQfl1krxEV6d1DZAqVrbZK62LNn2spGpWsyRg2dqT0LrqSD+n508HGvneaxX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tp3RIyokkEk5niTCbbWkU949KDqEk2TP2LBdfgunDik=;
 b=h9qOritC++pt3KkHHlqNLZWwJgITbQrliB/1/x3GmKPPzZ7DfG5WM4ilGBGFzEabzG43J5hz+qUQWzGtezWrujtydrDNNtnk2bpMLhDX9XDVPWRqBxjsqod37Wvu7lUzE7NVUryxqOpxHzab3hNfZySNYBd8RWyPZX3n1gSEER7OPFe2vZZmrgnjqoY45tgMnmcIXcEG5Kk307+MY7JlhgKOM9jKB2rnO4QlIBev+iKj6CFg3qLdcUjR27ULsa2gMsfcU4gg1x4lYRxnbzhC8w5rqK/2L5PgM9x6WgPPzrfRQuU4ClTL2M8sa8GY/XVa4ZPZLq0ByYqrk3TD2v6bQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AMBPR04MB12591.eurprd04.prod.outlook.com (2603:10a6:20b:779::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 07:01:25 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 07:01:25 +0000
Date: Fri, 17 Apr 2026 03:01:19 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/16] i3c: mipi-i3c-hci: Move hci_dma_xfer_done()
 definition
Message-ID: <aeHavzP4XEowaI1y@lizhi-Precision-Tower-5810>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
 <20260416175704.41217-6-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260416175704.41217-6-adrian.hunter@intel.com>
X-ClientProxiedBy: PH0PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:510:5::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AMBPR04MB12591:EE_
X-MS-Office365-Filtering-Correlation-Id: 71095290-f083-4df9-d7c6-08de9c4f2398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|52116014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: RpY7kiAA9Ia0EBOVpIyh7BclfUlXDP07UCz/dYAiQNaEt3TwXFyFSvGEfRRpXfSnG6eHx1AD9+ZnKI29SoDif5Ngrd7XEECVDh9ZSvrYjM80ZxiGnBlv73MpVU3WrCISXSCZeqgsDgn887vVhTKRxCnBAYLg/YgguHxIxbXwS8CulOaZAOnxEisFV4otydRwpNS8QpeDlO0W0AvEvmgrMD0J3Q6/JoEXho7PyZGwxHzz3ZuG9/J5Myaz3fJkI8fOFR4xvtJfZhs2IPJ9b7IHJaVrGLt7nn36mkMBYlEmVAZDuAF8lg2WTnfYfQo00IFaMHYbtGmlFlvp64Ph+cA2CXRl1jZwhm2R1NoR1mcWK39xSgI2Rbe4AwvodKceEVHvblROR0+lPA6GJrBCnpLLAIsQSoh3l0GMpTy7K32f60GHyf5Mwg72BKp+1nIHAIMYHLgznzBUv/Y3wq2ujOn8T+Mm6BPmHDYoMVX2QBcxg+SoZ3wLinoJR9tp9zWDal7S5hwa3smpNBn5p5Kgq5FObLoraHfz6r99sRUDP9+czzYwEdIqw87EYMNLAIvHZ/AWzfu0uqacZDVCP+k6zW5w1V4b1qZRqXDKB0xIM4uBJv9V+6w71ZGusO2BAkoiKgA8HRQ/vs/SJ0JiFfELiRH+P6p3BqU9FoHYRomJSIyI3RkocNaUe5ScCOL9q25gMqiknRTGM4zkNMd6jppTs36smbZZGjnCll01uSM8VP3LlwbNTwU5gSSjXvB0MkUdMXVnczTgnDQC6WfytC3+oMA8tI6k7clA6Eyj2AUS/Bb4/Aw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(52116014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bWCtbfzGr8880vNy5If/G6b4VUEczEm9hQLIYnTl4JP6+H8UL3aO60xC64yp?=
 =?us-ascii?Q?fqXq81X6N24eVKTRPFqhParr2yc9coYfdXdM1XwF3uZxfGk+pdXjrTmUuqdz?=
 =?us-ascii?Q?0swCpBKMHGAMT2tojbeYXy37ReW3waSGm69aR14mc3fILfnwKfqb+9A1B4pN?=
 =?us-ascii?Q?BPAYDqwCbYJhRZuS+c31y1Ug2XIekNecEnC/WomUcVLONXovcKc7s5jxuSaX?=
 =?us-ascii?Q?AfWYC8JCtALFyINSI4DQ9CqtH0ubnoBX+clPdYNNK6qt1qqRFvAJADCDLJqw?=
 =?us-ascii?Q?BDQc0M56k2N+PLwueFSkAo4+2acq7SUXsnJDVp2btI9YR44GzhU0A8+AHpL/?=
 =?us-ascii?Q?/ToMoPydDoeE/I1d3i9CLLB0hKEic0ce+DwKKTXYbgIk+kGhX44j+E2wFxDm?=
 =?us-ascii?Q?q1Ms3Adm9+HZhPXtUYRjZBdM4q0oCvCME4i0LI2UWvNH2rCBSkBaj9wXeY/M?=
 =?us-ascii?Q?ec/plk7T0xcG+Go+JTh+TSaMMy7L5LA3YS58dqT9BAXuSr6H/Jjwh/6fHqSg?=
 =?us-ascii?Q?9RNgYKwsyw6F5wwtgEk6okiC8SaGyBM37jVNECVwqjgmX6pYvvD+WyVA/unW?=
 =?us-ascii?Q?OvKczaVPwgEGgFl6Jk1PDIpzyLaS5I51fhcJif8tze8wFljfRJTRGXSy2a/7?=
 =?us-ascii?Q?60BFvaKcbiQOOLsgAKb9APVrYJ0v/6UjjSAyWGriKZGIL+iLODWSytMoQT6d?=
 =?us-ascii?Q?EfbRCRNF7dUFsBiXzKO8pD5+/nlmQEkvzJorOOBjGr3z/DngRebTXah1A+5h?=
 =?us-ascii?Q?LnVAY3k2WY2OzglW3uxghjbTADtcGbGA3Zxf2ooO7OeA/bmzAotLZpemD8y4?=
 =?us-ascii?Q?hDxw59yQA64rc+F/W6QAwJIC4Xo+huaOJ4kyrQgAJSc0A3yl2LF3PCWNnQSJ?=
 =?us-ascii?Q?4Ulxh+xEwl1qQt6x/8cXygp0ap74vqgD9f/V3Fu28ipgQBTCp5R6YC6rIROc?=
 =?us-ascii?Q?YaiF8wo+0fukOT5P6ZMFi64GR10t/AXT8hi4r410a7qT9SH7h+iz2W1JT/mE?=
 =?us-ascii?Q?CEUDNHDKvG2pWMRs2zHiPQjxYVCQUE7X07At4cdn781JKbZV1WbSHkL6Ydt3?=
 =?us-ascii?Q?kKHPU+tuqnS/TA3q+12Vk7D+N43N9zpdXYvbcy1yXnWognu1rSjTcs1ktTdk?=
 =?us-ascii?Q?gh4o2oGRtTUUaL7Qq5N7UBuwwmMA/amsJGOV1WDs34sfTjEJkHH0J/PWMq6s?=
 =?us-ascii?Q?RPr00Iz4+SedCgqmTeDB+D0g9tbx+Ir5/f5OC0jATXkNtDMfiYQIWtzsPOHe?=
 =?us-ascii?Q?DNwZJOm8dOLTRa9IdpyOKb90C5QFVcQmUkEtvV0e94ZDGh6WiKN8I2AOnbOQ?=
 =?us-ascii?Q?fHLkAnxOmbrXsvtmrHBgzkugLdr8SfbPcO6pfnF7nwdxPCc/BWX3bZwn2P1y?=
 =?us-ascii?Q?Ir38k8gNEq+YLobReG3RIFBiXjUk/UMg/QJlslo6/Un/O8vxbc+TTi4Yz+aC?=
 =?us-ascii?Q?49Tlbn3bYZz8yt8iS5fZWS/Kex4QkZL5KlYZrLYyZy5Z5VSDUAlDjdJlvQ8h?=
 =?us-ascii?Q?wCx2h3GOzBobcPMVw2AEGapcoQFTYgR8F7xkkH8CS5yjCr8Z4CgVKSJgcODf?=
 =?us-ascii?Q?f39esGYjYAnPl2kcXJgXiv/qvAf3VRieatoh9TVot8vPuEsmk/7rl258NGlP?=
 =?us-ascii?Q?HDTy/FJiQFGObLeKKk+E6CSazarQ0ETdNLXeAlXDXkHJzhDP30N3ECY4waum?=
 =?us-ascii?Q?es6LW+ImrB4WMrWWC2+3Pw1cU4m6ECgZz2JmpUcRlJGFGZUZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71095290-f083-4df9-d7c6-08de9c4f2398
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 07:01:24.9262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ToRHNIkzSsG28++8VRP4d9dJycLZSJx/IeQP/8yNXmXZ6kByUnxIHELIB2YSxHD3hI2/PC2fKuubTiWCETPk2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12591
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_000130_033730_2A9F512B 
X-CRM114-Status: GOOD (  20.68  )
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

On Thu, Apr 16, 2026 at 08:56:53PM +0300, Adrian Hunter wrote:
> Move hci_dma_xfer_done() earlier in the file to avoid a forward
> declaration needed by a subsequent change.
>
> No functional change.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/dma.c | 98 +++++++++++++--------------
>  1 file changed, 49 insertions(+), 49 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 28614fdbf558..c9852b85d6b0 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -545,6 +545,55 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  	return 0;
>  }
>
> +static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
> +{
> +	u32 op1_val, op2_val, resp, *ring_resp;
> +	unsigned int tid, done_ptr = rh->done_ptr;
> +	unsigned int done_cnt = 0;
> +	struct hci_xfer *xfer;
> +
> +	for (;;) {
> +		op2_val = rh_reg_read(RING_OPERATION2);
> +		if (done_ptr == FIELD_GET(RING_OP2_CR_DEQ_PTR, op2_val))
> +			break;
> +
> +		ring_resp = rh->resp + rh->resp_struct_sz * done_ptr;
> +		resp = *ring_resp;
> +		tid = RESP_TID(resp);
> +		dev_dbg(&hci->master.dev, "resp = 0x%08x", resp);
> +
> +		xfer = rh->src_xfers[done_ptr];
> +		if (!xfer) {
> +			dev_dbg(&hci->master.dev, "orphaned ring entry");
> +		} else {
> +			hci_dma_unmap_xfer(hci, xfer, 1);
> +			rh->src_xfers[done_ptr] = NULL;
> +			xfer->ring_entry = -1;
> +			xfer->response = resp;
> +			if (tid != xfer->cmd_tid) {
> +				dev_err(&hci->master.dev,
> +					"response tid=%d when expecting %d\n",
> +					tid, xfer->cmd_tid);
> +				/* TODO: do something about it? */
> +			}
> +			if (xfer->completion)
> +				complete(xfer->completion);
> +			if (RESP_STATUS(resp))
> +				hci->enqueue_blocked = true;
> +		}
> +
> +		done_ptr = (done_ptr + 1) % rh->xfer_entries;
> +		rh->done_ptr = done_ptr;
> +		done_cnt += 1;
> +	}
> +
> +	rh->xfer_space += done_cnt;
> +	op1_val = rh_reg_read(RING_OPERATION1);
> +	op1_val &= ~RING_OP1_CR_SW_DEQ_PTR;
> +	op1_val |= FIELD_PREP(RING_OP1_CR_SW_DEQ_PTR, done_ptr);
> +	rh_reg_write(RING_OPERATION1, op1_val);
> +}
> +
>  static void hci_dma_unblock_enqueue(struct i3c_hci *hci)
>  {
>  	if (hci->enqueue_blocked) {
> @@ -636,55 +685,6 @@ static int hci_dma_handle_error(struct i3c_hci *hci, struct hci_xfer *xfer_list,
>  	return hci_dma_dequeue_xfer(hci, xfer_list, n) ? -EIO : 0;
>  }
>
> -static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
> -{
> -	u32 op1_val, op2_val, resp, *ring_resp;
> -	unsigned int tid, done_ptr = rh->done_ptr;
> -	unsigned int done_cnt = 0;
> -	struct hci_xfer *xfer;
> -
> -	for (;;) {
> -		op2_val = rh_reg_read(RING_OPERATION2);
> -		if (done_ptr == FIELD_GET(RING_OP2_CR_DEQ_PTR, op2_val))
> -			break;
> -
> -		ring_resp = rh->resp + rh->resp_struct_sz * done_ptr;
> -		resp = *ring_resp;
> -		tid = RESP_TID(resp);
> -		dev_dbg(&hci->master.dev, "resp = 0x%08x", resp);
> -
> -		xfer = rh->src_xfers[done_ptr];
> -		if (!xfer) {
> -			dev_dbg(&hci->master.dev, "orphaned ring entry");
> -		} else {
> -			hci_dma_unmap_xfer(hci, xfer, 1);
> -			rh->src_xfers[done_ptr] = NULL;
> -			xfer->ring_entry = -1;
> -			xfer->response = resp;
> -			if (tid != xfer->cmd_tid) {
> -				dev_err(&hci->master.dev,
> -					"response tid=%d when expecting %d\n",
> -					tid, xfer->cmd_tid);
> -				/* TODO: do something about it? */
> -			}
> -			if (xfer->completion)
> -				complete(xfer->completion);
> -			if (RESP_STATUS(resp))
> -				hci->enqueue_blocked = true;
> -		}
> -
> -		done_ptr = (done_ptr + 1) % rh->xfer_entries;
> -		rh->done_ptr = done_ptr;
> -		done_cnt += 1;
> -	}
> -
> -	rh->xfer_space += done_cnt;
> -	op1_val = rh_reg_read(RING_OPERATION1);
> -	op1_val &= ~RING_OP1_CR_SW_DEQ_PTR;
> -	op1_val |= FIELD_PREP(RING_OP1_CR_SW_DEQ_PTR, done_ptr);
> -	rh_reg_write(RING_OPERATION1, op1_val);
> -}
> -
>  static int hci_dma_request_ibi(struct i3c_hci *hci, struct i3c_dev_desc *dev,
>  			       const struct i3c_ibi_setup *req)
>  {
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
