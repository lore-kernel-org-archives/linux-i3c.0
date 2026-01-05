Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4776C2A082
	for <linux-i3c@archiver.kernel.org>; Mon,  5 Jan 2026 10:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47GMJIEPzws2cD8qrHduVISG4RtIT0GSMcARHFeW0GU=; b=2c6+MJx1tp+u0M
	p82uq52lQmyFzJ9uBa/FnimpDdt8Tj//sJ4KVDuIdVyyN44MfILZVn+RBi4XEsIkT7e6MqR4g5CcR
	ooE3TAAi+5Ht1Wnm+KkgeuG71d+W8mwsbxWoXmTwR5tKUv/Esr7hg9X+eKdgy7jLP1sq2Pod5TnX9
	XO7OBZ3I8Qv496UcMDsNg41cWcw3M2S37TL0hT1zHIrm3DTjitsvhnReKino2Q1UzHWrv/dE0doy3
	kPx3MwZVOz7FItO5i3UZ7H8orr02ooQ6z4TJrXcwtmxGJbwcQFUV1P9JIS4O3Cy44Skt5UE4CqXY+
	5ktcvsXqlz1CBRz9VAeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vchR3-0000000B5bX-1F7K;
	Mon, 05 Jan 2026 10:03:37 +0000
Received: from mail-japaneastazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c405::] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vchR0-0000000B5b4-2lO6
	for linux-i3c@lists.infradead.org;
	Mon, 05 Jan 2026 10:03:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwSafswY2BELFPavJ69Q3zHaoAOlJSjq9h4Xjd9reCKrVCni//iSgbrN5NgSrbNqD5mbLEz/R/x6yZDXoQ8C46h23P9Ahb1BVaHXSteq35Jt82E2Fc/P9csnX1WbtIs4dEund0QPC4NT2MGfpN5sk8Ff17o516fkw8Q/851jxXggvjCYCMbhZgUqclmA3+8t7054QS1eB3vFWZQRzeEb7jnuEi9MWQz4FvsUB6lOw+Gm6JLYhWjt8fFqqNOEBoAWzgLsrTuDbAfnFQ4AWZkZInVJue03vVk7x+RtItTSvI89BNzGbSfpHqpUD8Hk69GBKizxjhCulEa8qRhCYae9pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arwrzcjw2fVpMNG8W02JplwPciOJZP7zHN5riRWJ51k=;
 b=I4Qo1d+w3Dpvz0C+CWYbTZa5UetcHpOaeiDkIdVPVVeFbOeqpdfjwkKsDc2DD/wVRJ06zLVS2iR7H1KDWlP5Y5H8KpNDVpwwnCr6UsRiZSYqviCVDKqxr9D9tXPcNu9LOQLwEkTloa/k4I4CVAzMMEmVs5Q+/pG6pTRbuz6Akzc9EzMVivZ6VArX4jEKI9tgZ+NY33JIB4BFhvAf9nKrwRJGol4vXqN+bCnZQcwjj5yp0qi3BXq89LCawrQyfr55ClVhJfMuDf/kVZzjOlvn5usx3jrKUfu397nlcsMVxgvMBxqTsvbkzohg/EmQPPcNzhZEN8kjxrrbKvd4sNsnfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arwrzcjw2fVpMNG8W02JplwPciOJZP7zHN5riRWJ51k=;
 b=Jetow5R9GG2adE8M1uOoYRUT7rxAb6D9I/4JCUJjUTjXvFOShwD2PZnXlT8XH9yEioKhjfQvBiB4EIx4DyAZMNBmfMOfUA/Oex58/iIkBhCO8aI/bJb1ajAdZWhIUNnMWXzF6aFVvHPoPcnqqK/+epAOzn6PcB1etIcgOd3beNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11239.jpnprd01.prod.outlook.com (2603:1096:400:3c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Mon, 5 Jan
 2026 10:03:28 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9499.001; Mon, 5 Jan 2026
 10:03:28 +0000
Date: Mon, 5 Jan 2026 11:03:11 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] i3c: renesas: Add suspend/resume support
Message-ID: <aVuMRpYkgPpHaG8E@tom-desktop>
References: <cover.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
 <bccb1a911e76d771dc457012bcc1b943a8c1cdf5.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB113467FFD21E457C2B06EC8EC86BDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aVuFPf7lyG4dQvWw@tom-desktop>
 <TY3PR01MB11346A08B97503E899897CFA98686A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346A08B97503E899897CFA98686A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::19) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB11239:EE_
X-MS-Office365-Filtering-Correlation-Id: bb9e57c7-30d3-41c6-4511-08de4c41ac61
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UTjw0mK/W+53NjG/kb5noKGqaY+3ZkRma2JuC6ab+5WKx7G7kRvEDED9Ol32?=
 =?us-ascii?Q?IpyXJwqF9X4Yt3HDBGUgKb82wS2RSxUIXB/yKAMSi7UdJ4Pl6qUcZVJ1Qv1v?=
 =?us-ascii?Q?4ZWBZ9jTdutwtpkdA9CgN4ZjtpBXaWJYP8I5A5jXDX/27y1OGqCJGlklbs/z?=
 =?us-ascii?Q?HcMIyeVk4IoE2RXV6i6bZV+r9lJwOFrewM2ZeQQhnfQbfj0ZIZPnD6Aoi4lQ?=
 =?us-ascii?Q?G55FE3xyfgWUBCa+09g09KlQuTORXnLDj7nzmJ4Mr/BLlwxwVD6F4gbb6f7B?=
 =?us-ascii?Q?lSersiNnWdrx0Vg7hcgeH8fIUzssvW7+67FIiWQaiuJHJ6MX62+WoW0Q7YPZ?=
 =?us-ascii?Q?+0OVtg7z+qR1EDp89/A0igvKWF7g/aK8zVm1tD1IdaxiQLLXQuVd/OGFiCqL?=
 =?us-ascii?Q?8ybzzpfzE+pwlZWCO2f+3U0+r31HBwQNRe8kSMOADJP6szyAoiiLOUMLrp0Q?=
 =?us-ascii?Q?EhZm5X+Xu35o0ABec+vzIrvwtyZ9OlGdJ7ycr7BdA1vq6FNZQivodzBRb8iC?=
 =?us-ascii?Q?DP3LRNukNGlEzsKGVxvTqqT7bxXyUlFiRCVP43d+3oGDKqC7nVaThpz0VKuq?=
 =?us-ascii?Q?iGEmaaETCWFcmHLKMS0CByAc5AtQxrmA8i2WQUeYuZxehoAYJQbUQ2KNeVAP?=
 =?us-ascii?Q?swYNKkYuLnjOzGFhlLbcbk2UPSt6FWctnkYX6LlmkWeURCVea/uyTX/JmNHD?=
 =?us-ascii?Q?jP8uw1UFaRNjh86Lox1bDPwVgh0CPg34pWvs4cjOvogMj7wBQcM9ZSb6oty0?=
 =?us-ascii?Q?onMAO64Uhd5YHEafFSWRjw+MDNwk475u8J3/ZghwFYDAzCmv17T9xWEZshns?=
 =?us-ascii?Q?H7xAvrG/G9sMmfCNBvjIkHmnqn+SmJVYg/Mz3HuW9ULX7ODSznunIC0FDOo1?=
 =?us-ascii?Q?4+MgRzaw87xBWfDuehJuuidPyUGDf0N8EqC1IEsG+L7zS8DSur3dDai7liHf?=
 =?us-ascii?Q?zqrsQDBAvrqsVhNDX2BcYSg6gq8Z/WAcQe+ZR8WxHW4AboAf2rdWoUAtAMel?=
 =?us-ascii?Q?52JpgcvGbts3kkWSMm3f3J8l5kqGvkHUp8kOCXEZ2Zk9dSlPRBDWaIDuZCH9?=
 =?us-ascii?Q?JKfT7Ee0bdTbKbxMNZiKwtnJM7uEmEcPm9Q+qfG1UMo60hMtxAKA/NmAy1/c?=
 =?us-ascii?Q?wQxs34xdJrbbQZivvGuvc/I9pJrfQAjt1iW5QhpW+Ga8ElxdNt1ogAcXopK8?=
 =?us-ascii?Q?vO2lB2Sl887dAmN6ghUjoPXvSYDGtWeMTbWt23mYftUvCXlEG7BZUZVLUlaA?=
 =?us-ascii?Q?b0WbBAAqQSlDZTBjRi71L5wNV4FH+o0LKCjt+Ij4Mu9c/3t4bJcm25n2SlIG?=
 =?us-ascii?Q?l4ryJjKtcnVrv/JL9cZ+EjfPFLkBik/nFdvFTEssn0gYA+sr1g/krZJxI+s5?=
 =?us-ascii?Q?zdiMRC6AQ5P3FAfPvGj4PVRuQT6ftc7HvWAgWrALExKqe2GF2AO/HWsN1SWL?=
 =?us-ascii?Q?bi9HufrEpwoadITLjxc2/3Pp/W9UxnMYCGNK71Qxoeu/p46oKSi6/rGwQo9e?=
 =?us-ascii?Q?qo0MZ2ZJbSFWzbndV86IRiG3xSyEFO1zmdFQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JfpHNk/bYdtEVt0ILxosvKzwJLR7YhzCPOt94ynU13wupRmLqdHcjjLUm1V2?=
 =?us-ascii?Q?2PssvuDm6JEO/b6XcjaXxa/bqQlMpLVWwdbTDvyabFIKXgk8DfZSYUk2zzqv?=
 =?us-ascii?Q?d+MJ4DUkUy2EFP0L0DccPJS2UVdC2EzUNYoWVzzUi51lticp10bhGcMKdz2n?=
 =?us-ascii?Q?QYI8RlcCYZFtC0yOulFGh8sfPUmQ3/+0fpb6T4K+56IEyAIM3b59ph9Ofzb7?=
 =?us-ascii?Q?CmVwK6tT/bxlLIW4lcdWBP0X5wqZ2xFDffFtVvVMHTCrhFVf/jUKVGMR6H+K?=
 =?us-ascii?Q?P3a7w9UoaWTOPi2TUgWtjVV5z+vRqNszd8UFukPXP9XGSd4h6C6wl7vP52Cu?=
 =?us-ascii?Q?+HdcUa4h9f8R+H7AbHtYvWeSXbPa8ZJhgQy0osr7CngtBKXyItzEoCe19HK/?=
 =?us-ascii?Q?RpSL3CXbFehS7yC03qdyoIv2ocqYoEZ0wUv4A2EI184UByZ3mrOXQrfzYtIF?=
 =?us-ascii?Q?ptbshk8g2laLRWCodkc10MOGqTAFmNYPi8La6l2AwB3+Yj/mdq6Y5gKZlPZ0?=
 =?us-ascii?Q?vMHt+konICfuZWZBf3sUH34Kua7qOWjkraYlcQDLZiE9gi9Wb65FYZ+qzTvb?=
 =?us-ascii?Q?ZsBciYfQNeZUQCCiPSlsnw4Kfg9r3z1MZ6AIPnqcrWtsVhZijBf221LrDb+J?=
 =?us-ascii?Q?OVjAvOH5DrofOC3+CA/t/rk5ZcW0uqZdJGa5OGurrMt1vwAV5srFq2uJLfj5?=
 =?us-ascii?Q?GbAlfouvfGd9m3r1BBIib59pO5+kmeDB2ZhdcYFUkAcZIoysQxH8fTX4Ofzk?=
 =?us-ascii?Q?5oFqyvQNZjj24VJ6HoSr8sM2zo+cUBF75CXOY8zNPN+/u3eI1F6ufxmlpTf1?=
 =?us-ascii?Q?PsRlj8AKo+hT2dHU74ncGHaYMESz8rb6C7KolhYpT22dcahCkPfXSyJ2F6kK?=
 =?us-ascii?Q?0ADWWGysJLTY4J8LpGeOBk4lPcmm4KSicgxRrU7jzf3gUPYyD9jTzdc0Vlq9?=
 =?us-ascii?Q?T1L9lFHbnM6qY4uGCL0siyq6lKt4ncto2IEfeqlKVXZsLEAR8veRJvRf2hhQ?=
 =?us-ascii?Q?zv/IODqodITu9T5CPSVMUEpSGq44AZVI7EkE5wxIXtni0K0nW6d8/WAqoC6e?=
 =?us-ascii?Q?xwnL2ggOHzbMu/bkjgQCyFal34Iskchiwfop6bTrp2vbMi6moXztXa+/k+og?=
 =?us-ascii?Q?aUW4bDzNTQXScdperlICjFNTHdIyz3T9NAr0xs1gNbKy5Qq9pg3wcpAK/n6x?=
 =?us-ascii?Q?zszuw0E/5c6igl1bANf5eRkKrsw610LasOPSDwxdl9G4ftbW9AER64AyPBIw?=
 =?us-ascii?Q?/mqs5yPrJ7C2hYfZuMxGv6wfzVCQJ5d87G07yBQW+ZXx2HuaPC7ixXoyNfAa?=
 =?us-ascii?Q?bli1wQRXdYT2X0pjeTaHlWwU4yNEseQ7IBkBw7ZQiAv9I9OZpRYf8dxg+2Mp?=
 =?us-ascii?Q?l5CbM21QSUo52aWGJs2n28+UX9+3iWX1Q4VvLfwlAkRLAMwyLF6K8WpWaF7P?=
 =?us-ascii?Q?iByZcPEOuw5Gpmx2TNZdeRTBun+7HwCKk2N37VRVhgwOkm7C5RvYppXusL7H?=
 =?us-ascii?Q?JCm+wcPLl6NUr43MyhcSJwBLmYKvjDT6GHFXBXSksshhX6X73Jc38gg2ECqh?=
 =?us-ascii?Q?1LPKWEnf5wHal6wGs0g0IT+Dn9PyEer5uSIpOXt6eC34T/57Zj+zpFu6Or6O?=
 =?us-ascii?Q?vpEuNHusy7D8XOtRynMRVO0ETB2bGITjr5JUFdqEqkf+Lnv8iA5kpttdh99j?=
 =?us-ascii?Q?DoHPEOfEJs+LnVCutPGu3QpcRGjxehkyPpBbr0/tnfNeKblXuUCJsq8LAKlI?=
 =?us-ascii?Q?oVbouQm4eLMT2nPgzt4E0n3Lu5HJvfb74p4tnho27nWejKhyOqZK?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9e57c7-30d3-41c6-4511-08de4c41ac61
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 10:03:28.5139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvgYEY9HImMcU3Rb5H0tM+dgou1IyyF7a6AYAMOzEesf9LXF0OJhQoWmg5Tt4FesywLatOA9mYRJWAXHvE73qIFmSbK3a9kkDYPC1unMstVo/Xdzmgv0F3qfyq+nAj/O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_020334_927080_36152481 
X-CRM114-Status: GOOD (  30.57  )
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

Hi Biju,

On Mon, Jan 05, 2026 at 09:35:46AM +0000, Biju Das wrote:
> 
> 
> > -----Original Message-----
> > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > Sent: 05 January 2026 09:33
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Cc: Tommaso Merciai <tomm.merciai@gmail.com>; linux-renesas-soc@vger.kernel.org; wsa+renesas
> > <wsa+renesas@sang-engineering.com>; Alexandre Belloni <alexandre.belloni@bootlin.com>; Frank Li
> > <Frank.Li@nxp.com>; Philipp Zabel <p.zabel@pengutronix.de>; Geert Uytterhoeven
> > <geert+renesas@glider.be>; magnus.damm <magnus.damm@gmail.com>; linux-i3c@lists.infradead.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH v3 4/4] i3c: renesas: Add suspend/resume support
> > 
> > Hi Biju,
> > Thanks for your review!
> > 
> > On Wed, Dec 31, 2025 at 09:04:16AM +0000, Biju Das wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > Sent: 31 December 2025 08:23
> > > > To: Tommaso Merciai <tomm.merciai@gmail.com>
> > > > Cc: linux-renesas-soc@vger.kernel.org; Biju Das
> > > > <biju.das.jz@bp.renesas.com>; Tommaso Merciai
> > > > <tommaso.merciai.xr@bp.renesas.com>; wsa+renesas
> > > > <wsa+renesas@sang-engineering.com>; Alexandre Belloni
> > > > <alexandre.belloni@bootlin.com>; Frank Li <Frank.Li@nxp.com>;
> > > > Philipp Zabel <p.zabel@pengutronix.de>; Geert Uytterhoeven
> > > > <geert+renesas@glider.be>; magnus.damm <magnus.damm@gmail.com>;
> > > > linux- i3c@lists.infradead.org; linux-kernel@vger.kernel.org
> > > > Subject: [PATCH v3 4/4] i3c: renesas: Add suspend/resume support
> > > >
> > > > The Renesas I3C controller does not retain its register state across
> > > > system suspend, requiring the driver to explicitly save and restore hardware configuration.
> > > >
> > > > Add suspend and resume NOIRQ callbacks to handle system sleep transitions.
> > > >
> > > > During suspend, save the Device Address Table (DAT) entries, assert
> > > > reset lines, and disable all related clocks to allow the controller to enter a low-power state.
> > > >
> > > > On resume, re-enable clocks and reset lines in the proper order.
> > > > Restore the REFCKCTL register, master dynamic address, and all DAT entries, then reinitialize the
> > controller.
> > > >
> > > > Store the REFCLK divider value, and the master dynamic address to
> > > > restore timing and addressing configuration after resume.
> > > >
> > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > ---
> > > > v2->v3:
> > > >  - Fixed error path into renesas_i3c_resume_noirq() and
> > > >    renesas_i3c_suspend_noirq() function.
> > > >  - Moved up one line sizeof(u32) * i3c->maxdevs into devm_kzalloc() call.
> > > >
> > > > v1->v2:
> > > >  - Updated commit as v1 has been split into smaller patches.
> > > >  - Use clock bulk API into renesas_i3c_suspend_noirq() and
> > > >    renesas_i3c_resume_noirq().
> > > >
> > > >  drivers/i3c/master/renesas-i3c.c | 89
> > > > ++++++++++++++++++++++++++++++++
> > > >  1 file changed, 89 insertions(+)
> > > >
> > > > diff --git a/drivers/i3c/master/renesas-i3c.c
> > > > b/drivers/i3c/master/renesas-i3c.c
> > > > index b065b8d4b138..e33ff16efdb3 100644
> > > > --- a/drivers/i3c/master/renesas-i3c.c
> > > > +++ b/drivers/i3c/master/renesas-i3c.c
> > > > @@ -256,16 +256,19 @@ struct renesas_i3c {
> > > >  	enum i3c_internal_state internal_state;
> > > >  	u16 maxdevs;
> > > >  	u32 free_pos;
> > > > +	u32 dyn_addr;
> > > >  	u32 i2c_STDBR;
> > > >  	u32 i3c_STDBR;
> > > >  	unsigned long rate;
> > > >  	u8 addrs[RENESAS_I3C_MAX_DEVS];
> > > >  	struct renesas_i3c_xferqueue xferqueue;
> > > >  	void __iomem *regs;
> > > > +	u32 *DATBASn;
> > > >  	struct clk_bulk_data *clks;
> > > >  	u8 num_clks;
> > > >  	struct reset_control *presetn;
> > > >  	struct reset_control *tresetn;
> > > > +	u8 refclk_div;
> > > >  };
> > > >
> > > >  struct renesas_i3c_i2c_dev_data {
> > > > @@ -609,6 +612,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> > > >  					   EXTBR_EBRHP(pp_high_ticks));
> > > >
> > > >  	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
> > > > +	i3c->refclk_div = cks;
> > > >
> > > >  	/* I3C hw init*/
> > > >  	renesas_i3c_hw_init(i3c);
> > > > @@ -617,6 +621,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> > > >  	if (ret < 0)
> > > >  		return ret;
> > > >
> > > > +	i3c->dyn_addr = ret;
> > > >  	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) |
> > > > MSDVAD_MDYADV);
> > > >
> > > >  	memset(&info, 0, sizeof(info));
> > > > @@ -1362,6 +1367,12 @@ static int renesas_i3c_probe(struct platform_device *pdev)
> > > >  	i3c->maxdevs = RENESAS_I3C_MAX_DEVS;
> > > >  	i3c->free_pos = GENMASK(i3c->maxdevs - 1, 0);
> > > >
> > > > +	/* Allocate dynamic Device Address Table backup. */
> > > > +	i3c->DATBASn = devm_kzalloc(&pdev->dev, sizeof(u32) * i3c->maxdevs,
> > > > +				    GFP_KERNEL);
> > > > +	if (!i3c->DATBASn)
> > > > +		return -ENOMEM;
> > > > +
> > > >  	return i3c_master_register(&i3c->base, &pdev->dev,
> > > > &renesas_i3c_ops, false);  }
> > > >
> > > > @@ -1372,6 +1383,83 @@ static void renesas_i3c_remove(struct platform_device *pdev)
> > > >  	i3c_master_unregister(&i3c->base);
> > > >  }
> > > >
> > > > +static int renesas_i3c_suspend_noirq(struct device *dev) {
> > > > +	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> > > > +	int i, ret;
> > > > +
> > > > +	i2c_mark_adapter_suspended(&i3c->base.i2c);
> > > > +
> > > > +	/* Store Device Address Table values. */
> > > > +	for (i = 0; i < i3c->maxdevs; i++)
> > > > +		i3c->DATBASn[i] = renesas_readl(i3c->regs, DATBAS(i));
> > > > +
> > > > +	ret = reset_control_assert(i3c->presetn);
> > > > +	if (ret)
> > > > +		goto err_mark_resumed;
> > > > +
> > > > +	ret = reset_control_assert(i3c->tresetn);
> > > > +	if (ret)
> > > > +		goto err_presetn;
> > > > +
> > > > +	clk_bulk_disable_unprepare(i3c->num_clks, i3c->clks);
> > >
> > > Why can't you use unlocked version clk_bulk_disable/enable(num_clks,
> > > clks); for suspend()/resume()?
> > 
> > I'm seeing the same calls into:
> > 
> >  - svc_i3c_runtime_suspend()
> 
> 
> Are they doing in  suspend_noirq callback(), if yes you could fix that driver as well.

Yes, but unfortunally I can't test the fix on this platform.
I will send v4 using:

	clk_bulk_disable(i3c->num_clks, i3c->clks) into renesas_i3c_suspend_noirq()

and 

	ret = clk_bulk_enable(i3c->num_clks, i3c->clks) into renesas_i3c_resume_noirq()

As you suggested, Thanks.

Kind Regards,
Tommaso

> 
> Cheers,
> Biju
> 
> > 
> > Into drivers/i3c/master/svc-i3c-master.c
> > 
> > >
> > > > +
> > > > +	return 0;
> > > > +
> > > > +err_presetn:
> > > > +	reset_control_deassert(i3c->presetn);
> > > > +err_mark_resumed:
> > > > +	i2c_mark_adapter_resumed(&i3c->base.i2c);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static int renesas_i3c_resume_noirq(struct device *dev) {
> > > > +	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> > > > +	int i, ret;
> > > > +
> > > > +	ret = reset_control_deassert(i3c->presetn);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	ret = reset_control_deassert(i3c->tresetn);
> > > > +	if (ret)
> > > > +		goto err_presetn;
> > > > +
> > > > +	ret = clk_bulk_prepare_enable(i3c->num_clks, i3c->clks);
> > >
> > > Same here.
> > 
> > Same here.
> > 
> > 
> > Thanks & Regards,
> > Tommaso
> > 
> > >
> > > > +	if (ret)
> > > > +		goto err_tresetn;
> > > > +
> > > > +	/* Re-store I3C registers value. */
> > > > +	renesas_writel(i3c->regs, REFCKCTL,
> > > > +		       REFCKCTL_IREFCKS(i3c->refclk_div));
> > > > +	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
> > > > +		       MSDVAD_MDYAD(i3c->dyn_addr));
> > > > +
> > > > +	/* Restore Device Address Table values. */
> > > > +	for (i = 0; i < i3c->maxdevs; i++)
> > > > +		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
> > > > +
> > > > +	/* I3C hw init. */
> > > > +	renesas_i3c_hw_init(i3c);
> > > > +
> > > > +	i2c_mark_adapter_resumed(&i3c->base.i2c);
> > > > +
> > > > +	return 0;
> > > > +
> > > > +err_tresetn:
> > > > +	reset_control_assert(i3c->tresetn);
> > > > +err_presetn:
> > > > +	reset_control_assert(i3c->presetn);
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static const struct dev_pm_ops renesas_i3c_pm_ops = {
> > > > +	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
> > > > +				  renesas_i3c_resume_noirq)
> > > > +};
> > > > +
> > > >  static const struct of_device_id renesas_i3c_of_ids[] = {
> > > >  	{ .compatible = "renesas,r9a08g045-i3c" },
> > > >  	{ .compatible = "renesas,r9a09g047-i3c" }, @@ -1385,6 +1473,7 @@
> > > > static struct platform_driver renesas_i3c = {
> > > >  	.driver = {
> > > >  		.name = "renesas-i3c",
> > > >  		.of_match_table = renesas_i3c_of_ids,
> > > > +		.pm = pm_sleep_ptr(&renesas_i3c_pm_ops),
> > > >  	},
> > > >  };
> > > >  module_platform_driver(renesas_i3c);
> > > > --
> > > > 2.43.0
> > >

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
