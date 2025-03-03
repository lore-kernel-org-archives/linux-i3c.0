Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B78C282CD
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Mar 2025 19:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wbhvRu+OGzyZMA5hkyPU1T4Z7RYp6PIcWKIurTXfRBM=; b=oMGhtFK7V/HXFP
	ilIMujR+2mkQeldvNJCJKox5gzJscDOQLOt1PUGjoisou4uzMbtMckvVr9HVmuaa1xj8/BOzxu1Ti
	raf9PPhVPr09NgfVRzCMuelD5ONFbp7JdPDKNvxOZ+AAsp2X4TIiQmfRuurs/7Vw9qTUy58vvdotE
	ufVYgMlLSA+PEszVDD9PrEPupr/TjEFlJCIbiG4QR2db8bpq6uPtzoVsdmc6FpXmCBmrvxtfpixAb
	um5lS0VjfD6qGeyaQvp06xBMyaQzhc8uxOIAD5jUpQqAabkBR9/amulYI78M5wkBIpsfP2Sbf4mOK
	X76jfr48a8WCDyT3dQ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpBmO-000000026FU-2oWW;
	Mon, 03 Mar 2025 19:48:44 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpBmN-000000026Es-0Pqo
	for linux-i3c@lists.infradead.org;
	Mon, 03 Mar 2025 19:48:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJBUuyC6C90c+nSkerkLu7xcO8amrtMFpXeHHbIPGQUtmsdLEAahqMXtJXHteXlc9TnETM9uIXkJK2/+0+Yoi5V74mlQQn4jFO766gkf+B/4EGXc1vmqO9Y0G53e/JLRGEYaw9uT5Px3J1/PTezVe0A8hp4fCllcFMtbj89h1e6UU6qahZhjrYO58rMIY2XXFRDMyrAwRUAID5iJpmygPIwhE8KhPPPpiPSAZSOjptO3wy/m/tZMNYD/jzxpP7g21TqC9G0OWdR7kWVZdMMUUP49iaBePmP/z0kviod3bSkciQ9F1/RlYN/DHjWmL0Eql7lt/2CJSPsVjFnDXeQ2GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMshsvI6KNm1f0VYckxtd1DCH2svXUxM3e2150fqTAY=;
 b=CK8BsjwTXeufufwbJjU+7gj5b2nnnWn9W3QiwyiK0o9hqkBC7o+FzY74yB5Yev5oJKniGXRQ+ASBoogz0FzR6BJUNWQGWSBILFNx5mAdLb5XCVJ6yYlZwBnB+9krynnP8UUVSJMy8/WwMNvR7opJy75rEZnUroIaSmRHELH+3CEnjdiXk1HBI+VpMX5jIps3U96SBUbt9b9nEQBvFQzSAGxoK9+KVH5HyiGPls0g8+8G41Ka4vY8BNj9OHRewUBB4S7+l7NRkhQ+sDRp6sOpenceCixw0mMDKLKb1z2Qm7u/haKEqRGfprHsEip9UUfHUZ26da3qGjKOCLxKkh8A4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMshsvI6KNm1f0VYckxtd1DCH2svXUxM3e2150fqTAY=;
 b=JLY1mh7FnOhJu+1zTKRGeh5ba9cTgelNEjXVd4Ocvt2kJgx0u1VWbpGnEPMPz/iSk4YIG5tTNBuRNG1yqk76A+ZT5r/V1ktTpRSC9KC2oAPz4lJ7H+97tFdd7OLcQYdyprTiXiD0yvU+ff1bm8zR8mzXT1Xg/YQ9GyX9RlbkSbYqbMA/R9/V/BRz1tjErBtTnu5Qy1oKJN0IlheZ2nu3dH+bQ5IbH5/Mg3EUTDiAWcpXV/UdHVBqiWZyqlegWp/Jhx/rH3wR/EyPuE5w/Tle/wkdwUYO2BAD8sMYjngxPNS/XqJFNGjyilqNtTLJYipghqUOlapmzMKg5KvB+c3FJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8021.eurprd04.prod.outlook.com (2603:10a6:20b:2a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 19:48:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8489.019; Mon, 3 Mar 2025
 19:48:36 +0000
Date: Mon, 3 Mar 2025 14:48:28 -0500
From: Frank Li <Frank.li@nxp.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v5 3/5] i3c: master: svc: Fix npcm845 FIFO empty issue
Message-ID: <Z8YHjNx+VBy/Ic07@lizhi-Precision-Tower-5810>
References: <20250227060131.2206860-1-yschu@nuvoton.com>
 <20250227060131.2206860-4-yschu@nuvoton.com>
 <Z8CfhvcoQSKsk3Ev@lizhi-Precision-Tower-5810>
Content-Disposition: inline
In-Reply-To: <Z8CfhvcoQSKsk3Ev@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: PH7PR17CA0032.namprd17.prod.outlook.com
 (2603:10b6:510:323::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: f25cf087-c385-49b0-bff3-08dd5a8c62e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1RbnvCfaKv6zsFb/uHJLAgeglWXH8V3s9wZsUDY/1wMthvAAUk2Zr6odtRZc?=
 =?us-ascii?Q?KANxbtvjgOh/5pW7f2BNDPHbrhRUD+CFdUgST+mqrDWxugjNyWCwSzBDQM83?=
 =?us-ascii?Q?1/fdz7OzhZuW0A5vSFDztCJHSSCpOyyH1oKY65qEEc+MZmkh2uOAO3w6tXqq?=
 =?us-ascii?Q?yFBcD3jpz/g+IW9QoWuC5WhQFtKVGmM7fn2SqIFzeYT9oRL281CLydtl7P/h?=
 =?us-ascii?Q?Wwu7GqSwCJFl+c58x+UOlCtXbGF0MMIZ8Cjt22mYo8s8LwvoAnEdSYwvJsTx?=
 =?us-ascii?Q?dfYkqlwcLH1zeEzU+vCLdx6ypJfEantSdlcErgmK1phvNOI6CNoIAvGI97FT?=
 =?us-ascii?Q?B2yW0sFXBLMzIjVDzrI952DAVDTEWvxogxxLPFLpUoIASuazzepGaxemfmF7?=
 =?us-ascii?Q?wcbLNoiiNZWUz2xwNcn7jLqjr5yE5zOZocShXkh2d7pubLNHF+7/7VZ2Q05A?=
 =?us-ascii?Q?QmTfyFKnrEKh1AtCjVW2coHwR0EZux5a5HBLZ0rqiFsXpwDMeT6Dv4lYo2sM?=
 =?us-ascii?Q?DJu8ABz+PbKqTw0QL36eZLOkS2pYus/3cMGhlXNKqByLjEGv/KQOw7nA25wg?=
 =?us-ascii?Q?uN6R9NFUwS2oIuKWd3WGFFqKKawIPXxAqziLn2NBPE2gmjVK9BmxOJBM1Mow?=
 =?us-ascii?Q?J+ev7ejAVft168DB+QQbxbwsRE/bmLG/3dkgpO8xlr427rPuwb3ExJTC47cs?=
 =?us-ascii?Q?SaPSnwIvjhLCWmljopADKd96OVI5JWamJsFeRxeNDdST0Y7i/C0oL2Ctrc6+?=
 =?us-ascii?Q?80Swy3sjsw6DfHTufeZAX4AhL/F9de+Lr/IegqxrW/ZTPzGSCPINsGVPmy1t?=
 =?us-ascii?Q?xY0YsIXnzaGLZrtWsrrLmFQB2cOepltAQ2ldQ4nbNfjve5l5Pe+6AKyj16//?=
 =?us-ascii?Q?vICB5kUkjv9kS5NGeB0ngq/AalEcWX4d2zocDsq34hdyi/p/SF0yNwXJQS2c?=
 =?us-ascii?Q?z3Gi7sLHeXGZgukT+/IY3YTWdBzas5RKmtpHh/e+++PbzJT7LfyzKV/Vf8Sl?=
 =?us-ascii?Q?H9FEyI139ppz+VOSZalPpWCSc8JASJw9b/amyvGuhT+xsm8UFj93XDvM4oUO?=
 =?us-ascii?Q?wvHTt8vte9SQsalCdiXkQka2fkoL/PaXYnFx14iTx/PRqE627JJC8cjVlOdw?=
 =?us-ascii?Q?mHSNl4aVnVsnEsJnCRTs0ydwJZ93t7LjT5pyvClBN8U+qoCQ20gQSje39qlY?=
 =?us-ascii?Q?cYM8AZhTYkx4Xvi3v0pjWOZ+Xz81rOqDG3AHM7tYqUcgoIh8HdDDaP2x4EhD?=
 =?us-ascii?Q?RzY4M32AUtGIZ9s6yBAM3MtU08qtFRgJvJLk8h27vTbvSRCq4g6aS/f3EvRx?=
 =?us-ascii?Q?+72dOhWBP/E5JbHcK98lMbUOq1NQ8mOj7mOHklVdc9xoouRCG6hzMUXwY54x?=
 =?us-ascii?Q?S6p01BY2LJIKBSoMLhqdR6K8WdT7p9fPV4P4jFrxUvGiCGwt0ZgMLy5UEp01?=
 =?us-ascii?Q?GJ3Aogjv3NjybbRPjhvNAGZKN3+lHnvW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BB1F1Lms7in438yBIw/n3oMtX+3fJ3/cfPmybx5wnj8WEw64/BD2blx9rbAc?=
 =?us-ascii?Q?ZjqaYNEN7jtKSsLuShHZDx8zLoQW0KJ6JFnFyWXTbMi5hPBODsqs4PV6sza5?=
 =?us-ascii?Q?iioXTXIgdpKJiNjgTRKP7FRAxggrdUC4fb8sycW6CJVKJZmrWA3uYx6QcKND?=
 =?us-ascii?Q?+sH2uQrITlL81v7+WczD0w2egHRWm/vl6CCWbRxUhiVDR78PLUTlcF9eirMH?=
 =?us-ascii?Q?3S9VYhBwLBLUEQWCe6wKipIDnu0XsRCgnc5lWwt11NY/vkBATmkHK6CZ7VrX?=
 =?us-ascii?Q?WqrjM8jhHYsRp372i0O61xxL1YF9rkn1gV7hbu2Zn88dDNUvy5gFXzezLSrJ?=
 =?us-ascii?Q?jfhld/j/yoLVmMurlAe/yJw5kXDMJ0LpKyui/Kp7PjseNFbNf6XMdp9DHqQR?=
 =?us-ascii?Q?fyYLWePr5mLePB1cwGG+lLmN7GFm/K9q+B75h4pOmnzCKyd0/u8WyXaYqFss?=
 =?us-ascii?Q?zSoXzgsrL4uiL69QLQDl+wtyncJzC54uWpr1GVO2GlfUVpe8C3+oacEfXFG3?=
 =?us-ascii?Q?MnxsRZ2/tTlaxl7fq0iUQXi1lqBklhcaA1Mj2RXb1VOMQRRz7Wt6CaPicAJs?=
 =?us-ascii?Q?Dz+qYWq0GPsH6bGcpnSwu5a7xiv12T/bb1gp/kpS7nW2oDLmc9li0pwwM8Lf?=
 =?us-ascii?Q?5e0ngQ1e1Zkxm0j2w3S30SBxPrekOG+z/GDPQB2xhEnlLtpCGlz44NOoEbS7?=
 =?us-ascii?Q?11Lg0dCfdHmIO/NVLQJYTwfxskUxwydDcF4vufpB4DAMjb+6zRu+RzflF4FW?=
 =?us-ascii?Q?Rp5pEbq+vffvSe0VV0rL+5eJyqOVxTG1mQZvUvJW2hoYa9OSYRT5Z7UHS+IA?=
 =?us-ascii?Q?t1aoROqLHYm7mz28OPxNMIycy6k8Wsu6IKrdAVIDWzi4JmTo/7AHUXjbLbOC?=
 =?us-ascii?Q?eK1J6kjJbHgSronn4o97sXAvxABPvwOTep+TDfQSsxvyL/jdVCAS1N3j/NNq?=
 =?us-ascii?Q?0glHGN26weVC5Qx70FxgQnH5U0bR2HGWBD9I/ZciVUnH39gaI3Y2/z6SULEq?=
 =?us-ascii?Q?HW3bmyrpmo9QusgplQw332FGQC8scH/bQh6c3u0Cprj9NPziEJDCqdBSbCCJ?=
 =?us-ascii?Q?eGX4mk+uu/nglnz+nTC+XuDsdciFRKtddHnZ31m4xSsswtey+IZZtqtsC1Qx?=
 =?us-ascii?Q?wGmM1GsgDQDjCSMshsUO4vSW+08VRh1bOo0/w3lJOM1pi4GbCI4isAqm1CGK?=
 =?us-ascii?Q?RpBnK1bitEO5/Evddb3lEcn1iJ3L7rbRoa/dsPRYdmSzLbQK4ChOmg7nLk7t?=
 =?us-ascii?Q?7HAfhHQwE2V4AvCKCEhs2BdBnWITiINCsU+qYkYLeClxiuNX+BLWt82DZQUi?=
 =?us-ascii?Q?5q28Y5vaNwWjFs4KU0FsDES580dQpSzto8jK741wpZtnmA9pVriaimUDOs4h?=
 =?us-ascii?Q?denO6TNSfTtcEijpFGJT0bo13THkwU67dOwdKuhSAdfXconWX8+9V6uVSIzj?=
 =?us-ascii?Q?g/JJ007YHLZZxvm3afRuWm0YAa3uKrgVirrm8gwoq7RQCht2KOwOF2G51afV?=
 =?us-ascii?Q?2qSggQcj1SETBM54k9OwanZEtKVcfI5GyV0fp3ih+zhCkDPctNA0TfUywrF7?=
 =?us-ascii?Q?04sBErkc26t0zHe8cKXx9E9Xu051shK3R7hmUXQQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f25cf087-c385-49b0-bff3-08dd5a8c62e4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 19:48:35.9511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zUxLly8OZpqW511GxUDWpG3Xgx+FvqJ2n1U/hftvYJkRwCydzVgXl+dZCp+ISxr1uqdLmpfvdxhWOBHnSI+arA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_114843_170909_6728FA73 
X-CRM114-Status: GOOD (  32.64  )
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

On Thu, Feb 27, 2025 at 12:23:18PM -0500, Frank Li wrote:
> On Thu, Feb 27, 2025 at 02:01:29PM +0800, Stanley Chu wrote:
> > From: Stanley Chu <yschu@nuvoton.com>
> >
> > I3C HW stalls the write transfer if the transmit FIFO becomes empty,
> > when new data is written to FIFO, I3C HW resumes the transfer but the
> > first transmitted data bit may have the wrong value.
> > Fill the FIFO in advance to prevent FIFO from becoming empty.
> >
> > Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> > ---
> >  drivers/i3c/master/svc-i3c-master.c | 52 ++++++++++++++++++++++++-----
> >  1 file changed, 43 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> > index 9143a079de53..a0c6d8053a25 100644
> > --- a/drivers/i3c/master/svc-i3c-master.c
> > +++ b/drivers/i3c/master/svc-i3c-master.c
> > @@ -114,6 +114,7 @@
> >  #define SVC_I3C_MWDATAHE     0x0BC
> >  #define SVC_I3C_MRDATAB      0x0C0
> >  #define SVC_I3C_MRDATAH      0x0C8
> > +#define SVC_I3C_MWDATAB1     0x0CC
> >  #define SVC_I3C_MWMSG_SDR    0x0D0
> >  #define SVC_I3C_MRMSG_SDR    0x0D4
> >  #define SVC_I3C_MWMSG_DDR    0x0D8
> > @@ -940,7 +941,7 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
> >  					u8 *addrs, unsigned int *count)
> >  {
> >  	u64 prov_id[SVC_I3C_MAX_DEVS] = {}, nacking_prov_id = 0;
> > -	unsigned int dev_nb = 0, last_addr = 0;
> > +	unsigned int dev_nb = 0, last_addr = 0, dyn_addr;
> >  	u32 reg;
> >  	int ret, i;
> >
> > @@ -983,6 +984,25 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
> >  		if (SVC_I3C_MSTATUS_RXPEND(reg)) {
> >  			u8 data[6];
> >
> > +			/*
> > +			 * One slave sends its ID to request for address assignment,
> > +			 * prefilling the dynamic address can reduce SCL clock stalls
> > +			 * and also fix the SVC_I3C_QUIRK_FIFO_EMPTY quirk.
> > +			 *
> > +			 * Ideally, prefilling before the processDAA command is better.
> > +			 * However, it requires an additional check to write the dyn_addr
> > +			 * at the right time because the driver needs to write the processDAA
> > +			 * command twice for one assignment.
> > +			 * Prefilling here is safe and efficient because the FIFO starts
> > +			 * filling within a few hundred nanoseconds, which is significantly
> > +			 * faster compared to the 64 SCL clock cycles.
> > +			 */
> > +			dyn_addr = i3c_master_get_free_addr(&master->base, last_addr + 1);
> > +			if (dyn_addr < 0)
> > +				return -ENOSPC;
> > +
> > +			writel(dyn_addr, master->regs + SVC_I3C_MWDATAB);
> > +
> >  			/*
> >  			 * We only care about the 48-bit provisioned ID yet to
> >  			 * be sure a device does not nack an address twice.
> > @@ -1061,21 +1081,16 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
> >  		if (ret)
> >  			break;
> >
> > -		/* Give the slave device a suitable dynamic address */
> > -		ret = i3c_master_get_free_addr(&master->base, last_addr + 1);
> > -		if (ret < 0)
> > -			break;
> > -
> > -		addrs[dev_nb] = ret;
> > +		addrs[dev_nb] = dyn_addr;
> >  		dev_dbg(master->dev, "DAA: device %d assigned to 0x%02x\n",
> >  			dev_nb, addrs[dev_nb]);
> > -
> > -		writel(addrs[dev_nb], master->regs + SVC_I3C_MWDATAB);
> >  		last_addr = addrs[dev_nb++];
> >  	}
> >
> >  	/* Need manual issue STOP except for Complete condition */
> >  	svc_i3c_master_emit_stop(master);
> > +	svc_i3c_master_flush_fifo(master);
> > +
> >  	return ret;
> >  }
> >
> > @@ -1272,6 +1287,24 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
> >  		       SVC_I3C_MCTRL_RDTERM(*actual_len),
> >  		       master->regs + SVC_I3C_MCTRL);
> >
> > +		/*
> > +		 * The entire transaction can consist of multiple write transfers.
> > +		 * Prefilling before EmitStartAddr causes the data to be emitted
> > +		 * immediately, becoming part of the previous transfer.
> > +		 * The only way to work around this hardware issue is to let the
> > +		 * FIFO start filling as soon as possible after EmitStartAddr.
> > +		 */
> > +		if (svc_has_quirk(master, SVC_I3C_QUIRK_FIFO_EMPTY) && !rnw && xfer_len) {
> > +			u32 end = xfer_len > SVC_I3C_FIFO_SIZE ? 0 : BIT(8);
>
> Define BIT(8) as macro
>
> Let me find a time at next week to do simple test for this.


I run basic test, it is fine!

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> > +			u32 len = min_t(u32, xfer_len, SVC_I3C_FIFO_SIZE);
> > +
> > +			writesb(master->regs + SVC_I3C_MWDATAB1, out, len - 1);
> > +			/* Mark END bit if this is the last byte */
> > +			writel(out[len - 1] | end, master->regs + SVC_I3C_MWDATAB);
> > +			xfer_len -= len;
> > +			out += len;
> > +		}
> > +
> >  		ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
> >  				 SVC_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000);
> >  		if (ret)
> > @@ -1360,6 +1393,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
> >  emit_stop:
> >  	svc_i3c_master_emit_stop(master);
> >  	svc_i3c_master_clear_merrwarn(master);
> > +	svc_i3c_master_flush_fifo(master);
> >
> >  	return ret;
> >  }
> > --
> > 2.34.1
> >

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
