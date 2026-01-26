Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9488D19501
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Jan 2026 17:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QUpqpfzK/Sdopqd3Nb6NB7Sfj1l/4pszwibNwx7q5Bc=; b=0KFTS869YaJBbT
	RtlYqbBCZZd1ME2HKCV1FDbRfTMDA8tnApGt17KkWBShUpeBaP7PN/79YXa5SpFAxqXzRfcQNfGjM
	jLPqXBqQJj15DtDkp/6eHKfPcoBD+Wm0QWPMK2iHqj02/hptExPQv4QU9McdtYD1CQc8oyn7wn1IS
	G8AT+uIsLivUUQlKHqx/sK/uYBUSgxfKycZJClPQ9CCypizB+ker2namsRFjoN5G705kLLIonuwBh
	gwiQMMMnRtqNRxlM7W9cT3UfUhzH5o94uRvPc4iPw8Lib2fPSMiFqx45YGdKCgrlppEgqIELOtDpn
	U4a/AKoECJcMSoHRnZ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQEv-0000000Cx3O-2bjS;
	Mon, 26 Jan 2026 17:19:01 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQEr-0000000Cx20-1tWa
	for linux-i3c@lists.infradead.org;
	Mon, 26 Jan 2026 17:18:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WB9wXYRzpdLvAtDj/WZpOUvwPTnumbKxdYB8fSoi3IIPCL5q0Jk7IFwKWX+alI+WIywEyajYrRsy+HuDZHW5GCOlpIInSgXWgsJRoPwscUQbPhpivxTEYpZxBWTOohbXWsmvLOu3DFCYy+hsXYITiF+LP8c4PPBIs85dGQ4aWDEK8QcBgB6Z8a746U06xfKdJcQLpo/Ibzy237Ht6iYxXHZHF8R8Z3qKUWxoY2bUNZSzJtZGzP7XW3Jz9VPJrxNXWkRHWwiSA2pKrhOJgdDlkWuAn/ThVM1ZlSniGgRBTU1nfUye/mfyDG192zEI4qspZSeLpVpVL3Aqdz9xklFu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPo6XZw3pAv7KuleHLzOfW0iJe1om+A/DjyEpo2UoK8=;
 b=Cs0mY69uabh5jSxEosSjtXtftgzgv5wZ1x+IfovDghsxIz+w5sPKP6Kw26zcRVr7PCB9M9BQ4GwY00Vi8KPVK7g3rScBHdigWZ/kRGVh+1TPN+EFb0dnwR/4uvcxovRjYrJoTVm67XNJbi6Cvd4MrEWzqoEiPNokTt8tCX6pQpm9GqnOuTEUgM+qxCaT4U9NHKGot5KmzEwJ+G8uZU/qqKRSSml4ZH8S08MrrcAs4+9xiRrk5BlmdwrPZFsp5ivc/kndbi24OclE3tj9Rm8mBRjibvJHBIZbFTdwft1PycYuemJynm347G0pCSrzwkWSsrCe2lLbeyRtkylz5Mv8Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPo6XZw3pAv7KuleHLzOfW0iJe1om+A/DjyEpo2UoK8=;
 b=aBO7kMj/rQ/8VoheWEBAEkqhjUUMHS0DZVdMYjCVMhzY+SgzeV7qdTXLYBObuhJyEO1NiCdBSzUhAOJZv1hcjyZiHz6nhUOl1cc0HD1MXCII310qbnyEmqTKaAJYFX9XljG7JwHbB/0XYqNypnAd0QMEKhmrutXwDL7LQR/iTq2qOVAExGyCA2K/kY3wWfru7bPTi4iY61iUA4tc7FP2x34r+jvDPsEIRmfJu34qREQ+Z3K9RCyEYgVJhUK9PhjTFmKo+QIzTkwm5rSC1+UuC6Oiua2HtycBmA9Nz43s2GN+XyS8tzS1Id9jjYN/mvGbek5Y8GJSGiIaOxf7BL61tA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9350.eurprd04.prod.outlook.com (2603:10a6:102:2b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Mon, 26 Jan
 2026 17:18:52 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Mon, 26 Jan 2026
 17:18:52 +0000
Date: Mon, 26 Jan 2026 12:18:44 -0500
From: Frank Li <Frank.li@nxp.com>
To: David =?iso-8859-1?Q?Nystr=F6m?= <david.nystrom@est.tech>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joshua Yeong <joshua.yeong@starfivetech.com>
Subject: Re: [PATCH v4] i3c: master: Add sysfs option to rescan bus via entdaa
Message-ID: <aXeh9ORxy0qxKPBj@lizhi-Precision-Tower-5810>
References: <20260126-i3c_rescan-v4-1-6b3559d82abc@est.tech>
Content-Disposition: inline
In-Reply-To: <20260126-i3c_rescan-v4-1-6b3559d82abc@est.tech>
X-ClientProxiedBy: BYAPR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::40) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9350:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f1bb196-c41e-475b-0978-08de5cfefa0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?05At+P5pzd6t2KjOsLp+pUZHqAisWJJTvufvpkyb7VKnmxikYqaBPTlzwR?=
 =?iso-8859-1?Q?QC1p6zd2nWbbuSlejybWrgLMk/PKvXjETAOzMKY4RtuHSxWJkOmEgjHOH3?=
 =?iso-8859-1?Q?sOeKT7DD8a1pvcifWedzniGAnOsVT6YFDqEn6L23clhvLCUAeQCSIL6J7U?=
 =?iso-8859-1?Q?XYO/h9u8aS4mG8HZjpCKSJZPDX3aU1s2DB9POa2dxvIIWBJcB6tJ6kPkMD?=
 =?iso-8859-1?Q?+fCxZnTOCHBYtQRGQYGaCupKHe1qrGToAOmwzk1P36E/2lxuALT7SZS9us?=
 =?iso-8859-1?Q?p0neK9NswCA+htHhgK3e/bWa5J0TQtOad/w9GiBVCND5wf1f/mKLxiHCDg?=
 =?iso-8859-1?Q?q4qupM1OzaIFZfwg9X62u7F027QriZCYtqiUu2xgvPhY1siZ28PBSPP2ej?=
 =?iso-8859-1?Q?MBjLf+z/xDIkK8Cl+sI3pVMXdeW/BZkOCnCacEbr1OVRFDn8FFe7s02lgh?=
 =?iso-8859-1?Q?MnU49+tEqtWzNL5jnoJGjdSXCoifprAsQCdQsiC2ulSbnww+/X86ITUL8U?=
 =?iso-8859-1?Q?8Z0bq/lmlLqtUDup0/aANNxuEAvRVqnXfqX10pRe4S0KsE81LrbP5KXoct?=
 =?iso-8859-1?Q?gzf/sEBrKdvJHHf9DeoNJ+3ja47t7zLoh2s1p0aJSk70cN+3Gl7kC4yBYq?=
 =?iso-8859-1?Q?0FqTImx6O7em6uxZ8K5uhQOd08QqJDQTJ0S7xc4HVF0mTI+1xDgk1cmIz+?=
 =?iso-8859-1?Q?J013mLcb6+6QgG06B/gd2O9eVu91ZDFPV3CcaLaA4pnJXckmdjOJHgdE3D?=
 =?iso-8859-1?Q?NLn/mUEmCT5tYW1UUHNb2ePbz8Tz7POC8/J9ZOC79YV2FU3KjlFrUQo6o2?=
 =?iso-8859-1?Q?bbBZz+eJHHPIBqUWgJYwzfVHVWivDhucLwQvPCngtrSJrQVkKR9l3iZKEF?=
 =?iso-8859-1?Q?d3ps+2mC9/lstQ16Ry1uro72DIlJBHTdLYwPnl8QCnzcL7dLCUvfIiWSKX?=
 =?iso-8859-1?Q?2D8WMBuFYxjAMkf2yH4a0JcyEBxWfimSPyygD7BsPZ5tHBY1ilJ7q9HZdQ?=
 =?iso-8859-1?Q?IteQptc5AFTf3BP6loZ84Qb0ntXigmD5vhfLYf4xDKyQkH3yr+w4VAvzw+?=
 =?iso-8859-1?Q?XRKB0ZFpIFODavBuUnpYQz4dRVIXAu2mP8ExU0gJ2z30bhuKQOa6pnt4CB?=
 =?iso-8859-1?Q?dBaFfzH+oU4hC6SXsE4FrOP3uzY/nO2/qomK2F11Iky3Z6F3kVURC93Uof?=
 =?iso-8859-1?Q?LYvpUx5Soy1MGKyiqOiaS65jquqlM5hISuGkiZktdtjPeh+AojTnuc9QqJ?=
 =?iso-8859-1?Q?xIe2S7+R0xBAz9FtMWgcKPTCb9pkgRaxz/Y5eexzsM6/k32VFGFmO8t8bA?=
 =?iso-8859-1?Q?txAxw3P8/4L0Jcxu0TxvCOnnOVAKNskHJhAFGSoIgVYDJA1nu5ZOGMbvEh?=
 =?iso-8859-1?Q?GGd8xVZFMmcLbSN2n/2k6VZoq8KsLO74K/bOkL5imQm32E19+KxknkSr/3?=
 =?iso-8859-1?Q?m8t9j5O6dg+avLKaEMZi2PplnIsJ4EeySZxgOkVQ8gt/Ru5DqkbdhfzLPf?=
 =?iso-8859-1?Q?H5jdMub7VxJ+g6VIY2+AlUnwcsa/qmyKmHvY0RYsgx9+TDQNlr07q702x0?=
 =?iso-8859-1?Q?krI/8cIWyzhWGZsJuGHoFhyl4teXOPhUaJtguxnN4+AjCHQNUBTIWK7wnb?=
 =?iso-8859-1?Q?3YPGqCMfbk2zX7O2UI1mUCSUS5e54Ly8NO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aLfhj5ReIk6i3rV2kH/anY/AXkyK/4mSAvZJt0+6ph9biSpsBzzj81ILLv?=
 =?iso-8859-1?Q?fK+GrkbdiBHfImA/cVYyKOCvAEsO9YN/0a4e0RgOkLkyFDVjVMecx2omTD?=
 =?iso-8859-1?Q?0fH1PcMY1Qdv9CAAplLyHP/Dgo9GfQ2btuYuj7HszIa0u+FcnGSEo0SU2F?=
 =?iso-8859-1?Q?YsdlwRFFi0n4Cc6yS0RO+86mV8tZ45RHA4GVsB24UFtqDzGunr7oyqsi8V?=
 =?iso-8859-1?Q?0gnPBd41KAur1eccCXFc8X3hUgyfA7U8F232kz7l9UGqBxb+8LILnwLVhy?=
 =?iso-8859-1?Q?3d7iYqsBCava+oYu0ecSFF1YMHa6T9lfZVJ9xIxOmd8gEwPbejhr61c6YM?=
 =?iso-8859-1?Q?EsLBrzMxoBL2QEHrjrKwTF2xZl+CIDzkNUUtylWMdbv2PHgUpRPaHNSSaW?=
 =?iso-8859-1?Q?0JruMNQLmi2yKovxcpyQ/Bhwxwor48C9sEmMl5vmG/n5hQojvLT65bAoDD?=
 =?iso-8859-1?Q?0exJB+oRUU1k5kREPBbUYRVJmoIpIXwVMp/7a/VPbmn/r6oZZbZmpPTiA7?=
 =?iso-8859-1?Q?3kbdTSQ1W20RWnxQbozNPkSUGWFAI5y4fHOhywDdYJ8TgxN30e+iYkT7Bt?=
 =?iso-8859-1?Q?Im9AGS6sVUqIIGGd9U+VLaRPqTL1sZ+RVvrJ8EWTTiWsYPUkyuzPjjdb4L?=
 =?iso-8859-1?Q?KN+za+ylblaxI2Uhhnh1MAwhxoUJMR+/Gvo1Ck4soEhE/ADX92jxy6AQBi?=
 =?iso-8859-1?Q?kCkTd0OmDUq9G3zezrL4O8j1WfqrvIMIWefroy8cLXXzww5DwtUB/wzfON?=
 =?iso-8859-1?Q?BR4RUMRtvLeLcqp2b/5Rt1VjDMT2h6I5UPKB8j14nl7Wpg8MGdAwMCnWCZ?=
 =?iso-8859-1?Q?c/VZPvofoS/p+q3SEeXPooIDynFVZhwz2VcbpAHTto5HhKsXFFBnUTu3+1?=
 =?iso-8859-1?Q?EUtj3wuq5MZLIkPU7zlxI5Qz5UEKU6sEb6Yq5QIkE2G6AKMe983XSPQKXx?=
 =?iso-8859-1?Q?uaVkDndYwSHOSQaTn2IHd86H2my/cTLXKqTVU79xKq65M7CNq6AekJpVLU?=
 =?iso-8859-1?Q?UDZk2ZQ7oKAKNP3m6OZXAsB2rNxOJ8Z2dmdXseCOE0X5lgZMwaF2i42W/k?=
 =?iso-8859-1?Q?GbShFjv8PeL5XXtkRsOEPnIw/eKB/HJNwNamTA5/ZuH3gaIbfLv5x8rFt+?=
 =?iso-8859-1?Q?aILebKgQFA+8dGwT2iK0eai+CjOIlfdJXykSlVUb51gPS2hfUWuCZGIob9?=
 =?iso-8859-1?Q?sLDQKwRxJuARou8fuMwjUBwGq6Dj+iNyQcilD1UHj8AaHcCkju/PFi22sA?=
 =?iso-8859-1?Q?/kujfljSZjP4mcWnF3wB7uHpNyj3ncCvHrlZLyYkMVAAli84LEK8juK0Jx?=
 =?iso-8859-1?Q?5DZ/LhliK3jYVlb0H2I633ftIDlqwCMTpHzbPte9dRTaJDHYi+mhT0f0s7?=
 =?iso-8859-1?Q?8K4ep8GXvhUAZYcYhtgW4KmjgBK7s5sfraEP53V7JcD3MlQDcK70L5eH0C?=
 =?iso-8859-1?Q?LLn9FY1FtKPOpypaRPQq9skpMMZS4BaZTvORLxlVGCBiFh9cHlSe2ceR7f?=
 =?iso-8859-1?Q?LbKhLFJgFSjaCMWfLRW2oBB4LZCLtlwbjTjMbKbi6rdn/Ts2AOeXnH9L3U?=
 =?iso-8859-1?Q?pGbR6JGxEwMj+GFiZf4Q0HQ05R2wyFSkAsickR2Crt9FLEpxQv25hMvSOa?=
 =?iso-8859-1?Q?hAJ9FpPoXz1FZUAiNJjxFor4etwPoRse2WH0frmozjsODq2u22xRBsUqNI?=
 =?iso-8859-1?Q?S5wdjH0vWk9JgbH8d2GYLCwOB0x8ay8ODDyDCnOhMcUv8L6mWX0Gq1USaA?=
 =?iso-8859-1?Q?Y5xK9qJ9MdHIjoEX6mk5wPGiPIe5p52mlVAvTD/082rNP9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1bb196-c41e-475b-0978-08de5cfefa0d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 17:18:52.1569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FaP55tWKFvLYgFKJNhmBmISyUyiRT+SANSI3rr5caW22q11VhTzJbmrH85nwIvslnQDRlRO7JSw4cb38rjrG8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_091857_516479_EC8A0BF6 
X-CRM114-Status: GOOD (  27.71  )
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

On Mon, Jan 26, 2026 at 09:37:01AM +0100, David Nystr=F6m wrote:
> Allow userspace to request dynamic address assignment, which is
> useful for i3cdev devices with broken hot-join support.
> This will assign dynamic addresses to all devices on the I3C bus
> which are currently unassigned.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Signed-off-by: David Nystr=F6m <david.nystrom@est.tech>
> ---
> Changes in v4:
> - Improved commit message, once more. Comment: Frank Li
> - Added required documentation for sysfs addition. Comment: Frank Li
> - Link to v3: https://patch.msgid.link/20260123-i3c_rescan-v3-1-026429fa0=
c65@est.tech
>
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
>  Documentation/ABI/testing/sysfs-bus-i3c | 19 +++++++++++++++++++
>  drivers/i3c/master.c                    | 24 ++++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-i3c b/Documentation/ABI/=
testing/sysfs-bus-i3c
> index c1e048957a01..040824ac7401 100644
> --- a/Documentation/ABI/testing/sysfs-bus-i3c
> +++ b/Documentation/ABI/testing/sysfs-bus-i3c
> @@ -172,3 +172,22 @@ Description:
>  		the automatic retries. Exist only when I3C constroller supports
>  		this retry on nack feature.
>
> +What:		/sys/bus/i3c/devices/i3c-<bus-id>/entdaa
> +KernelVersion:  6.20
> +Contact:	linux-i3c@vger.kernel.org
> +Description:
> +		Write-only attribute that triggers a Dynamic Address Assignment
> +		(DAA) procedure which discovers new I3C devices on the bus.
> +		Writing any non-zero value to this attribute
> +		causes the master controller to broadcast an ENTDAA
> +		(Enter Dynamic Address Assignment) Common Command Code(CCC) on
> +		the bus.
> +
> +		This is useful for discovering I3C devices that were not present
> +		during initial bus initialization and are unable to issue
> +		Hot-Join. Only devices without a currently assigned dynamic address
> +		will respond to the ENTDAA broadcast and be assigned addresses.
> +
> +		Note that this mechanism is distinct from Hot-Join, since this is
> +		controller-initiated discovery, while Hot-Join is device-initiated
> +		method to provoke controller discovery procedure.
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
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
