Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D09CD5BB8
	for <linux-i3c@archiver.kernel.org>; Sat, 23 May 2026 14:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8s8e+A2osWK+eAV9dmMLeQ9ldQWnSDOaX/VAnJTkJ4U=; b=D98XcH9ZKH2f/3
	LUqYhovPjpMcVmcpHqisgZYu/XfzHevnmAQZPkLfulq4sI6nvM7hj6DQcERyuViDxz0WuPUk83yC8
	T7fQxe9yUnzaWMmGRBkS0ZNTw0VYs70dZgUcL9GjbV5ahLZifvNkjt20dywRTZJRsZynJBjYgdBH2
	hZlsO1mFYnUnKBViYSs7JjWJi8o/g2iXgtQUXMZh18O7AZ7J8CZNAZ9AOkuHP9vW4bnhOdMT0W8ES
	2zLgkXbpiWqzwsK3HXsMvI1aBIWYU8evr5dKD1/T86QeBCmkpASsoYRIsvawSnUKhbQPj3I7wjbdY
	UzmMQdo1CMGYo5b5597g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQneC-0000000DRQA-0Lt5;
	Sat, 23 May 2026 14:48:16 +0000
Received: from mail-francesouthazon11011020.outbound.protection.outlook.com ([40.107.130.20] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQneA-0000000DRPg-14Uu
	for linux-i3c@lists.infradead.org;
	Sat, 23 May 2026 14:48:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyDMQOx9q7Zgck7eOG0l6mJLYRN1AIZHo8kzeNSzSh/DtpsuHG+/vxVt0VIzGS2lvAs9zHzCzW1vPI+zyrJYemcG4aB+diJ+nbpuV4Ad0U6l3UTfmd69wMXocJhk7tdIbHHmv4OSgM5irSB+fpw7WBMvG571n1MrdCIPuPGkVLsshyRHOtGIHnoMLHiohE40NN4NmypYxbewYMz240t6M5tlFv/HWIek9Fl396Q9/b2Zy+z48SRyzGndKO/rZGIbUpcErDI1H9jr2iH/R+x2VqAzeGbSSnYkg6oEnV907utbXCxG9zD5klvMoHP7NZK3U988cw04PcXClvBIEM4ETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROoU3WaW4vJOuF7pmF65av3aDeb17MQJx9nOswXXGuU=;
 b=PbIWv6z5Wvh2U+NRiBp/TFMYz14n0t9hZ5kuzJnB5sSAT03ykR+iV/Dwq4UPuMhHs4kz0iKDW1QTYopcs/Ki90TkbKP1S+du+Gj2YiAR83fTty6au7yAuKmTDQgmj/vQD3Q5XQRtQcGkINz95k5CJxPg8F1qpNxsK02TgO6E5rCTfziWHsj3BzrNY3BIT2HAz+ctnUoNuX6mMpZprjJUu5wrj9kz30vzhPuO+7TpOhiTKH4MoLjYCdlv5eJfHw/VjQpkwFa64WRuSo9FiLvdxmArAeL1A09Ey6Gtob5c8IAEUv2zfDc49qoAfGUL2cIiOz1WHYmxmQmjOHdIDrSpLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROoU3WaW4vJOuF7pmF65av3aDeb17MQJx9nOswXXGuU=;
 b=OK+hRjlP9LKLVUAU4au60HcTgi60h0xmdgIgsHHDFcrytkSUlSd5BSk0hEtO+NqDtLKYBJtb4nBalMd3HrSSSGvWCtQLQ7TfxGFDcrTx9+VRj4W4FIpTsoSVmkTOG0ejIcXBKabJTwRvetYUz5EN+iMjUbeL1QNiH2Ba8NM0NppHeyA2s6Hju/WbyOyjh1eFMwCut5SGxEjmGt0tFzaL+kWj945Ib/GMsvtmIuIlkx2wuP610HSp+i2vh+vqYTm0d9wevkFHq3WWP+D5VFEs6d8DSo/SBDIsrAgRtQfOJ05pwjqMooUJV3Vw59JvKyHCsxQ6rdYQJuTMPsBJF8GYlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GVXPR04MB11692.eurprd04.prod.outlook.com (2603:10a6:150:2e5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Sat, 23 May
 2026 14:48:05 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.21.0048.016; Sat, 23 May 2026
 14:48:05 +0000
Date: Sat, 23 May 2026 10:47:59 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
	npitre@baylibre.com
Subject: Re: [RFC] mipi-i3c-hci: Support for DMA Ring Pipelining /
 High-throughput Streaming
Message-ID: <ahG-H3D9P-qGjigB@lizhi-Precision-Tower-5810>
References: <CAHreonE1UF=BJjeQH_i0jjAEMBb8OALeTKoxPBcrRwLZWq=p0w@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAHreonE1UF=BJjeQH_i0jjAEMBb8OALeTKoxPBcrRwLZWq=p0w@mail.gmail.com>
X-ClientProxiedBy: SA9PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:806:21::7) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GVXPR04MB11692:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f263e17-74e4-4663-e25a-08deb8da4c41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|19092799006|38350700014|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: LpM0+wW/WyZiwJ6eF8bLxyyVezsltkOckSESyD/qJUQi2GYFg+fpBrIDASjPRjTZ5WRjKJrYIeJuWm90GI5GcNt9x7CCJFvWS0bjh/5DtnRmQB9+ynGhLIeZu4Fv2Q2hR1sQpF+Vw3AIQc2A4f8RBPMA+0KPfi02d9otjPJUeVqAfAx904MiNBoj/4kIU/bWcTBH04EfVtId7cSTa1IV64oIG2MYcQ5t/rZ+ptXhE/GDT1vZILcZVZcxfr3Wgq7TXJyy0TkCDtG2BZXW5oU7jfG4maVeUh5/8jfwH0msTptjL0Qr4+PGVdl7BdE8SsF5Q/vKyhHfPWJDaPvmJh2SBHOhnQHzlFOgvmCgFMh+WDHVLCyVUDHzVqGB/pEz2+xswuPuBV30I+vMllVo1RTTK9uRYSPraMBkAla3MEccEJf0eIJuPz6801VBGka6tR3m3F7BvPfEmnaRY23sInjYZ/88Wm4YyY1cA+S9a9zTRsfP7kad70/aIOf+Pk4yh1FlbWXk6RlOr33hc6uNdcsO0sP8eZlvQlFQULKNXRWdvOwplUIGwdovGsBqlE3wefp8WMTHoiUTywgjLRCgMrLwNpalhLn5pVrQSdsqYbVNTF2I5S76t+xqV7YrhvG7w8QleRr5o8EeOGv3mYkIsglqLKSb4uybg84vLTIRZtT2CzpDGv1yjPE22fgiV4LdtDK3WaxoiCk+s1wOWHGnSA+mQqGyU0zYnyaUM95UYgMJqjZ9Ap45AlQEwTYIK/KhsnDa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(19092799006)(38350700014)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bQG9xLjmKXAqKBh9HuHr1BDXH33e37nLtopHamVaRF6MyLb3yKIFc3X7LrBg?=
 =?us-ascii?Q?R2JGBgoVwplm0fzg7totvvxM2y/6Mfq/aPoyq3o60pzkFlB4YToxuOHZEakT?=
 =?us-ascii?Q?PHp6DRJk/icEPm99UVSeJOa10BEKsnzkVuIfRqgXntsPR+fzwz9R8mSHCE9d?=
 =?us-ascii?Q?dkuZfcvY+FHooZPmDsDqV0x2N8bYoC/CF4Ou/reWRvMI9fR5QDhNnMV47BCj?=
 =?us-ascii?Q?gd080ej3pJwri9He/+ALjnbyzK5nZcXBUUDXDc45lKn7809X+3brVSPeMXV0?=
 =?us-ascii?Q?VZhBQpPjttMlIlQg6Vcte0CNgJvUv02zuqZAn4z4m6AVpF6LxHmrAdC40i51?=
 =?us-ascii?Q?mGbIgyhglCfChPipxX03yo2Pzm6tqhkaEh5il285F55BX+OVYKMOelseojMZ?=
 =?us-ascii?Q?vlDl0MoAbRnoFbWNus+pOiAiJVVWHUrKJfxSqTSP6T7r/iSqSwaoIXogrDwh?=
 =?us-ascii?Q?3sNCZp9oalj+CrqLyl4F88LRETh0nzKtH8hyzq0W1AZx8IA9JYtN/2dWFCI2?=
 =?us-ascii?Q?QV3DeXBOjClkDaH7SfFC1NTS/CLgwal28VG1grZTQx0bSAemdg089is3ynCm?=
 =?us-ascii?Q?5JwGVwShk5tk8NLnEdBgbTnXC3bjOxjnqhilc360kpLWcsNEoV/i2oYt3I9+?=
 =?us-ascii?Q?J+68IrQGq3zElqcAzCPF4/hb3YpwFGll3DE4t6ZPK37+eERuYfi+xyiaAejx?=
 =?us-ascii?Q?Awqg4GogsaOj2Utg/A3NOHBIk4UeFlfCc0bdsnET//6V/yN9puVVtj9kcSjb?=
 =?us-ascii?Q?3nuAGQcEq7ck695crVNpsMP2KmPyBIUKiCGAhlzReUsY2nxC9oMHNXLGgJck?=
 =?us-ascii?Q?bxp798beSsLq9T1mcqcHg5R9ajwjy4Z1YPmBy2VL7Q+CaUkmfMU4k+iCS5fh?=
 =?us-ascii?Q?FxtANZ5ffQCERer28xQgUPvD5j/yZV7OohNpxh7wqAMqZ34NN3oqS8fCRCbO?=
 =?us-ascii?Q?opLlhztnZR5o0OBAY6eCokmMk5vnXRbjzInAZlhB7QlQM+811fz3v43H2OFu?=
 =?us-ascii?Q?gLwfTe4VXoiguyzKyP2Mx7ZZNoU+BN/ZfcOsR+Yq0GToP9ratrBy/wbM6nEL?=
 =?us-ascii?Q?hNLOg7OzwivuydzepV3TewOjIcfm5N3U342g89hrXNj4ZxyQGPnEuCM8wqVp?=
 =?us-ascii?Q?IJk9rzwMWTbP0cBeOcezrl2a/1XC9M5CDYj7psre2MogvSp77lCIK0CwaIHd?=
 =?us-ascii?Q?nk3w7Vf7WDmd6HjglL7ZZo55huGCNa5l+0eK5581LI8gSpZo4ZrPfRs2Bdx5?=
 =?us-ascii?Q?zgO5qkGU48gpck49/u79SNQC8hf0U9mNbpOTYl1LT9wPHpQfZMyoDxLD6H4B?=
 =?us-ascii?Q?+DmtajTi1BxVUKE7zmRZfEVWWyhSnL7w641hZYjWmYrXH+dohXoe5LGXFrOe?=
 =?us-ascii?Q?rKgcDbXEB6tCY/pSCj6mo3OfArEdojsm9vE7EQTilkHluBBmduqa7z5t2J3O?=
 =?us-ascii?Q?TdnV2E9MQtJDxQIF7vu4Sn3I5U72ymoG7HbjwFHcNEYJOktnYQGmyECzpJ73?=
 =?us-ascii?Q?ccBsz1WCOwYVLZOW/LBG4AabJLM8/pNohVDHJL4Ojqvf59tLSS0K9LjyedZ5?=
 =?us-ascii?Q?OJcUuWOTs4UPa8RhPr94d+GR7FqtGrYctcNpPipOr2BQj/SKNohZDi+mFwDj?=
 =?us-ascii?Q?v0fdV9CnTkYLy3gThXLovQmH/Q54engGloZbFYO9LXhB0O/YKxYlBKzH5Wic?=
 =?us-ascii?Q?ZfTelUbdYdLqDrVjPojS+/jo3eyWrS+8kHgQhbsA/PjXhNdu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f263e17-74e4-4663-e25a-08deb8da4c41
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2026 14:48:05.6054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgBA+k1fMt3f0v8C5wfK2S24gzRNpP7rbGs3SyH+sbVbxfDjxBKSXSDMGtEKO+7fP1ihZiuzVqP7U4+tjzAWoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11692
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_074814_302681_4B221AAE 
X-CRM114-Status: GOOD (  22.94  )
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

On Fri, May 22, 2026 at 03:37:35PM -0700, Sam Agazaryan wrote:
> Hello all,
>
> I am working on a project using the mipi-i3c-hci driver that involves
> large packet bursts (exceeding the physical hardware DMA ring size,
> such as large MCTP-over-I3C payloads).

How large to exceed DMA ring size, can you increase ring size?

And if large transfer, it will defer IBI handle for while. IBI check only
happen at every START phase.

>
> I noticed that the current driver implementation treats these as
> discrete batches.
>
> I am considering implementing a ring pipelining or DMA streaming
> mechanism to allow for asynchronous refills while the ring is running.
> This would leverage the
> standard ENQ_PTR doorbell mechanism (per MIPI HCI v1.2, Section 6.8.2)
> to continuously feed the hardware. I figured in that case it may be
> worth while to see how the upstream community feels about this
> feature.
>
> Before I dive into the implementation for upstream, I wanted to check:
> 1. Is there any existing work or a roadmap for DMA
> streaming/pipelining in the HCI driver?
> 2. Is a generic dma streaming mechanism for large transfers something
> you would be interested in seeing as a contribution to the mainline
> driver?

Usb\network\storage is async. The I3C's framework is sync.

>
> Currently, my proof-of-concept handles the pipelining at the core
> transfer level, but I

Can you send your patch as RFC to check what you already did?

> suspect for a generic upstream implementation, this sliding window
> logic should be moved into dma.c to properly support controllers with
> multiple Ring Bundles.
>
> I would appreciate any thoughts on this approach or the preferred
> architectural placement.
>
> Best regards,
> Sam
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
