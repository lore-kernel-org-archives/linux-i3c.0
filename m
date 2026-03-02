Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6D0EB362E
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Mar 2026 19:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3tlJrcGzR+wUPM4lf7GHXIFWxVtzMnZNQlE69bDH5ls=; b=HXzdZPRFlwV5Ra
	dAhyOxSATjPyNR0KLYOEXigmNybBnvmPCURxI0JWeTfozOkLtg7fOSqjbX158haPXbcEnz1JYXdKQ
	/RjSEJAKJdVOn5fQTcfWLwkKd3S6AJ0mcZLM9h5yHX2vE+q22vLQ+C8aiU6G7U88BELujrtT9+Ai1
	84kE/RgO+oVJUZOK/QHuqKoq5/TknLyldFYfrQkFy+hkJe1YL0yUSoxKumq5bgSqIiFcmYiTHR1dg
	88Zyw4jhP0f5r7Wt8dDVkkTPuQvbOeiFy0t5tPtZAekzZR0lYPg9E1PsVAOsxtchBX4GrCbAdfIMt
	gNk3MUv/LKoVc93F/dng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx8rM-0000000DjpR-0yO6;
	Mon, 02 Mar 2026 19:23:16 +0000
Received: from mail-westeuropeazon11010054.outbound.protection.outlook.com ([52.101.69.54] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx8rK-0000000Djoz-0D8w
	for linux-i3c@lists.infradead.org;
	Mon, 02 Mar 2026 19:23:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmqkP8JoE8sqYioi3Ci8SdS0C2TN74o2BAuCdIwMl5p+uoAnjVb2G36sW2WZDWF7gsMko8ydVrufn4JCSq6Baor9zCx/zSCQ+kA28QxM/HSJdWzNbQ+R6Ptj4+/P1S08ONModEts3t4oEsa6+Osh5DGcImxB355BcTK53gPyOWm8cSdNrCVOl1HpQOJ/H3xSAnFaet5LRcbFkNiTxSXq+AWRbObaMTip2Din13IQaqBLto2tI4ELL+lGm5DnsMRhdrst3eJ6JIOHAe0gybsIxcN8X0CNw0n0KSrTuMdloNQMXNaVIE2+wAeHHamxExoH1oDtwLltRG+qDi6kX4aEWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7d2cp+7fQWDrOC62PhSsFSadi7ciDaNSzTLknN5D954=;
 b=wUoPZl5oV+WZsOXugKiX9ryg/n5Jjdn0olzfIgVGEHkaDYGGW//SiTI0tFPp+J+dzautmY938xTNeWLLhLhnamWyTqZ2CABcd5W9ZwjxuhOI8fM2s3ki/sHT20lUNSa8orVox4tX+/K53OU6sunvq1RF/Frf/YLJHIOtGHrxw29vlAA0AAWwE4HdhcFe7FGmrCdnUgwtW31fq9PZ92AuYT8hYeq0oNkYu9/z7yCiyVxBDlEYsNdNd+Q8x5mGPhvybSr7oIngL2IRy2i1fRQgg05aYkqpkvaJ09B028CcH7uFBabwUYxoe4XbVezyQ2Q4K/fbQviGA3AyOyeKvo0aag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7d2cp+7fQWDrOC62PhSsFSadi7ciDaNSzTLknN5D954=;
 b=RMryYYdzXPfz5w1QXmEFKnn1SlFLBHfWwMAGB/sgTYTmbs8Bgnl35HSi2DcAVIHW8tOC2b7INZQnY22CdRglp3/8+m+sK9v6rORQE3cqxxTzwRp+8Ty5CDSFL95Vs1UoKiaIJPzB8FCqy9XSGaxX0GpF1pQgrbFrIISFhdfZovU7WN/24oMYON5QX2rIgw0TxMorXWzwbga5KHN76i9+2aM2PMYMdOvmBfEru9t0+d6I27DPNyh/TMRhJoiyPE5aQJa0x97bvBFJZNoqXsy4HcebyOn7HopYm/RXXRX8YCAuibgcWijeEk8LhU7jdxrszduC9jbRWqrYBQyAKwPd0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB6965.eurprd04.prod.outlook.com (2603:10a6:20b:104::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 19:23:08 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 19:23:08 +0000
Date: Mon, 2 Mar 2026 14:23:02 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 04/12] i3c: mipi-i3c-hci: Fix race in DMA ring dequeue
Message-ID: <aaXjliGPkW01JIgj@lizhi-Precision-Tower-5810>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-5-adrian.hunter@intel.com>
 <aaHD2hEUcfji9WKe@lizhi-Precision-Tower-5810>
 <d7d9a86a-3147-4bf2-bd19-9fc6dc4579ba@intel.com>
Content-Disposition: inline
In-Reply-To: <d7d9a86a-3147-4bf2-bd19-9fc6dc4579ba@intel.com>
X-ClientProxiedBy: BY5PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::18) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: 54bc2d4d-d502-4867-c864-08de7891230b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|19092799006|1800799024|366016|13003099007|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: YCR2aeKlVDiNR1mne0DUAzk0b0HyRv9tzAehSqrzOm4WKPc8C9v6kgGzcR6yOYJMQvXmmd3SW/xTUv7anSj+ZYSFyNP4SbST9t9F4jFlcviLGrjidRjoNUNehmAm0QOEVoqC3nd7nCGpozMQNAk78B4MeZxib25rgDgWqXV/YDgYltAHDo0ZPIrvTeQmWx1iaZT/xTSk+q73mfodGih3OlPzJOI3ubOeeZ4KqsFGinpgKx+ziiJEiF3nPrIGCAc2oQWuYXcb8qowRWllas4bYTr/yurcjpgCddWt19/xSm/8la7bZX4/wI7IOYHa2p1bHKpHZ1FZuoL9IW6vWqzZVV11OJTgCilzvKGtCBSE7m8COiPOidou/lAhV8Pz92OVljN1SuMcRzYCSaPIbNrcFdKAolquwS12hoBW+DT1bXL67HVuTV144OG7nLDJ8+JlauQDZ5PTINOH1DvThPQphtExAu6u4pUcBVa6rabMKb/M0bJ015xoTN320bNqOIpXk9q34LQwta3BMgsBhfys9FGFHHNbmqnzC8CbQwmHe/tGB28j6YOKo7t3PdweXTHuL1fta76RX4zmszt/uIIQIwM9kJEVS6aAPFp3L5bujDDmcQOJm4B3PIfNKrMiv8GA68xI3I0/961EC/AgD2fD8K56TowKCs9dzG+vLVoF+FRbVlKZBy5EPfoA/m5WjWOqbzngfe6XPaB9OwV9GctOUUyPRUwLYn4PE24lslG1Pcnz+sEsRz7SleOXeQEJQ7K+BbKH7tVuU57dWEWidf/8CzVzS0p75SouvVd9G7QQCm8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(1800799024)(366016)(13003099007)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Eje79WwFy+4uge7QJtrAaZIwRIs2AJAjagCYHU6AOHyFs38XTulFFq39omEA?=
 =?us-ascii?Q?MsJw1cq8rrEq7Ba0hNAu3UFimpwV+eUr33kRA6raIVJ5PqKZGjQdE6cLSn+2?=
 =?us-ascii?Q?CqPRu2PUhxUqH+Nvkqak8gQjnoKtywmVp+DXfklx0DwK5XQdxSsD+uJrNvW+?=
 =?us-ascii?Q?m9x3WucrErMbtmuPkVrpYSPxvfFFBvNhJUJSVasOTzitNlev44tEcbJ9PIMD?=
 =?us-ascii?Q?W3Af5xS2dHugsYOjxBTP5UZ9CLk/I+s4k1jxtrFpQjLJb21JbZdo/FRxA4gp?=
 =?us-ascii?Q?vefxpyMzy13GzlpW03Bi8F04grxbKfFekIdnBXGSEik6NMtatUM1K0/MkCZZ?=
 =?us-ascii?Q?XJeFDiTlh+ZK1bCTxNnn2ERWtq9iRlWWbzUr/XZnwStgf1Lhq3nToYdQFUcg?=
 =?us-ascii?Q?VvwIK9YRxarvYHvy3Dn71nI4M4QDY0h93VZ15hpNlLX1Vyz/6ne/hA/KnLIo?=
 =?us-ascii?Q?S8ZjBLBNrCzgD1co6bZOGkOj1T2snotFWu2BVMWHF4qYCWjqHnPMbc0d83mU?=
 =?us-ascii?Q?EIhjn0n9bUD8Db6xGua0kIP57m/XezsKwTk8e4evDMJpFGkYljYU7+nm9y+Z?=
 =?us-ascii?Q?2uMw6WA1wEZNHuB6Rh5tyV54StGUx8FTpJkGQOC33ZeSENUvUGg8iZJ+AGBI?=
 =?us-ascii?Q?vKbZoYTh+1xvgop4yflO08p6MOmQ8J2UPTDlaWgXJcaMtjC9EQ9k80gaybQp?=
 =?us-ascii?Q?ItOqZj/rDPWGmVAvuAxUiAeiG0Ed5oMeErwcARwulnh3KIvJ91FyEhGoqWDL?=
 =?us-ascii?Q?kbZrroLkUmvuS+uOeUB5oVmxVfUGf+ppWjgFVH46XaeHwvu2GQKe6RFZaiaM?=
 =?us-ascii?Q?6Su/Gm7u8TW6eB5vSgupQbQeCnOIw2gg1n4y+89KfNdcA89NG8DNtnD9c1DQ?=
 =?us-ascii?Q?zo8Ts4y1ncdqsWL2rR03kPrsxRvW/70T25p7bpUgh9KZ3MkFITnGGVH1mnk8?=
 =?us-ascii?Q?LijSI1vlBQeXl/FVIh3BPI4KXqltPGeLmlJyvvPWTXVlG4EQ1O79UoAUZin/?=
 =?us-ascii?Q?4VwfXvRZDknmKYlZmdFqIdCGVXkKL2gS7vRhla7wQXz67gmlTVgrqdfKtffj?=
 =?us-ascii?Q?OyouuY7aouQTPuNlDlngmaja/QyYoDZdTIeDyAXcvo09MrQBrvblkykPVOEV?=
 =?us-ascii?Q?n4tJcApQ3X22kd650inqTwIpn7lJFwULoAVIAJrUIy5ps9lMFofIJCP9NYLp?=
 =?us-ascii?Q?4kksHKpFm1WkXKvEGJgTLjzkCbqXZqAunHsMKAkUe1xEZ0YleagSWoyibRYl?=
 =?us-ascii?Q?9QjWXNwW5v6XYS/WcdkE4O883PZi+Tgp1MsjBYtSD3T4rNAPUIWAaYhb0kPv?=
 =?us-ascii?Q?2Ho79lSSqdRuy9Jd7zQpRZ4GULD5Z9pIicSxsd3qoB/Gwis7juj2X4HyHE2j?=
 =?us-ascii?Q?R4u9YI/2KnFn/D0lqLizUKElPzG72R3khqbYvirYx5OIr4qnwKQ984cuaaTD?=
 =?us-ascii?Q?Ut4+x3gqW2f6nnuggkzQoji83o3H4D9jQ+PzVzC4ZZ5opM23cnZwM/a7CeiZ?=
 =?us-ascii?Q?oVmc/XGnFcG/iyodbBICirEd1nXQlwhCb8IdL55EL7YxCtxmCi19QN9Bs9kV?=
 =?us-ascii?Q?XFl07iI7oCvL6glF7spVTCNUw73GH1IKOhKOct9dbQdLef2vjddGMMuV0Tfb?=
 =?us-ascii?Q?nRDnQ3nEwDEl1iR1WnnuRHr4K8pZAuAdGT7wUJvFdtt4SSvfpo2GZnUYKm73?=
 =?us-ascii?Q?xUyzqEc9ykvH6ueXDvr6c7YM9g9j3cc+a7VzTLd5xaNLmYpQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54bc2d4d-d502-4867-c864-08de7891230b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 19:23:08.8504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KcjxzE9DEJBaBC/i0fDY1Fmg1kzUcY8nPcaRTxDGp67ckDcUrgzjMRylioq/vjgdnm0W5tft0VMYvtkq6GazUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6965
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_112314_114897_4BA0E51D 
X-CRM114-Status: GOOD (  27.84  )
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

On Mon, Mar 02, 2026 at 10:43:34AM +0200, Adrian Hunter wrote:
> On 27/02/2026 18:18, Frank Li wrote:
> > On Fri, Feb 27, 2026 at 04:11:41PM +0200, Adrian Hunter wrote:
> >> The HCI DMA dequeue path (hci_dma_dequeue_xfer()) may be invoked for
> >> multiple transfers that timeout around the same time.  However, the
> >> function is not serialized and can race with itself.
> >>
> >> When a timeout occurs, hci_dma_dequeue_xfer() stops the ring, processes
> >> incomplete transfers, and then restarts the ring.  If another timeout
> >> triggers a parallel call into the same function, the two instances may
> >> interfere with each other - stopping or restarting the ring at unexpected
> >> times.
> >
> > how to sync with another hci_dma_queue_xfer()?
>
> In theory, so long as the ring remains enabled, it should be possible
> to enqueue transfers.
>
> Nevertheless, the use of the ring spin lock is added in "i3c: mipi-i3c-hci:
> Fix race between DMA ring dequeue and the interrupt handler".  The same spin
> lock is used in hci_dma_queue_xfer().

but not use spin lock in abort. So enqueue and
"rh_reg_write(RING_CONTROL, RING_CTRL_ABORT);" still happen at the same
time.

Frank
>
> >
> > Frank
> >
> >>
> >> Add a mutex so that hci_dma_dequeue_xfer() is serialized with respect to
> >> itself.
> >>
> >> Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >> ---
> >>  drivers/i3c/master/mipi-i3c-hci/dma.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> >> index f60654fbe58e..5a9af561e4cb 100644
> >> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> >> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> >> @@ -133,6 +133,7 @@ struct hci_rh_data {
> >>  	struct hci_xfer **src_xfers;
> >>  	spinlock_t lock;
> >>  	struct completion op_done;
> >> +	struct mutex control_mutex;
> >>  };
> >>
> >>  struct hci_rings_data {
> >> @@ -347,6 +348,7 @@ static int hci_dma_init(struct i3c_hci *hci)
> >>  		rh->regs = hci->base_regs + offset;
> >>  		spin_lock_init(&rh->lock);
> >>  		init_completion(&rh->op_done);
> >> +		mutex_init(&rh->control_mutex);
> >>
> >>  		rh->xfer_entries = XFER_RING_ENTRIES;
> >>
> >> @@ -549,6 +551,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
> >>  	unsigned int i;
> >>  	bool did_unqueue = false;
> >>
> >> +	guard(mutex)(&rh->control_mutex);
> >> +
> >>  	/* stop the ring */
> >>  	rh_reg_write(RING_CONTROL, RING_CTRL_ABORT);
> >>  	if (wait_for_completion_timeout(&rh->op_done, HZ) == 0) {
> >> --
> >> 2.51.0
> >>
> >>
> >> --
> >> linux-i3c mailing list
> >> linux-i3c@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-i3c
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
