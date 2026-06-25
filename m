Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E13CDB479
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Jun 2026 14:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gVJijHhataW/LTfeRK0tmNzQMZ2ETwN7EfjDyssSdlE=; b=psA+cTn6igsYMc
	xKVCLldHhccsw9PhrD1SKSAOA22QcbZRQp+Iqqbd08SzPonAHDzVLB1WUXvcW6AJVH9fqxXZNt5Vf
	ExX6TLQ2lPwh1fPBs3VrPoPYuLWE8mpcY5bjJ9eXQsW4zEuTiMNRipXdPqCxuaKYUVx0DWijKskZ0
	p4FN74LlF4fqX3iiWNS3TXXBgoR4VAJGui9odS3azXO041thIeM8sKNgi9gwE9f7diOysewQOpuRs
	sH8ZvTrwCeNXkZk5V5wrH54bt02GcVO7fN2mC8DIf+jk0F5PBASRHUdsF9rF37fUHl11XNlOPrsOg
	S52TRGBYonTbclxd5MsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wclAz-00000009LIe-2QCk;
	Thu, 25 Jun 2026 14:35:33 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wclAw-00000009LI1-2XW6
	for linux-i3c@lists.infradead.org;
	Thu, 25 Jun 2026 14:35:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXsfKehYJepe9lJASSHdqypXuPE4Ne2jYOjOTbLubP594S/7o0PERi8GhLsrKysHA1dLHoDPayMV+IPGaEpo2jGFHJrbauQu++uJMt7cj2uytpZ15IFLZl2aTrvJimsEFgiNdg9HiEKvncMXY2b8kWCkWCu3CeS/RD8Q7AS2AbCww3FC/B1+o7AmD8Yh/IiJsz2eLSnxC7inyLxeRRlTnrpu1A524oTlNRmY/Z9Y5adEp4Wak9bG+W7pWnwrAsO3flFi9C1KqYY3gxlJ6s/X3ojy0iGXQ5tfG2+qa2DIfLmcWtD1Ay1BKAbH9axyiOc/mPnBYJydUEl/mETGAgmaEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+ILdfGXj4StQfygvSbkEiAFNwtR4ekyaYtaJw7sGrI=;
 b=fGvHbPfacInT0sut/9mRtG4BEYaQr3k8tHTLaQz3W74PXU8Ds2DEo9+Stn6WiuCvwSazKPhmJgIslolmRtFnk5w3E9QCwB7G5MO+Cxol7HONuaeUGzl/4mmYdR5nzKESftCKnDbnqhluyOBcVjT/6d8Fag/4uM+ThQyhzNHD4vpvdlniaup2TnrGOIibqu6b5z06NqEWeok/qAmHBQeLA0p5sUy/H9G0p6dvypRNH6iOivWjZx69LOJHa2qfmurIL09MPiGjDhmTO3nipL0zuK+PhWZSz+VHcX29N/cRGY95taauD+MpE6JCbHRLfK1iBzrJvUghNIocCQ3H2oC8Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+ILdfGXj4StQfygvSbkEiAFNwtR4ekyaYtaJw7sGrI=;
 b=FISktZOCPBThcySB3DF5gL+CNvbXlx8Ggg7wPidBPpeGpw3M21Iw+vE7kNNQn4KDnEz3uVc4ZWZHCFnpwXHjtzk6TVw2lrnwiYnXVMei+ImqItJCMsJknKEfV7G19TI4ml4HDCnPZlvu6wGPBrweGtg8J5O3m0NmiPVscbybI9oT/b76Bi3B7dhohzEHbYoBFvBvnpS4lwECRZu7UY0aypGWuLc04qO1IUWIxPItieVRDLkTIdC5UhzFKV7uYXz76XBOJbVKibYXkBCRV8jE7zvYq1AIXPiRvKwYG8Ia+OqKmZYaH0NWQHNx+uosRy7vFcNmCI0n+SloT004cUTSJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PR3PR04MB7291.eurprd04.prod.outlook.com (2603:10a6:102:8c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Thu, 25 Jun
 2026 14:35:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 25 Jun 2026
 14:35:25 +0000
Date: Thu, 25 Jun 2026 10:35:19 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, linux-i3c@lists.infradead.org,
	Frank.Li@kernel.org
Subject: Re: [PATCH] i3c: master: renesas: reset xfer status before each wait
Message-ID: <aj08pyM2TCahO6a_@lizhi-Precision-Tower-5810>
References: <20260625030357.87402-1-pengpeng@iscas.ac.cn>
 <20260625032059.14A3D1F000E9@smtp.kernel.org>
Content-Disposition: inline
In-Reply-To: <20260625032059.14A3D1F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA1P222CA0051.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PR3PR04MB7291:EE_
X-MS-Office365-Filtering-Correlation-Id: d223688e-52f6-4d2b-85f0-08ded2c6ff0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|23010399003|11063799006|6133799003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: RbuhqiflM/KErfPcdYKi1RVY954SyOgpkk5CK1z9lA/88bn8GtvL3Dbox7k8JG55cFLvsEe9x9lA/3+S0GKrDXuT3ZDrbOAlX3KFD9pbyR3F1jC+CSaohsRMKCYk7kRThFaKP6m4jCuCtei2HzrHvnac/FzBHWNHRxmj43N7wepAGoWdhMSz50JI9psx8q4qjetZ/VKa+wvGLzGnklc8xYUivFZtIE87WA4kqD3UQO6w0RkbDlXwcSVJVC8ViSKrH8INox9bl3tklDKAf/iPNKEz18lVmZrtCIzg6JKq3Mn7jsIVc77h9dey+bsnTLMorCz0pLrYHQq7LFpG4uBcmKjIdRaVgFGH44uOmB/U08/g/rJNS/x6iJGo/EchtrpSUb/BtngirZdGK2zq7Ypmkzf5qAcXjsLcxE4VxS8uCQ1/kdA0PNNkRk/B07tDzu8V7EosbDZeZ4TjOVmtaP05vd80TyGCxD9oBaS2lRkySNCJNJw3rYPkhXaiq1ZEZtwPm1tY/bnVoSuZ6ujLUhLaeKRte9r25Ww9kN/inPo4o6WCh9fFsvzqa+PhO6nXYwZUEJPWff/ZAovPFj5w2C0iv+VtAVTXXEI6M2HJzziKR0c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(23010399003)(11063799006)(6133799003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5lc1r1T30bzaK0zVBfZ7VKwN2jlmj4+bODGRoWtWAlLZhah7yutujHFRq0?=
 =?iso-8859-1?Q?f4H5PCHfCSyBPXptnnQA/FZ1n2w+r34eKMbpd385bJcY4jzMTg36rEkn2l?=
 =?iso-8859-1?Q?HMlILvghx3fn8hmqC2iWQt7fbIv5yFc4CbQBigkDozB5Ti+7if/I7VKyBs?=
 =?iso-8859-1?Q?xwrrf5PpjtVRGnaS1XYAzCZ5DlqLLSk6hVvZpidYFkAc/Q5FiVJtC4Tps4?=
 =?iso-8859-1?Q?iTOm4j+GaOi4n67ls04uizRim31rjXLyTYKcfU8ObQjP9PGJiMeNJeNE1o?=
 =?iso-8859-1?Q?vfpyv6LdPlPDiKF/ujN6oH8v6MkaKW1fLrgnPnn+u2L4GNcu2DyViiuu2l?=
 =?iso-8859-1?Q?3cdwXTGjU2o98d6SJ6r2WBAHD1zUEH3xw9tAe/L7HKKwgRvnw6Rg3jOZTL?=
 =?iso-8859-1?Q?p7w6bHoM519F8zgxa2kx41ZoiaBt/4UbWflJu7Z39vdwWhBMDaCgS9mcPQ?=
 =?iso-8859-1?Q?LlwEmXHYiDoRCR/9wjBlVGHiM/QOkQOZL1vtZlEBW/QoyIhtmGNyJkQv8A?=
 =?iso-8859-1?Q?n6M94QU5H6NQtn+xXz/fi2lDilR6OXZmsfCLODJspzdujPlDwzxOabgyud?=
 =?iso-8859-1?Q?a2JjXM3awKZahva6l7qr6WBUa98llNJZV7z/LJkZa4iRzOp2MHb+Wgauor?=
 =?iso-8859-1?Q?cJ12vu9/wPYUPXlTTC5b0eJhZogK3d1rtm9oZuyTr/ZIHF4fRBquUtFvev?=
 =?iso-8859-1?Q?1yuUMqoVcxrzjt16CsrPO19dKiKpHmw/unZdgkLfvyjyDhi6PClvhJlVf2?=
 =?iso-8859-1?Q?BA695iVXzTxrMZEnTKFwEE+b1LkTPAhY0tSiOBTFNxET3cnMHiYmofyvQR?=
 =?iso-8859-1?Q?1oZOWo2TM7P0T7OR1Y2J6THTvmXXQqDiB9f6Lz6nKoqMNmrxgv0/HHdxWk?=
 =?iso-8859-1?Q?RhFNrAJy7sD9weiCiJ1hqfOp1LFMKMflfDaLTsthnLb1AkFsGEYnKnlhIa?=
 =?iso-8859-1?Q?J9/Pxlj/usMnt5LED4vGbiYd87LanK151ujA3nJamd26OON/8Blyvqmmkq?=
 =?iso-8859-1?Q?ecM2sCQPUk8EaICCUeL6YLNFkH2XKVt/jXYJpYdGegjxtud/spQGS0sW+Q?=
 =?iso-8859-1?Q?xt80KbJUFZWf5iI5bbWcj6ShiRapHFRSxPWLjAxtqIfX2He1GGoBpTNtrd?=
 =?iso-8859-1?Q?knEC29499B8thi7p/jcmjo31+Z77iVlN0XruQgXEBLjRc5KsAxP0+KqTku?=
 =?iso-8859-1?Q?K0/+c+bQeMKG8JKOSX8T1GD7y3xOKW4+2MYRaFtg+sqw0DraQdw9D2Bsl3?=
 =?iso-8859-1?Q?JN8S4wLU9tZ7R4aTAAoelyzsKaCogQYRr3QZQRFq3Q3BIVyQ+e6mKRcRmE?=
 =?iso-8859-1?Q?0NYdOscVRjw9IEJMydILFaXtMK3DC4+RtWbhOCyzdwDgnW8Jsn0alLhiy5?=
 =?iso-8859-1?Q?DSk85daLywZ7MGUdAp91EFw0UqILD2HW1n4oRtkNoWFhQYgoN50qxhz7Gr?=
 =?iso-8859-1?Q?Fd+5wLK0hNHjVvF/SWqHgCWgHZ1LnPWyu76tmcgEoxFziC8gqp1ecMMgJg?=
 =?iso-8859-1?Q?qE7S9mJnhwlqq5CQwtjtxIXlmRCt30NE6ZcLtBl1bbk7t3BukVo77sRw2X?=
 =?iso-8859-1?Q?UxcRer22qJixrm3DASJhbTmUpxZ9TfYz6V1+vhX3H9ZZVhPKRBqPOBZLDq?=
 =?iso-8859-1?Q?0IUPyxCLVO0uJQmmHf2pdRfJNBFjFvt0x+tsr+OQQuvZ5f83pE/KWyk2lV?=
 =?iso-8859-1?Q?Q0w2XkYUIIPgOWHisWWjIN0r0nxiXxY8XPeBJfKZtSuz5dNIhUTjSvPhIC?=
 =?iso-8859-1?Q?GnRK18lVkh03A2PqckcF3jmTayjnidUtnJN0LbN8SKc+q3xTTe2ZNhCOqY?=
 =?iso-8859-1?Q?/0IVWicnPjGx0njJVFRqSeGlO1rfvj8XwMUSRg6gEF6zynWGU3n+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d223688e-52f6-4d2b-85f0-08ded2c6ff0a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 14:35:25.9009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YggdETY19v03wLs/yuaHcJp0lwK4mmt4Qz3534p0PGhMcx2SnDkboHL+9kgJIQ4ZdiieEoF4IGrP4j2GDeEd/Kl6oULkVKLk47EZYQrELv33GQOyN8iXgzVQZjizQdt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7291
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_073530_651808_A5F0D080 
X-CRM114-Status: GOOD (  29.39  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, Jun 25, 2026 at 03:20:58AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] Buffer Overflow and Data Corruption in Transfer Interrupt Ha=
ndlers.
> - [High] Missing Hardware Teardown on Timeout causing Use-After-Free and =
NULL Pointer Dereference.
> - [High] Ignored transfer timeout leads to Hardware State Desync and sile=
nt failures.
> - [High] Unvalidated hardware response length causes Integer Underflow an=
d Undefined Behavior in GENMASK.
> --
>
> commit 1827d9b795e70cd1f909f688b702f06c732c89e1
> Author: Pengpeng Hou <pengpeng@iscas.ac.cn>
>
> i3c: master: renesas: reset xfer status before each wait
>
> renesas_i3c_wait_xfer() reinitializes the completion before queuing a
> transfer, but it leaves xfer->ret unchanged. After one transfer completes
> successfully, a later timeout can therefore reuse the old zero status.
>
> Reset xfer->ret to -ETIMEDOUT before each wait, return the transfer
> status from the wait helper, and propagate it from DAA, CCC and private
> I3C transfers.
>
> > diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/rene=
sas-i3c.c
> > index f39c449922ca2..7f123cd72cdf3 100644
> > --- a/drivers/i3c/master/renesas-i3c.c
> > +++ b/drivers/i3c/master/renesas-i3c.c
> > @@ -433,15 +433,18 @@ static void renesas_i3c_enqueue_xfer(struct renes=
as_i3c *i3c, struct renesas_i3c
> [ ... ]
> > -static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct rene=
sas_i3c_xfer *xfer)
> > +static int renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renes=
as_i3c_xfer *xfer)
> >  {
> >  	unsigned long time_left;
> >
> > +	xfer->ret =3D -ETIMEDOUT;
> >  	renesas_i3c_enqueue_xfer(i3c, xfer);
> >
> >  	time_left =3D wait_for_completion_timeout(&xfer->comp, msecs_to_jiffi=
es(1000));
> >  	if (!time_left)
> >  		renesas_i3c_dequeue_xfer(i3c, xfer);
> > +
> > +	return xfer->ret;
> >  }
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does this timeout path saf=
ely
> abort the active hardware operation?
>
> If a timeout occurs, the driver removes the transfer from the queue via
> renesas_i3c_dequeue_xfer() but does not appear to halt the hardware DMA or
> interrupt execution.
>
> If the caller then frees the xfer struct, and the hardware later complete=
s the
> operation, could the delayed interrupt in renesas_i3c_resp_isr() derefere=
nce
> a freed or unrelated transfer?

This is one problem, although it is less possibility. suggest fix later,
you may reduce timeout value and add some debug message isr, this problem
should be triggered.

Frank

>
> drivers/i3c/master/renesas-i3c.c:renesas_i3c_resp_isr() {
>     ...
>     xfer =3D i3c->xferqueue.cur;
>     cmd =3D xfer->cmds;
>     ...
> }
>
> [ ... ]
> > @@ -687,7 +690,9 @@ static int renesas_i3c_daa(struct i3c_master_contro=
ller *m)
> >  		    NCMDQP_CMD(I3C_CCC_ENTDAA) | NCMDQP_DEV_INDEX(ret) |
> >  		    NCMDQP_DEV_COUNT(i3c->maxdevs - ret) | NCMDQP_TOC;
> >
> > -	renesas_i3c_wait_xfer(i3c, xfer);
> > +	ret =3D renesas_i3c_wait_xfer(i3c, xfer);
> > +	if (ret)
> > +		return ret;
> >
> >  	newdevs =3D GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
>
> [Severity: High]
> This is a pre-existing issue, but does this calculation handle the case w=
here
> no devices are attached?
>
> If no devices respond during Dynamic Address Assignment, cmd->rx_count wi=
ll
> equal i3c->maxdevs. This would cause the subtraction to evaluate to -1,
> leading to undefined behavior in the GENMASK macro.
>
> Could this result in newdevs evaluating to all 1s and incorrectly registe=
ring
> empty slots as real devices?
>
> [ ... ]
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does renesas_i3c_i2c_xfers=
()
> properly handle transfer timeouts?
>
> When wait_for_completion_timeout() times out, it does not set cmd->err. T=
he
> loop then checks if (cmd->err) and proceeds to the next message:
>
> drivers/i3c/master/renesas-i3c.c:renesas_i3c_i2c_xfers() {
>     ...
>     wait_for_completion_timeout(&xfer->comp, m->i2c.timeout);
>
>     if (cmd->err)
>         break;
>     ...
> }
>
> Could this ignore the timeout, incorrectly return success, and allow a de=
layed
> hardware operation to corrupt the buffer of the subsequent message?
>
> [Severity: Critical]
> This is a pre-existing issue, but do the interrupt handlers correctly man=
age
> buffer lengths and offsets for transfers?
>
> In renesas_i3c_rx_isr(), the byte count is rounded up to the nearest 32-b=
it
> word, which can write past the actual buffer length for unaligned transfe=
rs:
>
> drivers/i3c/master/renesas-i3c.c:renesas_i3c_rx_isr() {
>     ...
>     read_bytes =3D NDBSTLV0_RDBLV(renesas_readl(i3c->regs, NDBSTLV0)) * s=
izeof(u32);
>     i3c_readl_fifo(i3c->regs + NTDTBP0, cmd->rx_buf, read_bytes);
>     ...
> }
>
> Additionally, the transmit ISR writes the entire transfer length without =
tracking
> bytes already sent, which might overflow the hardware FIFO:
>
> drivers/i3c/master/renesas-i3c.c:renesas_i3c_tx_isr() {
>     ...
>     i3c_writel_fifo(i3c->regs + NTDTBP0, cmd->tx_buf, cmd->len);
>     ...
> }
>
> Finally, the response ISR reads the remaining bytes into the start of the
> buffer, potentially overwriting data previously received by the rx_isr:
>
> drivers/i3c/master/renesas-i3c.c:renesas_i3c_resp_isr() {
>     ...
>     bytes_remaining =3D data_len - cmd->rx_count;
>     i3c_readl_fifo(i3c->regs + NTDTBP0, cmd->rx_buf, bytes_remaining);
>     ...
> }
>
> Could this lead to memory corruption and out-of-bounds writes?
>
> --
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260625030357.87402=
-1-pengpeng@iscas.ac.cn?part=3D1
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
