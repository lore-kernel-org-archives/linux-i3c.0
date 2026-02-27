Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1898AFEFB6E
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 16:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFjkija9mvriOA1bKkoZh14zliOW53OgitK+8FGLWMM=; b=fHSo7WILdxnO/N
	J14v6F+818Bq+0ysFgz0mOy6zkGWDvVGIyzzu4JBDM/6CsU4AA7dFdmtaTaAgqB7n47G+jbbnx31e
	MO3iMYu0ZrYRLwex6DrOGQeTL3alMuYYGMsI2BKHq6rLp4fn48mKqx4cm+bnXCGzGi31Io/RtukS7
	k/ipAF8imPOWnO3pad5CLX2jJH5qVjeUg+plQQ3XyGcGagde/TEHjPaj0arrY3OZp7HE0QtB1SXg7
	GLsDsiDFg13zdArAyj6hJCUYtDZleap5f+G1ohC0nhCTjcEOhD6E/DlJrrDNpdgwe/7VAkSw/egDc
	x3BnhHCzD3a7Sao5S1FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0i7-00000008jXo-3VHT;
	Fri, 27 Feb 2026 16:29:03 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0i3-00000008jXJ-3QAH
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 16:29:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGg82tLuO4uuIyBSe+ZB2Ui7vhrO/Nad/WnI572l6A2f4OpmlOb/nnezPmIvqT+1pedn+wTxAKzt+BVXD4zZ6zyeTO7EUoZjaeEgv2omUWpjJV5OfZqSqb5tAytLJ8MjpEQNPvykGtmhB/w0Y7Q2SuaG3MI6SZiYwo9qV3vUPCzzo1pr9CxclloYA4TeW6+ina10jOJ7AeanWEVmKWBy4ICBXHkmctjajCRa5Bf5rAlmqDTHeNDXiMyot3e7XcnxT0R4KD89hanY8Qd3ZSSUNmOnI2kPlqqO4tZxbCuQ+Au0n7apJ8f9UclNow+Pg9tSp5B37+xExmeM/pp8NVDrXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjpQ571CnnkRFVzWZjJJDOjjDyT/AvHVM57nKOSz+r4=;
 b=jUr/or0A0dOWEkaR5Y6dYWH+g8p0sLS68fLqM67poKx69WVEKRPa0cv3g0E2n9L7Bze8NlmkaYoq6kmIqtP33/k69Hv8is+PeZfA/gJAPsT1GbV3gJQhFQ0yc5wJM1FRp0LDTbaBbbQ60oUp2rar5N+bz62wVOBA819NYSdQ9+Tf9bcvXfuvFeqts85ZrXW3ZYaaYEUBNhf8dnzSEAnQ1JkGiUEOWiAhb2vO8ELl/n1Xv/koliW8+9m86nEMMsJdD4y22eIGDd2fDGOlLYMX7cFL5lyRdoPoO3/KZRSG1RpVrYt5E4yXNEuwcIf7XYEc6bGX3PuJqfZL1jmPMYrJeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjpQ571CnnkRFVzWZjJJDOjjDyT/AvHVM57nKOSz+r4=;
 b=LW3FWGZBOWfV/OOc3fkP49TyBwTAT0lB0d0HaA+B2gWD4ir/8/eQ8ONvmp11AHND0sWjPq89HaTVp2L018Fq9nmtZB7EyLLYWSyg11l8UfEwzoquw5ePgHj4pWx5S6gRr9FNuLW1HgdquuMwAA+xyjpEEYhTbSh1rEypnNlJQ1z56F/ClQoJ5dpXzIS74l9Y+58mAyasPX0c32EV2c1d7DQ0WIas+RDJV2/DH/zP+btbLZdhxfoQwHK4CNEpn1HOUkMp5gK3THzzgMGNLsdXkWYCxFqs3sVxz+qM4qm1Ue1/Xi3Qqm+bjPOK4omTZH8sqRuYq7rPcm/p9gQzjgRGXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by AM9PR04MB8421.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 16:28:55 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 16:28:55 +0000
Date: Fri, 27 Feb 2026 11:28:49 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 08/12] i3c: mipi-i3c-hci: Restart DMA ring correctly
 after dequeue abort
Message-ID: <aaHGQXF4gVwD0scq@lizhi-Precision-Tower-5810>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-9-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260227141149.184980-9-adrian.hunter@intel.com>
X-ClientProxiedBy: BY3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:254::10) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|AM9PR04MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: c249e420-8be1-45d3-a3e8-08de761d4d19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|1800799024|376014|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: O9b87Klu3OzZ0Ewi3kSnMsiLuUsDfxCYp3MNi61+vqTurpidE+beIWKB13csuYarr4ELQbn4Dq9YJFnZ8/sC4qHhIARcktIe8mHlcIcs8gpJevVnlqmNGAFuON3lMausrnEfMteami8S85vQeIKeBxcV24kiuQ472ga/mHO8wVxUVUyTC+tflD/eZfoD/vr8WD6Mc0JIJYtJ24oVKAW5zpU7wgqrzR/ZrfrARP3IIag+tuUgi6NuPIgv2C7C/267lBcTifeikdvVEkw+zIMrb7ih/JdteZzNCA94lzZpJTU4ZitqVkB043qcJs74UbeMubzSCs8HJTbsGiV91wpYZEn/amkGZdq5czCTh9KuhZXhARUZHLqIgUJeIGYrdlWkR+RquG7A+pFm27vicRx8mETa8J+LICrsJ/vwNM9sXOJOclborCPbFtkKk9smUCSZJEqGyyXoO5m958WKVKn+UQRrcRX2RN9lZC3JVSWJMZwAx4fpw0zcSSHp5XCU1IkH74Bbvj3FnkBtVT3Er9SY5k5AuijC6h9DHVXJtc/Au8icwv1x1G+h1l2qpm8FY5a85/vWWtRguACNAwxY6eTerRUxaIb09u5k5ZJuMIbkxu4YuZIdy2QBdP/KAqRNQ0X5u7MVn539F2NZ5Cunmuc2Jx5H1Ar/C2Gwwy9zb20El8BNej5yred38Ogs922R2/tt+jp5/00ddV00Wqhxxc2t1aXh+ADSzSEd4u2jZ7ATg0518LE+cnLz8RU8w5pfTro0uX3YfSAct/SgjSqq/DoVHlOeXJWmdQetma06ewTUiPc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q/vno8EPZ7HsrA0ABM/xaEPWA3XVYqI9n+BDejVpe9Ta8Mr+BdFcrIvW2NdU?=
 =?us-ascii?Q?DCP0+XyGdzDgJzUVvFhF+HQ4k1CzOyqe+ycfiROxXS0UNvucq6/iV9qBh6Vg?=
 =?us-ascii?Q?EWB+EnArzUfnqQiAlMOcWmDNAsDkHD0GTRdbKjthOBj4YlaWzHu2wjzkBgBX?=
 =?us-ascii?Q?EJjO9YN92jUJj2Id7suim5QPOtD4kP0TQLQ6H9/IGT+9/sYCWaaL4Iq6yKXz?=
 =?us-ascii?Q?rSyM/cApeieHHwo7J/IhszNCIkLpMid/Q1V3AP1jvKJ4Mk3acLA5vLiWCTqh?=
 =?us-ascii?Q?/XBCeZ+rkDQbT1JX4cspKnmlHIr9WF2Nn83yR3BvQ5KrwiwWrJVe7Vuu3OMO?=
 =?us-ascii?Q?WQLzYRkggFQOpC1FgnYRC101/W5HRXeLarsmZ8JAOkg09XZUksUJJxjJ2l6k?=
 =?us-ascii?Q?GQNbb0f+fNitr5eTktth+Cs87pnLhFB7KJE0HEWHxIKTaa23KGbaoiFhYUGR?=
 =?us-ascii?Q?OUlJ+nXI7He+P7jGPBglhC097mXIp+NIWT2KtKGLkpzRAYNhHzEC0T9sPTJx?=
 =?us-ascii?Q?H3wW9OnzuwkjzEkPtwqrXCa4voPU9Ezq5mwi8yX4SSwSLU+OwcCPadKi9I0B?=
 =?us-ascii?Q?Z0jc7HLhQdO3oTegmIUSZnUIZGuzWf/F9Fk158zYGzJLJf6AVOc49VlZCRLn?=
 =?us-ascii?Q?5BaIrMOaoRHxlFMq2GxgXfrDjr3QNPaRDPAZ19SSNHm44Rl1J1Okf/W/jbZF?=
 =?us-ascii?Q?J1ApfpwTZ6HRNpDA0mA6MR2D2gnny5Nv6w4Zfo1jc382XjccuRtmgfEoKb+R?=
 =?us-ascii?Q?1EY1SULz2ADOhyzc5zq2XK64ZEJQtMT8Oe832ozSGjgYCTQKFmVMq3FbzeDl?=
 =?us-ascii?Q?SEdc4f5W8qcPG73LzXv8rPL3tHFs/RkBmLlOTAGYiWTQmi63TEZ/hoHwgzum?=
 =?us-ascii?Q?HZxsKhrtrv5kR0pkutJmEmsLgYz+OpLEIfHj+68Sf+AFR/gW+1WegaR6KlK0?=
 =?us-ascii?Q?PWA9kTV12c4yFTyysbvQmj2oq7O6Y3D6GuO0lZHCMDk7DhPWWL47C7/Y4+Q/?=
 =?us-ascii?Q?e0Z6h6LlgkU3WLz3z5vBIXo+fSmaTJ2YpRu81a61JNY9Rj6/POYo3OXc8SAu?=
 =?us-ascii?Q?qvP1hLUoK1H4JoKGJIqyZRtyVLMJ/cra10H/qqDbteCAoj2cE/a9tR1SGiVo?=
 =?us-ascii?Q?/wYNbpT8pRwxq2/9h9AjxJ+Rr3tPGgt/OSmZVUEVsLdsKEzjwg4dAHVJ7wFF?=
 =?us-ascii?Q?odeS0jxNDYqhL1j1KPVqOlAKRpSvimIfWBi7FO3p7lmOREb33d/ip+aNXXcl?=
 =?us-ascii?Q?qk0xN3/OfPbX5JRH2qll7W/+Aj6FWrapRK/rxotxgEbcOje5JH1hvokWpCt+?=
 =?us-ascii?Q?F2eZ+Sc3y1E2TwBenvS2kTCxutphPvT1z1oEBjmEGMFqe4g0xGj9jXdzmiTT?=
 =?us-ascii?Q?b++yoHP1w2qtoxwWBwv87wywvnkiEVmdZTu0jYg3+HpncZKmFsQNUkErvWQh?=
 =?us-ascii?Q?eg+7JhmrIPJAllki/y7cI7kdHHdQMIcFGK+vzHBsyEcv98t4jvQauEsIsg5p?=
 =?us-ascii?Q?BfqbM9HJBR2B+cmaVR+dPzMReySCXWMfP28ryHfdG2I1C0q7O5KnFLr4GSVF?=
 =?us-ascii?Q?VSXO3ccunZzE04JkUionA1QAF1EWqBbX6koQAVRoCEUNbA4C4080ZVziaCQm?=
 =?us-ascii?Q?cj14rb+utmY2rlB1bk8klLJtthYU2IzKw/ZAESSLH9o/ioUOIOYf9YeBKe+B?=
 =?us-ascii?Q?lj9EHpWm2RBVsG4RPZDsUKCkEejh+f0eB6ckdxcR+/w3N9Bk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c249e420-8be1-45d3-a3e8-08de761d4d19
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 16:28:55.4637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PquVrGrhi5Y2Wh53ebDg1L5bhdsOqIivqDYFbQyaqseRqlcEXHYK8G+NAUWkHGbSH9pby0RO7SghKTyb4l7iRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8421
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_082901_602576_8C2A3509 
X-CRM114-Status: GOOD (  17.01  )
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

On Fri, Feb 27, 2026 at 04:11:45PM +0200, Adrian Hunter wrote:
> The DMA dequeue path attempts to restart the ring after aborting an
> in-flight transfer, but the current sequence is incomplete. The controller
> must be brought out of the aborted state and the ring control registers
> must be programmed in the correct order: first clearing ABORT, then
> re-enabling the ring and asserting RUN_STOP to resume operation.
>
> Add the missing controller resume step and update the ring control writes
> so that the ring is restarted using the proper sequence.
>
> Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index a11d0743fb80..323c5ead82a5 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -604,7 +604,9 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  	}
>
>  	/* restart the ring */
> +	mipi_i3c_hci_resume(hci);
>  	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
> +	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_RUN_STOP);
>
>  	spin_unlock_irq(&rh->lock);
>
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
