Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC17F8E4B7
	for <linux-i3c@archiver.kernel.org>; Fri, 17 Apr 2026 08:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PzSgl19NSmaX7Yhb4HypBeC3bNehN9ywmrYKKQplYDQ=; b=qHpjTm83qiQ7di
	4QXt9mIQ5eFWAe03IuIAIMV/R0M29IHiTDu4fp8XGmmFv5seZMl0N7DMPLT33ahLNGe2+mYj2VeDv
	gdPAmNQ1Gy2Nnj3ex10jt5zzEVXeEtJ9krkbxa3FgO0lmk1Kh8/0/Z60rpgidSZrsxlZ8fn2VLUob
	k2nWiKFHLYXflao/5nsUNlyb18u97MplH9X6aGvnzOGIWlGEgMG/kxhw3bwBw9MUQnS2P9vfjMZij
	cykOzcuSkLER00QomoSmCPeSwZA5X9PzX+fp6cWkz8TE9KE83e40HtUDR/j20tUFUPeMP/XaX7Ry7
	umivEg1rxzMqdZ1Ujgbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDeIK-00000003eeM-2VKb;
	Fri, 17 Apr 2026 08:11:20 +0000
Received: from mail-northeuropeazon11012029.outbound.protection.outlook.com ([52.101.66.29] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDeIH-00000003ee0-48HG
	for linux-i3c@lists.infradead.org;
	Fri, 17 Apr 2026 08:11:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClOW5XWpO7IODqHvG8vgoa2XZLYux5TsOaEZqcCgcTsujhwl62l5sa6yEa3JB4LPAx9Ve8703JuGOWjMGIQ+oZQNPueBiMZcdCLPbOpVsC3KcMURltafkv2Pdtx5qUZUlrVMhLXEsbbhehp5D3PlM92sPODgNYzn4wxw8rWnu+Q2wsPp5LVvwRFAJkZY6VK3TGe9brrEmKJhYYpXS1CTmDlXJKBI9MCplzhJO+Xj6OYxoq5gJk9J+kB1mv6jJRoH0HTjL2u9Wejc4RGaxa9R17u1Mzvpe7wR39L3hr+IljSfuYbqgP1bxqWgwigQYLnMifad/rIoVZGLs3tN1so+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKFHcnobfcJ7hGWyAWwuxg0CSK9dpgv7YC7QzdeyItg=;
 b=R3R8Muw4d53idvRn3OXpGtdh7iiyGkgnDffIdSFRVRNoLdXw6ybdobJYgA+AvN0jHO3SDHSpJHWhBt331Z3o+GQl/oMty6Y7tfpwnMl43+p5g2Wjji6bJkhh7b902mRt9RN9iYvXkah70yqbPGheHEcrxSU0xY5JiwSpvpguXLvQL8hf0uIYunjtj0cDovq380Tq6xloEOR9T26Dt3Nl5Pp5D/JM7NCE9hUTyglM7Z4vgze3N9xjzhM74p0DFA0Qi4LmnUzOEfCx10cDUKTLN5pNHTm6Zyuz4T+JAsOWMzqGMSBoFaTbGxrfXhbyYhh7ZcDYc3CoLUzih0VJ5l+G3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKFHcnobfcJ7hGWyAWwuxg0CSK9dpgv7YC7QzdeyItg=;
 b=RMuvD35CCzgwF0sYx2dj7BkwA4lZIuG2UiPbuFVM+zS3qF8gXZWeXy0JBJFSuVbWUyQlDaKjiEnveMMb0Joh4lUg2Hm3Z4OQT5E9Ih/ms0NhflNWcQrqdYm2Vvo8+cKP8Ipk9r2Sug/UMiJuLvQ2zI/PafVvPryZbyZijoX8slMCO561KZqhIweH1N8fbfolVz3aX5nqHQAzpGU1twWPcZ8vrFozaWK6O45hvxLL7Hqa1XDK824+4G9HcD8yNLmji8MJefGpJDsKQAp1zPVtoF1xnSUE15z2CC0vBc2paGTL4OFSvsZTDKQ4wqKjp4bJeghIoI5GLtF0UvG8KHdnlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10996.eurprd04.prod.outlook.com (2603:10a6:150:220::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Fri, 17 Apr
 2026 08:11:12 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 08:11:12 +0000
Date: Fri, 17 Apr 2026 04:11:06 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/16] i3c: mipi-i3c-hci: Complete transfer lists
 immediately on error
Message-ID: <aeHrGjZfP6_LcXp4@lizhi-Precision-Tower-5810>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
 <20260416175704.41217-8-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260416175704.41217-8-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10996:EE_
X-MS-Office365-Filtering-Correlation-Id: d6df59fd-f48f-462e-f6af-08de9c58e3c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|52116014|1800799024|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 6933ZxcJ2gwq9SbvK31H0xEqM01pXGYipzu/pDJuHwdmjzdBAASBMlMlQpSquHnJ4K6CB9i/q/RtMKIPwUB06Fe/uazDMykOXFZ/awP53JMUIc/6NpOw4RpklRdQFmVPQVf7Q/t/vR4LPVun8vHlYxy9emOm4ZyFoFbcIrv4zDgu1R+pu4HDQFFP1NRG5x0OG+vP4YOjTG4ceZHHu2PrnKxJyvMdjQRV3Tgdn9EMnfYe0IcTccMz/2aC9tq1hTKMn5nqcIxHvCWff+7P2/M5mo5DTSozLTs6J6tvnPWevMZAXTudvNaiRW22sEH/G4rzrsLZx7kYU/oM9JBKROGCjxsh1joixEFTsrNVFjJlOjb6L54KXdr+fHo0T6R4uUR0WTRnwtMzvSABdNQM+9TTwSUr/OlKrxnNqEmoqzd2Mciv6171aW1PA17mgCy6p8hHRHModcwWtF3mzu6Nb/jbssxU2BP/sx75NKyTs58g/mLsJEZWsV/mdejccl0swXKDll4Kf4veK4Hk1WYKdRAYchHMInDzOQgZyGpJ+oc8/2ENxJDDf9k/C9CxxtlQ7FQo/K/NQ2VD33wym/05yMO1j2RXtmYj8o9NbPwSD3mxhA0DblacDBucGFAB46M41Fd/BebqvtQQ5S/9JEjWzAiA1UemyyRaTLXWbZ0iUgTiyD8GXPNITwZVHYmGrQzY3yBhZgNTOgjN/zikmazXdsiMAOYuu99xUNry5+3q1qj5EJ55rkO9wmemcOtJAhbl5ue29pDeEsusMrF3NZ6gDkBId5V7JtJeJ0RPYIo7TPe58JQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(52116014)(1800799024)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1e9fMXB5jcX1zGZiH7aKg70RcWUkwpOex9iuwS2m0xF3T6krffhXKrNRlyFS?=
 =?us-ascii?Q?rIpohZqVaFnZm4DSLsqiO74gFwPr5y7Zxp9D1pyOKdRdVv3icVmAev8vDeVw?=
 =?us-ascii?Q?e54d9/9xjZ3m7gZZdiAwrPoSyDs+X3imckhyOj7ppKav1fos5RQiEqD2BwGk?=
 =?us-ascii?Q?+NjmzziiaRfUqexay6PZKMyB5ze70+e7sRvQemBx4PofUjyi7QNSz63xIojf?=
 =?us-ascii?Q?YJZpnGk8j+zrAiKEVYwiAZ4egN9FNrBfhrzQW40KnizrV+GWbwr2Xgzfg7Wa?=
 =?us-ascii?Q?/IInXaOirb/rDDCTC/CT8Njqxb6oevO1nns0bsGKlGid2NwnRgMkpYHb/MZF?=
 =?us-ascii?Q?Xi2y6QuW414HoADHCzjnZbI13mFINFWYsCHT55desBcZXFqFJIFDe+IstZq4?=
 =?us-ascii?Q?qOFGxcfp8ncMoBvPP+Q4juqaw1/Qhn1ML2RRmDJZ0fXBSDxjhM8wNEcW/xvq?=
 =?us-ascii?Q?ZJRsQG6qTsj5hv6fOiWtE4BqCNJp7hHiUOAZgGybCFdmRYfCz/kjzyOUX6z2?=
 =?us-ascii?Q?ZV77tLXuPxduz8hXrqmwBSY2K5oadCklJZHseY3uvUhQezKA05DIvlniHHTj?=
 =?us-ascii?Q?tYxQd8SfUy9zfHHVM6mTejvbu+X3opiTgToDL6TMikzXesQZlZRs3zASbZLI?=
 =?us-ascii?Q?/4dHKo2upJg6iSmm0XjziJ1Uq9cGZfziicSkRkkIVOsn7qNXQGrJ7f9Rnn3R?=
 =?us-ascii?Q?A1aIhwpnAPbl6CQ1plOvN9sOmPLN03VWJtfS+l5tX7N94VU9Ap55A1F2qmte?=
 =?us-ascii?Q?L0B5/Dur7E27Pivd3r6rmW0qhd8pLPEugh2BOhA70SsnZ3OKsWFZ6bm6/bAW?=
 =?us-ascii?Q?9S+Vp8ao1Kb2qt2DXSzEGnL14hJ0eaQ4FpNU8Pgzrjb42cvvOBeA168J5B1g?=
 =?us-ascii?Q?z/POvCjMjSwTzIb+TWqiBqR9ISJR+wRAesAkYRlp7cM3ELZ7Je27/G9KV//Z?=
 =?us-ascii?Q?eFRYVY2Q0ClXCpE4W9bTgB/0Dd2uw6cfumIzrIpKEZBJplat+gewWmaVBeso?=
 =?us-ascii?Q?0p/O1fypkF/kZ5MRcTDQ93PQBO4Gcy4dWwMaZjf7c9Zc6HtkNz05p9EA10NA?=
 =?us-ascii?Q?IhRQNl+4V+tQbLS5+3K+Fw6XvEK+iIDxyBl5YajXOGK5PqPpridDbyJgK9fI?=
 =?us-ascii?Q?HZ/VYCXYB6wha6FSCsTKugItqBfYbKlh44e//H8xQY+C1hHjskZk77GPL4iH?=
 =?us-ascii?Q?fO+0yGWN8IVCsr9rRqMHkDzIJdJ4/W34dycefZttQAGFgjXODWK8AtUYYFsM?=
 =?us-ascii?Q?nnDKh3AyNrEQf3RoTqszyOJA6lxvZSkaY38agZCT8nPtnCD1ggQI6dngDrIM?=
 =?us-ascii?Q?+vh6Ol3j5fDpsB6XV2KKRHksBjMSs8KSc7cNYSSq8600OpWg4rs2dGVfsE0k?=
 =?us-ascii?Q?+kXnpJ55WAlyY57n6MHxXIlKCxiBETSY6TLDdNGv+CpfzZJJqvwHAaXfXheO?=
 =?us-ascii?Q?MYCA6dEpQQA2rhNIJQxNIRPmkY7FTv95EU8koVGAIS3OxjzSBvjIdEgN9xaP?=
 =?us-ascii?Q?ak9tzNZRBl0cqjKPk8mYbM/T62XcJqLNocBbfIhmqeBylgXXNm3GFEWY9qGt?=
 =?us-ascii?Q?v0JwLSOdcOg0vb1ijSk9NisjnNLsYGyvlxVe8cLZyvQfKlrPljnen72686jc?=
 =?us-ascii?Q?P7wK+7vRaPkJVBTP+AUW0R8mO73QdEqhwQPBtBcgyBUR26satMPFrVRXzNTV?=
 =?us-ascii?Q?iC9sbJ9zZiLk4lHcXlcpV/Xd3wtAKNLUPUHKVO3IjyZhB3H2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6df59fd-f48f-462e-f6af-08de9c58e3c4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 08:11:12.6775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u05tmj8qzHEOZ5zmin84q5+Fd5j9s6xaZVfVgHNNTbz+u12UIwseE60P4MnS7LiiLVpWhyAF8repltdr5bUnIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10996
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_011118_036385_1135A8E9 
X-CRM114-Status: GOOD (  12.65  )
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

On Thu, Apr 16, 2026 at 08:56:55PM +0300, Adrian Hunter wrote:
> In DMA mode, transfer lists are currently completed only when the final
> transfer in the list completes. If an earlier transfer fails, the list is
> left incomplete and callers wait until timeout.
>
> There is no need to wait for a timeout, as the completion path in
> i3c_hci_process_xfer() already checks for error status. Complete the
> transfer list as soon as any transfer in the list reports an error.
>
> This avoids unnecessary delays and spurious timeouts on error.
>
> Complete a transfer list completion immediately there is an error.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
...
>  			struct i3c_dma *dma;
> +			struct hci_xfer *completing_xfer;

Generally, it should be working queue.

So working(current)_xfer should be better.

Frank
>  			int ring_number;
>  			int ring_entry;
>  		};
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
