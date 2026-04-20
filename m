Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B593EA71B3
	for <linux-i3c@archiver.kernel.org>; Mon, 20 Apr 2026 02:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LlhMrTL30xg0IL1TtL8GWQTwB9CgL0j9p5RhI0By9P4=; b=jmXIxR0UeWzXa1
	RTmkZS7QkgXG4mKxytLcO8haYqYy0PXt6MsPlDqo31U9NFL0OoWjrZGxwSOvwy5smvtamALuwMXPt
	Im/v/8Ugcj+ilkY+8KD/tPZ5Kn2DFJePbZAXlMKCUDHjuobXFxsOynZxtvO1lMqjxBY6TKj12utvl
	/L1A1eB4VRmFmV3z7RLyMbo15d41Hp5M353hbnSfSoZaLFV8h8OmuxKHpjlFH4Vk92Wnn6Icho4B5
	2DZNM3NALBdXXTWgSaNvXCUnArFqaUozURS6MVsX/TwCDGX59vzr67UXaKlZlT2+/0sXgyJWsonPI
	m5K3PM+fqulncPqsLs0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEeAo-00000006JUU-2GBa;
	Mon, 20 Apr 2026 02:15:42 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEeAm-00000006JU9-2eJ5
	for linux-i3c@lists.infradead.org;
	Mon, 20 Apr 2026 02:15:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k78RVvLER4am3G3s7Nh5P1mQo0aK2lQdT6daU1Uy+JYg1Za6H+ps69TzvrG+CdeaRXOQHHZD/RPXFYgBSqnakCYhCnqj43hBXfqH0PmPqZ/yLbs754TOlvMm1hfp+uTWicpsF5AFUJ0YALF+37FGxGlATWT07qa+MKP7/p7SrEizJmGQBSVKJjdfAQt7eKuK12sqhUgbBqj4l+lCZA4TAi4+fQ8E0r1o3AaifFh6H1ztW1qEraxmZfW/BJUfrE4dj3YQr66Wsz0t0j8dWJ+ucFxKCFqjxIWe3fKhqNuWsVy5JTIOxrh5KD6qu8MqxD14l1s7KBT8UxnH4bQMxrlYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IaznjX0BJMkSR/Ue4PJclveVifVPEw/WFbHpemmolFY=;
 b=XVHdXTML42UG3OnlXpN0B6/K4xkBV4O1C5+SB87Im9cdCDDCqpAJPU2U2Jrng/B0i04/Qhz7iRwJ/lxeqC8Zzz0pFa1qaClwdvGLgSEdGUnPy0Abiur0yvVK+A58FG3k3kkDajuZD+nS/MjyfFKq8b23I9+xRly+fm8i6dKknYu7AguEk//oHviS/qKsDG5vexgSXMeSBOKbNSWz3hf/VPry9JxD6O7eFpvWEF9OAygxQ29lnYWy8XnOwuJ8QAJwUvIfXImSMCoJ++yVjyHdlKLdcb07RVKbhZbUg9jzWsUlrohOQ6+Hi/hleRxSf4hPBVgQH89nGQX9GbDSmOTpDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IaznjX0BJMkSR/Ue4PJclveVifVPEw/WFbHpemmolFY=;
 b=FDzWZBO9dHUe2lqVh7C04rBpOjQmgmq5fWlO6irwIUwrLKzZvugNiDDKK9W9sBHEecKP8T618+Fmg6Mtuvj11OByrKKTcQIJe6H1FQT5C0TfAvhoStyM7lIkdPotkIB9etFmHZOMG7AbKYkczcFqf/zznpOaHx4sZ/7+kHn0SGXSKAYc1w+VRAuNbSW+2Ws6feqONdad4oKfq9qTmkgPqs5gWlVr9pALhgr+4kPzXHZl2PP9vimmBbVst3VTQife1Jmz1ZU97ahtvjUyjUb46Kj2X9qmPVioRSazGeW1NL23PhtGdHxRnjIyH15zNgtP8/btgVWmWeOtJt/jkijuMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8037.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Mon, 20 Apr
 2026 02:15:35 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 02:15:35 +0000
Date: Sun, 19 Apr 2026 22:15:28 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/16] i3c: mipi-i3c-hci: Complete transfer lists
 immediately on error
Message-ID: <aeWMQB_KnW2MD1Jo@lizhi-Precision-Tower-5810>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
 <20260416175704.41217-8-adrian.hunter@intel.com>
 <aeHrGjZfP6_LcXp4@lizhi-Precision-Tower-5810>
 <542a004d-e615-4bf4-962a-91736d7a412b@intel.com>
Content-Disposition: inline
In-Reply-To: <542a004d-e615-4bf4-962a-91736d7a412b@intel.com>
X-ClientProxiedBy: BY1P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: c5ae0427-ab73-4982-4288-08de9e82b4de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Aju6Z7eXYcvkrqoIVfmLn6trJ4KpT/pJ9RpYBTBazk2mMfndJIxnVV6jK1qmb3KZiUgmvRhIqhjs9XWiuGqpikHRofK2D2RAzS4kvT9JcyNNqx46elnK1P7XEuYYvdyCDlGa+4MoQYlMN04DBnbl+zwEvQMAT3jNHGI2ZkSyEHKNghxVDuGdTjQiwBP9GjX9BEZt3lhkVDz4wX8oPDk+8o5JrPQ71ifxhetIoEOWznOv84qmArVAr/yHHOuJRG4fVkwa6Y21UUzq6JhRSfv0hbV17VcQnAOqyz7MPrTKlhyM7Axza3dZ61io5hjpmXnDjYxJh6rXSTA2G9AMbRpnBHRsl4rwQQ0riGK68hAeNtfHGAFof9mUaENFWCuyd6p3JO0bmKSNpCCvkbIdcw5QWYyFDn0mfC8m3iQPpEVg4stBLalpD6J119LCWSsP+eXe1noP52V2TGo3Lv/O3dprCK3YjdM2CKTzwTpfuGz/pvQNV1dsNXULO+CWwXC7O7ZHaflKXxRXzaR3UCkDhrCeg5ujkzlbdMa4Cjd10QcDW8DceE0u87xjHEhnTpgKYs/XvJJoB9aQ5RMLpodfMqs0Rf9Bk6ueKNsbKuXbo+a9H8vIMa20NThyD2vlR2uP7c21aFnCb/i2bj738V+zgJLS08a1eQusWL45g+8hhID+QEpbK0ax3PYWqX30QLGwFmkcB/jhJs3AdxgiFnpayGGCy2/ZWOH0CCGlOWjoG271t2kMnFvc2ULhJX+mP6Sgy8JCI0cydZlrtuoiRvl8/ZE0ik5oUrsnf1wrHSzZvEpxMeI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YOHa03ipfQFbPhdznKj3BL1K97nB4QItePu5FU9nePSezvL9pXU4hiZRruQ8?=
 =?us-ascii?Q?Xxjhhdh6G9+HIhYbA7oq7DxaQDfx9loDx9COcsS5DG139WIalHSvUgC4esiu?=
 =?us-ascii?Q?xKmmMU++9qbHMSX+VEa+kNRFQr4qpCmbt7XPBy051wt+wGaruFOxx0PtLfNx?=
 =?us-ascii?Q?sm3Qo3Is4lD/Flr3v+ySQf9JUxZ23FWFwXNkgorm1Ke6LHnHLRuY+HQEXVRC?=
 =?us-ascii?Q?9wPJRAdST3LF3H7WOLe+Pww1oBlELpDO4Ptuc63wb5AzpF77XuQHgItpoCbK?=
 =?us-ascii?Q?/NHzlkcR2IX/Y1dfxAt7m0iad6YhwAWZgz9Z7N359NOhFwc2vwBN/j/SlYT0?=
 =?us-ascii?Q?YKC0Vf4DzOb7dts4XIyY+/AdTxJQSRf+3cLFa7xWAjCBnTPngYiL5YYS8Wju?=
 =?us-ascii?Q?GA/EE+IlvJvWqB+hsTBjAYsaN/gflYbWZf5ct+vq5v0k/ChWl4IocRWx4q9v?=
 =?us-ascii?Q?nws+FJsAIgr1NmtQC+IdPH/5pBWUavFTEqHCjPaVpSvBrs5vdChSX4USDePR?=
 =?us-ascii?Q?mWKNG4CAd/6qU5MDmld8uycbh5cJpoDfJDg6sJ/NZt0B/3WdgIh5jhIm3qW5?=
 =?us-ascii?Q?2qQXRQSTDQS6ne88kiHP9aEL4jOKvwEcenxzqpTcz1GMghFdg68mtV9THGoz?=
 =?us-ascii?Q?S2OWCtaLn5rCbLnnehwL4J7T+Ez9MgkFgsY+gbFzkAnSsJJEmDwZY7lOxVvY?=
 =?us-ascii?Q?92qfGHKC7arb5T5Mgr063tZOFMtUBcmwPDsy344BQPpo2MDHtJzLqsJbPmjS?=
 =?us-ascii?Q?IjziwtvtouRCZFrUdhJJzAwF+WN5ZXIu+27BUYrq88x5VQ/74r+0nKJLEMmy?=
 =?us-ascii?Q?MqHZKqjPVUY3LUg3yGAMEw23Vm0wclIMtwYdfwXx4fYCxUWwSPvIpcnmryht?=
 =?us-ascii?Q?0OLWn65ETuFTE8YNl+sBpA5wj2u8HefbvdD8hadSqphNtF4mJs0/7MJcuC3l?=
 =?us-ascii?Q?3hr73O43gyzb5vod+94V0fuy04TYqYPWYr29tuqgkO/htiyhmX24eAcYU2F0?=
 =?us-ascii?Q?XJMOk6pW7hJfBfeV7thy+3sjwuUMirTsdd/l305cuXgPZ2hnjKuc583FANXh?=
 =?us-ascii?Q?m8VhvXjgP+MupyL5RIVXDLOXdYAfIsD3Jwmhwkm0MSg6++VUcIpc/bmuB4XT?=
 =?us-ascii?Q?YLy2QdaQKQSo9zT9T+RLLrA491zAsr68EYFFwx6vEjM13omFcauIGfbiAY9+?=
 =?us-ascii?Q?Zh+43Rr+XI5kThp+p1XLJQzkYRovQPjh7NPV0kskSwUVFAvjOPoW9ihDesZb?=
 =?us-ascii?Q?Mo8F9fUL3XFrTqazLmo+voRJduCnwPmadQuShzjBBiRLICYBQ41m7QVWmDQv?=
 =?us-ascii?Q?CU7hsV9Rc2jrqSTV0VX3/YVqefD6m9QypKT1Y06zaeyIX/CXktwQqddlg9Xe?=
 =?us-ascii?Q?s9vItjV7Ftc6oKwjNXM21RL4BjVn9z8IRlqc8IvGoif8sErRz+ZYTT1oZYtG?=
 =?us-ascii?Q?lzL8NHjZoaip169fZtNznpapZvfQNx3iEhgDKmfFnhLSxntrLKS15ns5PqB6?=
 =?us-ascii?Q?FAJO99GWqJWQiC9Ig1PedMlXPWRQKJQWSyBvJGjWcUh6gXvqOJ6My72DOZkg?=
 =?us-ascii?Q?ZRg7tjPkwD9/Dyr6bBVtTxJj7i9MOanHXWsbwHzZVfSrRpzhPeti/wpFpw7z?=
 =?us-ascii?Q?sus9TE8d/ef6PUUOBZ5/OcorRPrHakgImHpL6kpjVJHojviuZazW3m2Y562m?=
 =?us-ascii?Q?hHpJtb/rNIgY+cW1yzXW48jbyH/qc27QvlYybY4mSgVeDivI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ae0427-ab73-4982-4288-08de9e82b4de
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 02:15:35.2237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uurGUikEnbimuCm52s6yMq7EOGNA76ceHkpbhxiA5DQsEscKzAuqC8CAkVf8sk8BiZZi8mNzM07qKfOEkivenQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_191540_758308_501EB09A 
X-CRM114-Status: GOOD (  19.15  )
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

On Fri, Apr 17, 2026 at 08:12:46PM +0300, Adrian Hunter wrote:
> On 17/04/2026 11:11, Frank Li wrote:
> > On Thu, Apr 16, 2026 at 08:56:55PM +0300, Adrian Hunter wrote:
> >> In DMA mode, transfer lists are currently completed only when the final
> >> transfer in the list completes. If an earlier transfer fails, the list is
> >> left incomplete and callers wait until timeout.
> >>
> >> There is no need to wait for a timeout, as the completion path in
> >> i3c_hci_process_xfer() already checks for error status. Complete the
> >> transfer list as soon as any transfer in the list reports an error.
> >>
> >> This avoids unnecessary delays and spurious timeouts on error.
> >>
> >> Complete a transfer list completion immediately there is an error.
> >>
> >> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >> ---
> > ...
> >>  			struct i3c_dma *dma;
> >> +			struct hci_xfer *completing_xfer;
> >
> > Generally, it should be working queue.
> >
> > So working(current)_xfer should be better.
>
> The completing transfer might not be the current transfer.
> This patch is concerned with transfer lists with more than
> one transfer, and an error happens on a transfer that is not
> the last one of the list (the last one is the completing transfer).

The modern module like use term "working queue" and "completed queue".

"completing" is confused, look like dma "working" it.

Frank


>
> >
> > Frank
> >>  			int ring_number;
> >>  			int ring_entry;
> >>  		};
> >> --
> >> 2.51.0
> >>
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
