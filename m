Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39A7D1D46B
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 15:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=luexEtvpChDNx3rb+Vc5yHPrhEXSO5Cq/qpKazQhg2s=; b=w0pa37ph1unFx6
	fU0Yo+cDx61QZfivrj10A4+FCuQBeSU/JcusBc9pj4x3eGsR5KXrnqD/UIXV5ByS0ytYSRuogsmIH
	cMppt3u3S8++d56fKb98HdpuePVGf/9zboCOqECFuAiPvz8tM8leBNMK6+uFmmKq5a7ZkGWoFcDPl
	QtTSvChIHwHcL6AqrUcAmHNH69sB7YAYxYCqquSO9c4TA5eYxi8PbuhMI1hlF4R+YBwzwvkDq+DjJ
	y8rfuCNNKxWv1144dyLM8ZzS7AtSmqjKisqJu7OjU9+VLfAH+sYfUZnbxhLpptWwQfZhWUo71SjT+
	7nK2JhkQ3HeL55fbXa4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdreS-0000000HTDH-2SsU;
	Thu, 08 Jan 2026 15:10:16 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdreP-0000000HTBl-2fMR
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 15:10:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHZXa887TQ9iJqZGmAQ/xbK3OIFtSbQ2puWbcTVbocjb81pmYuCQMsVDXxShwg4nJw4gMqxtoBZaVFD8/Q0uBpzprGUpFIuNcn+TQcusX2Cvy8xj5Jm+vqLqlixZGD2R8gG4+q39mrgLHeH+NAvMc2UmzSgB/8De1H0r1IyB7P1k4Hr8EfDdTnJVi+LtW9jTOKPyqERry+KUyxev9ljn81m99kfW4tgQJ0a7wBj6M0KUrZaWbILEN/W/BEfbv0n8C0tbkSwjIkisgRrsRzNi0FOrvSfg5hAds8Cf6sfSR238CuI4ubPD02fTU/2WIWSnCfcphk01zuAppuvewP5L5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvuyxHosDzQh8Dy3ZVaMIvU1yDpSUzVznhkKmKuqTi8=;
 b=uzegGP7RE4tSRx65a1B0hf29MIVcAiCUoqPnHMOO6aYeroY5mjoiyMjWt2E0CRS0+osU8ze0lgy1f4+eQxkRx5PMh0VL+9Lh9YkuJWKjEYjJD7JE5ooX+iD+CzLWSbZmDg2985ivJmYzjdLNq0XRKr+KcDXmwbDIwgXW9OHTcYtwTuUL78YN26o20CnHU/hLQQM52ZfX7KR0GS/nP2E8aIYBZQeU/oYMVM9W1B3Y+MaETaIP+fCQwV6PSqIi0iYbZixrUZpXFyJwmQG5CMcf06YhgzdEkiY9PJTr0RnMBKj3JPuq06zV8KPAUCTiEekfF2rNrQ3j0EqsOiOhKHaPfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvuyxHosDzQh8Dy3ZVaMIvU1yDpSUzVznhkKmKuqTi8=;
 b=R2q+gv+c6YnE1WZgsDa8zWRLr/bJlcJUMhd9KQfaRNg9iBI3OG08zcar1Yi1JbVuSZLdXwDxLQfZfBJdprf0p4tGd0Ch7ISZjTKgDGe+lKg9reUlbgl3piXvg4Oz3XWTH+jg6cyTCMKXtTQS6cjGsUVA98sNTJB16Q9gx6wC5LZTFsPFuQqhaKxUTlnBghQYzeJUAdzqOkJbelKzaIX7xi7gGeKAq4dRhqmRBeWIpjI5Ljm5C9KyK8vOtk4zN2nsdyihufP7/mh1ZmPlb9MqW98rJ1iO7dY4rlmdXKI2eru4Wjyg3uLZ37vRkY2ykhIXMQVv0Oh2C4bXKyeGJ/PNrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU4PR04MB10549.eurprd04.prod.outlook.com (2603:10a6:10:58d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 15:10:06 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 15:10:05 +0000
Date: Thu, 8 Jan 2026 10:09:59 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 18/20] i3c: master: Introduce optional Runtime PM
 support
Message-ID: <aV/Ix3i4/nO54vDf@lizhi-Precision-Tower-5810>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
 <20260108080558.21767-19-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260108080558.21767-19-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::23) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU4PR04MB10549:EE_
X-MS-Office365-Filtering-Correlation-Id: 52fbb305-bd64-4d82-6600-08de4ec80177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|1800799024|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9wJ5/f6zaxidh2ajYF/Ct6jqvPgEfJXmkZyqyza9tVKkKapX6kQGQWlTlSF+?=
 =?us-ascii?Q?x8g7jgjHwwi6+XBrnhaumZAyZ2GCj0bTYwWgpGeJF3tXTvdYC6Y1yesKDwCN?=
 =?us-ascii?Q?9/+x7OcguS3Lgg8+GHSYB2joNUQj4Kjq8PQVaCFTS0yYQP0jhHEyXGsOB59W?=
 =?us-ascii?Q?0Rv1KbRpKqn3Yvr6aFhqd4xwXfokeqtQQP4oK5isD1ZnKIVHlGtt5Pv7dk9A?=
 =?us-ascii?Q?cBmyCV5HTO1UiCEi8qQ5rtx8w1woRo5vbFAm7zWR+EreuWnLgscH2HWF6S/H?=
 =?us-ascii?Q?UxjJbpU5BnxlduMOlBIOfAaOPyz5f/784905jOAN9QyqQUjkd0J9uKNozo/T?=
 =?us-ascii?Q?IF7QX5/IOJXA3XVYr47pfZtHaq92GK+W5JL4AmxrTcSRChHLVp0Rcgrjde7W?=
 =?us-ascii?Q?3/R6qkbUTID9oMusm+giURb0xFWv7EUr0MpSY4nm0uTT9VXuNhNoXDcg0RGu?=
 =?us-ascii?Q?pQp+48Zw4zjkZd+RkzcZ8Iahk9nH0vHkDp1lGUWOcPbsNsoy57Txuy8mUtxc?=
 =?us-ascii?Q?TtoylODH6++idzDLmEWbIE/h9Xi7OxgEjyjKJruAq520jzqmM6HDasPB9H3V?=
 =?us-ascii?Q?qBHzSyicbbLBLRuewteuN4WyjJh/otKz0FWNedMUSOUVzXIoI7cCNO0GtLxU?=
 =?us-ascii?Q?esxf/hxCWSXPKnLB1TZLOQ2hWAL/gd/zepXCaxJFkETe6c/x4sZ8M7Q5iavL?=
 =?us-ascii?Q?EcmaYOE2k4m4GHz3KdQ5oUp92dCrV/k9KwbI/ZhdhJmzz65irhFOcphyaeDe?=
 =?us-ascii?Q?+CH4MPI+WtHhKGykwVab+joBd/CEAka7lPH++2vPNb0Pjn+SgyMdtN7BNLjF?=
 =?us-ascii?Q?JKzHMYSF1DEE7jgsco1oN9MzRjlPXfudjpzyUpE2k9Scx12Nzxk8h/D9H5Nk?=
 =?us-ascii?Q?vgls+MpvFiOxqkyDHKiWl/X1TebpKB7hL4kzXBSsQwXHm9iZ5YZomPRc923C?=
 =?us-ascii?Q?cznCzff/C5DldGPcXgBzKAK1I9iZJHBCbA14RtVpB4WKD7MG371/lnKVXloL?=
 =?us-ascii?Q?c7j8JoaLUyQ4AXHgGmL6UDkJN4ilku0ZQyNZzx474sKeFjvJCuS0Q9URtP+g?=
 =?us-ascii?Q?nmDnoaNL2tC8SjCeVX+Cvau3vU1VVzlkTM/J3plrsMDSOkJnGkhPm8CJ5DnN?=
 =?us-ascii?Q?5bh/XMQmAc2FzAwjTyqYcQ4LuPCrqK4DSgwUB7t/yHxrJRTZ+VlrcnpRdZBb?=
 =?us-ascii?Q?EanR68opmMcLOlSSNteY6SywCGbSHrw0H6biqVeaoH3eFfMtB+VV9OabiyKp?=
 =?us-ascii?Q?aT9a04XEBK+T3StUZoQnT/F/JNqaX/NVfiv19qxAyrS8lDsmfMOsMfcTE6oD?=
 =?us-ascii?Q?vpSLrFq+GKo/cJTS6PgjFNwsLV9tdlbRbdxUPVeQMmTlntuqrmNKu+4jnLLK?=
 =?us-ascii?Q?twDbLO+p8DXaIr86mWfY5atAfqiiLblICgDJadP4Uj0m/nfPpCaka5MZqpE/?=
 =?us-ascii?Q?RV5LrlPhwmrSWfwCFAiFkIjwSDQRR5AE2XJNdQYsNLJvBI2oa8t7XNepG7+a?=
 =?us-ascii?Q?+/ecz3Z4Mw2Pbk0lRm6qt2/nyXAMzggBONSj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cr6rmu+kIfsdk8n1TmkQV91qzD/vFouc2XSny6hFAS3zHznB9khVjyJKt69z?=
 =?us-ascii?Q?nYJC29DaPtehrz58UWnYNgz46Aepu1FbAEN/ih9tk28nGc/nG5TtmQUPIrzF?=
 =?us-ascii?Q?Za1cj+OrS3MGDcud8peaUR/mK61RjCkEBMOK5o3uWd4aIA61D2X3yqHRmHFy?=
 =?us-ascii?Q?/hm1vnMGwg4adi9lln2gXK4D/9DXXecAetlL3r8gaN1QjZJQwQLcBj17m+06?=
 =?us-ascii?Q?qDC1aOpRorobbAjvPVgbesiJ+e6cqQwZBMPVdleVh7xWMRIh+LRh4Aolzk/E?=
 =?us-ascii?Q?Le6eu1RdZGi4Tr0XGUbgU8xrcU76/moKwp3cj986Md05SIweHBxuo2CEIUlo?=
 =?us-ascii?Q?RxhQeToJKmLzRoeJbGXHtjvSWOSXEpiR+e6I1449JVK6XkhO+mLBUzxbtdxc?=
 =?us-ascii?Q?e3Nsa31TqigGfUI1K+PtlqiuKIXiQIC5pT55Ku5jSftwZXVHcEN/ojw9XsQr?=
 =?us-ascii?Q?gx4s4hvmJuCfOBuqiEYThuD+k/jE2/Qb9JaLG2KKAyZeycXRl93GFUBQzR03?=
 =?us-ascii?Q?1sdyACC+ALIlCDKgW1bwwJAlCDTnAzuJGmNOsy27yc4dWd7l7AXJ1xH3UGLM?=
 =?us-ascii?Q?MQcqWhMejTmrrs5kDqEY3vHIUGcZ6mOht7wDsCo+XClm1R+LSUD7+hrGMOQ6?=
 =?us-ascii?Q?IavgPxS8shPWsKSdVKmPGMprMArqpsxx+oMs0XQvE+1PMHJDpdM1LWgbN+it?=
 =?us-ascii?Q?a+zpZaHtOpX4miFTKMWg/N1ehd5q3DBjAZz7FjFLtF6viwOiDnl92ziSSycm?=
 =?us-ascii?Q?BbdHs/MOt7gBiId6DxIWCUJyHlVufUxgAaj3nC05uj0/M2sVRH27DZN3EzzX?=
 =?us-ascii?Q?q89tdjveUXLRZVSnyK44k/ELt0fOWapTHjHyry629ZTx1Q5eUxRoqwcX7PRk?=
 =?us-ascii?Q?UCf9ZjWv7cjtQT0INAdAZ4Wr/VElinyQk0xyuN4Bz6MoFxIVNefyzj21eRAc?=
 =?us-ascii?Q?gI/tAv9kyjEXbWGO1jpldVQ+fR0BN3Z+cP7L7L/N8GfmFYjT1FVBZgtk9f8U?=
 =?us-ascii?Q?SqxuSizAyj8pFCQtFJ3FR+GeXAXoiO+hMNfu251uRsJtCC9mLb3O9KaxBXRI?=
 =?us-ascii?Q?m7C8yazD7q2W01QHPWY6GFLu3yVbBHuN2VPzGHFUihTTh5s5NY670NA2u6on?=
 =?us-ascii?Q?NtiAw8NbhYEfgaRgzcARoUzcsEdBpkiCM5XXeWtaYmvmrhieyzcnW/v3mb+s?=
 =?us-ascii?Q?PyhfgfVfpsG3EmwXhzsrV0ws+7WOvGkvggHtfjkcO1AsMbS8rLtL5L9O4hmo?=
 =?us-ascii?Q?7giiS1ritDYVbO8Ujc6a//J8+KWzkNInVRxqKKieHYEAWN1TfOsJfuIvYok5?=
 =?us-ascii?Q?z046CXN83FHWtAbJg13/0mlDHzNpilJyQTm8KXkQog0FQgzHZDhFIIPQ+/YU?=
 =?us-ascii?Q?veY6o65WEq+rUoR98uEDTOLq+aF/k9pHAYb1FfKzbHvAW0hZ8HtnTImyNSRv?=
 =?us-ascii?Q?BuJOoa9wPVNidqr6bDarLpcdzwW6U9DyCvEoBbj7I0pYdKG8kA9h6k59tPGG?=
 =?us-ascii?Q?TqRys/BGtq+IOwqUMhsmfq8S1PIy1geJxDRUWPzxO4Ir4PGRqtKeVWuLZW2u?=
 =?us-ascii?Q?HtPLAPMk8xOK3Z9BXnSoLOxv75JPxeTD+BSw2Tg3Tgl3osizYR5+1VmqIZzw?=
 =?us-ascii?Q?ZjHZD5fE81AYjoxjXW4c3acfBsbsk/sGaJoeVPWS1473dwp9jJt39yu6fD4k?=
 =?us-ascii?Q?DhSY/J5GVAt2KNYW3k+lPVpvPMvVp4izA4c5ajN9gJGFKzOE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52fbb305-bd64-4d82-6600-08de4ec80177
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 15:10:05.9225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1vTgIrtRkJ4X8bO7iD6I4kJndIOYnctww5dGyrwrGfVRhHNsiltxhaSuTx4SNyinqYmjw/Nm/VYWYqh1tVT6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10549
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_071013_853082_94FF9679 
X-CRM114-Status: GOOD (  27.70  )
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

On Thu, Jan 08, 2026 at 10:05:56AM +0200, Adrian Hunter wrote:
> Master drivers currently manage Runtime PM individually, but all require
> runtime resume for bus operations.  This can be centralized in common code.
>
> Add optional Runtime PM support to ensure the parent device is runtime
> resumed before bus operations and auto-suspended afterward.
>
> Notably, do not call ->bus_cleanup() if runtime resume fails.  Master
> drivers that opt-in to core runtime PM support must take that into account.
>
> Also provide an option to allow IBIs and hot-joins while runtime suspended.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Changes in V2:
>
> 	None
>
> 	Frank suggested dispensing with rpm_allowed.  That would be OK for
> 	drivers that do not enable runtime PM, but the drivers that do
> 	enable runtime PM (i.e. dw-i3c-master.c	and svc-i3c-master.c) might
> 	be affected.  rpm_allowed can be removed when they are converted to
> 	the new approach.
>
>
>  drivers/i3c/device.c       | 46 +++++++++++++++++--
>  drivers/i3c/internals.h    |  4 ++
>  drivers/i3c/master.c       | 93 +++++++++++++++++++++++++++++++++++---
>  include/linux/i3c/master.h |  4 ++
>  4 files changed, 138 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> index 8a156f5ad692..101eaa77de68 100644
> --- a/drivers/i3c/device.c
> +++ b/drivers/i3c/device.c
> @@ -46,10 +46,16 @@ int i3c_device_do_xfers(struct i3c_device *dev, struct i3c_xfer *xfers,
>  			return -EINVAL;
>  	}
>
> +	ret = i3c_bus_rpm_get(dev->bus);
> +	if (ret)
> +		return ret;
> +

Can you similar method

commit ef8057b07c72a817537856b98d6e7493b9404eaf
Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Date:   Thu Nov 13 20:33:33 2025 +0100

    PM: runtime: Wrapper macros for ACQUIRE()/ACQUIRE_ERR()

    Add wrapper macros for ACQUIRE()/ACQUIRE_ERR() and runtime PM
    usage counter guards introduced recently: pm_runtime_active_try,
    pm_runtime_active_auto_try, pm_runtime_active_try_enabled, and
    pm_runtime_active_auto_try_enabled.

    The new macros should be more straightforward to use.

    For example, they can be used for rewriting a piece of code like below:

            ACQUIRE(pm_runtime_active_try, pm)(dev);
            if ((ret = ACQUIRE_ERR(pm_runtime_active_try, &pm)))
                    return ret;

Frank

>  	i3c_bus_normaluse_lock(dev->bus);
>  	ret = i3c_dev_do_xfers_locked(dev->desc, xfers, nxfers, mode);
>  	i3c_bus_normaluse_unlock(dev->bus);
>
> +	i3c_bus_rpm_put(dev->bus);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(i3c_device_do_xfers);
> @@ -66,10 +72,16 @@ int i3c_device_do_setdasa(struct i3c_device *dev)
>  {
>  	int ret;
>
> +	ret = i3c_bus_rpm_get(dev->bus);
> +	if (ret)
> +		return ret;
> +
>  	i3c_bus_normaluse_lock(dev->bus);
>  	ret = i3c_dev_setdasa_locked(dev->desc);
>  	i3c_bus_normaluse_unlock(dev->bus);
>
> +	i3c_bus_rpm_put(dev->bus);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(i3c_device_do_setdasa);
> @@ -106,16 +118,27 @@ EXPORT_SYMBOL_GPL(i3c_device_get_info);
>   */
>  int i3c_device_disable_ibi(struct i3c_device *dev)
>  {
> -	int ret = -ENOENT;
> +	int ret;
> +
> +	if (i3c_bus_rpm_ibi_allowed(dev->bus)) {
> +		ret = i3c_bus_rpm_get(dev->bus);
> +		if (ret)
> +			return ret;
> +	}
>
>  	i3c_bus_normaluse_lock(dev->bus);
>  	if (dev->desc) {
>  		mutex_lock(&dev->desc->ibi_lock);
>  		ret = i3c_dev_disable_ibi_locked(dev->desc);
>  		mutex_unlock(&dev->desc->ibi_lock);
> +	} else {
> +		ret = -ENOENT;
>  	}
>  	i3c_bus_normaluse_unlock(dev->bus);
>
> +	if (!ret || i3c_bus_rpm_ibi_allowed(dev->bus))
> +		i3c_bus_rpm_put(dev->bus);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(i3c_device_disable_ibi);
> @@ -135,16 +158,25 @@ EXPORT_SYMBOL_GPL(i3c_device_disable_ibi);
>   */
>  int i3c_device_enable_ibi(struct i3c_device *dev)
>  {
> -	int ret = -ENOENT;
> +	int ret;
> +
> +	ret = i3c_bus_rpm_get(dev->bus);
> +	if (ret)
> +		return ret;
>
>  	i3c_bus_normaluse_lock(dev->bus);
>  	if (dev->desc) {
>  		mutex_lock(&dev->desc->ibi_lock);
>  		ret = i3c_dev_enable_ibi_locked(dev->desc);
>  		mutex_unlock(&dev->desc->ibi_lock);
> +	} else {
> +		ret = -ENOENT;
>  	}
>  	i3c_bus_normaluse_unlock(dev->bus);
>
> +	if (ret || i3c_bus_rpm_ibi_allowed(dev->bus))
> +		i3c_bus_rpm_put(dev->bus);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(i3c_device_enable_ibi);
> @@ -163,19 +195,27 @@ EXPORT_SYMBOL_GPL(i3c_device_enable_ibi);
>  int i3c_device_request_ibi(struct i3c_device *dev,
>  			   const struct i3c_ibi_setup *req)
>  {
> -	int ret = -ENOENT;
> +	int ret;
>
>  	if (!req->handler || !req->num_slots)
>  		return -EINVAL;
>
> +	ret = i3c_bus_rpm_get(dev->bus);
> +	if (ret)
> +		return ret;
> +
>  	i3c_bus_normaluse_lock(dev->bus);
>  	if (dev->desc) {
>  		mutex_lock(&dev->desc->ibi_lock);
>  		ret = i3c_dev_request_ibi_locked(dev->desc, req);
>  		mutex_unlock(&dev->desc->ibi_lock);
> +	} else {
> +		ret = -ENOENT;
>  	}
>  	i3c_bus_normaluse_unlock(dev->bus);
>
> +	i3c_bus_rpm_put(dev->bus);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(i3c_device_request_ibi);
> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> index f609e5098137..0f1f3f766623 100644
> --- a/drivers/i3c/internals.h
> +++ b/drivers/i3c/internals.h
> @@ -11,6 +11,10 @@
>  #include <linux/i3c/master.h>
>  #include <linux/io.h>
>
> +int __must_check i3c_bus_rpm_get(struct i3c_bus *bus);
> +void i3c_bus_rpm_put(struct i3c_bus *bus);
> +bool i3c_bus_rpm_ibi_allowed(struct i3c_bus *bus);
> +
>  void i3c_bus_normaluse_lock(struct i3c_bus *bus);
>  void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index ff6cbc044787..594d61edcef4 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -106,6 +106,38 @@ static struct i3c_master_controller *dev_to_i3cmaster(struct device *dev)
>  	return container_of(dev, struct i3c_master_controller, dev);
>  }
>
> +static int __must_check i3c_master_rpm_get(struct i3c_master_controller *master)
> +{
> +	int ret = master->rpm_allowed ? pm_runtime_resume_and_get(master->dev.parent) : 0;
> +
> +	if (ret < 0) {
> +		dev_err(master->dev.parent, "runtime resume failed, error %d\n", ret);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static void i3c_master_rpm_put(struct i3c_master_controller *master)
> +{
> +	if (master->rpm_allowed)
> +		pm_runtime_put_autosuspend(master->dev.parent);
> +}
> +
> +int i3c_bus_rpm_get(struct i3c_bus *bus)
> +{
> +	return i3c_master_rpm_get(i3c_bus_to_i3c_master(bus));
> +}
> +
> +void i3c_bus_rpm_put(struct i3c_bus *bus)
> +{
> +	i3c_master_rpm_put(i3c_bus_to_i3c_master(bus));
> +}
> +
> +bool i3c_bus_rpm_ibi_allowed(struct i3c_bus *bus)
> +{
> +	return i3c_bus_to_i3c_master(bus)->rpm_ibi_allowed;
> +}
> +
>  static const struct device_type i3c_device_type;
>
>  static struct i3c_bus *dev_to_i3cbus(struct device *dev)
> @@ -611,6 +643,12 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>  	if (!master->ops->enable_hotjoin || !master->ops->disable_hotjoin)
>  		return -EINVAL;
>
> +	if (enable || master->rpm_ibi_allowed) {
> +		ret = i3c_master_rpm_get(master);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	i3c_bus_normaluse_lock(&master->bus);
>
>  	if (enable)
> @@ -623,6 +661,9 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>
>  	i3c_bus_normaluse_unlock(&master->bus);
>
> +	if ((enable && ret) || (!enable && !ret) || master->rpm_ibi_allowed)
> +		i3c_master_rpm_put(master);
> +
>  	return ret;
>  }
>
> @@ -1712,18 +1753,23 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
>  {
>  	int ret;
>
> +	ret = i3c_master_rpm_get(master);
> +	if (ret)
> +		return ret;
> +
>  	i3c_bus_maintenance_lock(&master->bus);
>  	ret = master->ops->do_daa(master);
>  	i3c_bus_maintenance_unlock(&master->bus);
>
>  	if (ret)
> -		return ret;
> +		goto out;
>
>  	i3c_bus_normaluse_lock(&master->bus);
>  	i3c_master_register_new_i3c_devs(master);
>  	i3c_bus_normaluse_unlock(&master->bus);
> -
> -	return 0;
> +out:
> +	i3c_master_rpm_put(master);
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_do_daa);
>
> @@ -2065,8 +2111,17 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>
>  static void i3c_master_bus_cleanup(struct i3c_master_controller *master)
>  {
> -	if (master->ops->bus_cleanup)
> -		master->ops->bus_cleanup(master);
> +	if (master->ops->bus_cleanup) {
> +		int ret = i3c_master_rpm_get(master);
> +
> +		if (ret) {
> +			dev_err(&master->dev,
> +				"runtime resume error: master bus_cleanup() not done\n");
> +		} else {
> +			master->ops->bus_cleanup(master);
> +			i3c_master_rpm_put(master);
> +		}
> +	}
>
>  	i3c_master_detach_free_devs(master);
>  }
> @@ -2421,6 +2476,10 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
>  			return -EOPNOTSUPP;
>  	}
>
> +	ret = i3c_master_rpm_get(master);
> +	if (ret)
> +		return ret;
> +
>  	i3c_bus_normaluse_lock(&master->bus);
>  	dev = i3c_master_find_i2c_dev_by_addr(master, addr);
>  	if (!dev)
> @@ -2429,6 +2488,8 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
>  		ret = master->ops->i2c_xfers(dev, xfers, nxfers);
>  	i3c_bus_normaluse_unlock(&master->bus);
>
> +	i3c_master_rpm_put(master);
> +
>  	return ret ? ret : nxfers;
>  }
>
> @@ -2531,6 +2592,10 @@ static int i3c_i2c_notifier_call(struct notifier_block *nb, unsigned long action
>
>  	master = i2c_adapter_to_i3c_master(adap);
>
> +	ret = i3c_master_rpm_get(master);
> +	if (ret)
> +		return ret;
> +
>  	i3c_bus_maintenance_lock(&master->bus);
>  	switch (action) {
>  	case BUS_NOTIFY_ADD_DEVICE:
> @@ -2544,6 +2609,8 @@ static int i3c_i2c_notifier_call(struct notifier_block *nb, unsigned long action
>  	}
>  	i3c_bus_maintenance_unlock(&master->bus);
>
> +	i3c_master_rpm_put(master);
> +
>  	return ret;
>  }
>
> @@ -2881,6 +2948,10 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	INIT_LIST_HEAD(&master->boardinfo.i2c);
>  	INIT_LIST_HEAD(&master->boardinfo.i3c);
>
> +	ret = i3c_master_rpm_get(master);
> +	if (ret)
> +		return ret;
> +
>  	device_initialize(&master->dev);
>  	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
>
> @@ -2960,6 +3031,8 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	i3c_master_register_new_i3c_devs(master);
>  	i3c_bus_normaluse_unlock(&master->bus);
>
> +	i3c_master_rpm_put(master);
> +
>  	return 0;
>
>  err_del_dev:
> @@ -2969,6 +3042,7 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	i3c_master_bus_cleanup(master);
>
>  err_put_dev:
> +	i3c_master_rpm_put(master);
>  	put_device(&master->dev);
>
>  	return ret;
> @@ -3114,8 +3188,15 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
>  		return;
>
>  	if (dev->ibi->enabled) {
> +		int ret;
> +
>  		dev_err(&master->dev, "Freeing IBI that is still enabled\n");
> -		if (i3c_dev_disable_ibi_locked(dev))
> +		ret = i3c_master_rpm_get(master);
> +		if (!ret) {
> +			ret = i3c_dev_disable_ibi_locked(dev);
> +			i3c_master_rpm_put(master);
> +		}
> +		if (ret)
>  			dev_err(&master->dev, "Failed to disable IBI before freeing\n");
>  	}
>
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 6225ad28f210..c1ec597f655c 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -504,6 +504,8 @@ struct i3c_master_controller_ops {
>   * @secondary: true if the master is a secondary master
>   * @init_done: true when the bus initialization is done
>   * @hotjoin: true if the master support hotjoin
> + * @rpm_allowed: true if Runtime PM allowed
> + * @rpm_ibi_allowed: true if IBI and Hot-Join allowed while runtime suspended
>   * @boardinfo.i3c: list of I3C  boardinfo objects
>   * @boardinfo.i2c: list of I2C boardinfo objects
>   * @boardinfo: board-level information attached to devices connected on the bus
> @@ -527,6 +529,8 @@ struct i3c_master_controller {
>  	unsigned int secondary : 1;
>  	unsigned int init_done : 1;
>  	unsigned int hotjoin: 1;
> +	unsigned int rpm_allowed: 1;
> +	unsigned int rpm_ibi_allowed: 1;
>  	struct {
>  		struct list_head i3c;
>  		struct list_head i2c;
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
