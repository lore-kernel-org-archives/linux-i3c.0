Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA89DCAC5B8
	for <linux-i3c@archiver.kernel.org>; Fri, 26 Sep 2025 14:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IEP6m2PjDWC3xJurClwxEemEsj0gguxEt16AinTlMGk=; b=02JSGDDJM5LWBm
	d5t714waB+OyjAoHAK+02rxpOM6pXCcuYyphKdL3SmR/OIKsnjNC9WvtDYNZMhmoHuOzzNx//01Iw
	wP5gwKhX0WOv2ks0cFSmGMOlIr1arYcLlF7pPLCkaH2h4V9J3DTnUImfs1G90QAbMjLrTZlPhQtcF
	B2k88TFTqIOyoV+vkefmRdCK4kd01sAPNk/N4XHPp+E8OmkXyMx3P0Fb18o4LIFBczqhcBVgwcPOA
	QAMaqCDZUDTlnoMRApVepuWmj3jSgYKRKSpwKQbGFN8Yv+HNduuQ9baxo6l0R2buzx5q2HCAY9PVI
	TW8n/7vF4tbHJ6Vygpaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29nm-00000002ABU-2MQM;
	Fri, 26 Sep 2025 14:52:02 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29nk-00000002A8o-04TK
	for linux-i3c@lists.infradead.org;
	Fri, 26 Sep 2025 14:52:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKtL9ilg8qsEDgzcs99bIz2jxCPhFrgq9JXoFbSrDYG9fb/f1ybyrWIQFbS3xW9HnIhZsG/XPtHU615sEe7qRLcPqTuESLRSywzAod0cNEYL9Vxd5C3RFX988oK2qmbpMeuqVCA0W3hwpMp0t6TMEn0ujTS9xvbIJjvaiqVEHcOgo7BbOkeH98AXgJhYB1q+hr6+ZYjJw/jyFwfxRD15N15RxuwjEDkCNqwv46wWfa4KewZSiUGdUMxJYUlimzCIy019U+JO2oYgE8Ct3m06pBChVePjS6jYOkg3TzH6Twr+UtOZPSrGA1G1NgLmJWfm3LFZpZ0BcoNZssK3tDhMnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pU9+q0Z/rbVBh0lqIw8R1PORXHoiRaC7lN3xsa8XYqM=;
 b=H/SrUeEuZn/hIFgEU9oOULfrkFEM9PPc1hOEcUBMrZOizu9Ow+gAzui9rtt81k0/2VTXX6FXle6eNxMbpTkCVN9PWuRZHW2VFi4JOrkvxlqMpkazkdMjK7un4R81efACdljq0MiSNXUfcsq9dFuskdX8YfIxYeRD1SazMuRPAa3zD+ssGymWvpE9ZhfR1m9wZKKzLQKZu8u2hJ3UwLPPruyX5s7mq8dxU1rAO1vUB7Vzzdc3/M/M3gh1Qn0xjHZigb0PT5CoyH9jUTHqvojL4s/yX+c7xdvQbVSyjJnBxLdVwz6ZRUMacmZhjLBwNmod8pS2bPVf6ShTdOsxLteiaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pU9+q0Z/rbVBh0lqIw8R1PORXHoiRaC7lN3xsa8XYqM=;
 b=XPnJY8b2UOKUKg5ZJrGkznTXWZrf6kH7+jBWLxNWmr3K9/09L1p7HqImQ89kSEKgV5OuYsIfgsjOkkkw5n9n46t6ARzHa43YmAf3watFMaM89/pj4UseJZbYD1kOi+cRkTK2deC4vjQK+vth9uN3QJhJ3Ybsk+VVHFKhJ1URzEkLMNIL6WUcwd2glqHIBDiRcvkQoQHiWsS5NmSDidQvz7A+v9w0tB8/qjDwQis6CcHbZEN5FO3wRfLwR1STmch/N5gLKprWKjxZ6+nwnK2sVzOn24d64EIKsrz5xsWlcH/xnCEtrWFjOuUvpJXEw5v7LYT2yq9rl0AkpJ8jfrp6sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA1PR04MB10675.eurprd04.prod.outlook.com (2603:10a6:102:48f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 14:51:48 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 14:51:48 +0000
Date: Fri, 26 Sep 2025 10:51:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Manikanta Guntupalli <manikanta.guntupalli@amd.com>, git@amd.com,
	Michal Simek <michal.simek@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>, krzk+dt@kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	tommaso.merciai.xr@bp.renesas.com, quic_msavaliy@quicinc.com,
	Shyam-sundar.S-k@amd.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"'billy_tsai@aspeedtech.com'" <billy_tsai@aspeedtech.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jorge Marques <jorge.marques@analog.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-hardening@vger.kernel.org, radhey.shyam.pandey@amd.com,
	srinivas.goud@amd.com, shubhrajyoti.datta@amd.com,
	manion05gk@gmail.com
Subject: Re: [PATCH V8 4/5] i3c: master: Add endianness support for
 i3c_readl_fifo() and i3c_writel_fifo()
Message-ID: <aNaod76qkM4Srqyl@lizhi-Precision-Tower-5810>
References: <20250926105349.2932952-1-manikanta.guntupalli@amd.com>
 <20250926105349.2932952-5-manikanta.guntupalli@amd.com>
 <93704e82-ea7d-45ea-8527-8ce92108eccc@app.fastmail.com>
Content-Disposition: inline
In-Reply-To: <93704e82-ea7d-45ea-8527-8ce92108eccc@app.fastmail.com>
X-ClientProxiedBy: BYAPR08CA0041.namprd08.prod.outlook.com
 (2603:10b6:a03:117::18) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA1PR04MB10675:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec54f8b-9784-4c0e-fd90-08ddfd0c37e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|19092799006|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jWa6aK+dMrxBtQWkzbyaN04KvnLoESMicfb0BFyFpnmQf5fB1maWVGsm5Em3?=
 =?us-ascii?Q?OZKJnScDKEEv+UliUZBTLV9G5XzowDXQu7StN/DdLfDaieXFbT4MyADnpDna?=
 =?us-ascii?Q?WI+GkCd/8HRTxFaAbn+NPuGWpwb31kgeH/Vs/oz+lSHc5cSlt4MR8SHsJtpc?=
 =?us-ascii?Q?k1EvYT1sOhmCv6oZoIyf71REN6eomX72uPdKwiiLfP2r13hsfjeVDpaKSYUA?=
 =?us-ascii?Q?m++Bu+J2gJfc4uD+Dz/cR/dQDQ5G+k/Yna3WtEuBmD8kZhYmx4QynGtuAWfb?=
 =?us-ascii?Q?Kx0MZfIQfGu1uxCQGtroV8Tpof7+zB+xQZB1boJTv2lLAR3w7Yo6DExsZA2L?=
 =?us-ascii?Q?8P/VAHxavSVO/evEG5Dw1iEFHlw/eW5BIjUxtSJydOroJQt+1bZSv9DtnE3t?=
 =?us-ascii?Q?dYd2lJsmh5LDr0tDBLM/DrrbJ8KWP7lLrIe/Z9LZUCaaVYmwMMd7Rdiwk4Jo?=
 =?us-ascii?Q?1rRPgbdnb8LQJY/QWcVSm5rYoHMzQMVWyfNBTGzz5xHI8fzeJiVkBPdLR3Lw?=
 =?us-ascii?Q?3jFQc65qNjmnsE7zkwjbZBoTrHeVk0ugIm6v0ksVgSwIwjjov5ZBk4rtKZDq?=
 =?us-ascii?Q?6/6FzCYw1vd8PZ3Fl2YqFYOoXdrsmE7M9QYI+EzD8gGbNxVchXysfF3pDtT5?=
 =?us-ascii?Q?pisS9x1hgtC81LRUvtnFDepbzc8AVQpjkInYUJONetnButYQIRipPb6eSeWr?=
 =?us-ascii?Q?6A31U67A+QxcNdg7TEk2XtaXPaeqqlmwxb3DIDg4SS5TlzHI2HCuVFCwVh4w?=
 =?us-ascii?Q?x015gdrsCfu8kzwzjKj7nIz9RCitcQQWPiAGwFm1EjN81ggiyHACJ7Pj59jk?=
 =?us-ascii?Q?qtVb9dwVoW+REvRREkshNI2iOrD2tTITjoMF3m9WzKjVopuGuSQggT8yDRwx?=
 =?us-ascii?Q?cbDECNqdP4gJmXXGGUstQwqBg22vmV4Pl1kUwwPtw3jnSqxThmm+crTIAWO7?=
 =?us-ascii?Q?l7i6cXpE+srLbci6BIkrGakIABTsxCpmvAwphrJcd8pVu/OjGp/VJBpy5CCC?=
 =?us-ascii?Q?9usa1kvKfxOQn4IZKEunWb/Och8+BHtRjXTlpPbazGpKwzIR8t4X7GUatAqX?=
 =?us-ascii?Q?xOmM9v9SKYA4Tb26iHK7tncegEyQOZqmcoP7LouJf4Cl3Qo1vIYn8EaV3ibM?=
 =?us-ascii?Q?HjNEWr8cYKqiwrF20H9NsVKt3uv67RLZbSFzio5dam0xv6EPnxIExgd2BbNl?=
 =?us-ascii?Q?YT93eWdUv1liMAmX0uHj8M/M30rqEvWmUGEh26n9etuoRkydo6a0ZNWGL3Yg?=
 =?us-ascii?Q?roFf9clvL5z9arvEtjIryYc9dZCkQA2/hHIblizojtJAzU0ymm9vfSVUAw2W?=
 =?us-ascii?Q?1J79wxr3hGfZbS5qwPCl2ZQbC78P5Cb9rwCNXPJ+yv4H7MAu58/h78zZGYwH?=
 =?us-ascii?Q?SYaqWs6WqztOrYeF8zy60/kLgtd235qKf9Pqv9R9G8xNyvycZlxgFU/XmLOW?=
 =?us-ascii?Q?YXLzp1EIme10HMZaTPz2IhNdg1q3uHtSilSnYx9cEbE5GLxtqsMWuA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yNyQBBfhLh1CkkctBLtsJ4pFqaoeSObfTDmAt53anKcFz74yGXWXt73zqpYs?=
 =?us-ascii?Q?pF9kHS4LZeMmxkTtxQ31EimIUoyFNemEirKS9xR6y4efBVLEml26xxQAVSTl?=
 =?us-ascii?Q?nKmE2AXE7ZJA0jZOd9ObvQEUtygPtvgAsaoZA1OGs6qqd5bO5XSdeqZJVnf1?=
 =?us-ascii?Q?gLenNNr+yhpmZv/kMh75E+k8sOUIqOej5Wic2LClmcFenIAkMo+igXCCxr51?=
 =?us-ascii?Q?ITR0i6/ukaliUmA9liwcMh3H2ET5cRlteqGKqpVAMAD/Y4NIjqLDQTogPRDx?=
 =?us-ascii?Q?UV90HcqAl2XWZtuWgZveWVe7bqzDmkY9vSnOSSITh5l9JoKnUg5ZoJj4dMAM?=
 =?us-ascii?Q?WvAECI48E4bOkKxTfWny2sVUfEAswskVAFMpDxfaEbzQknUxwvUWqc3AC+tg?=
 =?us-ascii?Q?LcO1C5nXvC41M+bIKO4gSrmu8vV2B0FDJmFMY/SG3QzumMD1FCe7i7eWm1Oh?=
 =?us-ascii?Q?fVGiiDUI4p+1juL7D99LoLXezaNofJtY55XzaWJHpHnUFzaogQS+R+gmCEn+?=
 =?us-ascii?Q?MSQljFb1rcL1Ms2Q/aAFAV4cPaoi2HDMO6v4g3Yb32HQEpE1bj8vP1yZ0Uwm?=
 =?us-ascii?Q?UZSepoKWeG6G6RexP+XOBkAw7zkCSn+bj3adv6p56g8qrWzHfawkHc7ZdG1b?=
 =?us-ascii?Q?YTTPgyG8AJHulBfetGiVWqTp5xC+ftqExoq+ceMKFazcZCEWvyWg8KlQlY6w?=
 =?us-ascii?Q?75AUmjgXNA6c+j8H8RnlUpTQORDbXId0BbB8mK8bjPx/1uk/vx0xEBw8jt8S?=
 =?us-ascii?Q?klk+SCV43ix0wSfVk3mK9aQ+MZ57C4/IvpZs2rghtXzTgGyWHIjENXyXr2IH?=
 =?us-ascii?Q?2Q0WxJFlloVo0cV/Gu2Luptp54y9EnzJKmhM1tyYyP0loQh3pPjgEmPJcbz7?=
 =?us-ascii?Q?XNwP8GZZ58nrctDlvhxJTXwWe3h9ChpcYv0h7LWXYOmHocTCVbOLP5X4IiFJ?=
 =?us-ascii?Q?MsAmgEtXFc8lyXYrDqolu1LN86Nk8vEI7fuxNxhhsHHAp+KdEjeZeqKMWH5V?=
 =?us-ascii?Q?TsxsSKA6vZf95UOe7igzB23R7jD9aIOL7K4MFeRbpsLKKzyn3WxX1zF5qUuw?=
 =?us-ascii?Q?RUZTV0Kfd6x4t1GTIcCU6mX5ftmpCyxLgu2su1GuQfkQSWnEtaQeHKZGT3Dp?=
 =?us-ascii?Q?npcrx2Xv/XMqvGMtKmr1MV9+GDaBH8dM8NaRFVJcfUUwtKoy6xPnMq7vt3Ex?=
 =?us-ascii?Q?e26c07fyEIUJ92T9Ytz/Vr4d1HfixZCeE/kBob7ctsxB0E0mOwLQDk/AjW4A?=
 =?us-ascii?Q?Q0ZE+BHhCbhCBxZ4sfLDBubCg3g4NiEqU98qT1BjeKuvqk2Hhk37c7iC43lS?=
 =?us-ascii?Q?7W10ep1Z0d/CqTYPPwIKL27tXdKxftRuxmNwIScx3mljtXnFnZKAqmDgQteN?=
 =?us-ascii?Q?N9512SVN2AXhDah4YR4+BqQKXXMyB+xVdl63RZ753wRWUNX3JOc8BOxjAW9r?=
 =?us-ascii?Q?d3EL+GncfyD8a7/nw0Q0bYxPAVLlerXtE6napnFeLobnpS7J6KIF1GY+f9H0?=
 =?us-ascii?Q?+1oNmED6WYGaaw/H8kg9aBTL5AtEKk6Bl5rT8gKu2oocSdQnVfeSnYyCSkWc?=
 =?us-ascii?Q?VT18KymEUWyHvSqs8JMMwKJ88PZp+ZzJf43zSpGL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec54f8b-9784-4c0e-fd90-08ddfd0c37e4
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 14:51:47.8808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jAQ3v8CWyEadSqaxiyn55A0JBR/SxQ9HEGJzTgw7yYDaS60mg+fLnfQqxjQI25Y/jyahw7ElsBHd1fMUz6R0AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10675
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_075200_061386_671119F3 
X-CRM114-Status: GOOD (  20.89  )
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

On Fri, Sep 26, 2025 at 01:09:37PM +0200, Arnd Bergmann wrote:
> On Fri, Sep 26, 2025, at 12:53, Manikanta Guntupalli wrote:
> > Add endianness handling to the FIFO access helpers i3c_readl_fifo() and
> > i3c_writel_fifo(). This ensures correct data transfers on platforms where
> > the FIFO registers are expected to be accessed in either big-endian or
> > little-endian format.
> >
> > Update the Synopsys, Cadence, and Renesas I3C master controller drivers to
> > pass the appropriate endianness argument to these helpers.
> >
> > Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> I don't think this is a good interface, based on our discussion
> so far, and I had hoped you'd change it the way I had suggested
> with a separate function for the xi3c driver, so normal drivers
> don't have to worry about the AMD specific quirk.
>
> I think this should also avoid mentioning "endianess" in the
> changelog and in the code itself, since that would likely
> confuse readers into thinking (as I did in my earlier replies)
> that this is related to using big-endian kernels.
>
> i3c_readl_fifo()/i3c_writel_fifo() are already portable and
> handle endianess correctly by using the readsl()/writesl()
> functions.

I agree. I think previous your suggested API is good.

/*
 * BIT: 31..24   23..16  15..8   7..0
 *       B0       B1       B2    B3
 *
 * Memory:
 *  0x0:  B0
 *  0x1:  B1
 *  0x2:  B2
 *  0x3:  B3
 */
i3c_writel_fifo_bytereversed()


Frank
>
>     Arnd
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
