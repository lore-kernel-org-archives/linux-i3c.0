Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A295D74EF8
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Jan 2026 16:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZs/bzbZLLrecE9KigJm4zRN8qeFXDSXEQrki1kQhHo=; b=dioBJPP6pxGb5W
	SrW8XfMd7pxhakgzxX4eFnyPYaHNjdSvyElpnJ09MDh3m2xVkWpHNSvttdHxRLUFKydddLhzdcKn+
	XMacuP2xjLaORJ/nKLTjIaWbIocFnavBo+rKW2phd3zr7kDHZK1u1f8l/+VnI+EHNCby3W9Vz/cKL
	knwSE5MSItuaJ2Zeaid6v3PeRp8ejDVlonebmJ7eyhlqiroJeHJGzj8xSjUDZv1opySAHmEghG1oG
	MZVQC/CzLWxxKxMCSH/1Lsa+sD/vWpzCchDZc2CYU0hi7ex9O1OT0vCgzuFPe9LLCmXT2HMWusi8j
	YBLMS6W5LOCZqSqNTgyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJiU-0000000997w-3Qej;
	Fri, 23 Jan 2026 16:08:58 +0000
Received: from mail-northeuropeazon11012042.outbound.protection.outlook.com ([52.101.66.42] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJiS-0000000997N-0ceu
	for linux-i3c@lists.infradead.org;
	Fri, 23 Jan 2026 16:08:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbnLUieBownxtOxqryrEnHhuL9HTvDeVQeaS8KtfPRkb1716yqEdAtLVJVR78sqvTAbGC4X5kdE+nM1CFXrY51zT3kOTLS1aUjlGmvMD8iH5takkKlOsY8f4lT9ZV2T0qMY/7gMwmot02gtMvc17b4jO/ShJKk/P+UFS2mEXuEOWn0iDJNJjiNucYMp7UkWjsBi30vVJ7KCDoXpzNmW1L41TMlxlrQ5j1XrMJihmCr0tesf1IEIB39c2PxUKZlW935D6aKKU2Ibk9+uSIv5q5AC62AulwAUyY02iLSLskkz/SVvuCpZI24ZzsyPB3EFjG2Ea89nMMXFffLF6dbffiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8/cNwfuEmM0k6vKxu/7oLobpK8/3Wlt3Ybcy/N5DQI=;
 b=SSltdy4ylpEPk1scgoetCBr+VgbfW/ujHCftshcRz6HucjYWhPCN0tPWeJdVf9CdPlZ8rzcwje2a4Kh5RK0uoau2ubJkj0VbDKcHj3Wz7XD08KOLVHSxxCzEypL6SDmQj7Ge9drGSfSpSVOr3b6LvG520MKHBC/krpcnKKgcX7zFJHIkhkfAoMLw+4kNfiSp6sS5HW4Dxi8ne1OERvHi64II8EmypmBoZe0Vgj8bOufQErlpqZxCfAxeUrMw05rasdzRQqTw8xrGLoH3u4SsLkIbUPBlsEikW5XNP1Ghou7eP8dFWACcA7KvGlwXC6gEmBmpdnP+C8DoXjAburtGfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8/cNwfuEmM0k6vKxu/7oLobpK8/3Wlt3Ybcy/N5DQI=;
 b=nOJ5aTiVMZwtw1Nem7vMIAejd21XQUx1gXBnDI/JoIqu4VIfq84t+NWmg8m4BJSVDSMMPZUFjzGqMmTj0KGQz/aPK6DjZ9pweXcs72FWeLUfb1kaUN/g2mwT9gFvG8w2YDtxfl+yhQmUSwGMpG8yPoy3JVxBORh/CXOr9wR2sz1bWtO2Mltrwn/gk0R1WDU+YDZgwLeuPs7gu4iXB1DAQC3RfxQpdblPU76hZvAWtA94EYKvcj4Z7eM33nScukF0sbn6bX3g69Ky1sI7IUVdBwR1oLInFLI+pRjBxZ9M2qSeZrQ/RRP55EyW9YfmxwI+QDf8MWkDDb0YE/WVsnbbGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5)
 by PA4PR04MB7792.eurprd04.prod.outlook.com (2603:10a6:102:c0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 16:08:52 +0000
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5]) by PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5%3]) with mapi id 15.20.9499.005; Fri, 23 Jan 2026
 16:08:52 +0000
Date: Fri, 23 Jan 2026 11:08:46 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i3c: dw-i3c-master: fix SIR reject bit mapping
 for dynamic addresses
Message-ID: <aXOdDgLT97N9MrJj@lizhi-Precision-Tower-5810>
References: <cover.1769151395.git.adrianhoyin.ng@altera.com>
 <657b5e305abac836fb4884ea530e6526d3008942.1769151395.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <657b5e305abac836fb4884ea530e6526d3008942.1769151395.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: SN6PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:805:de::31) To PAXPR04MB8957.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8957:EE_|PA4PR04MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: 422f814e-b9ce-4153-c9fe-08de5a99b370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f/6jNC9c+Imk+EOplANuxwhkFpMCNzyfdCVltV/aBsjgSJzjM/5JH/ioDGzF?=
 =?us-ascii?Q?uAChdFwbNPw8PhkGaEmGzYwX9fYBLjkZSXs0khmvFU7jgTpl2J3MJROtsi4X?=
 =?us-ascii?Q?b/F2vmaN/msuSK4GVoGnHLQ54a7u0HYG57hqRymFL2KMreIPOA2fMw+vdpPA?=
 =?us-ascii?Q?j8iB0iMlNrHlo109Woie8rs6DS7GI7m4jmK0zhNGYJ5gtZ7hfTiW2w6PFqZP?=
 =?us-ascii?Q?4o9hT0JaqJlWOr/5RMhtBIQT+o24UIfxnuwSHxO2IksxGhnpxjSy4R0pjB9m?=
 =?us-ascii?Q?mry3RlVO0yioyC4RHoP68CJtxhpmvSo5TTypZbSnikw7TTFCBK1yd63fZowf?=
 =?us-ascii?Q?vxM3hlitX/P3hxA8C6vn5sSOiPtmYG3xRyoMQQfE22HgPeeDz/x5HvmMOP0V?=
 =?us-ascii?Q?002KRP/FY4/ZXnCgSPZOXDo9Q40Wlb4bXCuE2OjsRFFytBdSMZNDyE/vf8Em?=
 =?us-ascii?Q?5aGjKZ4YmlEp/Np5mM7BRzFRn1/dpFSD1S0OukTy/7HgEh703xq+7g3PyV81?=
 =?us-ascii?Q?XTbwCGGVhlnMWrXceLSeRkEXvK3jp1tdeRFb2B0sNA46Q4dKGlAWlgt3YWV6?=
 =?us-ascii?Q?pS3fNlp2fXUnwenmrv6+vUf/EVXQCZknguSXdYkKb2E8v53XgIKXFviaRfPw?=
 =?us-ascii?Q?aGRmTISMv1WzL9I1wCAPeYVpSsVAEaNlCn0mxPNPdu5nPehAAnqbKm5RAyQT?=
 =?us-ascii?Q?NR89O8bkIV1vxSs4w9DUDQDC/tQ/IfL8vd8C7omBiSy7rMXN1a+JwSl6fhO/?=
 =?us-ascii?Q?C6jeQsoefB197Fr/Jy0S/R9FbBx+5N8rWvmqQZeTNl/nXDjrw2KjcNPl7sLo?=
 =?us-ascii?Q?xYXLRqrcgVV+5p0Y8shTZKwF3U0+g34Q9NNyjTK4Q1QXgXemLzp2dtmNe4bx?=
 =?us-ascii?Q?07XP+4Hfk8GRY7Yc9K4TA+QDwh/Rf1bhAmn0vRQEe9bmdSx1gUeyAxUcHDNY?=
 =?us-ascii?Q?ZmgHAA12qnYRBlCxNmuhJDlnNZKCfBHha2erMDgXvSr90N3Ba6oTSKxI2Ax/?=
 =?us-ascii?Q?LvVRgrsl5hcFp4DeC0DGrObIZ4yfMVn1bvzbUvwHmOotRw+G6LwKM53KidSD?=
 =?us-ascii?Q?X6Q63pQgUt8ZNft3D1C0qYqW+wfr5EadA+cuJeL/nOb8R42DtfZ+8WPe7Pen?=
 =?us-ascii?Q?xEKpPvYgIXHrKTJ3jyKu2w9YaV/TVQQiUdkFbhrVlOZxVRSuVCS1/Fcnrrvo?=
 =?us-ascii?Q?qsZtwxxQcZjm4iMnaKIKyh+mtcYAya+hlxcJDCdJ0KzsrjKT+/vCJQiG6t5A?=
 =?us-ascii?Q?T+diWsk6YIH6mD5SOPi00cD0eBCA7LAqr5eVnNu5DAD6iuHtR/3b87e678+3?=
 =?us-ascii?Q?Ufqiq/hvfJX4ZdW7x0pytv603zTHJu80YC+bI2Y0XAvzN6EWSrwfzMVQLVmA?=
 =?us-ascii?Q?2gBWgQluMu9vc5CH2eMQarkIQ36P5Qe7V3pvmTD6OqwEwejmcUA3NKIHsik8?=
 =?us-ascii?Q?tYv8SA+8tvDQiccV4HYSTFa7XzHx2gCuNOjNaQ4gpL3oh4M3pvkdGQzGEzyY?=
 =?us-ascii?Q?23kPWqhppqNQT+2WDd+NrOc7pfOITZJbl7HTMHohAsH7vDCZSimFZPYvq86I?=
 =?us-ascii?Q?Z40WZ5mqNViSIYF1vZGiRNKUJ1Z3qQOyAVu5G9/TjksckL53RPU41AQITwkn?=
 =?us-ascii?Q?zMb+HEyGGRXclmh1lmR+4CY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8957.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k8LVoAqgxgWE5Rmrfimbkgn9dg8rX+97xvA26fTUcLU7Uht41f8JiMKrza0n?=
 =?us-ascii?Q?Q5TIaz5kDW5FoY1okivugn1T8PVYFAWZP0LnoVH+3oSAnm3+/ngd5QmYc7GD?=
 =?us-ascii?Q?qjy6mK9ATF4QCTjL3Qbr6L6ElI4Rbod6K5nAZHaplw/COgIIQH2HYIY+qBIv?=
 =?us-ascii?Q?4kCOQcmQV6+L8zjsQpupjMCYqlD5WY4zznw6dkw5g0lzy2OD9ZtkoBw6VRjN?=
 =?us-ascii?Q?LC+bbtNecEM82mNEXUPzF3WmZV8yGDAjKA+8X/rfwOKRvLEv/JNi7GUKp8kq?=
 =?us-ascii?Q?TcMlBqDJryTkcfagvY/UX5dJuEHu4dKJ6HYyQszDixFdUYB4ENohqG33j3Qe?=
 =?us-ascii?Q?XKH+sFzIXiAnM671o1KLPxpoGW/pdz551OJmJQR+PovDRfnq1IbdostAGKDD?=
 =?us-ascii?Q?hNWmpf4S1N0fvJFWYngGzPvHfmW3l+JDZFVUnve0afUm589vmbTFPKH9aZun?=
 =?us-ascii?Q?wlhuHK2xyOFuMUcY0fMCvyeUDtlKK7mY3I82JUcktxRTUJ00FLdnWnLA5R0t?=
 =?us-ascii?Q?oxPCdG8XFSarzJiv+2slJOrUt3DwkWNYb+q/1NxMepgVbY4RfnBCbNiy5UuY?=
 =?us-ascii?Q?AjHw57p/99z6R6BLc8jGxndmZpdusiUPIniTiXddaPuLZulRWXIRJhvJoUlw?=
 =?us-ascii?Q?RQoZErjqsG1kD7WPVJYFwDGZyc1GyCdrGZE/qQPKuNTZk074XCDlz7LwvQZW?=
 =?us-ascii?Q?TdLpU3e/1EK8ZxWfZ1SHibisDdizKXRaUCRsb/pWpER0PWkprNnvAnWmrWA7?=
 =?us-ascii?Q?s6pJr4fssvtJt4v7TCthNyV7ACedhNh80jtqW1/Rt0KsIHuGWRG99cJGmVlv?=
 =?us-ascii?Q?8AJyZpe/QaMf8/SFzDpMk10I8tSL41CrydCtiOGzyzCqx+L3HexWM2U8tzyM?=
 =?us-ascii?Q?UDNSfzqETeyV/vmgucZD6i3qNGH/MMGcfNr1BdkGvmzOvAB1VWGmcmj3uZby?=
 =?us-ascii?Q?6hpg5YjmCTC7+PNg8cLgJSyxA4LwIjUaO7uwy2ds+A8iLprvIVf58np9x0Z8?=
 =?us-ascii?Q?9Ph/YWUmBLOtNlcms+OszBilL6+WOt929pfZac0D2ShpuJmzK/niKDzoFEAV?=
 =?us-ascii?Q?pmtEFPnIG3dvJBkc2cGj8TB0b0BjYhq96kYPVWjorD9MSSFrSrBKy8y+mDkl?=
 =?us-ascii?Q?x6XAZSTKGcKNxNws14Q42iYwLmZt0xXV0F0Zb3qZjrxrhCNDCyYYzWQhD/yI?=
 =?us-ascii?Q?22GMkMlr6JihuavuMBYTsjtS+PEMNuR9t6qw6ibodC5OWC6XqLSDLCLKhjDC?=
 =?us-ascii?Q?3wFL9iGVhNjSqTKIFG//nqrC+Tp5BA6uPX/m3enmsyRcZXDCG/shz6CBPz46?=
 =?us-ascii?Q?fIieumVjWVbBxKXVL6O5QJ3Qi/9X1ahVWQisa6DJXdy7jbxh9qeuDNEbCKtw?=
 =?us-ascii?Q?oyBHNq2WnFoTivr0OC1e0RvGq7QwtMo+I7u4LEAYVWw+ey347XEJnxhjtWdH?=
 =?us-ascii?Q?5WD6NP5IKK1eJ7xqtmkLOqSig1CtCBRKkkPU0hyjX+6VENjOJWTsqUGhTg2y?=
 =?us-ascii?Q?yXVpWPGZzitJxiXKSi3Zo3zFw3dlUXifipXvrp8DxjvuQMoT4cta3j7Itul0?=
 =?us-ascii?Q?EOq0AIqOcqveZdwpL4SB2o4+yT8JBS3SqxQiCSWp6joMU/5Si+OLlDdI+u4E?=
 =?us-ascii?Q?lUF/4SLr5Y3MgNX8OcOWYtvCup42YEWYAgQB4DeX73FMJKx/sOegdlhhxdvt?=
 =?us-ascii?Q?633VRP/lC2gFuoMjSvXz5JqDXXLaJuPwh2/CeNZAqqpRJv8YrZjGXMXEZY4/?=
 =?us-ascii?Q?6ZX3JtM1SA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 422f814e-b9ce-4153-c9fe-08de5a99b370
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8957.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 16:08:52.1222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: poeehoTcC1mHZLzXPsAIOPfHa9HpYGO8lhWJhstknRMycSQAdRwxXqepLRoLM4wZQjcPDClXed26/RP/735WSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_080856_188096_0C071BD9 
X-CRM114-Status: GOOD (  22.93  )
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

On Fri, Jan 23, 2026 at 03:35:12PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> The IBI_SIR_REQ_REJECT register is a 32-bit bitmap indexed by the
> dynamic address of each I3C slave. The DesignWare controller derives
> the bit index by folding the 7-bit dynamic address into a 5-bit value,
> using the sum of the lower 5 bits and the upper 2 bits, modulo 32.
>
> The current implementation incorrectly uses the device table index
> when updating the SIR reject mask, which can result in rejecting or
> accepting IBIs for the wrong device.
>
> Compute the SIR reject bit index directly from the dynamic address,
> as defined by the controller specification, and use it consistently
> when updating the reject mask.
>
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 15101f41b9e6..ffb1edd32097 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -205,6 +205,11 @@
>  #define EXTENDED_CAPABILITY		0xe8
>  #define SLAVE_CONFIG			0xec
>
> +#define DYN_ADDR_LO_BITS		5
> +#define DYN_ADDR_LO_MASK GENMASK(4, 0)
> +#define DYN_ADDR_HI_MASK GENMASK(6, 5)
> +#define IBI_SIR_BIT_MOD 32       /* 32-bit vector */
> +
>  #define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
>  #define DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK   GENMASK(30, 29)
>  #define DEV_ADDR_TABLE_DYNAMIC_MASK		GENMASK(23, 16)
> @@ -217,6 +222,7 @@
>  #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
>  #define DEV_ADDR_TABLE_STATIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_STATIC_MASK, x)
>  #define DEV_ADDR_TABLE_LOC(start, idx)	((start) + ((idx) << 2))
> +#define DEV_ADDR_TABLE_GET_DYNAMIC_ADDR(x) FIELD_GET(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
>
>  #define I3C_BUS_SDR1_SCL_RATE		8000000
>  #define I3C_BUS_SDR2_SCL_RATE		6000000
> @@ -264,6 +270,14 @@ struct dw_i3c_drvdata {
>  	u32 flags;
>  };
>
> +static inline u32 get_ibi_sir_bit_index(u8 addr)
> +{
> +	u32 lo = addr & DYN_ADDR_LO_MASK;
> +	u32 hi = (addr & DYN_ADDR_HI_MASK) >> DYN_ADDR_LO_BITS;

Use GET_FIELD(), so needn't define DYN_ADDR_LO_BITS.

Frank
> +
> +	return (lo + hi) % IBI_SIR_BIT_MOD;
> +}
> +
>  static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
>  					   const struct i3c_ccc_cmd *cmd)
>  {
> @@ -1235,11 +1249,19 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
>  {
>  	u32 dat_entry, reg;
>  	bool global;
> +	u8 dynamic_addr;
>
>  	dat_entry = DEV_ADDR_TABLE_LOC(master->datstartaddr, idx);
>
>  	guard(spinlock_irqsave)(&master->devs_lock);
>  	reg = readl(master->regs + dat_entry);
> +	dynamic_addr = DEV_ADDR_TABLE_GET_DYNAMIC_ADDR(reg);
> +
> +	if (!dynamic_addr)
> +		dev_warn(master->dev,
> +			 "<%s> unassigned slave device, dynamic addr:%x\n",
> +			 __func__, dynamic_addr);
> +
>  	if (enable) {
>  		reg &= ~DEV_ADDR_TABLE_SIR_REJECT;
>  		if (dev->info.bcr & I3C_BCR_IBI_PAYLOAD)
> @@ -1252,11 +1274,11 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
>
>  	if (enable) {
>  		global = (master->sir_rej_mask == IBI_REQ_REJECT_ALL);
> -		master->sir_rej_mask &= ~BIT(idx);
> +		master->sir_rej_mask &= ~BIT(get_ibi_sir_bit_index(dynamic_addr));
>  	} else {
>  		bool hj_rejected = !!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_HOT_JOIN_NACK);
>
> -		master->sir_rej_mask |= BIT(idx);
> +		master->sir_rej_mask |= BIT(get_ibi_sir_bit_index(dynamic_addr));
>  		global = (master->sir_rej_mask == IBI_REQ_REJECT_ALL) && hj_rejected;
>  	}
>  	writel(master->sir_rej_mask, master->regs + IBI_SIR_REQ_REJECT);
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
