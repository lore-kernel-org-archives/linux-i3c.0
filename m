Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512B7CA0EFA
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Aug 2025 23:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S6ccwtckDfyJnOW/nX1DpsTDGV5rVf1hCh/1jFz5VSk=; b=NpsyqiIxozrjII
	1dLvvOC3opflofDMZFMRctdhmzazfTe1eus4HvAeb09IFY11guMiibc6QKyebfPZHYvCkvd8hVf63
	kiM9V6FnkZ23ho78mftydxoxZQKTQQUX1EdwAr1nWjfXiFX2h45ZnYrF4y5BPvtuy/gAscB1rd2BU
	aQD58e1MihEccVXx7ecg9ZkPkQ9XFiFGel/OqFPb9Mu4Y5qtU+p4Nzw2T4YdFQQKNPbDKDsVX+gLu
	YEGbWgLkYcT5GslmgdjnjX/EMiCfeUXBLfHPTyVj5jXmUSG8sxw+8VU34X/XyFjxGnR4Ru4WCi0xB
	jo/Se8TVDY5rYllvippA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upF6Q-00000000yfR-0O2x;
	Thu, 21 Aug 2025 23:53:54 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAQL-00000000CTZ-2ZjV
	for linux-i3c@lists.infradead.org;
	Thu, 21 Aug 2025 18:54:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HG70CxAA2pqVkuuaIzlZKAM3xGOoORnA/kIKu3ms7yRipMgl8oyn+XXwFSfCk5wLQCE094cGDcXUpBCdYt9SoThLzGBbjUnPTIOy12MsdUxvLlKAXxacCgWmO3Vvvn6KKzDjC57Y/EeieD6/qb6mvINMfzSY2E829w/FvzJEYHvGetBi4lghIdMj4Fr4gqwaCWVvyXd8GwQH1cGS1sO5QjRGDRE/7fMZWIhguTuxI1RKQl4g+z+++JJ/jd0g00PDpK/C0xZ6Ti47DkTUE8axEfiCc6eppavl6Des1rhA/+4yRtS2Z48d1PxBEOwR9ZwpuaYDllaIyLANFGHt8RWdNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcLg7ZQKHeq2OyBB04dXjvHUhVJ/lluJMEKh2MU/KHo=;
 b=d7WsJwj10utFfuEsaPbyIvbvUDzZ/5MLV8Cdbsk9GAvZ8IYueuzCMrhJCxvAo0fR9WdvReNb0cjuOKJsyFHNqCrv6tNlrgUMlh4Iuc6UlydklthxGGAt+0A0BA0rri5JyPK4eVionoPTDPmEvm5AvuqoYPlB6DQWGDkdvY5Pcyl1vu+iFZICdk/K1nuBDac2hzh33MGTMotke2R3u0wCRW/vKigpBZefwJe+amM598TL2wnLhM9yq8xzGhnExq9YoPtuVEHztA95tp4p/po/A7uh9h2t01wDDDBAS5jpgbzYt/4CR2Z7NHv3xV3HIR3ZNkgkXtG2ka60nAQ5Xhn8wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcLg7ZQKHeq2OyBB04dXjvHUhVJ/lluJMEKh2MU/KHo=;
 b=D0yVprQji/nw/UOFicBR0ZGP67owWdKfArYu5CAETq77T/6d3R2vhIUtkHldv/Mg/MwVMwFMDcjHYEtDqsVoYge7KRnIlm4e0JlPAWjBKO+PDSUQr8Z5RGg7ssoejtHxtpKccRSkXgS6ulF+snk3hExAzIS37Dg8g1OzTj/ChGJmmZtPxcOViazaBX+P4oNB48n0WqOgZt+G4Ex5MnLuK2F4NdFJe7bwQMfnsxEbN7BH8LJYvvu4v8I/KiZbUKxZeCuS9U5GCm6EnOYgupmGZ1XqeU3BzKLe3OE3sZ56oMHKa+r4yQwsDddHoGYjEuWYnxyoiIvEl4MMz352mvip9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB8272.eurprd04.prod.outlook.com (2603:10a6:102:1c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 18:54:02 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 18:54:02 +0000
Date: Thu, 21 Aug 2025 14:53:56 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 2/4] i3c: mipi-i3c-hci: Use core helpers for DMA
 mapping and bounce buffering
Message-ID: <aKdrRD8shx9H1+Ki@lizhi-Precision-Tower-5810>
References: <20250820113447.2502071-1-jarkko.nikula@linux.intel.com>
 <20250820113447.2502071-3-jarkko.nikula@linux.intel.com>
 <aKXzrHl/EfJ9JRm3@lizhi-Precision-Tower-5810>
 <994e78bb-2b4d-4938-bbda-59fa8884ce4c@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <994e78bb-2b4d-4938-bbda-59fa8884ce4c@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0067.namprd05.prod.outlook.com
 (2603:10b6:a03:332::12) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 5debc67b-5f47-4caf-be3c-08dde0e41843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|1800799024|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CQh0eiTRNNJ5kgFiHNQP6lKzcEvwLSfRdsiG9jI1eDQvcPWlm/PhiBFEhS8h?=
 =?us-ascii?Q?vZmqXPXw9jsPLnw/ruMI5LavgIuDaGbdc8WCvhytLGyb5DmRZd9mPzpEk0o5?=
 =?us-ascii?Q?I6GJJK3YppcrbHlkrTkTF5Fogt+U8hvk8bcp4uzgataEjlu5HlVs7X91zriv?=
 =?us-ascii?Q?qW4BOvnU4kgUfnhjugeYuVe8zn0F4yDmnM99wwLrhfvKJLfvvHEN4qpa5HX3?=
 =?us-ascii?Q?ZRcHEGkmJ36YavIY9RntTl/76VOVBHz47V6F+fOhTEsh6A7oyoT0As53A9pb?=
 =?us-ascii?Q?rQAS9Rju28n5Eh1hNLwtuQsQI8gXTGv8fxUzz+Yhy/fqFgOsojSJ8o6pHRQZ?=
 =?us-ascii?Q?QdSHAY9+VRZZJAJchH6RsmN5S1jRG8wzFCpZZ/HpbPPWQjdMf2HJ1C0aJrX+?=
 =?us-ascii?Q?/mnpX0epDp/EXbBdsSpWJt3cB5mcRk9Mul1XOTvNEWMSp2aHPZOrKlUKV7Cj?=
 =?us-ascii?Q?OJx2xG0btniLlcTmANotLpTJJLr8+VT7Euqp9+H60UFAXyDHqK/i9QiRNixk?=
 =?us-ascii?Q?JQrhBwVnA5Sfmwi7ykEgUMuoRdOtDUGJrVjLMFolBFd776dFgqrH3aUSZXtI?=
 =?us-ascii?Q?BwWk9RmQY+QCiz/LtE5o3ttuUVDZfFpgGZlLbJxNSdwj1++5/MDM33hE+DXS?=
 =?us-ascii?Q?I2nFqTxHQu0FCMiUK44ggItzFqSvr1E+RPHutHOSw4wJA0GukBHQmNDzQr71?=
 =?us-ascii?Q?Jsl7ClK1NBl/Ifr4CeTz8YfBH6rloAr4JHD+LK2uWBRmYkYqIk8xNCnNg8/9?=
 =?us-ascii?Q?xJgJOC4FkC8wnmqJ9om1w6Gw+/jarwNMacVBh4DSrDeVogSsx3jjJlZW/fMy?=
 =?us-ascii?Q?GwVVNb5om0ksUVm5XgTFgjnzV4wFGouYp5mH8LIF5qPS5BlMqVjXECOX43yd?=
 =?us-ascii?Q?Zg2zWXqgwbJHchdbJS5v/WHTWl3XGoq4AN2GzzFnKCkr3ThQWDjcuXGnwtR+?=
 =?us-ascii?Q?JsvbSOf8bLG6/pArsDSdwIlLisACrDlrQuGnxFAzV8yOG/Iu8jAipFijC7iH?=
 =?us-ascii?Q?Tm03gb+7GuNcY8i+rk87DNrbuCEY4hqd5vUIrOO+ZCSoTZNFFu+m/Q0lNkL8?=
 =?us-ascii?Q?ehWsfybU+iw1NHBGp9QGlmgs8r43o62k7p6Lm88/5fjTJ6saqilezl/KLUm9?=
 =?us-ascii?Q?NIvL1vLFDncbhoz3Z6W/LeADlBDFL+l2sy7hU+Sg+WjvG73fgvkBFZa+JgD+?=
 =?us-ascii?Q?S13mxgr5h0KC/9x17EIPpmDZFBpgJmIyTYOZxHtNyESXDc/vRJrUMXQx/LW5?=
 =?us-ascii?Q?z7/p+5yEJzG/JBYaUURitHO2638baeCJjlUmQJ53XSvVb/Q7S7WoBxk4wDgH?=
 =?us-ascii?Q?/HkOFjKf5nU9f+PCIzZjYkhnooYp+089UYmwipWFt4Kr1yUipUE8XO4IKrqe?=
 =?us-ascii?Q?QRYXDMl0EUXN/DIcjpSRHxa8QsF/4SCAIoYZx+F7HtO/tvSHcBJXjQi2j5ZG?=
 =?us-ascii?Q?u4W07kVDfU/uwhUXR4ZGG2NITm53zeQ1eJufWQL9M0ya+Y44PTAodOCY/YH+?=
 =?us-ascii?Q?icuJ+lNEikP2VAY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XiCjbXXgsoDhhC3tUlqKQ6/rVRhwdkmiNH7iPMUGiHUjvcArMwCWaXTIgmdk?=
 =?us-ascii?Q?wDs7HtvPVTslZwR5aoML8oaWP28+irJoVVNpr5XP5rixCi6fdS4pRjlgBtN3?=
 =?us-ascii?Q?KIZp+0gKYEOdN0w8bKOTln42syjC3fBpW0Q0fq/OONvpooSf0YdwSsDjeDAQ?=
 =?us-ascii?Q?iLn9bfFR9R2iMr9MKSCJ8GO5oCpOYvxUwoCd6wm5HEU4m/4q/iALnnf94aBV?=
 =?us-ascii?Q?Psexr5roW0KBJXyoFdH2QT14WN0nPiMr/btw28qo52tV9dpNC1iIsP5WI3Cg?=
 =?us-ascii?Q?UP6lLTvsn81A6xM4+QLrCpqfg7ZbeKjTmrzc/R6doPZF3wSBT86qA6smSwi/?=
 =?us-ascii?Q?DyQjeTzMcYmuGcAdox9rgpm4kqhmM0pemDdFV/r9c2e1/IUp3DmNz0rQ3PEW?=
 =?us-ascii?Q?2kPBgng2B+34Pw/i04OdJm+mHiAXtwadgpbMfGVc4N6odWYALFUdRxEebhQo?=
 =?us-ascii?Q?Q+Jp6GVT7rJBJKqRAPWeZ17TE6PyixRAoM6+0wSZyj0bwngRi2IN99nXNnxy?=
 =?us-ascii?Q?fjABkI0AZt035NQ35Z/EmprZcCgB/qgOlgnlgFcmKl+XEs+hK48dP2am8pku?=
 =?us-ascii?Q?YB3JQ9CxR56zvZdpVqykZRHo/Zv+ywnjtqw/6SYYPEbRfgW4+5u30Oa4D6N/?=
 =?us-ascii?Q?HT5vE5M2eB63pdqJjHDomI9gIfwhDPUVHjOp6iSjmR8hycOmTePvGIRZjFXe?=
 =?us-ascii?Q?KYsa2qOgvEy4Guw+lFvrpD8/ZTJI3uPUBuxnS1jl5e6XX0PRwux5TYBvuMfe?=
 =?us-ascii?Q?b//2C39FnSzOeQ7mkOUrJHqk2vCT0dDU7SL/pncnEp0Ak6ZTDQVbe/Ix7LJ9?=
 =?us-ascii?Q?3thpCEspy7SVmN2Bo11cR7KG/AF0B09j/vBVNL2Ar0dwuQc1pLdDEOyzVUWe?=
 =?us-ascii?Q?zSPwKye1oZqwWWbIYDK+HITcClFMMd8Hc+eyz6CSXIDVOo9MV5oWOk2ZYKfD?=
 =?us-ascii?Q?niCyfzO2NMDnHW3XuEIyq15w07d7nnfKRTS3E1hBJGsZJHbDs+ttNJ60kXtR?=
 =?us-ascii?Q?EJx9QmE256DJvwfPp8AmgH8OIWKXjvmD11WNjATdBAdfxP8eiQZyUBYOLxNI?=
 =?us-ascii?Q?AcDt7ro0wJwYY7+rB15ocHALupKR6GpuAR9TMjQgwG45gvacZS/yy7dRI98q?=
 =?us-ascii?Q?4mFLcHsLGrYfXi1aQKYytDqXU5P3ilsR6sWnYm4ljIyAETXhXRM/Dyyx0a5Y?=
 =?us-ascii?Q?/m1ZcC0VoFjjOC666vi+wGWr72kmxHcufrkyfUtUcjKQvasHlwP62nE0IdvQ?=
 =?us-ascii?Q?k3b2vMo3xvHBk0qQGkHQgtzywyHJ1lS2fLa5lTUIP3ICQOGPIQbsItV2jcKz?=
 =?us-ascii?Q?QasaHcXZECBIlkz2vf8OS/8mivER4WGB0X1L5VOKT85DUUcPw6JKvMN0Q6Vk?=
 =?us-ascii?Q?QQHwLF8Bgi5TgUty8FHBAJMhOsm35cWVjXp2vkHu/Gf7SvjG/39QOT0LeTRu?=
 =?us-ascii?Q?6M2j1WRT7jX4EoCKsZJ4jy57coBZ0J+lJqymVbT4BXeoWe5wUjB+zeQaqKhL?=
 =?us-ascii?Q?BejXnvtT7pD2978Es1Fzp89MjBAKUUIMMYN6anj5WVKSdMbVBCGhKROMwC1u?=
 =?us-ascii?Q?o2NRgjSENsxLZJFupSl3vbG4CAZLA8w2DwSHo5Ko?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5debc67b-5f47-4caf-be3c-08dde0e41843
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 18:54:02.1955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+gkQqslwTtYdVhXXSk2/MDcfafmuBOgWLlLdOoZjgPK2EoXbm3LUNwYh2s392HFm6e713J0WkcQlAZxXgF7TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8272
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_115409_656337_7F74CC5E 
X-CRM114-Status: GOOD (  22.44  )
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

On Thu, Aug 21, 2025 at 08:51:37AM +0300, Jarkko Nikula wrote:
> On 8/20/25 7:11 PM, Frank Li wrote:
> > On Wed, Aug 20, 2025 at 02:34:45PM +0300, Jarkko Nikula wrote:
> > >
> > > For now, require bounce buffer only when the buffer is in the
> > > vmalloc() area to avoid unnecessary copying with CCC commands and
> > > DMA-safe I2C transfers.
> >
> > I see below you pass 'false' to i3c_master_dma_map_single(). where
> > check buffer in the vmaloc() area?
> >
> Yes it's intended in this patch. Driver doesn't especially require a bounce
> here (in the next patch yes) but if buffer is in vmalloc area the
> i3c_master_dma_map_single() does allocate it internally.

After check your i3c_master_dma_map_single() implmenet again,

i3c_master_dma_map_single(..., need_bounce,...)
	if (is_vmalloc_addr(buf))
		need_bounce = true;

You overwrite need_bounce in i3c_master_dma_map_single(), it will cause
confuse.

Can you change 'need_bounce' to 'force_bounce'?

force_bounce: true,  means force to use bounce bounce.
force_bounce: false, means system auto check base on buf

Frank

>
> > >
> > > Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > > ---
> > >   drivers/i3c/master/mipi-i3c-hci/core.c | 34 --------------------------
> > >   drivers/i3c/master/mipi-i3c-hci/dma.c  | 27 +++++++++-----------
> > >   drivers/i3c/master/mipi-i3c-hci/hci.h  |  3 +--
> > >   3 files changed, 12 insertions(+), 52 deletions(-)
> > >
> > [...]
> > > @@ -391,21 +390,17 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
> > >
> > >   		/* 2nd and 3rd words of Data Buffer Descriptor Structure */
> > >   		if (xfer->data) {
> > > -			buf = xfer->bounce_buf ? xfer->bounce_buf : xfer->data;
> > > -			xfer->data_dma =
> > > -				dma_map_single(&hci->master.dev,
> > > -					       buf,
> > > -					       xfer->data_len,
> > > -					       xfer->rnw ?
> > > -						  DMA_FROM_DEVICE :
> > > -						  DMA_TO_DEVICE);
> > > -			if (dma_mapping_error(&hci->master.dev,
> > > -					      xfer->data_dma)) {
> > > +			xfer->dma = i3c_master_dma_map_single(&hci->master.dev,
> > > +							      xfer->data,
> > > +							      xfer->data_len,
> > > +							      false,
> > > +
> >
> > you pass false here.
> >
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
