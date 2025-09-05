Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231B4CAC5A4
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zM6w5O0vx8RFzuW3yTRKnWlet0pnj7VeMw3W3gNrqp4=; b=OPBuaZVrPOjCvL
	L1JoVaY/igP7vE1kWWoc1iBMWMAphEmasgvFxisuqB+eZmoL1Pa5YXGaHO7Q8VLR4o26Nfghd3uNN
	MRwYN+CxPCBHtH0OF1IlzCEanN2wAB4LTN76LalO/H8WfSMhtyy5Bsk/E76mNOG0ZnYN0r9jcgTII
	mUrl4UllAoUgNZjjx8idRVXjVShZNRU75PaBG1wHehXORq7uVvMEk8eUXfvqwic6RS4HJXe5vS7V3
	K14huA6Jf6JpWyIsH3K8SsTTMlQMJawEUr1YE85RXy5lvmB/Y95wP7xkhqpOwrpUAztjqiRcBdFZr
	s3/0x0Br3lRaZMFsA1mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtPh-000000029tq-3Rys;
	Sun, 14 Sep 2025 20:33:33 +0000
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuUNx-00000001Iyk-2gMk
	for linux-i3c@lists.infradead.org;
	Fri, 05 Sep 2025 11:13:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTC093lQkhMeV71Wibn6b2M+o1DcLsJhfApZK4O8c0HcuwHN3eC5JO9IN+tjW42Lr+ebm2IfkzvBfvQqgvUtI8EG+FFyOR7Z/cBMMWsLmEyoRHSob8WKPpKGBjlx0hRkWgRjTxuRqeV+J6YLgt557EB3Tnad9SDg2FT6Ju/lQBEfkOZWUWY9Yz0D+eEwrU3+lrpvhpHjzsRti5ybO242rFywTvXA2CP3D4vdKVm4RJoeJTNv4gM5Qjs3xP1vASfxwT5x8KHurZKQDAPN1WRHHYcmdXr+5rYoc1+5xguJVT2iJuq/4+rsNa80gME3EtLKdsEGhSHqNhcfB/JndzRqTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2Bxqq2sde1T3cn8FwhjWO9qd/MGhaLWgbscVBpeB5w=;
 b=IIvUNQo82psMsI+W1YSNqm323FU2VkSppwUkcBKgjTpTa5ys/xf/ocdFb+W4h14qxoro8rR8Kyea5QrsAwZYE3bXC8+ev9IjAIZ+9mxMqkFfGEERikSXdpCfWdUsHNfiJY+RBDfIvFuAPo2I+/IabXIWkvEfQk4UKpTduJhBAYyWF2IoZYYAdxp5uvJlPdwPXPIjriwHtm1z7EcqRzyHyjsuYrW24REuP6D1yFMlB9Bfzxd39G8VCG7M7RTbjPcoWBKAzqLqJtxoGzjrv6Hnj6scVzWM9RvdFlnfqGY6f4RokIE1sX14bJbDwW4B06H9qytlzhhpZ87pD9lqY05XSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2Bxqq2sde1T3cn8FwhjWO9qd/MGhaLWgbscVBpeB5w=;
 b=gwks6XKy+PxFZj8opkBXYkCsKgVaEzqwG+rYiCZBMRWic0Zu6wiYO7OmxZPmFjE2AuWPnnl+/2gciPktEhPwkkJoTUING+FUxYWISSSl6LTahEyWnOrk6nd3/5iJ9xLMs9/6Ce5U57eFSFnblVHmrzoFWj1Ki9hpZn1dkHFccPU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB6950.jpnprd01.prod.outlook.com (2603:1096:604:12d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Fri, 5 Sep
 2025 11:13:36 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%5]) with mapi id 15.20.9073.026; Fri, 5 Sep 2025
 11:13:36 +0000
Date: Fri, 5 Sep 2025 13:13:24 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and RZ/V2N
 support
Message-ID: <aLrF1OnctYZwy15y@tom-desktop>
References: <20250904160305.247618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aLm5kbgRIcomBo6a@ninjato>
Content-Disposition: inline
In-Reply-To: <aLm5kbgRIcomBo6a@ninjato>
X-ClientProxiedBy: MR2P264CA0157.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::20) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS3PR01MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d69ae13-fa8f-4bb0-7560-08ddec6d41ea
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lPn9nys86zjj62YsXBKB6Lp+CL4emxBeNnkWZrsyL0x27TsmNkhYOoDOerNT?=
 =?us-ascii?Q?pzTG3I0RCffRWNvb9JczsBohpMArpX4qb0/PnYt1HYMzlpwLopd7RurXMmJf?=
 =?us-ascii?Q?ebKtaVy4N1nOaxInC4gtnDOgPXWwLmefALT7vy2/d84SUWtu3Ddi+9o9ofDr?=
 =?us-ascii?Q?wFR0LbP+wPji4zJ7OPmxhoNt1YjDWNuX+Y3bvqiIDSlgcsxbUE99kpvZfIqu?=
 =?us-ascii?Q?6YMUsmfy3meS7B5y9LMeiDTV2+WFkS4is5rFXpMeYsWuDn8cDVFaAjdRRYcn?=
 =?us-ascii?Q?wSMu698Ajl2fxuPRP1IyYQmMxXOv/pRAm7I1YoysC1wMLXaMIlLQ5D8B24Pe?=
 =?us-ascii?Q?GMprSnsCwhcnEfrCAW1aG+y2x486T15bN2pLPvTltFdPeLjo6zsH902L3nf6?=
 =?us-ascii?Q?bCDqDRgOWehzqjQfXHglNRvHIxiixD+/huJ6qJr7j8+QPH0OhqAMR/9FTM7X?=
 =?us-ascii?Q?RQWRntCjndBRorCApHG850w0d5JzxQDEGrpoR9qyJRDCYBUEoAmkiy+AEY8t?=
 =?us-ascii?Q?KAR0CFCkRcH6nt20AmXB64Fuv7FbpLf/6gXo8/AH/K6+/wliUT1JaXRu6Y8Z?=
 =?us-ascii?Q?7Qp7UTQEP6ZFmo/dA2HEAiDl4jZfLV25eJysNMAz0Fd1knOE/gwJI8MqCM9i?=
 =?us-ascii?Q?arhrJYu9MJxwH+czq3JSb+1zfdI6D8Tcz+0wpH6i7jU9HT6M8yBNgoHYYQhn?=
 =?us-ascii?Q?uZBWyS351/axtw5ayE1Y9F43/kWcazLW0zXrV4CdQ+GUpGRVeg9DbEmTHZnL?=
 =?us-ascii?Q?mD4XdMLSACQvWG9Q/FQEXCA21Ij50y15pTH9fXuxiwayl03KI9ZNleSpjKkJ?=
 =?us-ascii?Q?YoG5xay8Z3XHim94dAGPjbkUIhAFtEpB7JvO1f0hZTA5PJ7halSW2pOrXHXG?=
 =?us-ascii?Q?uAU+sKEvvDyQO8AsJOc4f3S0l+RPuHYpL8mLS4YKvCqqS3NoGUAVwBZ7JAvT?=
 =?us-ascii?Q?RtPnJuB/hMuadgLzoZdglQx8koM6xcobH/2lWVcb0DHr3CN3bHvWMWvp2fCl?=
 =?us-ascii?Q?0sTCw7WxVFVYQFQ4JZb1gI0Odc5DReI0gdd0cowz/rybj0HgZGHy1CRnTghB?=
 =?us-ascii?Q?SxgKZ1m0Oho7UgV89WfSv3WXUkN367X0kzuf7rmw8D4pYZxlf/M2/a09W+Gk?=
 =?us-ascii?Q?E3Zxjr326fCF9dg66/sXEPvl8UdpLkamv20Zv0Z0fT9DgpAp3N2BUdu90Sa8?=
 =?us-ascii?Q?18rhyqJl6qM27ybkK/DnEtzRUUXR6n4vhViLKgNADFrStIUzeiUnOG05QYPu?=
 =?us-ascii?Q?QWcmBj6cTBWbFNN60Rm7MT3JzcPKXeKvxcUGHe1DKqXPQ21CFrNaJHZVPLRe?=
 =?us-ascii?Q?fwFTEAs7dzgX+X/LtQzqq8AL0BQ0BfIVstTnQvVYMFusR/vhjys3Qfa5gp3j?=
 =?us-ascii?Q?fv08s0Q/3tOXH2Xc/G/VCado3/HpT40E4IYFHv6sBBfkkE301Evg8OSiDV8A?=
 =?us-ascii?Q?uk0x3+m9SASeMEbErKgZOLlOPD4G1Wuu/NUYlhL0vHsRdwOEHzjgeA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B2oXly9JKWwtubtFqHuJ6L3HG/88g/unVhECWl9cZaluI1JP8PMrzuVuv8m/?=
 =?us-ascii?Q?/alAkyuR/zblPZq6FP4hcGRMRsO+QMletD0ZRIg//jrqmKl5o736yNv6N92I?=
 =?us-ascii?Q?gKZGO9MwylCC0psNDdgDanm24fAknktTc3K54VXoVDpZ8Rk+k1/jS13rPW+U?=
 =?us-ascii?Q?mXmLvVesVad8uJWonKrj4Mw2eZFgjWXjV2J/GUREMh90TK7vb48MjQRWHSHz?=
 =?us-ascii?Q?KFcVFy6WphwGvUwyk60vzfNQS7u4+yTaFBMFMBrHmdAlb7mrgvsn9Vfwkd7+?=
 =?us-ascii?Q?VlS679Cg1UPTZC9ZkMGZ3Aqo8792vzwMMOUAtApp27zNiYfojcYzflfLbgY1?=
 =?us-ascii?Q?NUwMzEyzU7It1UrIV6dGC3N0yxnfGL0mMX+YCEZn6WBSXxmHb+fhVf1nQGkq?=
 =?us-ascii?Q?UwpJiI2VKt8RmTtZqiv6xWEdCkctVWzzNJsYFuYKzdbj7Pzlva4/2wW5Ce7p?=
 =?us-ascii?Q?33slUEu8TuEqF06oejmE+t9lyKxDc3oFkA8LgZv1AoZMxLvoz9/6mebOqnJW?=
 =?us-ascii?Q?zDJkIL2oGAz5786lgki8w+NQtdk1W1GajNZpPWjIwdMclM7uLIUjOuff8bVF?=
 =?us-ascii?Q?FwLJk9g6VvvRYiLZl+HOopUlzKHlq+UmSqro2k5oNE359nyeV4+9pkN3kWHJ?=
 =?us-ascii?Q?kfML+EiEr8lat4CYljhrKN8bZ2/d6G1yFAaM/IB+zL3zhWIx1Hiro2bUinRC?=
 =?us-ascii?Q?H/0GJU6YHQ6s5t4v96fKiUb9Nhk53hhcv4dSSYhAMj3IRETHG7kEgYAZjCEu?=
 =?us-ascii?Q?LJRa0F7PJa04UHYMClGigmQPH97tnpv5kXxzBxI8l/EJeFG4y2HEQYePAxoK?=
 =?us-ascii?Q?IvGuK5i0OyRJUbaQnuE+NB7PJaqfiRhorP1VorIXEVDRl50rpzao7cVwfQxY?=
 =?us-ascii?Q?C48TjAb4egNQMTTreMLB7LdOPMUya7QxFVY/F2qHK/E6CDOkMstepj3f6XNE?=
 =?us-ascii?Q?uWxNVLBclbJ97Hm4BfGtTNUX4myGm/lTNUHkUNnItxgDkx2GlMGI8gqGjPZT?=
 =?us-ascii?Q?IGpQzORtNwLcJ5fwO349OhcCC9mQzuBw7s2EtLOcK8Am6Zi8DYu4+crBVS5K?=
 =?us-ascii?Q?pC5NSkJtTq9W43A1Fx5oqncUNjsJKIgbudTWnLwtsOAjYTPPbAMGrB+rCFpI?=
 =?us-ascii?Q?H/ZXB6jPFpXy7mVS12rHhMDKQuQx5QJ4Vh53ksp1M9UWtexOPM7RaseoRhlc?=
 =?us-ascii?Q?xjovlD2d8E2LwvW80MvIN3mHm+Myazfjmlxv6/s7tpzsF+KyQGVbZysYq7p1?=
 =?us-ascii?Q?Dr4Yo5licSdgwuAOGKKNEOPp32Hwg5bY5neiflC5prRuxrbxjSE99f/dGPOy?=
 =?us-ascii?Q?77MipK3KA55UILrorFN0y7nEp4cUSP2u/c65baEa8yxdJQworSAUbTrsBsEp?=
 =?us-ascii?Q?LY3YJ1JpZQp+j1Rn0LpfWnvx+kfQJqvCK/Dbz2+uJ+1JgYnFWNKvwmmtsTX9?=
 =?us-ascii?Q?iiuJos5MXs+e21At6AO0siDSNfNudqrKtxt0j0+yG/BPDrNyQ6HDmO6FLgnw?=
 =?us-ascii?Q?kasGOW1N1HeYl+OIQs2Wa3Cbw/n5pj4lf4xuCCJeMwEDZJXtS5R1y77Wx5ox?=
 =?us-ascii?Q?csUpa4RxEpIPol7qGDLpy0hiD3LWWDH+2WgV6OkEdz7wilTHN7cGWQHCNdLW?=
 =?us-ascii?Q?eoIIj30tJnZJZB2BC31Ot8c=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d69ae13-fa8f-4bb0-7560-08ddec6d41ea
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 11:13:36.0919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/XsXitG+eWq0Wyo7gb4JY5CHcbKE+W3SbKjGIjiIw4zU/ShnxViuuLIrmB68PmljHVEVglKLblDFoZSIDonuVtnMQFIYiVm3CM7sMucZFV8L9eRf2BNyOTdlU5UjXF7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6950
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_041341_682434_DDAC7D00 
X-CRM114-Status: GOOD (  12.03  )
X-Mailman-Approved-At: Sun, 14 Sep 2025 13:33:24 -0700
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

Hi Wolfram, Prabhakar,
Thanks for your work!

On Thu, Sep 04, 2025 at 06:08:49PM +0200, Wolfram Sang wrote:
> Hi,
> 
> > Add device tree binding support for the I3C Bus Interface on Renesas
> > RZ/V2H(P) and RZ/V2N SoCs. The I3C IP on these SoCs is identical to
> > that found on the RZ/G3E SoC.
> 
> Cool, has it been tested with devices already?
> 
> > -title: Renesas RZ/G3S and RZ/G3E I3C Bus Interface
> > +title: Renesas RZ/G3S, RZ/G3E, RZ/V2H(P) and RZ/V2N I3C Bus Interface
> 
> I suggest "Renesas I3C Bus Interface". The above is not going to scale.

Agreed, thank 
Maybe "Renesas RZ I3C Bus Interface"

?

> 
> Rest looks good from a glimpse!
> 

Kind Regards,
Tommaso

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
