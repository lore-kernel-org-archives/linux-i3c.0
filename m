Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B31CFEFB6E
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 16:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kn3moXHF85U2liV7lpLuA2FNMRCmHDJt0BHBhO7u6t0=; b=maaqqJe3y166zN
	vtxjeCo2vniw44buek7k488WcESRBEFBvj+/FGmATc4LQJ3vP6pi9irklvNyr+EqmhySH3PF1WQc0
	AblDMwvtOEbZrF4CfkOimgZ48FozxzXjjN4FcrKjtZGFyWG/N4I/WjwFSRwfREwuLaTrq5wFMxXFX
	B1dY/90R/fk+zkMRDgYeBy0IhCXK5H0eVufDuKCBSH5S+z853umeQxMiQVrBy/LvFGt5VgHalAL+R
	jI7nouvz5I1LXvSbZynsO6hCvZ/UCCO/hHtJ+GH3YZW6Oshrh1QzboTigfXeMTBlCgKIPa8fwbTyu
	yHEh5q1K1pjshfvP2Z4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0fC-00000008jPx-3UfS;
	Fri, 27 Feb 2026 16:26:02 +0000
Received: from mail-northeuropeazon11010059.outbound.protection.outlook.com ([52.101.84.59] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0f9-00000008jPb-2tHN
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 16:26:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ne5337y7b7HT26TjCFmmtW2K8il7cPeDPgdJaysRrCd5GbsmZi7V1z1sN8ckXFqjkN8JwrgWUwITS52N/63inF5v1uiC1JR2he9XZssh/u7rMlVjymmqHHFI9tbrRe9dbhoyLqVRLiUDvO8Eh32I6dBlLt4apZrxbBq3GvarYJfgIpF56qPsN6pDwe3vG4kQ9eqV4pNOXcfF8t8oi4suxhVlbQu44KEi+MIEXYG3l8W5kg/GDR0pD0wCLWHZJB5pL8AXcdgHFnXovnExwjZJm/8rY7N7szbskyEgWAYrOZu7laeLdfzyMf696r+TsiATBoBlLTVOxF+c4ZTxseoBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukqVv9a/owqUeyesr83//IjQrho3t/eqocU5HFaWlxA=;
 b=iAZ5jUWKN0gAyTLhe6I+4rVBKxV0IoZY1hmaONbdq6nc8BfVFinR8CJiKeVwcsfiD6eNkErSO/qLa7sn1NKvEjJSowMReWrAavN2zFAMpcry/6Y8v2qLsSWdOwj97yDsxr9O+LwLgO9nZmpScBD3EnQORrEmPngVftEiZPs83lr1z6T1iySu7k0sDvPrGRrzIKyat2JMiZCm9gMwfIEqJjsMcfusuEXBuWXg4RLdC5H38xTzx+RzQIomgO0mdU25po+Dk9J1LixJHlhgJbS81fqgnupoqURYS6FBzyQgZoxqgKkEZco/3qjvpaPuTazXOvZzduEUEcmwkcHGiN0q5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukqVv9a/owqUeyesr83//IjQrho3t/eqocU5HFaWlxA=;
 b=YGnbeJrtZXMYs0sJsnpDMN0RuA1DNGAlqUMX4UPIQ5KakX9l1EItVGDNNhh6JqFTOXiewOMNIxyov0v+WYPNNpfOd3NVAijjOGrenrttCHLHvfZC6hLlGpAMwnXGhGaQHpbzV/Hp7C3KxdxcJFUc/zLbwgF/DDTX17d6IWWCCWA6eB7hT0TXP6c4Crt+H3mq+/rC1pGjgfQU+cBCekQMhttE8U7oFLYLpCLtHyX0/Rg8NZeKqOJgcf0pMI62FHfpCG/NDo1I7kZhlFCZA9KcdWW3EFmnE11Z352wAfAQzStvfO8dgB2naewzb77MSBkSXo3iRIB2sM5448iT1JD0lA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by DB9PR04MB8478.eurprd04.prod.outlook.com (2603:10a6:10:2c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Fri, 27 Feb
 2026 16:25:55 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 16:25:55 +0000
Date: Fri, 27 Feb 2026 11:25:49 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 06/12] i3c: mipi-i3c-hci: Correct RING_CTRL_ABORT
 handling in DMA dequeue
Message-ID: <aaHFjYAWOlvNkYDQ@lizhi-Precision-Tower-5810>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-7-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260227141149.184980-7-adrian.hunter@intel.com>
X-ClientProxiedBy: PH5P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::10) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|DB9PR04MB8478:EE_
X-MS-Office365-Filtering-Correlation-Id: aa56340e-98bc-4b80-e379-08de761ce1b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: +vbC3KHBXNy+wzHYfomCCf9Lkn/wWit7Be//68YZqcnYlT14lR432c2Axt0oH/mRqKEF6ZowyFPb0YnsEkkcb325T2jdJOMfjzTIPxGurinsu2qcKNdXRGZGSkts/V2D4XQ9m4nyECXoW1aZg49/6BQkYrQJ4zrdNPNEBv//cHc4KftaXt+w3xZ9KdpBok4eB+Se/9nef3Drt7avWECETzvfmk7nLAfhTqci8PwSdH7WVCNjrz4PB5SFRmPbHRDSekySmDwoxmGpm0hBKwd8sZjYsIHwuRYmBuYWHaCmPbyTEVXEkODk4/9UFwIy3ipdCXVzWuMKZJThOkGlPgHvm5nv72ZAyvV/uYmtUUAKyO7dyivR71ixtP3kjaMBT4q/P+d0ga9WRkn/wcx3WS6IKV/rl2DC916jmI9CAaUjUgs21/3nlTiuauDfcQo9R4ScHz8bhfaWnuauhMmx4gdY81wp2UplelRDS/OdhnpyJBVC+CPAfdjT0juLMyqrYggI3Bi6Y17F764GTVuYWMYHsGOxWgzenfwKTb5d4pd/jgx1w9gdznmu7RRlWrGoiMfUuOgwWQH5qUYMgKhnDs3SKywTWkcWZODw8pWz0ju5OjkLQDpr4LekrYljF49AdDnpwtSAr3/7SYjJdKxQVmtynlAI8w2AeFXVoiPztkNjYxGVE8dX0B8WrvoYHxIvMbW5kb1u08z7mQQAmjaYpF7XZHDGGO5URubg3LDkpvreNuGPgLHC3rv6gWIV+ytHFQBlNk5weoIJTM9SVpEz/6L7qAfuOk7hsmDJfVH0KSGyceA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mvoSG7oktNNAfE2Bg2Q0RufMTQm5g5p+3CMnGCqKfqGf+AxoFJh1jxE2usnz?=
 =?us-ascii?Q?tB1QlJEoZ5Zf6CqjKUk54QxsnyXwRcpwuJ1ikyHx+10xuCcDtVrOCyEiLiAa?=
 =?us-ascii?Q?HoltCXXb038Lql21rkqfyycS/mCpSmnSkmJGZEkgaaUeCYNHVuUWcoTEHYIc?=
 =?us-ascii?Q?b7U1GSLgrJiQh50nutbpPJByU0ijALvc/+khi/iooZsV6pvLgCOU09kn5/ni?=
 =?us-ascii?Q?gZ3DsQv2LcjJt2A5ZpkDhiDGhPQm1o1hEEEaKFeOiHn2ENsHE8gXNSmvF8FX?=
 =?us-ascii?Q?zRSPAv+SVLaWnxOWo5KhqMKDxIrmMI+hI9H+BHjc1JCltWX6S3wQEKetrpc3?=
 =?us-ascii?Q?avqR3Rl+Lda9wT4tIM/TS1is0w5oPZEFX8r2hoGkhrqK0ofcUx8CMmvYdABD?=
 =?us-ascii?Q?sBMh3XsVo8s+MmYwbJwj4sNnUc3U54efUScnBHxhCI8AVxg+hqCn8XAxrS3/?=
 =?us-ascii?Q?qvtcPkrrbHRB/GzPBVrF5BKH7cBxElHEVWaZ3dav+jpetobzOUFaD05xb1Io?=
 =?us-ascii?Q?Q+qnMVKGT9WxkS9bGAigcZkYWCCwvBiyrk6jwbzeZxKH9cfpisSH+IN883l/?=
 =?us-ascii?Q?vN8dyDrWZd+vxrYlxtbjsvFJTnX3x/I+uxyxXDUXk0DeXpAmYqnd3mwNIb2j?=
 =?us-ascii?Q?EuymHTTmrSt3RkcXAPHCnbti015+u4ShYy5N6epOnZHk7yfjpabFqhu6kk2y?=
 =?us-ascii?Q?aO0uwbOYHbHWOXN3seHJApSGMwlrWmWcXs23xwM30t2lHhE/jjVMYNsUrGQM?=
 =?us-ascii?Q?gpmsgZsILw/8ty+oi0T4zj74Q0Pg/0ClLedgm21DZLx+VqgqLGo6blmeR3OU?=
 =?us-ascii?Q?XY6yG6Eucf9RDA6W6Lt8quUn7M2/T9LF+jzbkoQhzlGeEJSYxQ3kL8nEBqRb?=
 =?us-ascii?Q?vASmDOOpUDjcXJEaQjkMBF37wJK2y60ydDco+cSfCR/l/mefn8kD/EGoxJmD?=
 =?us-ascii?Q?cnPuMMw5OdGaZ6P6xDZ8mi4G59UJvrB8aA2n5a9QaRmF4UZKLd045LlGPRBI?=
 =?us-ascii?Q?lWAYJ/7j8MOuBAm1Yik9frFcAOxNK2P9oLLrVg3vF71D2kz/GJ1yMqU20fm6?=
 =?us-ascii?Q?+vfdV9DAT5wECD9JcI+nB8TLZNgzbaMSqZeps8LQabyHHc1u8B7AOVhTghZX?=
 =?us-ascii?Q?idMjPXmf3TFhHLidrLrOnsQF/SxZynWkahKxN15OWcdNDGxmSlkvOL+RtFUn?=
 =?us-ascii?Q?wmtx+fXIaoQ+t3qx/DItUFkHQH26Adob/VhKJyEAINrSt7vWmR5x0QyZKKxH?=
 =?us-ascii?Q?QfxEGGj+WMBRRIjaxueZpGsNaoP25PepmFa20VoLrZJl9ubSTUUtZgMXuxKW?=
 =?us-ascii?Q?KaXYGnmVXaEc92c1UwyHX5Tb7ymlIBfFFG/wZJ7Mbhv3neg6JYL/bvnxF+dF?=
 =?us-ascii?Q?dqHjNUdF9Rgkk/A035XfTtqbont0HsgOpPUCwOQEk6pp2S2JF6d7cXpDBFyU?=
 =?us-ascii?Q?nh+mkZrUEa9AbKnO271gHd/NZqKxksw4vxjTRN83QSZooXfL6Ou3sBFseGUl?=
 =?us-ascii?Q?7ZghdDdw6MGV0R9AUjJHVWj6vxD+/CJ9Gp2ntsxaErPZvOs/Cb++MCR1SG4u?=
 =?us-ascii?Q?LpZDUNb4d/nCqBJHnFKoB0eqBwvcIQPuMcfGIVRGlfssSEWmaZzZWIE9EawY?=
 =?us-ascii?Q?XqQSeDEEeNdBZ4TjqYRhFb4B148AhTh9N8Ij2lgyawtlUQc5p9G+SI/ybAMP?=
 =?us-ascii?Q?3DOcx2H/ZLpul7SGi/OMoSwgjh7nFG2c+JATwjr2PnzW9WV3Kr/28ojhX7uJ?=
 =?us-ascii?Q?CIRKOtJyyA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa56340e-98bc-4b80-e379-08de761ce1b6
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 16:25:55.2342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEWGpEI0zUq9lxmOEHU0dqxpuL5LsmfRUebeBJTlNt1s1JJN1wftRxYg4KDDfTi2If0sZOOjt0RRtalQhmSw1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8478
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_082559_746754_D286478E 
X-CRM114-Status: GOOD (  24.09  )
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

On Fri, Feb 27, 2026 at 04:11:43PM +0200, Adrian Hunter wrote:
> The logic used to abort the DMA ring contains several flaws:
>
>  1. The driver unconditionally issues a ring abort even when the ring has
>     already stopped.
>  2. The completion used to wait for abort completion is never
>     re-initialized, resulting in incorrect wait behavior.
>  3. The abort sequence unintentionally clears RING_CTRL_ENABLE, which
>     resets hardware ring pointers and disrupts the controller state.
>  4. If the ring is already stopped, the abort operation should be
>     considered successful without attempting further action.
>
> Fix the abort handling by checking whether the ring is running before
> issuing an abort, reinitializing the completion when needed, ensuring that
> RING_CTRL_ENABLE remains asserted during abort, and treating an already
> stopped ring as a successful condition.
>
> Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 8d5f808e03ea..dff96b84479e 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -550,18 +550,25 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  	struct hci_rh_data *rh = &rings->headers[xfer_list[0].ring_number];
>  	unsigned int i;
>  	bool did_unqueue = false;
> +	u32 ring_status;
>
>  	guard(mutex)(&rh->control_mutex);
>
> -	/* stop the ring */
> -	rh_reg_write(RING_CONTROL, RING_CTRL_ABORT);
> -	if (wait_for_completion_timeout(&rh->op_done, HZ) == 0) {
> -		/*
> -		 * We're deep in it if ever this condition is ever met.
> -		 * Hardware might still be writing to memory, etc.
> -		 */
> -		dev_crit(&hci->master.dev, "unable to abort the ring\n");
> -		WARN_ON(1);
> +	ring_status = rh_reg_read(RING_STATUS);
> +	if (ring_status & RING_STATUS_RUNNING) {
> +		/* stop the ring */
> +		reinit_completion(&rh->op_done);
> +		rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_ABORT);
> +		wait_for_completion_timeout(&rh->op_done, HZ);
> +		ring_status = rh_reg_read(RING_STATUS);
> +		if (ring_status & RING_STATUS_RUNNING) {

Do you need readl_poll_timeout() here to make sure hardware actual stopped?

Frank

> +			/*
> +			 * We're deep in it if ever this condition is ever met.
> +			 * Hardware might still be writing to memory, etc.
> +			 */
> +			dev_crit(&hci->master.dev, "unable to abort the ring\n");
> +			WARN_ON(1);
> +		}
>  	}
>
>  	spin_lock_irq(&rh->lock);
> --
> 2.51.0
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
