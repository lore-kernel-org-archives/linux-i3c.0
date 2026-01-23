Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635EDD74EEC
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Jan 2026 16:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Q2aC2Mm0Ge1Ftm79sxb1u6cmxblTdYLrK+FXxk46Eo=; b=IHVEjafaFpYuI/
	vYevN3pW2x4kUr+1qm7zot0frIlcoGWr+oCx7sXAill37e18EOkhbszfHeC4zSHHs9LxUSKYKui/X
	OFSHhAvUSdI6K3lfOLecWEFGaFs2h3PdFZ4t5d9jJxnP2bKyOakJOf206slnAT9vcTKVnwtQnV8Qy
	2TA/Co6WXKou3P9Yni87gl55Q6gAEd3OYKFA0LxCqQw4YqGeFrkBiba4aCOOAurSIwwxH3HotwnQw
	RBCTnpDh4izbHnz54qZ6smPzHn/CjLHeVuIH6S/DNzScO73Dp3UbKNp1Ds4Xa6FRrsW4sog9FBZ5c
	Drkg7BY7ZBAB2Fxv5BHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJsX-00000009CAo-45q6;
	Fri, 23 Jan 2026 16:19:22 +0000
Received: from mail-francecentralazon11013070.outbound.protection.outlook.com ([40.107.162.70] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJsV-00000009C5x-0jEi
	for linux-i3c@lists.infradead.org;
	Fri, 23 Jan 2026 16:19:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUqENM5oQfkHu/XMVjzLEVESk4m6Fm90O8FSneMrDGM8ZAe41FEKPdfyRz01NPqqW6Slw/deDhr60nyC/eVkXYXm1UxE29YiALNwv/ZMcVOoYJ3BzMI1tWwYcBNQQgF48MT9yAExr8eMLGVgGTCQjRfyq/6D95A2zK2jBDt4ttRw5mltaEiEdn0IaFnNHKtus2dB6yCA1k2D4KrAl/pAoDX6befL3X2Gt4taXy86MWhEJ3Nksn0AxRKgbDvnofDnNvZwLrWUknkc1hnIcTdrAx22ildsyxJHXgUh9OG9Hx8B7l1w82IYo/BHCWfR7QTjpBIOfHFkFiSWQOQ/JfdafA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVn4bPx810V2ffPR/4WDMRZ5dX+3J3Rqr5RNIbm73V4=;
 b=ihLVWmcT7aK69XL7FhzExhGrIGb4AxE7J9p5B1ooUnmysyvrWwZqWe9SVFqmYV49Ez8bvl4PoJqRKgTn/Ttc50OVP8a6lCpVuvUjsgq/R9GygjXKFPw60L9Q56h0D1KVOEI8S7RO69mqS6bJSPt16qRao9V1MZEtd69wqYXdiBURe7a9pEiv2ZODvvxw4VGMLxVPqPcBvIrNn/iSc/6u2wQOXS7KcTn+CM+Ec8auYdaGJTDdQ0AR7X9syoIRzdB6NnLCBp/fDI1k0lnGVihb2ZQ8eFNc0efzy+1j+fLjicJ9FwT5qDjx3LF/PvRZatn0wsPE7zmrux+rUGGWO9N4dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVn4bPx810V2ffPR/4WDMRZ5dX+3J3Rqr5RNIbm73V4=;
 b=HABmSRVHpZJ6JnVwanLGQquEWUTVYKJaGd+TFpDFdi+ObKjjLkZBUfzq+wzGPnpy+EatAqilgu4yNNmPMjdZ8DqlK6buCJyWAgVOmsJJtGJxsLdgOqbLPPo8djhaAzdc1c8IQ4xDpVIEoItDf/xDM8iAz/ulFjoBIdjtBws9SE3yIaoyFkPW13pFtuxiFUjkRtzmF9nn5pLCJzz2SDLkz/mxyAc9/OuxpswCTis25i8syrpnxhnH+oqute0I+20Ug+JhArsht4DODnl/sJCeUN7xu21FhaYHrEaV9bhNn2VZ/RsHJAWeqq2yL/9Lp5tMBjBEWIYxLu5DS+N/Gre6Ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5)
 by GVXPR04MB9734.eurprd04.prod.outlook.com (2603:10a6:150:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 16:19:14 +0000
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5]) by PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5%3]) with mapi id 15.20.9499.005; Fri, 23 Jan 2026
 16:19:14 +0000
Date: Fri, 23 Jan 2026 11:19:07 -0500
From: Frank Li <Frank.li@nxp.com>
To: David =?iso-8859-1?Q?Nystr=F6m?= <david.nystrom@est.tech>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joshua Yeong <joshua.yeong@starfivetech.com>
Subject: Re: [PATCH v3] i3c: master: Add sysfs option to rescan bus via entdaa
Message-ID: <aXOfe/T0gPPbTiHx@lizhi-Precision-Tower-5810>
References: <20260123-i3c_rescan-v3-1-026429fa0c65@est.tech>
Content-Disposition: inline
In-Reply-To: <20260123-i3c_rescan-v3-1-026429fa0c65@est.tech>
X-ClientProxiedBy: SJ0PR05CA0128.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::13) To PAXPR04MB8957.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8957:EE_|GVXPR04MB9734:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d84fbc-1590-415d-fb5f-08de5a9b261c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?z6MRa5NQfeNpUudknv3XvSN92swdGI7IkJre6cWX4SmBcHKSQ0q6PY8qy+?=
 =?iso-8859-1?Q?MqCecaZWISW9fSmPRwablSJQAemhwISIIYD+nfmjrbfVedwFGsOTpMNyUt?=
 =?iso-8859-1?Q?A2lRODqU5bESluoPQICvxUbjaBo1juG6c+HCCDW83WZBBdFLfgCfkGaq5m?=
 =?iso-8859-1?Q?sVsATtdINkTxnwaCT0kPu7O2AUv3zXWyzqjyHVPf5alBAl/pZge/oHjhlk?=
 =?iso-8859-1?Q?kd8w6UX/POFOjXFtKWmuOZ3n78EJrGjj3I+67CxdcM9ge/O3U/sc5gUWyh?=
 =?iso-8859-1?Q?n50tM+KB4dUVyRteoHKNX6Rk+PlJ6KF8U8B+s7N22Qt70eN9RitGvRECVJ?=
 =?iso-8859-1?Q?Lo2XGoK0VWuwQRbwp525OuuL5SPAu1Y3ipRTo6jKfFxGqH0sVoBcmnwzak?=
 =?iso-8859-1?Q?abUos972q/n3KdXnhlM0Q66w/2lR+gvbjRIjrh5P008IqxG+Uk1+tJA1Dr?=
 =?iso-8859-1?Q?Wv+ThHZGZMJhxyG/LQH79j+Xqlq/4WFtpWgEYQFT2bHGidHkl826x1AquY?=
 =?iso-8859-1?Q?+uV4VxiCc+p3Fcf/bFnM5TxNnFntFYWBIMRLrBSrlslrGZID1HIQuUV8DJ?=
 =?iso-8859-1?Q?OqeJZZcNqTWJKGgbsRzDMJdkVxgBy6Q1pVwDuWFO046NLKrciFlIP467z2?=
 =?iso-8859-1?Q?kmEMiGZP873SVmutIyX0fL0qeOAI0oVIqOFnqlGEm11KZ1pkYG537LNMh6?=
 =?iso-8859-1?Q?FYd+I4enCixfwTenedP+vAaNpV1LsZ9clhScJXxcsfRS/KjGe/ymH7Q9bB?=
 =?iso-8859-1?Q?GbIH8Um78AxnUsfFFR1ZmwwaWivxzWM8AafdEFaKrAy7Ubf+r8Uod1cRIH?=
 =?iso-8859-1?Q?aFiWhleBgvybXweeZ5ei3mgUgCD1qHzJasZ0PrxGa1Jhmp4r05vWILlMzg?=
 =?iso-8859-1?Q?vrqrMAUWnNzH7l9VPygxKftLPiKEzBLqPksHwYxv+HrimojVEoNTRw7VLq?=
 =?iso-8859-1?Q?+aWqH9lHwBTBPcF4oROhqJiUX1cZEnqmWABpSSQuUQiT3Xf4QKYyalQ0CQ?=
 =?iso-8859-1?Q?DfIH/WJXYK6bsZZQJLlKMAmIwMR7SQIctYej5caVA19TWlxkaAZWEw1fUx?=
 =?iso-8859-1?Q?QbOoPlVv/CSadCQA98x5iwTzF6Dp9Jbo9Ae8zcuef36bok4OJwST6+Zsi9?=
 =?iso-8859-1?Q?JqMylLiAAFSRNshCKkcYfTYNJ2YLqe1SN6zlYeJaTo3W/mReONEhm7sHD/?=
 =?iso-8859-1?Q?kJ7BXocf3NxsKGk9hIyItXVYnLHUxAx66TksnFaZwPzC8xAjGW2E84dsqn?=
 =?iso-8859-1?Q?cpX6VZfOT6g25NMtXBLZN+FKDTwJ4EAuxaRmUd4mT9M8PFUc85Dae2ioJV?=
 =?iso-8859-1?Q?BcBuWueVDNdBm7R7o86zoelEQ8JA9MrNzL9Y5waxwSa33KYZAonHnQP7U+?=
 =?iso-8859-1?Q?XCuJXvaHJBCJNRrTsJG6FQeHR5oFLFXLaNjSpUEbxSgolXk+SN7ju4Fays?=
 =?iso-8859-1?Q?1d6ks+IifTOCCWU6+TZ0tUexar/2zlVatHaknNfxT9FKIQNyxwEfkI+mj4?=
 =?iso-8859-1?Q?/Qq9W5pe5Qd1AHQF5i2qL0QX1Pdn3BeiuV6Lz6CJdmT1tIyPV/01XibIg8?=
 =?iso-8859-1?Q?w8zhLjIXsX/mm5jlIfpTxvogJ/lW7orrr+COBbwHN+pTaVeWZcqAj8GsFx?=
 =?iso-8859-1?Q?tnXW64ffywZHZGrvxr0fv7iW9IYERHSQ4w?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8957.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YX/iR/8zx73DSUDlLPt8ZtQ9Bxj7lu0MieZmpwWlk9Su7pziY8rjYY/3HO?=
 =?iso-8859-1?Q?5KvlhxTYYFqQ0knrGOHL2F6BwkhZ9bST4S+yeUZn1SRFTaqiQjKSPrNkBJ?=
 =?iso-8859-1?Q?m2/LKrbNNYWmC7tKTMuFCpqfNE4NuaT+cBzDPbA0HclEPx7bGAoqhswRKY?=
 =?iso-8859-1?Q?1dgCXNhJi6SKkmqFE66yN6nu1+fCy0lL/0UsUHKge9JBUhAl+T2d3BD59o?=
 =?iso-8859-1?Q?RdWcly9lcxVjA1VRlO8hxUVeAy/6PGsIqMa4dDKON2YSxSksiIxw5xT2sy?=
 =?iso-8859-1?Q?hNWrirqQA7gcGRfl8ZE3DblaWAmlu8aYB0GMNW6BijJB2zObRB/vhC1l81?=
 =?iso-8859-1?Q?xpHsbmv0U8UElbsKCp8fLolv5OCKdz84x6I5wNGntktgaAi6B0B8n6Kraf?=
 =?iso-8859-1?Q?Nv27HK/qdxbhkb5Eyv3iiHZff/h1tMtYiTOuj8wjJSQXGGV1DDqQuqeTGz?=
 =?iso-8859-1?Q?eQXl+S5yLL4kfNtPlgLjsf4oDox37nXgU2Gznt8MCScPNhEwFaoFxNRd4B?=
 =?iso-8859-1?Q?u6X6IyCQuu0zw9qEnCnQFQkGCf8H5JWB5B6g65Bjf0srP/19a9eQJjUE21?=
 =?iso-8859-1?Q?BWeSQrZcpnFOJSAX5canvYWMsfFeMHHqyOUg9EvYdQE/sArS8iHX1s9HXd?=
 =?iso-8859-1?Q?VHvMwrtzVOhGGvhWcWiMy20HKlUW12PzkIoDJPKMc6SGDgGcwu44SdL1HI?=
 =?iso-8859-1?Q?vFAHpkeQDM1zJCUWSTC5+J1cNhAHsVnE/BCdE5FEOib8IYpQkhjlJ0zXlN?=
 =?iso-8859-1?Q?fJtceeNtz5S/4tyXsWwLn/UDKtMWgONXiVwYbR1xFRGy9LXuJGPfKeNPVQ?=
 =?iso-8859-1?Q?0ZH+q67DJhDutTjt4C1houuUKgeLVuQCBTtft8eT/0wc3nBVku7inySeyJ?=
 =?iso-8859-1?Q?Ci0BJYlSODX8BknSfyD61hkNaV3JGw26VAvvbqbjRIsiFMKQ/anHNPvDhA?=
 =?iso-8859-1?Q?5qNsqEyy6cp7xJ31qLpVEMdErsw2DJwSY+gWQouL0l2cpeudBJVaBlr1UJ?=
 =?iso-8859-1?Q?OD7T9jZNYwhRTLpRZQAii6Dg/kU9OqUXlapKHnBVZzJnZIqAIyqG7IqPHr?=
 =?iso-8859-1?Q?c30noskzYez7sArX36fqTBWi18h4ptCBYbUbyIupo/5CiOPA4Zc9eQJONo?=
 =?iso-8859-1?Q?6NkFc3DRoz9RejvK4LH/fwkXwyWT6TYPfvWo+p21iugV9DToUaFnqyp6Ez?=
 =?iso-8859-1?Q?IaqvaZv3PZ/Qs9wSNq7SzlYdGs73HfLJhGOztvJSfMQDPpwSRj8OIA2p2A?=
 =?iso-8859-1?Q?gU7v5S4+5EaaH9nBbvUZ7EsMYVwQ3u3CBpaiIMO70buxa2eyEk2YQroBk/?=
 =?iso-8859-1?Q?Um1z9WmsMEf0NvhXkyiLZOtphOmwPZUXFZaAVI4EU2is+skShx8cA2mGUp?=
 =?iso-8859-1?Q?A9r68MbsOlCoV/FfiirzIzt1e4QRCuKR1JTsqC2+kMJEJRY3Q02VtYtyUD?=
 =?iso-8859-1?Q?XUj/xJftdWoezexOGSX3TbAYpDXbR/5bGe0kpUr+KOcMSxjH0C/iS10DV/?=
 =?iso-8859-1?Q?uZuiL2j4VqQAShziL7VbINlZgteiCreQk2JYLe0PjAM+Xt9oxf1m97Wq+P?=
 =?iso-8859-1?Q?FA84uep6tjj++jlN7g2+o3qHOdhCPHw1/0gahGIWj8sRWjQt6mjB4U6vul?=
 =?iso-8859-1?Q?hlpvHFBdPqRaQe4ZPCUAQp36IPQwwME+BAEb12ygUIRNYlC7cNRZSrqF99?=
 =?iso-8859-1?Q?PbWsd6aMH5E6IqbzcHcUK0TWOPLuyehBIaUZXVK5ty76mjmlp2H9VCoVIK?=
 =?iso-8859-1?Q?E8TSaMaXcyquvvTJ/I68TxFPCVGayzNN18fZYLSAZFr4gm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d84fbc-1590-415d-fb5f-08de5a9b261c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8957.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 16:19:14.2058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unWtg0K2PSnf4JxnIV5PlmmuQ+c4d3XIDccR4TW8KBeFuIfXUtwitUq7TrZXrQTPQOMiT/DYHwWFPkW3R1+t4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9734
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_081919_234027_F8893811 
X-CRM114-Status: GOOD (  22.71  )
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

On Fri, Jan 23, 2026 at 08:55:37AM +0100, David Nystr=F6m wrote:
> Add the ability to rescan the i3c bus from userspace, i.e. provoke
> an ENTDDA. The usecase could be f.ex. an i3cdev userspace driver
> for a device with broken hotjoin support. If the i3c device
> boots slowly, it might be miss the DDA during boot.

AI helpped rephrase

Allow userspace to request a dynamic address assignment, which is
useful for devices with broken hot-join support or devices that boot
slowly and may miss the initial DDA during system startup.

Need update ABI document

Documentation/ABI/testing/sysfs-bus-i3c

Frank
>
> Signed-off-by: David Nystr=F6m <david.nystrom@est.tech>
> ---
> Changes in v3:
> - Rename sysfs entry from rescan to entdda, Comment: Joshua Yeong
> - Link to v2: https://patch.msgid.link/20260122-i3c_rescan-v2-1-84c74a483=
f03@est.tech
>
> Changes in v2:
> - Improved the commit message with "why".
> - Link to v1: https://patch.msgid.link/20260122-i3c_rescan-v1-1-0c17071e2=
32b@est.tech
> ---
>  drivers/i3c/master.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 80dda0e85558..a1d816634a25 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -758,6 +758,29 @@ static ssize_t dev_nack_retry_count_store(struct dev=
ice *dev,
>
>  static DEVICE_ATTR_RW(dev_nack_retry_count);
>
> +static ssize_t entdaa_store(struct device *dev,
> +			    struct device_attribute *attr,
> +			    const char *buf, size_t count)
> +{
> +	struct i3c_master_controller *master =3D dev_to_i3cmaster(dev);
> +	unsigned long val;
> +	int ret;
> +
> +	ret =3D kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val) {
> +		ret =3D i3c_master_do_daa(master);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_WO(entdaa);
> +
>  static struct attribute *i3c_masterdev_attrs[] =3D {
>  	&dev_attr_mode.attr,
>  	&dev_attr_current_master.attr,
> @@ -769,6 +792,7 @@ static struct attribute *i3c_masterdev_attrs[] =3D {
>  	&dev_attr_dynamic_address.attr,
>  	&dev_attr_hdrcap.attr,
>  	&dev_attr_hotjoin.attr,
> +	&dev_attr_entdaa.attr,
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(i3c_masterdev);
>
> ---
> base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> change-id: 20260116-i3c_rescan-4921d0b41a00
>
> Best regards,
> --
> David Nystr=F6m <david.nystrom@est.tech>
>

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
