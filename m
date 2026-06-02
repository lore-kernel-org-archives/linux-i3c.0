Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13501CD5BD1
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jun 2026 16:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T/zwBcIkH/viEvn/xx7XLSutTUzSZO9Ny7OCYwPWkmQ=; b=l0SJAEbwV0HCo1
	7+1wjdrKzDeGXc+nNtvIU/f6GH8m2KCyGDalce6dHXXLnUPkA5+YgVDU8F+tgeIk/pKx34ilXLiIy
	eiBcCiWPoQnhHygdkCUwiceB+/upZyQqdOvP6vHOzrqXQJw8PnZuHd0qb0hFsoLvbz0lXxXZj7aYO
	L8Tu3PF2/uDjvI/GvhSJ10qUdfCchyKEtLenmvAHxElba5Hd0/C+tsUs2eSiEhsDUOBJ4pEl/K01Y
	kaJNDRlnC3L70Hu/JoXrE8esCBXEuhoGuUO1HDUAiHEAczPObIGETjFqMTHARFhfSb3SV9pYMuRR1
	Jg6uNcpbE2f/u+u69avA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSH6-0000000DUMK-2uHI;
	Tue, 02 Jun 2026 16:47:32 +0000
Received: from mail-norwayeastazon11013031.outbound.protection.outlook.com ([40.107.159.31] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSH4-0000000DULj-0iC5
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jun 2026 16:47:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pEKDlgN/fxsVU9/fRzy9CVTAHI+xg4Uw5RNnWh3g3JuRd2cARyR/6gTKEw36wfLiWTRVwjkbRCIEnSOxueWZjlmf7osYrh2sCimD4aaGvIwVIzwx/EYhfLD9WspyD33dI+cqWjg2lT6jRhzDXOQAVKrGnrLIxC3Rh5M0SGvVUHwSdVlr8SzhNix7e6Nhg5PBwLR7MyaVLSIxpj4Hop8r5U5gh0jZCwrI634vv+Tp4H18Z2kXWNOoXgtQCheTXJb2NRAXU0c7RfHQtbz+IcvdfDU1Rs14zu1G6QPRncUaeGn7VVUDvaCJrGOTWWt5q4pV2IS1scT/geSdN47kwjvsyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKBDTkAsJg42idGk0kPwgpPo07gIR3G7dguD0tQ2kCY=;
 b=EZCys/MJTgVoRC+IrYRgmaJ8403t2DqYQr7XR5AHyYaf0smrIXsFY08o+OVcYFs2OiHwIX/Io/xm4d9hswIiE8D9QKXyTf4ebMn0ofQhsAw9XYVvWnb+MDikyzR2B0sfA3jsGNSDFTCcUZb6vjrW3hJhn6ntOk2L2ZjBXDTrGdZXejPgrGJycZY+veFto84srAXKuqot0YuYJJODhRQRDDLKzhEUiltQ7ymKFW6LG3uEXGNdmh+lUeF5s/tax5dcT/WE3C2dCiJOhy2FSY50pijfuqX+oDq3N7NXBNUFm/gPczcYm9scFpRoRslBtiJtpTrpXXDN6d1TY7rSvCGkZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKBDTkAsJg42idGk0kPwgpPo07gIR3G7dguD0tQ2kCY=;
 b=VsCKSJ0W83nM4WF1nv4HiPQ4sBentRjfyaK6/BpSa5HhGZ9su0BCnl56ML6vqe6xjhXa0pJceG3c2kS15VGlMT8iE5Z6dnVT4owsmtRw+dFzFwYhM90uIOmUyP1ubSC7wSyvVE2sxGiN/P/Mk6kjamh2oVYo4NrbsKnSOMqb7UEZlPm1gY8hnx/auEdo9hH7knfirvHbc89uqn7NIn1yGiWCd4FrdqwcPvp9djqqxzmOEdf6yoJ9ywFKOvwkQSrW2YIWCnc6smpINwWgEyXy3BHqwA//XN10+ZCYKn/0hk8Q88BNsodN49Dyyu2OK8zAdR8Kw8MY+/zz1G1l32f0CQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV4PR04MB11751.eurprd04.prod.outlook.com (2603:10a6:150:2d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 16:47:25 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 16:47:25 +0000
Date: Tue, 2 Jun 2026 12:47:19 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 15/17] i3c: mipi-i3c-hci: Base timeouts on actual
 transfer start time
Message-ID: <ah8JF_u-sdLo_sPN@lizhi-Precision-Tower-5810>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
 <20260515162621.57719-16-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260515162621.57719-16-adrian.hunter@intel.com>
X-ClientProxiedBy: SA0PR11CA0123.namprd11.prod.outlook.com
 (2603:10b6:806:131::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV4PR04MB11751:EE_
X-MS-Office365-Filtering-Correlation-Id: 802211ea-0d2d-48ae-ce35-08dec0c6a005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|19092799006|11063799006|56012099006|18002099003|22082099003|4143699003|38350700014;
X-Microsoft-Antispam-Message-Info: qQ2Wd1X3cKv0VPDaS/yaXKFcLvEt/lqxzarfmSyS5xHXLSUgXzA9BC5VXFKPbSq3XvJI8Gz6IR/z8ZDBAoARjczQIbL9TUwpf4FfRIbNBFsZ/mKm7PfR5jct3xhqy/oZQDt+blYJbkRCOzRz4iK7iDPiIlPel4Tlbliu0j0sCRP/sPgIZ6bcU5+ddc5YO5WFbWGxAH94ITfPoBSIMJWt5NN+ROd9blzARTfzbKEb3QQi6TdfSe/ZpoN3/Fyd87j7rGudTTwviaSQbBCqwtDmS32LZ8ZWWN71v/lL8CLkbAl88XjJZIziBPsJWOkz5Yjkoloce6xcrpDVzBjD1OMx26Y8YYx0q9ZiTP/gNzQBsT4TphHNO1jZpeAMB4MOGx1RPXRSUG1JMUjUOK/NVmI/kp4rYfaEzKh5OMjeeak1pJHpfIlSqAK4hYGkyL1V9WIFW3YjZVFLbwgOKGzaPXiE4j9HztUDRQ4VwPmOgmsAcRxdA3PR19LUfuUrMrOaqrsZgQtvbea0B4IuhQvTlv8hvmpPNANfynjsxY1mKrpoTjBvq2jcfLnW/rhSZlSMuYDejhTKpxk78iK5bfffZp2waZPtXyUcnAfLAu7c2qTEsAi3HitEaZ50zTPIMPoLmDefG1fb/C+cIjdFyKv4Kn6i4SrqI2Bw5K2eYdsg1EYNLzSgsmfjFrIH4HNfr3XPB6TkoDOV/aGye5C6mofZaOz5gPvUjXlkodYVG3GA5W8Wjb7BkjSvJEQI8mESoZBp9CUS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(19092799006)(11063799006)(56012099006)(18002099003)(22082099003)(4143699003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6O9P3H8Ndo0Y3/3p+ylJ8dBJrk0uyb4HDFiiS1knXmbs++8jAIvrIWduf0Yb?=
 =?us-ascii?Q?+ssuN0E37m/E9r4gLwdAakeRXDpBKlDK4o+OvTvlRAvOOqnmux0JtNvtZ3TY?=
 =?us-ascii?Q?CZFI3co+o4q9TAqJEQrsZU6RmL+krHGkSU0Wxk86HaaCwilOkqZBdCtShomJ?=
 =?us-ascii?Q?v4WdOpFJ9PNQPIYw8ccOqT+kz8sg+iAHavE7r7hH8ylWCBqxyuIa4aJEVEur?=
 =?us-ascii?Q?vg+Fipn7IrmvwmgxgbZcR6QFpGgpi5WsllX9TjB36N+L5Q7+aJCYzsfV1ohw?=
 =?us-ascii?Q?9VcWx05/iBoaVZCdTpvqRhXQzt9pcQuNN5ynt2DXf52hVCiS2h2Kv/1zfb81?=
 =?us-ascii?Q?gd9R3OwhpMyLokuRDy/090UwEtO/G+TlZfnrRmhDmNy1YHl89xNQJgPBgQpF?=
 =?us-ascii?Q?1DtzJE+tyW4edo4QgxjolaiO030f05NYHroEipk6KpWXCKMUk8AVnO8UVNE5?=
 =?us-ascii?Q?DCv/SX+V+MLYF1YDM7WkBQvGe6zDUStaVmykM9ZHvs3FuDeVJ8ZHbfnHDpF3?=
 =?us-ascii?Q?AOGgYJhioyKNn0qGzKvDtwp001XUlXcpNf/5ZtCeJ3GtWHB3XAAA8EqQ1LsT?=
 =?us-ascii?Q?6dPx0ga5ugx7mAnRSGetX9kb3HmARAHVxGX9XgNY8RlTY7zPOZPQvOWBhh4/?=
 =?us-ascii?Q?XES4Zc8YN3N8yHyifhl3hNbeEAS8Xty+X+LFRSMvRyMF3WEzwPBpoewhVJwe?=
 =?us-ascii?Q?9fMBc5BWkdNmycU86rG4IIroxinrunYiqaclBKZd99ymf/n79G/B3xtm9bQC?=
 =?us-ascii?Q?SDuiLXUiXTDLUtrcUB52zPTIoLCMU3mVP7QO7kA+u97mAPF6a4EGEbup1NNi?=
 =?us-ascii?Q?V//3BYVU6s2uYhy5l7MSLgzgsVQpYaO7F6VhUd8p0rSK17OE185DpipWDeIk?=
 =?us-ascii?Q?7IeQHYSObGWwQswkVmJ5C/u/xPPRN7IVQy9Jinva8zF79r8oaZmU5ugoWC2y?=
 =?us-ascii?Q?y4bDAyZecNq4DLBCor9dZQ4QlR50RhyP6T6lo86S3vyawBYTHoIYKQ8rkRiW?=
 =?us-ascii?Q?wUMSbHf0jHLCaNP5jrHojO13uXsvJvAN+AHHS+WOvp9gc9ye8Tt1Z4MfUVKV?=
 =?us-ascii?Q?gqjdL1090Bu6YreR/RI3HQo6JKouyqylIl0Jq4FjyLBA4vZ7txc15u9WPLNl?=
 =?us-ascii?Q?VUng7gD/mEaybY1po6x/9R1uzxmvpB04qpf26a10UWJF/ZgJlQT9Hj7Nijn5?=
 =?us-ascii?Q?c/fWyZAW+U/5NpoTGHd0vvSlR2sPBg1Pkq0Xyd95Dcg9CvQqGoaDZdF/QS3l?=
 =?us-ascii?Q?f1KJXQOaMwANVvd11zmV1liz3cc5hFQ3r6w4P9zmjhLdmWyKNbLm35uUynWt?=
 =?us-ascii?Q?LvTq0n0nYy26ZK9WKXJLyuiMbO5EboQS17sToxIJnG7PHLj6pyqVkY4jIWoJ?=
 =?us-ascii?Q?HGBfXCF9nVcjHQ8kMUDDlFDqC8Ks7FSeHv2M21WLBFwmnvNidYaXTp4bxEs5?=
 =?us-ascii?Q?Kyr3fBq3gsFPuXkso6ZfdGObq405qASQxxBZ8REhzwgE9eQ6YKRGq48XoJxf?=
 =?us-ascii?Q?/+i1QIkS4XEpi1M/93LCaC12mTDW/N99O/LdgaYGca+XD9OBFAjBgnk3+UCS?=
 =?us-ascii?Q?w+9wd/Cgh7LhiFI5zLRSz46H2NUrf5EJkuOy4AEKrAMs7gnpkGWqpMrFQOa5?=
 =?us-ascii?Q?zk2qW+Nde4OKZqwQ2iH7OZoRKZ+w3vn1B6SGTax/jGblrq/SDL7D4lc8Syyd?=
 =?us-ascii?Q?+PuvLeYKtH8tq52TluqW0dDYKK1IuJeei4jwExwEZeqwXLb2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 802211ea-0d2d-48ae-ce35-08dec0c6a005
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 16:47:25.5380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2z075F1vdLlY+FH18DwyLqn8RFB1bElPyHToAnNuYf6iYNQP/6NgxabpVVo3wgcyBWEGXNl2BGnsdpZKp9N6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11751
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_094730_243057_1C30DA56 
X-CRM114-Status: GOOD (  32.03  )
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

On Fri, May 15, 2026 at 07:26:19PM +0300, Adrian Hunter wrote:
> Transfer timeouts are currently measured from the point where a transfer
> list is queued to the controller.  This can cause transfers to time out
> before they have actually started, if earlier queued transfers consume
> the timeout interval.
>
> Fix this by recording when a transfer reaches the head of the queue and
> adjusting the timeout calculation to start from that point.  The existing
> low-overhead completion-based timeout mechanism is preserved, but care is
> taken to ensure the transfer start time is consistently recorded for both
> PIO and DMA paths.
>
> This prevents premature timeouts while retaining efficient timeout
> handling.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V4:
>
> 	Rename start_time to start_jiffies
>
> Changes in V3:
>
> 	None
>
> Changes in V2:
> 	Do not flag the next transfer as started when there is an error
> 	which halts the controller
> 	Instead flag it started at the end of hci_dma_dequeue_xfer()
> 	Use hci_start_xfer() in pio.c
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 19 ++++++++++++++++++-
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 19 ++++++++++++++++++-
>  drivers/i3c/master/mipi-i3c-hci/hci.h  | 11 +++++++++++
>  drivers/i3c/master/mipi-i3c-hci/pio.c  |  1 +
>  4 files changed, 48 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 69dcf5dad3a5..c6edbbedfdd7 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -275,13 +275,30 @@ int i3c_hci_process_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n)
>  {
>  	struct completion *done = xfer[n - 1].completion;
>  	unsigned long timeout = xfer[n - 1].timeout;
> +	unsigned long remaining_timeout = timeout;
> +	long time_taken;
> +	bool started;
>  	int ret;
>
> +	xfer[0].started = false;
> +
>  	ret = hci->io->queue_xfer(hci, xfer, n);
>  	if (ret)
>  		return ret;
>
> -	if (!wait_for_completion_timeout(done, timeout)) {
> +	while (!wait_for_completion_timeout(done, remaining_timeout)) {
> +		scoped_guard(spinlock_irqsave, &hci->lock) {
> +			started = xfer[0].started;
> +			time_taken = jiffies - xfer[0].start_jiffies;
> +		}
> +		/* Keep waiting if xfer has not started */
> +		if (!started)
> +			continue;
> +		/* Recalculate timeout based on actual start time */
> +		if (time_taken < timeout) {
> +			remaining_timeout = timeout - time_taken;
> +			continue;
> +		}
>  		if (hci->io->dequeue_xfer(hci, xfer, n)) {
>  			dev_err(&hci->master.dev, "%s: timeout error\n", __func__);
>  			return -ETIMEDOUT;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 0fd56bbb84ef..9a01c740760f 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -543,6 +543,9 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  		enqueue_ptr = (enqueue_ptr + 1) % rh->xfer_entries;
>  	}
>
> +	if (rh->xfer_space == rh->xfer_entries)
> +		hci_start_xfer(xfer_list);
> +
>  	rh->xfer_space -= n;
>
>  	op1_val &= ~RING_OP1_CR_ENQ_PTR;
> @@ -558,6 +561,7 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>  	u32 op1_val, op2_val, resp, *ring_resp;
>  	unsigned int tid, done_ptr = rh->done_ptr;
>  	unsigned int done_cnt = 0;
> +	bool start_next = false;
>  	struct hci_xfer *xfer;
>
>  	for (;;) {
> @@ -588,8 +592,14 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>  			xfer->response = resp;
>  			if (xfer == xfer->final_xfer || RESP_STATUS(resp))
>  				complete(xfer->final_xfer->completion);
> -			if (RESP_STATUS(resp))
> +			else
> +				hci_start_xfer(xfer);
> +			if (RESP_STATUS(resp)) {
>  				hci->enqueue_blocked = true;
> +				start_next = false;
> +			} else {
> +				start_next = true;
> +			}
>  		}
>
>  		done_ptr = (done_ptr + 1) % rh->xfer_entries;
> @@ -598,6 +608,10 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>  	}
>
>  	rh->xfer_space += done_cnt;
> +	if (start_next && rh->xfer_space < rh->xfer_entries) {
> +		xfer = rh->src_xfers[done_ptr];
> +		hci_start_xfer(xfer);
> +	}
>  	op1_val = rh_reg_read(RING_OPERATION1);
>  	op1_val &= ~RING_OP1_CR_SW_DEQ_PTR;
>  	op1_val |= FIELD_PREP(RING_OP1_CR_SW_DEQ_PTR, done_ptr);
> @@ -810,6 +824,9 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>
>  	hci_dma_unblock_enqueue(hci);
>
> +	if (rh->xfer_space < rh->xfer_entries)
> +		hci_start_xfer(rh->src_xfers[rh->done_ptr]);
> +
>  	spin_unlock_irq(&hci->lock);
>
>  	wait_for_completion_timeout(&rh->op_done, HZ);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 4bf2c66c97b4..30297823ca85 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -11,6 +11,7 @@
>  #define HCI_H
>
>  #include <linux/io.h>
> +#include <linux/jiffies.h>
>
>  /* 32-bit word aware bit and mask macros */
>  #define W0_MASK(h, l)  GENMASK((h) - 0,  (l) - 0)
> @@ -88,11 +89,13 @@ struct hci_xfer {
>  	u32 cmd_desc[4];
>  	u32 response;
>  	bool rnw;
> +	bool started;
>  	void *data;
>  	unsigned int data_len;
>  	unsigned int cmd_tid;
>  	struct completion *completion;
>  	unsigned long timeout;
> +	unsigned long start_jiffies;
>  	union {
>  		struct {
>  			/* PIO specific */
> @@ -123,6 +126,14 @@ static inline void hci_free_xfer(struct hci_xfer *xfer, unsigned int n)
>  	kfree(xfer);
>  }
>
> +static inline void hci_start_xfer(struct hci_xfer *xfer)
> +{
> +	if (!xfer->started) {
> +		xfer->started = true;
> +		xfer->start_jiffies = jiffies;
> +	}
> +}
> +
>  /* This abstracts PIO vs DMA operations */
>  struct hci_io_ops {
>  	bool (*irq_handler)(struct i3c_hci *hci);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index 8f48a81e65ab..6b8cc5f2b4d2 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -605,6 +605,7 @@ static bool hci_pio_process_cmd(struct i3c_hci *hci, struct hci_pio_data *pio)
>  		 * Finally send the command.
>  		 */
>  		hci_pio_write_cmd(hci, pio->curr_xfer);
> +		hci_start_xfer(pio->curr_xfer);
>  		/*
>  		 * And move on.
>  		 */
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
