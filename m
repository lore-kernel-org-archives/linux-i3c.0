Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209B3C54E65
	for <linux-i3c@archiver.kernel.org>; Thu, 22 May 2025 18:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=POte9xHJtBUHGAq8grDSPkHvfX3ahxrFnDVElkYo/Kc=; b=IncTjom17P1ESa
	bUlg8wi7eJy6MHN4fOq4a493MDmfcU604W9SU4RryjpnqZlrtTHjDlz/GBqcVXK7FKFtiDXy+IQHH
	YvdxrRZm4UnGZkBcsTV1CMCJOwmh1AwkwkFPG313zenW0bmeVUWcbpu5P0vg73/LOXmUIlWY13XnP
	mlgPYCfUejySRTy5v3CUc0bgTty0VC1as9QiT1R0739p6dj3qQsVXXAey+1x5J+MtwM6IeEtzdecA
	zH97cen7gL+24lkOq584HYCG+Jh4U/XWZ97KETa1SmhYpEqk5ao7VQ4f+1ympIHoTTx6qMa8jCztZ
	zR70BEGk5kpdVSjndxRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIAuK-00000001tdI-3epI;
	Thu, 22 May 2025 18:44:44 +0000
Received: from mail-db5eur02on20607.outbound.protection.outlook.com ([2a01:111:f403:2608::607] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIAoU-00000001srB-3qWs
	for linux-i3c@lists.infradead.org;
	Thu, 22 May 2025 18:38:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzWZBqCbPT8H5NOXAbKYpUEziGsT74tka/fDOagwdBqWbsWsaMoCWmQqHVTK04VblxBVRCmXiTqfo/3Az/BAHHANDCJ+1sX7YCXioi8YHaz9XQGaCVUG1CymVSrPsK2hW/NGD41umbnK1uTT6CZ2bUABF52l612O/gQnS30DyioLlwgpi5sv4xZ1AkNc65XiB6XGLKMoIV3p0lQPE4KYzCLv4X3Cas9E5YM8CVT+ZV+tIdv2SIdOJ6om+EJodY9jPvdAbfL4tdjQHsMq0uGId9CfMExodn3doSC55AX6oGuHEgq92FqBqlgud7epSU4kx/hlJTNgdehIkOFKY7Z1MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtLDw15xdQqhkdrXVAdnhueeu43Zhvq/1lLVu5wct+k=;
 b=HhG5dOaVks0i7gCRYU4pqSLiLbnDol21S3Rp/lkMsAumtBBNBAkLA+mOrZUteuPZ5nIz3ToP9IbLaNHAbjpjvTM9N1TdWQaUNEya0a2cGh+7BCK4AFShd2y9w8z78RahZnjKcn3RRDMrGlR5zptP2K0jAfaQ9RyGEHUCblAYPEfS+l+A9Nmpfef1YRflG3esoBfqfMumBCPaWp9mtOIdrugmo/yFxqpr2XPdZvtTJay1/4QCVRm24OY64igvtMh/gQxGZjToeFD+dGZ7zQF2TG1pV7d77I6m+vrjGmKI65nk27l9a6BHxF60OaR4LZJiui+TggeqAM06sw0ylD45PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtLDw15xdQqhkdrXVAdnhueeu43Zhvq/1lLVu5wct+k=;
 b=jeG+OgJVP6/WK0snxjaSLyvAxM/qj9sbagHnc16YsSbP9Vhss5Bv6axnVRDlh9Jl954wQ6qj+ARuRPHn1PBJvk6dWAKKrH8IOAtqTkiRPYH5ZPcXV6/sitluP+rhBHdtMghbXtYwhcCtBDA/gnnLXMaIJXcDKi3cxaJtYhcZPmp7XJlDX6M20tFu/0p9XQ0UWKXdQQHmZ5EVCMR51HO8O//p1hcJPa7VAX5FfWAwzWTzf9rPbc7XujN4w0KP3R3gaVyZb2nUuDEomFsLA/+Jxp90m+KtSkQ1A6WhDfMtqxdODKLgfIIyt3cXkSIWyvX6aurpdV2+tPzSng3kUQbIuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10380.eurprd04.prod.outlook.com (2603:10a6:150:1cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 18:38:38 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 18:38:38 +0000
Date: Thu, 22 May 2025 14:38:30 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Vikash Bansal <vikash.bansal@nxp.com>,
	Priyanka Jain <priyanka.jain@nxp.com>,
	Shashank Rebbapragada <shashank.rebbapragada@nxp.com>
Subject: Re: [EXT] Re: [PATCH v2 1/2] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Message-ID: <aC9vJiiOi1E7PesF@lizhi-Precision-Tower-5810>
References: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>
 <17145d2f-5d07-4939-8381-74e27cde303c@kernel.org>
 <GVXPR04MB9778335A5DFAB37CC8D011FC9997A@GVXPR04MB9778.eurprd04.prod.outlook.com>
 <18d6951a-860e-4479-837e-9edc90adeaea@kernel.org>
Content-Disposition: inline
In-Reply-To: <18d6951a-860e-4479-837e-9edc90adeaea@kernel.org>
X-ClientProxiedBy: SJ2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a03:505::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10380:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f07d21-4e2a-4c12-edc3-08dd995fde1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PGBiKZcC0CfNuOE+8MzP3FD49zP2CkyYHp8XTTZdFaayPDdAHL+Zq08/AWN0?=
 =?us-ascii?Q?STdFerFANZYETnUaXCYl3j03sVvLMkIrf+niZSifbVnsNQ9kM0/EvoTDmLv8?=
 =?us-ascii?Q?ayfU/Of+9wVEccRbqNhyrlCZYXBzSQ5PkJW+pRLfDYbwcA76aMphbPKtInL9?=
 =?us-ascii?Q?TDCIPEGTcHxOGqPHZE3Gbaw2OeaY2fkGcpNkyaB7Xb54tl0P0n9TqpZzgVVY?=
 =?us-ascii?Q?7X1DH6RvWmrP9I5RvPLfeThyTNj9/L2bodqgkGYeEATjEid2KOUGq0SClR6X?=
 =?us-ascii?Q?oFsLpDUFJTQh5ZXa0L8HEwh+IpSceRZkyse12SQs4si+4dV2R7y9iykvNUny?=
 =?us-ascii?Q?exsNXqZgNdYm/zkcOuPLw5aI3vd7FQAzCyvLeL25iWyfps5T2dNp6MaAJ9ep?=
 =?us-ascii?Q?S/0EmTkOM12nczKelQKe7G2HvTZlBdJrMPe2D2V7ueqRl9YKbRniZIbWV7v0?=
 =?us-ascii?Q?SX4VAjQke69l+uWnYIQ7V0RZ2+HhtBp/Xz14K0o0ad2wj2FIYob2jDTNHAHZ?=
 =?us-ascii?Q?R8BUjfBuwy/s/hSoB37FoRTRfU6nZ98C/eGYmkoLdBbaMiZbSDMnSl5+QVf9?=
 =?us-ascii?Q?MIqKhWm2WIfRcBZWy3nONeTNKRLYaYov51ZrpVLbtotHMpM7jg4MBz0SLcMU?=
 =?us-ascii?Q?oe+/Lv4SbZH79NX6YDQ0hy9PwqWPOgv7l2AEu9tttvYLIvlsRjqIENlmKuAw?=
 =?us-ascii?Q?RXk9ClupWYHeYg1UGbK5jUk+2Hc4e19mDrk/Y/N5jqVJxn7bN7xbvrJukeID?=
 =?us-ascii?Q?2MZ66x7Zf5vIxrxnLJHpHttt5TVrf2cf9Vrbg8YIWLt20trUBat3DBgs194n?=
 =?us-ascii?Q?qpAnQluy0urdTUyEGZXzuxoon/WMfR6ZV3+uGH5Y9DQU2Vmpx6vlSHDx1ZNX?=
 =?us-ascii?Q?MVe7wGtj+NgKwHqN8i3cWaeBHG8NNgW5CR9oNgG4uuA5ao26GkQm+fTBfs9p?=
 =?us-ascii?Q?tqG11yjoxBw+ZH02CoF6QnjSjKTFFhbgvycyf0VGFN9zHgbofV1hhGiQgqD8?=
 =?us-ascii?Q?M9T6Xj9GCS5StGSlsK8AQD0s0TmNeTqC8Jkwe/lFtlrGlvRp+iHOmLjMTx+e?=
 =?us-ascii?Q?umf0RUHfxRIe6xFnS6bu8LH7kWy0KlT/u3E2G5+Mjc1FJPFWcfX2Z9TES2Hw?=
 =?us-ascii?Q?JvaI1lRUSgUkpeiokHqTjd7YVBOgR6uQPo3Bknd2VZxM+atoZiJiLQT1Yw7J?=
 =?us-ascii?Q?BiRTvqaeMcBPz6Le+8f2uVYrDVv0OG89AXyahWdPvlhAxQ2+tkco4bY+mdL3?=
 =?us-ascii?Q?BGgrqw3/6zhpfRGEoWRyM1Ah4p2yZHOVNQV5uyZsH+uW9KjMMnKvxj3tJ96U?=
 =?us-ascii?Q?eT4qV+PKzCYGe8xErY73hy2Gv8ll7WgWDbE/jAxIzLUmpYbaHvj6ddMGQY0d?=
 =?us-ascii?Q?EKltLOYZnQG0CGrbP/R98Csqvxdk2mx0uJKbvUVXzcNqA9SyNCWoKRY9KbSO?=
 =?us-ascii?Q?XzS91bktbFHMgiIde17BBEOu1qJ0ASZ5k+16lN2s1dsS6lgIuaYbsg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gqZ8SYv5o1F33oC10JWGFA+3m+wa2v06VSs02I2x7K1g4RqVYTPLQlYobagP?=
 =?us-ascii?Q?B8IvdpjNXzBcxR/Cg/WxMNHP2y1udMjB1AovC1ePh+5suaDtZgciI5NTy1bz?=
 =?us-ascii?Q?iSt7FELH9Vfa26KAtfGSlfdpUhqega5GadES8QkqUvYGuOxwF61CgfGijjBx?=
 =?us-ascii?Q?tzBP2RiQlQD69WQa9sPt44xecykpbMJw7Vf+S9Bjs3OUBxO68HVWS4AYEhKq?=
 =?us-ascii?Q?YMEvd5qDMI4iC2L2XSGAQ6xHviyCO8yj52E3+IzMECAgiZPaL5pE2ncvkSml?=
 =?us-ascii?Q?PHZ+BmVjnxAziDF8cfpWSy4BItu2uvL+KgEc97Xe21olFHAwVGOKhI3hfApD?=
 =?us-ascii?Q?vuPKCQNf4c5eF0uMfmAsCG+kxmFuxymVgiXtMSNK5dXiD3N/GJaWpbey8o3U?=
 =?us-ascii?Q?hCTSQ1edA3l3zYSkhJtNiliZp50LpEoX2y1HYc7QGXBHBpu0gsYBtzfpVlEX?=
 =?us-ascii?Q?gHRh3fX0HHh5rUf7DmEoXLL3jAPWWg/S+AFLJdTAo6BpjmqUJBKUtJ9Zsy6G?=
 =?us-ascii?Q?MD+egQkHLNlJ9QmrPBhswsA/wdasi/aDXSV//3Uskp9OWvBrozLBNtlXt56X?=
 =?us-ascii?Q?dt4FIV36mgL0HuLuSCJMiS0luBUpRt6R4gnXJnmkJtYDgy4Jzn02jrTj2vK1?=
 =?us-ascii?Q?expGBybVYRolscwUfuzCYpHqDQpKkFgW5wZuCSMmO3uXPnjuMmcK3u8WWs3X?=
 =?us-ascii?Q?Ld/Gouh5OBwZJ6iKvQNJoKmdeFE6CbMaUb3WdxrihF6vKXd1lSuX5QLnnjVS?=
 =?us-ascii?Q?uNdAUxnigk2Wn25USb17etFbec8GsNURpRv0nogfjs2HZfcgHQvMlwSyH4dJ?=
 =?us-ascii?Q?MI7uqTGIlflDFd1m/Bk4QhICbdTf9aTWB48O/aiQTAD5bNvDRw4tdgHH6GAV?=
 =?us-ascii?Q?/n8hlvXNS+b1gF4CiXYbycc5pIK2t5Vp8rx9/5XjVIXWrhSdLsjlr4LEAlys?=
 =?us-ascii?Q?IokeIYd5y/IEj5EkQAYVHs4dYJrsyhir9MdzQzaJOtDtaja6ui4bIoXiX9YZ?=
 =?us-ascii?Q?GJ7eh2/vbK+NrnOxz5hIO+16OjFycT7aRWgbaXiu3D607HvqgxwX/7gA43kW?=
 =?us-ascii?Q?bqT1EEiLYQM9dXSeK2P8vU/Wf4tEVXTnSerOgEE6ygsc8476wqJ70y25OvDl?=
 =?us-ascii?Q?tqMtzVfpw6pI7Ad02arPuwX4oOHT+OnRkCBb55F/cl2he2INumEgQD3PfPE9?=
 =?us-ascii?Q?pNNr7IL+mJoPLf6vaDf4PvZ6l6iz/e5pNWSrTftgwbwHCCPHR+JycvlwcvCB?=
 =?us-ascii?Q?Qv2fpBgW4s+MYzpgpoQCzhP3jj96qxiQZq5pHSoyWCwnVkzdRhoPq44F4mqT?=
 =?us-ascii?Q?1vq466W9gygN3V2GI87OcLW/T/bnraFg3M68+qzcdMM9N46BoOROIFemylDE?=
 =?us-ascii?Q?KFCoh9QH7w5FD2lenTTOJZmTWF2zW6D001Rh9ZH3+InlGHy9tPF6DAL/uiXM?=
 =?us-ascii?Q?pWfFN/ao445VAopkPVf0ZpEGSCf8C+el+8+yGPp2Bw06o5qYqtXYq0ByVom2?=
 =?us-ascii?Q?8+z2WaqnryEKxzXggRTVDlInCSQ3EZ00O195DDwRQGXjzJvtejp3jXT7gTgI?=
 =?us-ascii?Q?Grq0E3ZxvENNwHwLFm7c5jZI741uXLGj1ID18Ts7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f07d21-4e2a-4c12-edc3-08dd995fde1a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 18:38:38.5560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/RGygZ4UtzBixqoR0qU0kfzLf1kVfSJXRIsaFawHW6GNee74HqT5TybKpGW+dkQudcgxjfpYmIvgdm77kAnow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_113842_963457_6C76C98D 
X-CRM114-Status: GOOD (  13.31  )
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

On Wed, May 14, 2025 at 12:18:46PM +0200, Krzysztof Kozlowski wrote:
> On 12/05/2025 13:45, Aman Kumar Pandey wrote:
> >>
> >
> > These are not vender specific properties. all these properties are as per i3c hub specification.
> >  What should I change for above properties ?
>
> BTW, if this was I3C spec, then I would also expect all of such
> spec-related-properties to be in shared schema.

At least I have not found it at mipi org. I supposed some vendors choose the
similar design like other's i2c sensor/gpio expander chips.

So I think we can keep this property here until it is prompted to standard.

Frank

>
> Best regards,
> Krzysztof

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
