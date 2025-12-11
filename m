Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413DED41D69
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Dec 2025 16:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=449ZTgYmuZenXynetpYwYoVVv5LPFcy7W+8iTW3wKGw=; b=vYYGVnokhrHjXS
	yjEFxpwh0N3BOL22Wcou4IzhrJ3sQrFR6XAYHoJdklhl7AWXfziF0obnbHwTlMIhvrATXJ3/2jxNW
	3Tk8whIZkom8uobSPaIorBJjIfSOZui07/iA/Muwzc3S8IWJEZ/z4RN0wVV6M4XTqdfYKgZu+gIrQ
	Is5GVjY1mUuji7Gv6QnWUalQeIVg9d95hYxrWplqzimkddN+qRBSuGYdvOJ/nQamDDqmr26aJyG2F
	1YPiX0IL5SttQIagznJwaS0Jg9cntcAJ9ddG653LFqVEg+VlEhGKpdnAMGY1Brd5b7XsXBHuvuPpI
	W2ZTBU5z4uW64l3nGEaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjpM-0000000GzHo-005g;
	Thu, 11 Dec 2025 16:47:40 +0000
Received: from mail-francecentralazon11013041.outbound.protection.outlook.com ([40.107.162.41] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjpJ-0000000GzHK-1Qyh
	for linux-i3c@lists.infradead.org;
	Thu, 11 Dec 2025 16:47:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9BjNs2Ov3DaxUJ8tCrQDUdC+uACGmxb/DQA6G2HvTiKKNCqV2ztjd0eciYpIi8LF752+l77cHAgLLrieBsh/W86yzINt7Q4Xv8jk/B8zUuig7tjXMBWMEzz+QxzRzpJGkGJ6DivBkD9XV7Qmx1vQcxSptQ+Ff3DZdZvWI9l7vY8U1zV1Hu/gKpC9/t05+yg/Ch0CY+aHD62KHT7yaEL9NPQxn5ZcVWeuY2T80UtJaY6SLu1HierVIppdzN6K+TohJSS4+OCmpEJMAN8oVxSFT+3G6U1vTSbNPWKNo1E0+u5p6808SXtDuuVACHvsBnnI6YPa11tuBgxsPPOiADqnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1HodRzG2DqXcogX+h+PYrq1hEXLyyLyEFXV2xxoqR8=;
 b=JsKSdIjQTO20nlu/bANH9gqVL22Auvi+HxJ5ItJN312zN0A+iLLA06ArYGLQxD6ZEhfZGQVRfNEGoPTcXJgF8NIrMu3awiprOjTL5oBlFOcO/81NpDj28hcxPPHVpMMzB1WA5AyKpxc2X4ZPSYmOqr+dJ8e1qwwS4SSmqzguHd663LUP9LG6bqvFdBeAbYtsrVgi7oqphdi834b3HBLo3v6Nr6OYwbK0vDr61dK+79+NJja5Cm7C++xKloCgxvQw+Ee5HCDVq0Kplee8FG1I0yMiW8VcgPhNA1AgBhKbdG6UqnZGevEm9RGcvUmfeyIdtlMB49slUTvq6emNGdHzjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1HodRzG2DqXcogX+h+PYrq1hEXLyyLyEFXV2xxoqR8=;
 b=jPPf0UEDk6KSI7WQY1jpUXN9L+oz8tHoPag83qzX5M4zY7JBZ9NS7YrKphRLZf2vU9o8KEViTl6JoXUc/fyiH7ysVIpn4GKHxdtDQ4nQfwUwOeB8X/6hxo6+Nb2PPivQ/z8j4NG7Zgh+y8VlbeQvfjpB/07+QeFe8lfHAduPmkpav6BE0aMdyleZBkS/o2bYZZw60g1tnsYHPQuXx6SOrjZesS6ji1zroEnm5pdQ1z5JQ4UWd2dI0Zb7xMhahTexV4+wPXglrszL7n7sv5k5XlDy5IhAU1+TdNwzCtSU2WCCxdGcVFqoOfIupu0ZLdIvkmFDi/kBE3ONNecA3g14gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM9PR04MB8572.eurprd04.prod.outlook.com (2603:10a6:20b:437::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 16:47:32 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 16:47:32 +0000
Date: Thu, 11 Dec 2025 11:47:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 10/10] i3c: mipi-i3c-hci-pci: Define Multi-Bus
 Instances for Intel controllers
Message-ID: <aTr1nlpR/CpD5krh@lizhi-Precision-Tower-5810>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
 <20251211134809.75872-11-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251211134809.75872-11-adrian.hunter@intel.com>
X-ClientProxiedBy: SA9PR13CA0082.namprd13.prod.outlook.com
 (2603:10b6:806:23::27) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM9PR04MB8572:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e73972-d7a3-47f0-9c48-08de38d4fa81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|19092799006|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uAnjAMVOn0qInnbFh70Mrf3dnWAME6/GIZIqxytONlZY93f5MyY1Bst+tx9S?=
 =?us-ascii?Q?6FUbT90H334fKHAR1EkSXFON9yx0yZO5JJUht6QnxzZLZBVBzmxBFczOPcJw?=
 =?us-ascii?Q?ckNMOVVc3RGD0rATl40Jy4swoKdObRyc6rcJWbMHE5w48r1YoCSECHNiCcwO?=
 =?us-ascii?Q?pb+G8b31Je0lOJ/0qZ/+CR8U2u+x3bAcE1grhoBin/wBty/S+Jp8PFBs8rBx?=
 =?us-ascii?Q?4iUIz22vjRt9tGRQ+zlDZHEJvyomcBXAer241YafE/0dMC22L4u78jzt7E5F?=
 =?us-ascii?Q?az555iGB2q9mmWagVCh2Cpn6GyDqT3nlAtWgQvoy27aU1s6dyFQpY0S/0+7z?=
 =?us-ascii?Q?8IDHwDlXHtw2L/5v5DQf/pRT43B0eFplgBtEhx+9zJHDG7+y1ykntjYfwyP6?=
 =?us-ascii?Q?BLwSkJRkeWr4Kc95WT1bEOI37HNK4e9qKG1EXwndf4ag/R8KsHbW7DXKPqkx?=
 =?us-ascii?Q?Vz2BvluR5GuZH+x2frAf77i2g6X0CS3QSrpybEJnqDm2emsJhSEn6WuX/E9b?=
 =?us-ascii?Q?xgg04IurpHfzTfW2TtEygiWNfskBxuAHlYR3fn19qPTA+Gelu+6G53s7m+Vr?=
 =?us-ascii?Q?FRlIDO734jjh4J9WiBhB+v48++Cm9rPPEF2sHwAJd/qqzVx+OXVkCi0MDzvB?=
 =?us-ascii?Q?yl59viE3639iZBBjvmxtWh/Hqo2MN83j+uAyfLiDqsS1EuW9a3wTrSktsitM?=
 =?us-ascii?Q?thSa3mWos1zjs7c9ajIu5ZJKq7Wt1xPQnxuWEh8nQhBXGFKwG2AMGXmaAdz3?=
 =?us-ascii?Q?ziysuVpff1ytGj/fruUeTUlFDVOBf8huYGRZ1hLhnOumJUu/FMpwsP3erOum?=
 =?us-ascii?Q?MDEvYfWYF/1wFuRUt+iLXa+jyHvmDbU89+gVJMiUDJ9WRpWvlZjoq7QlBuZL?=
 =?us-ascii?Q?J8B9YuFbEjVQHXgaHJU8LFhzr9aJfMm1V4BomlTEEEcxxwa6ew61qOGlpw73?=
 =?us-ascii?Q?eUmFwkxOhAmO6Qum0Q2li1CjbEwIAcLghXxoqcBuiWZGtQ699EjLMO6gSWVR?=
 =?us-ascii?Q?AzQ9Fp09Y5H8od5bDGqqOVQoZdkM/ITXD8GWFI2DTPF8Nb0cMIzOQ7uTYC6L?=
 =?us-ascii?Q?gxpOT7f9iuzzFF8zBg9WVt8n538iSQPxzUV5DsZK9K9iuDmDNGw5y9+O4ius?=
 =?us-ascii?Q?EXAe9E94mwnh2EwuAOlQnmmslCXSzP1Cnc31zGqk6E8yL+4aALnYihm4k9jY?=
 =?us-ascii?Q?SVKB/M/qSIJ+GyImvhbqVt+JmsFepJ1HOzvvUAoqjWW4CQ/j9FnAMfZXX2Pe?=
 =?us-ascii?Q?Ds3AtGT56ag3bdbq1Xtkjl2DI7DtkUmL8oDjdZyZMsosmWc+DQlphFqxJQH+?=
 =?us-ascii?Q?kTPnntQ13E2SVB9Qg3VhC3V/1Y2BkbbiSnDew3NhQoiWYho6x2r7WQNKb6C4?=
 =?us-ascii?Q?Ia6HieIOWi/SCS/s8940ERRKfYd1gZhB3+3653kIPt8NhB9tw7EZcqfZFa/v?=
 =?us-ascii?Q?6WZp8v53qCuDY2BsM/zgWVozhMEPr8HqDHcWBf4ZrS+IyR+Cpzq9dO1ri3jy?=
 =?us-ascii?Q?LFY791PrN6YtlmBiIv9ek1ryyTMv+AfTx2eu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(19092799006)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dEBqO1uF/4FFr70FHgr8r4mVLuKyiDjlgZiqYiVAzB/H8aCqrdcrx4qpk0QY?=
 =?us-ascii?Q?2o1d2gB2GG/lAoEcmrGF0pJD5pEHoR3fb/qtaZyzQynfqDpJ0lEZ3Ncq1QuI?=
 =?us-ascii?Q?nJyo9XRYv05tN69+9ve5DT2mhLPwNms7ZFLFQ3rHBLmcWfw3SvA/8SDUpckG?=
 =?us-ascii?Q?4ShAxnd7USPWeNX6Pp5r1wxVoSeIOTF2jAd5lnA2BtIzDP/UOkKqk3mq9hGq?=
 =?us-ascii?Q?rN5VaK7Et+qVH3PQrlPWFrQJXfGvRQ4ibz3iDKDOycDjVXJyetxo52RdzQxm?=
 =?us-ascii?Q?lWypcZEOh9hQ1rCepb7WSUJII1hvxBPuhybc52prg9ZIV+4b7+Ap+4dZhDSH?=
 =?us-ascii?Q?kv1f4P46N1limLvOxygkj/XgN1u6IVO9PymUnSAgyZQ+hurCpdK9/Y48r1Kt?=
 =?us-ascii?Q?HOiadrE2JeSThZh6861/jFjTckfoQSzdAeXWyMa+MrtFNRhSa1v5d8o8Wu7k?=
 =?us-ascii?Q?MJQwCx/MmvtDasBs0GCb0UGZ5vU2+pjGa0bvAtrlVIbDBvSriiaskOnK+x4T?=
 =?us-ascii?Q?K+gomKWf30TzlaGnggJRMbb0hcIIdFcuLN25Gye/O/x1aOYBQWnywuyL/hOC?=
 =?us-ascii?Q?Woi/pGiV06ZE3+tg9xux9deTScZah0WkCMzNpqmwtys0NQnkObuIHIx29r3Y?=
 =?us-ascii?Q?xbg9mFV66w75WzEziBGOi/EMnE93h/irxawDyPOL/oWYLFn0cnraUfjxJCCa?=
 =?us-ascii?Q?5rzKg5FeOSqYhRrGiDLp3pb3b7NVkL0i9Mnqf/5gwGSx2TPxwHXmS8eAWIpv?=
 =?us-ascii?Q?sNykXkIHMUKAjD+l3GAVewQcW7DKA2+4zVuaLUO4TToRec9UuXONwOYmozKR?=
 =?us-ascii?Q?Egt2DDcGqrV9hkus7kERpnPPyCXiMaxZe3VXy8kHmJ0QWOi8SFadrIeLXGO8?=
 =?us-ascii?Q?HkD066Fm0Uu0xoLnhSvulo2p3cP+CLChDC3FY7FTpFEqoy7RvR+gVYo81Ooj?=
 =?us-ascii?Q?7g8+OGz1mFmcabRQ1gQ0s+glxQCKvI5xGxh6RN9WrwbreO4REmsSxkVgr+ek?=
 =?us-ascii?Q?/RUtE7HstRzIFQqGDTQKIU9s8j1pyJeY9cGTuajWNtu9Jp5EZ0CsOkju+zqx?=
 =?us-ascii?Q?dpnTv0eVqj/xJWqm27s674lYkfbo8BZVMYa2hFedyyONkGDN5S339V5QgjSI?=
 =?us-ascii?Q?t1Kw/WxNyFU2Th7KkVeSrxBFjpr+/9+wXgAdz9rFnTSV1rM/Mgh/7Pn3eV9M?=
 =?us-ascii?Q?tmBOHLh6F8toM9hB5YlZ+JK6qjppa9UEXH9CdXZGOlw9sy70b4b/z0OeQ5FL?=
 =?us-ascii?Q?KWi8b4PGC8IO7zZmS0uSdNn4OunXJh2anhUtaAnupY+LmehdgSI8qyrSProp?=
 =?us-ascii?Q?0QZLTjra+1xNMrSp8uOAzYjoGwDsXgdplWSrdpgy79miVbzGZF8049tQG52J?=
 =?us-ascii?Q?+RAwpTuXUKROBsAJl65wCwJeWXhDvjZMCeXs10aZ+Og2GapQx4flotxcTJhr?=
 =?us-ascii?Q?5TEyNGJ7k9OeIM1WUSokfGmaMyLbx4Xr2LYOESF8pTiaoLHHb1yDIQBB//dT?=
 =?us-ascii?Q?Tr9hn1P6Owg5Lqm6gkejUrFKKygDYBM3tZesezOAkMBsIkTDQkUfoKiofTO6?=
 =?us-ascii?Q?LaBafQ6j2d8V/moPErM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e73972-d7a3-47f0-9c48-08de38d4fa81
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 16:47:32.1461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b12vKfzyk46mx0PkpdBJPPOPsynRJemoUKlGPFZfxeuC+4sih/e8Tl73ZbcfGe8okbX61AUzQSLbcl7ITAFsMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8572
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_084737_381646_DDDBD87B 
X-CRM114-Status: GOOD (  17.44  )
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

On Thu, Dec 11, 2025 at 03:48:09PM +0200, Adrian Hunter wrote:
> Define Multi-Bus Instances at offset 0x400 for some Intel controllers.
>

subject: Define Multi-Bus instances for supported controllers.

> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Changes in V2:
> 	Also define instance 0 in driver_data
>
>
>  .../i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c  | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index de1f71763786..9937718dc069 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -190,6 +190,13 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
>  	.instance_count = 1,
>  };
>
> +static const struct mipi_i3c_hci_pci_info intel_mi_info = {
> +	.init = intel_i3c_init,
> +	.exit = intel_i3c_exit,
> +	.instance_offset = {0, 0x400},
> +	.instance_count = 2,
> +};
> +
>  static void mipi_i3c_hci_pci_free_ids(struct mipi_i3c_hci_pci *hci)
>  {
>  	for (int i = 0; i < hci->dev_id_cnt; i++)
> @@ -323,17 +330,17 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>
>  static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
>  	/* Wildcat Lake-U */
> -	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_info},
> +	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_mi_info},
>  	{ PCI_VDEVICE(INTEL, 0x4d6f), (kernel_ulong_t)&intel_info},
>  	/* Panther Lake-H */
> -	{ PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_info},
> +	{ PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_mi_info},
>  	{ PCI_VDEVICE(INTEL, 0xe36f), (kernel_ulong_t)&intel_info},
>  	/* Panther Lake-P */
> -	{ PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_info},
> +	{ PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_mi_info},
>  	{ PCI_VDEVICE(INTEL, 0xe46f), (kernel_ulong_t)&intel_info},
>  	/* Nova Lake-S */
> -	{ PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_info},
> -	{ PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_info},
> +	{ PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_mi_info},
> +	{ PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_mi_info},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(pci, mipi_i3c_hci_pci_devices);
> --
> 2.51.0
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
