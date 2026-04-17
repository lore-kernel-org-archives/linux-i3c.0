Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950D7F8E4AF
	for <linux-i3c@archiver.kernel.org>; Fri, 17 Apr 2026 06:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvjEv31J4lwBVpXO91MjLx5upzyGSX6Cy0UBs6aS1dg=; b=Sda2PTzzlS3Avc
	/HWwLMZ2+giwINACfUp0abBTrbbJoh2REupUsNqtkjq0JeH+drpzSMcwfAmLkr5lIMyUXLFfd5tHQ
	5WX8bOp4HFYdaVWQNjvxX9FbAJcU5FbEh2SmvlwkiqmUCzITu8SkymSsz+GOWBJbTuugqLN6eio9+
	OhQd+N2vcD7eeLx3l76Lli9PmqSHmErwokOqy9ivJFPawde+e3/XBXyc/+91KePQb7CY9xTbziAt7
	P7Z/qtl81mO2YSGLhZszGg7D5eqsauDj6HtGny0vxEZ31HejsUhFf/TAeCotuJVX+jrGI3gjLZJZm
	MAS8AwAJbf+BQov6cu+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcz2-00000003Ygz-1Qyg;
	Fri, 17 Apr 2026 06:47:20 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcyz-00000003YgI-2M3s
	for linux-i3c@lists.infradead.org;
	Fri, 17 Apr 2026 06:47:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSA7klFEhKOdIjRceA/SXSurFVfO+RPDYztGBtHxafmuodgN3ugfrD1pL6DFwx6OeWFEk98Yb2GspYnfs/MzAy5beEPdH/LZbgAVS6mBSHextGETO6bagTQnIMFX0AQ2McgqdggzhD+ZRkRdlbDg0X/1kBuzn5i6KJtqHcGi5Cvnh6Rprl96xSQWhm+RJC1SyA7JvZyQeqwUhe8kCgsS+kSNDtCESZHSAQZRREf7yworAf0YVb1q+tUKpOS22t2pWHqIDsz+GBB3iZrToC2CPwjrDIzNU/4IlyZKLMwZGtifDIgs6l25Eh7VuZis8S96h6IeHLjaTUszV5Pi8T1PtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1BiPmL9z+NxJhzaG/Lj0uOqSoKtnUwqcdhw9e3SzxgM=;
 b=tYBnt+BUVloXuOIVprJbO3nwSVNVYjzgx1iP9nNDinR+wUFCy8UIO2r47oXaZFDsoStyRwxEtXUVFZ3MGr/b4exYIp6wIJ0jwVTJmef6VpYXbGbVE5++wXAQoc6+uJKYZDNdyR4zmMuUbAZ7n66ii2VcIQVySXJhFtZdX9yN+IFrvttSk+QeZ8kun06S5E+NicgKQfkWDxk8aeUdMxzE8YmV6KIr48BX85tHS5ag7QW70pobPA6pAG7dW/r54vstxPOFOls2Ct1kuOQxWCm+qCwdt1+prkdUBwhqF3rFM+mWsqTydMkE7AuiwgyPuP11sjoVSCbziTrCazR2n41TSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BiPmL9z+NxJhzaG/Lj0uOqSoKtnUwqcdhw9e3SzxgM=;
 b=jQFKIl54/Kke4VIpiVIIuV44ldGU4Vl5z1AwJ6WWhnKN2np3uqR4usrI/m1nygDHKhg1OXOh8I3bgXf68rOT64Nli0Uyz66hEt85pcG7zIE9VN9Zyi+/G1/aGnKaBgmgI4H3yhx/ZtS65BfPzUSf4MeVvUzDC9No59qzP23hbAlsy8ZRIX46xXPCHajtGGzej40WSOBKsFVHPmzvqlrDS+AFz4oCNnPIsnK+blnHI+7brdJpmEtIg8ttQH2u9MCKFWxXdj1XbC3YWP28Lr4dR03BY93NNNtfMFR4iU+hSlhcLr213US56aLNehxqhXKNoxDrDtHbK6O7LuCWOnfBhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8294.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 06:47:09 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 06:47:09 +0000
Date: Fri, 17 Apr 2026 02:47:03 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/16] i3c: mipi-i3c-hci: Preserve RUN bit when aborting
 DMA ring
Message-ID: <aeHXZ9ZZyMnJfcoC@lizhi-Precision-Tower-5810>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
 <20260416175704.41217-3-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260416175704.41217-3-adrian.hunter@intel.com>
X-ClientProxiedBy: SN6PR01CA0034.prod.exchangelabs.com (2603:10b6:805:b6::47)
 To PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8294:EE_
X-MS-Office365-Filtering-Correlation-Id: 642fb651-5730-4057-1946-08de9c4d25c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: Gg7Hkp95LiZ8ifAC3Qsc+jnOSbEhwmEj30rAm0vLZ2be8Z7owLLbpA1f3Jwpi7QQ3JHHqimKozrqA3ewOeG5OjBBJu3cYmWNEwh9qcvAFdaCjavnbMhTlJcI7JdGbtZpKiPEAcV5VXjt65ZlsCquFdqUtV8P5z+5aPow4Bivr7/R+asVHl2UaRrWaYOYJbI1GyS4EUMfiZJLkDisEtn9diFoka3TBd01Rsv0PFVS9PCiRVA/gdF/61AvMQjmuikIVzyf6oZZbWQC1vBexZMIGBVEgpYQwgi/P/E3RCm2Ffv87LFzuSuOHQbRkey0D1bMeIbIudyud2e3Xa68o+i9qgfC/StSM7EaC9DKkuVvz4j7t51NTnPVdYsIJK4klp1YaovM9/51deCkP4KmcOJDLgmdL7kkhEVBZMuVu90/WnrCkPIlk6bNc6c7VH1oumnc6C37yh+4mSMdwfZgwerfoSRKJ5jxYiPqcBYrhMDjb0+xC9K4FGo5AUk8ZSx7yL3HkTZOdj9WKTe9O96YtnzoFPAQrqHOMPNusi7CIjnW+85Y9WUD0f0Cin/ncCtKJfjqhAjlw88fiYVR/PPJjiwhcXZO2/FW8pgr+TdpAA87IAiG/ihw9Tp4VbY6BVkbjVXSDFtLEgZajGAEPqOHXd1EPAAqXWN9IOrOypFp1snGEO6P4baPkbNrlYBniLsCL/pbLwfTVfhsxj9fgQrIaZWXT9/7807hF7JZvdTkSDk0r9uRTcg6hkEFBtv5Jvm6/X9AKlGhHHZ5byXMgoknmgrDyFGDH0YWIaE/o5LR/kzTDV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1Lg9cJxtBQzBgmDYU4N+ClphMjnsdNLPs9oEMFvxL4402k0tz/2fcUyscS97?=
 =?us-ascii?Q?btI8lLhgIWYW0tPZu58m/+UcRoQaatpK5e/ru2b8tRxkJoJdtAV5yJWWWN5n?=
 =?us-ascii?Q?s2u3Mwv8D7HoFHEHLZ57POUjPO+262HRbae5S9/dPMvwTr4twvXQP23PQqsK?=
 =?us-ascii?Q?5IJ5Vttg5h1x9j88e05IS/chjEsq85L0767aInvWI8y6KEZ54VLDuG6NbSUz?=
 =?us-ascii?Q?cWNpgMrFdEb0/Y6j0krzO4v0DE8oN0vBu9FIEY2fa8w65wiUvkOzdhwbL2/P?=
 =?us-ascii?Q?JtC06EZi/hpW5AF4n2AtuG0/58KA6exc6YJBN7qHOVI22QkxCGJVeR+HEtXA?=
 =?us-ascii?Q?POwNQhQS0xH5y+5iG+TL/kw004Qx0sB5qfga0jh2ITKeVf4j0VXcQBNyTrUL?=
 =?us-ascii?Q?ZpfOOhdfDtDGmRDTCtbPjbCdvJ+6GAN7bxlubWFpRlqM2rWxoDEfCzTerySW?=
 =?us-ascii?Q?cjJcHE6WVCj9t85goRXFz+/WJHsBNkyBLdbdZyAEW06DFeJy591RRJKtpS+C?=
 =?us-ascii?Q?wTKkUKYdVOrvaWCnGgNfRu3Jdbm1HzAW7KYfdJcfL+iUNQ9+IwTf6uWi4AlS?=
 =?us-ascii?Q?C8TgOWluGzp/S1tcDPfUUB4DWAzfri2k1ca2S7wUTu/oDmS12jHmrMmVcVYA?=
 =?us-ascii?Q?fgfNjTOyaj55T5h4Ut4qbMPfcE7H/778CcTJ9q8WMOqOwiI11yPf7sbBi5GI?=
 =?us-ascii?Q?eUhAeDtVTcTyRJwvxN+Sbu6364DS88ms9t7K+mV4hqs2DCAbhaWGlhsKN0Cx?=
 =?us-ascii?Q?c7yf7iXJbxyWseU/ug7jWX+n5Vl6SM3di4s3JlNHgd0Q8p+nm4Izd5a1uuRK?=
 =?us-ascii?Q?k7VgxU4n6wBDlOCc/fM6GpBlCd0U8zgcECHxnaT8/XIaaxUOjYffDw7RZIp/?=
 =?us-ascii?Q?f5+vXaspG753gE0LziFRIw9Z2HZfJ7ZgNIxXZLecVY8tiebrPYOaFjKEKugF?=
 =?us-ascii?Q?Vl4Z91IydkSqX/wzWtzce2hInYze3DZd/rfpZvmmezzpkH/X2ltyelR9hoGH?=
 =?us-ascii?Q?lF+pSjkMJLfZjYlXMpddyBIsQM75aP258gO1P6X2FpAh39RJt0HZMO3J/JVG?=
 =?us-ascii?Q?0kdbVCEds8AAbna2FrxCoYWYYWQZjYRriRw2Vg8QljSpAbTb4alix4NVnMp/?=
 =?us-ascii?Q?jPmKNqRJIIZrX+QTcRnKVDmVvzB8uqIGyAq5fgXVObK2cC2n3hJB9+klj+1x?=
 =?us-ascii?Q?wBffYPRK9zqdg+f/CL20Me3XmJHrPyTHciAG3YksaCHmZK5LSZyt7Rn3FTqy?=
 =?us-ascii?Q?fzCrfhHuH/YqlyKLIAzW8xtreouGjio7us/p1Dcmc2/ao2VDFVhlQFC/z0Pw?=
 =?us-ascii?Q?l4m75Q3xo4QdzttuY6amKkdfpaADOzJ0iJuoYXkssgJtle96ZpiKXGIJmIz2?=
 =?us-ascii?Q?xhrL/C1no/VPTMn3QsOrLWZFJv++jXaSdAuj8c0YEvEcDwDSzsqIC7WnEUCC?=
 =?us-ascii?Q?uW+E2Gl95hrE1z7oqQ09nk1Tkzqyd20NZSkl6F+2ZJtOraWpTudytvrgSDca?=
 =?us-ascii?Q?HGhGbYYP73rFU1Vbf+l8OPqQ5Tr7JNgTvAgkbHFl+afHNDZ04eFWnU/tHuL9?=
 =?us-ascii?Q?j4uZPRuq6zxebca0UXbk7pALt/a1tq+r3fBfZt8cIOx5Wh08uPyezG3dx7G4?=
 =?us-ascii?Q?3zjmkWIX3hk1Iqv8QjirlEsjNuMBWtEI+qch1xUkDGKeK8VegQoJelTqWpHy?=
 =?us-ascii?Q?VD891LSW5r25k/S6Rp1q1e4OYdPi9NalGd9FLy7JdJkgMj7a?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 642fb651-5730-4057-1946-08de9c4d25c9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 06:47:09.5094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xcX5pEr2Ue9OEwXw2y0M9M/MYvuSxp7Vo1J234YyoP9IIBNkkYFuWTZZQK4WdztZxIkSFI9NlWgbuSREmz9bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8294
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_234717_605605_55F8C84D 
X-CRM114-Status: GOOD (  18.72  )
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

On Thu, Apr 16, 2026 at 08:56:50PM +0300, Adrian Hunter wrote:
> The MIPI I3C HCI specification does not require the DMA ring RUN bit
> (RUN_STOP) to be cleared when issuing an ABORT.
>
> Adjust the RING_CONTROL handling to set ABORT without clearing RUN_STOP,
> bringing the driver into alignment with the specification.
>
> According to the specification, that allows the DMA ring to continue to
> receive IBIs,

This should be major benefit to keep RUN bit. So better to move to first
paragragph

"The MIPI I3C HCI specification does not require the DMA ring RUN bit
RUN_STOP) to be cleared when issuing an ABORT. Keep it to allows the DMA
ring to continue to receive IBIs."

Frank

> although currently ABORT is only used in an error path so
> the change has very little effect in practice.
>
> Fixes: b795e68bf3073 ("i3c: mipi-i3c-hci: Correct RING_CTRL_ABORT handling in DMA dequeue")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index e487ef52f6b4..4cd32e3afa7b 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -554,7 +554,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  	if (ring_status & RING_STATUS_RUNNING) {
>  		/* stop the ring */
>  		reinit_completion(&rh->op_done);
> -		rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_ABORT);
> +		rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
>  		wait_for_completion_timeout(&rh->op_done, HZ);
>  		ring_status = rh_reg_read(RING_STATUS);
>  		if (ring_status & RING_STATUS_RUNNING) {
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
