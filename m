Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28884C77B7C
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Jun 2025 22:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wkl28A2uh5S/Trmb3p2GxvwBrFGa308vGSEEJiV80wE=; b=vdEo7UIbj9LMcU
	BjYYMq6xTWebkX+8vTNHivugKL3XWgzALegiGqDGmHoVfSMI3e2B5xFFblt6K7BMHu3J+AJY9JRER
	S3wOGI+Ef6K1y5tPDIHaht7iiqwz2ggQUreBrjS63d/5nEK68793lC/eXpqgCzibKAbL1TJ8WgMCG
	BQPBO7IVnt8q6Fla1r92dImiXjZKmhsWwsoWuVq3Yd/TFMa3bA3JJflwLsTi2ReQ1O4/rH443HAcF
	yd8q5ShFWNGsdUhuCFfhxGIDWX4cs7v+lIwofEBRIfPZ8KCqHj2t87zeGVYgsnogwEm97fFxYff6x
	aSpxD6kAsUjRb+1izcgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBuy-00000006xt7-3lpl;
	Tue, 24 Jun 2025 22:15:04 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAx5-00000006qqf-2ZtQ
	for linux-i3c@lists.infradead.org;
	Tue, 24 Jun 2025 21:13:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/GXHZH6w6QF64ltnQkF622lxp5hSAr7rFqcgCH84pyu76mfn7dCXDN6vWlX/sfZHR52d2IAjMCNWIT1OMXLczZXSETenEKiGzbLHW96tIeqMlzpp4RzJRwiUicVg1T1qON+YsFPeZLxjHX8LLdfOtyWT4zxQnycgmed/3e1Ca6ETqJEl+lFKom+Md1qCUYCzIO5uUyoabLwY26464dw4c/efdkuvm9S0OYTxz1q5KcUsZuzoGz+2LeL6zgxjGhWJpNz9V4Iszb0c6qegVL0GvR9UeXGU2JUV6v3TUyL4ulYn+ClPzvQ5pPwm6a4LbR0LR53mgDr5J2iJmyd9YM7Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5O5iii0wEYbUn5ASPNO76r9P3roc4ahmdJSkZJ54I8=;
 b=BoDGlowbXrMtGb0gQqds1eCvaacCLDw7jpP9uPTHNISlDyw0ebLLK26NwW2ZIXySFDuXh8zoqHaFySJW+Kd7q0MH6r3RFxwb7W/9WrihcaEj0Kr5blV8OEafv4X8n8kPi/C0dbbtuQVJ5NkPjNnecM2oP2zrf3Kwgtz6b0aODCwCOdoAHEMmJXIt5Juafe8kNbrzp+vsF7BQVT1cXmETu1HeQS1/tXfUIFWlivu2BoSW+nb2RT4hMoERmKyKiE1JxUDW8Lln/NgjO/ENrB3zaPszV3iYtSImoNoZq3v54g3DBrVj529VRB1krofMG6T9NR2juP7eUdCBZtXza9AYPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5O5iii0wEYbUn5ASPNO76r9P3roc4ahmdJSkZJ54I8=;
 b=XbuRyqFFmJbAaOrhk3MyxjeHaAB33cD5MGnMpz8pfp5AGrC3ylHuFYQMOeE2UjnSW85ny+VNqmDYuZe2c4Hdb3lvDO3+dvkXiDnQTJLwRIcpIbEeYRnm9y3rhGqiBzurh4Pz66GozYO8YpY0vkojZJ/UTOwzETS5I845Ra13ZtR/G3QYNTYE+WrHHzgNJ1sF6vozUvpi6wQ1CYZW0SoeHm0g/Hr/C7+IyH0X+KVBUnZEfHN7OMEJArIJabcv5XnD8Lj0V/lr4hf7bwcZOmJMDz7tcUHe7VExuZ0B/Rm+ni9Aoq/9NKnWtbMCPhBaVniM0W00pvGsC8ymlhH97k5j9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB6789.eurprd04.prod.outlook.com (2603:10a6:20b:107::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 21:13:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 21:13:05 +0000
Date: Tue, 24 Jun 2025 17:13:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] i3c: master: Add inline i3c_readl_fifo() and
 i3c_writel_fifo()
Message-ID: <aFsU3YjzjxzR2drQ@lizhi-Precision-Tower-5810>
References: <20250624-i3c-writesl-readsl-v3-0-63ccf0870f01@analog.com>
 <20250624-i3c-writesl-readsl-v3-1-63ccf0870f01@analog.com>
 <aFrpra9j69OkkMbL@lizhi-Precision-Tower-5810>
 <aFsK8sDj7WvIBZvW@shikoro>
Content-Disposition: inline
In-Reply-To: <aFsK8sDj7WvIBZvW@shikoro>
X-ClientProxiedBy: AM0PR07CA0009.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: 585fc445-c9e7-4901-def9-08ddb363e92e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pjx8MLK5uHRuCF5Kbef1SU4EqJxDj+xdW1vuFfSQLi0E0Zg3rkdIPbt9qM3J?=
 =?us-ascii?Q?qI6sjLpmdEoYhSvYw73wHU4MFTPtF5DDeoUUoKYKkmASMbbNML0DRqJwGIcU?=
 =?us-ascii?Q?UHTg6Zt7pQJsgdf23kNqzCksbPPDgTEqqA1OvsjFdIiG9LmI+QWB93E4N6BT?=
 =?us-ascii?Q?1OeQJQFCEm4+ckSEW/WOTRT9VoBdpEu5i5srIcT5t6THMI32FR5ZAL94Xtj8?=
 =?us-ascii?Q?KO9E92i57wnq+hDANxnx0rOSIlMeviKbRjgO5y4dOduS66vyfp7xqgw+Px2L?=
 =?us-ascii?Q?AGs5eYf81JFckbPUcPDOa5BqX9QquWNs4Z+3fKVSoPJ8XYbBXQKOuup+v6eE?=
 =?us-ascii?Q?fg2cv11AevDDx0g7q85sg4OlmZYGAfyID2D2zLAfdIbYLt0LmFtdqEhXN5sC?=
 =?us-ascii?Q?QsdntdoW3/Z0JcFRVlfz4JE6a6PZQA7BTxYZ2pnfcvTfQXywI/Zrp+4pL/Th?=
 =?us-ascii?Q?PoKJ6kx3H/UkQK1NKe6gwp7Sbyyy0m6FeijTTO6nFZ72E6HcOeioFCpXTHAF?=
 =?us-ascii?Q?mZgN74YAOqiL0ZiFLB5NEzFTlgqnEZCRXz1hD34r1537COpFn0547XaKlxaZ?=
 =?us-ascii?Q?ghNMC4CWxyT6a5+pGQVbdyeL9Xp0To8mFlNKzV16Hl1pGX9GFFvg8oUDYX4V?=
 =?us-ascii?Q?QU8jyoSlDZ3TXMSThtxCyxi+rPkCx8XskbJOmXmE2Zg6sOHuIaeeN7prtZKV?=
 =?us-ascii?Q?UzlR8XbVn+YBo55hxb0yaolcjDkHTKv5sgzexqHwrjTfENsX/JKoIJvrLvM9?=
 =?us-ascii?Q?Znit8sWlpubSw/twMyeeYc4c/gRWgn61ju5CGHR/xzvCsgqeS3CqrJ8rNPez?=
 =?us-ascii?Q?TOEFBsUhxImQ1ynsse9/ZG3Ya1PHQw1VTnmrw+bdnsgc7OEW2Vn1jeFCLGUv?=
 =?us-ascii?Q?bXbqvYe+3m0EASMFQyk6rZH4mbTbhisLtTRKQLRKgR3y1lAUd92T1YXtQjmw?=
 =?us-ascii?Q?h+6GOxDWCsoW8VSf2LOVQw0/fhBfrZ7lZGny86N2PAjbB09/rvhQyu4L7Fde?=
 =?us-ascii?Q?qU19I7gzr3h7svTo6K1sqe9m9ob1PxFID7AkoAqNv/xo0J6/pThoFqfZDzk+?=
 =?us-ascii?Q?CB1dGwR/khXjaETvdAwLiUrH5oAfN+hzh9+OAUvl7FOSN2pcwg5zfH4eOs3J?=
 =?us-ascii?Q?h+NgdH+2gfPQQBFfOMeQZmmJPW3yEIXg97IigJQ3X2VUhL7bmwDyyKhV2/aH?=
 =?us-ascii?Q?O95WxAC8zFEaXvimgtR6Mik5j2+b2Nw13KSge2V/uRr5wJSgWgyCYKr5BUvK?=
 =?us-ascii?Q?m/bWr3ZVjsMz1qeKRRtoY6M86P+FSC3SBuB6ZmzRe/0qIOF6esZd726l7F6P?=
 =?us-ascii?Q?1q4Td65SXnITqxtu5ieeebh6qEuGBvpM8jY3Cv3WTizVGjo0TRiCk+5hC/nU?=
 =?us-ascii?Q?bJBTMJoJ7iBv2IC26aWtdaH0qpw76IWj1UsI20Wqgzt9ufo2CwqSKDpRLut7?=
 =?us-ascii?Q?4jKN4CeE6dICGlubTw5CkCPFihw7uwxzNCFdflFqooD0LcA8A1hs7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N2Pv2gftYHBsdFLGba5EhyUC7ceiA7pll9NIALxgThTMpL8Cu3VI8aPB3UJF?=
 =?us-ascii?Q?PX2BX/EkUY2FrYKOZhNZ1EQeSjdpkmEz2Cft1TRgdeKKRXH9Wjnm6uPir9Zv?=
 =?us-ascii?Q?DkKxqSCLSaDCFcAl83Ykt6yERwwEnSwr350ZU8F3xv96LYSXg7bgIWz70JZm?=
 =?us-ascii?Q?8AKY+jLRahNBQ4DoNTHlkMXBgc7zUTtzgdgNOHNquuu2o57RluZiYQQ6PuIN?=
 =?us-ascii?Q?nZZ0nGQD5ZJwO1cpBQzbcFOfPbG2fcaNNsIvzBqHCy4ffYeJkO+OoqY5n+FW?=
 =?us-ascii?Q?mB0jQzLyigDVxTOYwCuJq6+qkjS2aGPKcVwTd7mrPUr7KiarBetjCwuMYnkR?=
 =?us-ascii?Q?rWyAeY6E4/b6kqNV/X7CKSvFwqRx/BzT3zut8YQIYkNTxJmTSU9GSzAc+fTZ?=
 =?us-ascii?Q?bintwGhCk4AkBScHlD1CiH/IOAiWnf+8CqeuOOQbbNkmWOzDM2mAxLZXt+UO?=
 =?us-ascii?Q?n2X7MauoC/io119Je6t+RFHmA9M5gDjC3KSTSMeFVP7UruyqsLEDN0Q2f5kB?=
 =?us-ascii?Q?H17npFEdjO+SERe1cNwtliOOwE8yY6k6jKjC+BtKIj5/60WYhLKakZ/f17Hu?=
 =?us-ascii?Q?ORVlDnUAFa4IhPupIgSEuykYdyUaU2wsL/1K9C/s7z02lLazF3XBhy8cXUoC?=
 =?us-ascii?Q?Zx4IDJHlWItjKHg37pq3hRFovrqLW0wyp/ycyJcie+Vs3DMOXm77Ukg3b8Pg?=
 =?us-ascii?Q?Q91e9P28w55j9DYHE8cq/xxK9HynUwx2OrQuq3XofG5iaF2dra9qe0ELpCTv?=
 =?us-ascii?Q?LAnIX1tfxM7oTCQxQ87pmWfJEevYe4lyQxKYITG/uFtBniXcSYVkeYh+/jGP?=
 =?us-ascii?Q?Be71hk1NXRfDVdt1usYz8j9J7Qvv+1/CPsA9T0GGmElLj6MlIxJIWsfsmhXB?=
 =?us-ascii?Q?J8xT4BmCejbDEbG8YP1Y4cazJo2uePIZEJR3teDzjbovn5eYBemWA/OxXXb1?=
 =?us-ascii?Q?/iu3pQbg+hZwO3pBysgfA4e6n+0gm5MdDeTxOM9DydQxJ4r72qDJudt+NTz7?=
 =?us-ascii?Q?I5dxYDhPrKASDJsytZuQCEy/pBdMbSLJY8KcGdC1pqwvLnQ4YMQ0i54JDdHX?=
 =?us-ascii?Q?+asCciLn680MgSfpqUMWgDkD+XtX7kxku9s9RxDMY6qsS+Q2TrBbaeffjE0k?=
 =?us-ascii?Q?QMUqpk0Ly/lX8E63ClbAziLm4nhTY1jUnfES5zWzRrbu5Krsz2uJwBApo4r0?=
 =?us-ascii?Q?iTVlHKFoFA1qoqFlWeZ9WLIxKRKRCpvN+7eAZSUoBbUrF+Ppb/1RBizhFd2q?=
 =?us-ascii?Q?/+kQvM+labpDCSJl2KCt4vZ+WMkSvVhxefnLDSvU32T3k9Eb9houtAMLi2jg?=
 =?us-ascii?Q?fX3n+OzHUGfklnUbJr7pzvR3h8DynM5kCjYycYUg4dykfXIwwk2ccucgmJeR?=
 =?us-ascii?Q?7USPQzIUocXvt3hABEWpl2EgN/calt/SKtmQi0xKoGTr2rfQfawxDycEbBzu?=
 =?us-ascii?Q?I2AJKraKAuWfA9kc2vsnrQj0MGcAIvM+6haJM+Zmcrp7MkiwgmDG0ewU1pgH?=
 =?us-ascii?Q?HcaOQL683SbpAQoXAIoPoCG2x/2EC5+B1FnrrwPZT6hI3vY7rcZA2V20xjUL?=
 =?us-ascii?Q?UzIEu6YSPCkmweRiL3CYPRCs5U0WFl/isM1j5APW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 585fc445-c9e7-4901-def9-08ddb363e92e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:13:05.3174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9yekjXZrnGZ3om2tYdiJ2IbH3RUNzX8uKHU77AKvJUXLpZ5jAMTpz21xdE8QsdUjb71d/uIcZfBF12Dmv6hxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6789
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_141311_675190_F0308E11 
X-CRM114-Status: GOOD (  15.98  )
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

On Tue, Jun 24, 2025 at 10:30:42PM +0200, Wolfram Sang wrote:
> On Tue, Jun 24, 2025 at 02:08:45PM -0400, Frank Li wrote:
> > On Tue, Jun 24, 2025 at 11:06:04AM +0200, Jorge Marques wrote:
> > > The I3C abstraction expects u8 buffers, but some controllers operate with
> > > a 32-bit bus width FIFO and cannot flag valid bytes individually. To avoid
> > > reading or writing outside the buffer bounds, use 32-bit accesses where
> > > possible and apply memcpy for any remaining bytes
> > >
> > > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> >
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >
> > > ---
> > >  drivers/i3c/internals.h | 37 +++++++++++++++++++++++++++++++++++++
>
> Is there a reason we don't put this in 'include/linux/i3c/master.h'?

master.h can be accessed in whole kernel tree. The scope is too big for these
helper functions, which should only limited to i3c drivers.

> 'internals.h' is used for the core only so far, and '#include
> <../something.h>' also looks a bit like a layering violation.

Not yet, you can look driver/pci/controller/*,  which include ../pci.h.

Frank
>



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
