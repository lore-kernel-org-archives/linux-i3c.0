Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B2BD3B980
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Dec 2025 16:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ZrXbrLzjvchvBvHXmZs4v90wlKJohboL6EEdbbqngI=; b=EGe33UIYmy7zLJ
	Kn8ljFdtXJUqLWyr7GDZpN9uQ7x1/dWetOQFqEXpD992hmB3KI6fPvTxctCjdqeBVQt7Z1tt9dTaa
	DTpZ9FuRTcxSiNA4yI7/dlZVIIvQ33DCEbSs+nDtxXJX7CS5L9HIqcO5lKQgoaQaZLo0TWH2UKJsS
	As5pyE/P4phXH6DIoofC1NLxNsQ0RXCeNOhGXzRXxNtTCuBHLFnVwLcr/ajZMOQhTvCdFt+l/ThlF
	GwN0LsJshKYSrP1nYkvfjRyqvi+yHe0SWqhPcP/G6EKna8PZpKLgloiEz7DBRk9WQLmya2G9MC7pV
	bp86Dde+w/voO+OyHDaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0UY-0000000EVwQ-1j3t;
	Tue, 09 Dec 2025 16:23:10 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0UT-0000000EVvo-3KuX
	for linux-i3c@lists.infradead.org;
	Tue, 09 Dec 2025 16:23:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AL8jwUJciPkzFp3k0JithYXd1zGP3H6fq+JRk60IVb4LCBZeHxP4SXFfDph/zWl0cTPekJuYYcStuxS9AZrTvU3QTsO7OteKXw/gCP7exyT2/JU/laaQhR/bB0HyAoNukOrI7ioYpWYuB2x57ifuWYSMJJlBtojLprTvxRj56hx1dv7sMQ0G6bL8No/UtF5RnkPtfnxSG6Z4u8IlckcQM98rSKuCD5FSwXhLdfHF3EKICO4DC2zHKAFDPJJ94V7+J4eLoEE0DDr2NRcczDU/VKsjH3pZWLPF6JJTJ7evpl57gtszKsxHl2G9vcissu127qVNA12yRbZajRn0j1Rmlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=403t9yG6RYHHB50XJz8SijHMP8m7u1Sa7NOulojsLX8=;
 b=xfU7JMoxerLk3mdekgSHJawDl2LWl/5HrrbNIM+MxuYVRg29kuf66o2Q2uwYAZMlq7RDN3s4oBbm3j9f5+tPsGDf3wN/znXzpur8GnWqhmzgDyTVX/i0rCYmixvts4yZldGraZ7lRy1CeQuF0ASb36MCDxoWXCR17qV9Wuy4usf97FYQPZZebWA/H0dKno0gx6c0nY0rEi/V46Vjjw5CWmpy//VYNOu4HaSbToAuFJU/Kj1GXpRC7UD9KALfMZBjUKa9eDPBj6Qwc1mNlOGVlEIx0HPYSS6e0I9mkXLvb0wEs345ef5GEtf30PWpGU8lEafu0xvCjc+sYPeM1EDLnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=403t9yG6RYHHB50XJz8SijHMP8m7u1Sa7NOulojsLX8=;
 b=B0rh/U4TkzT1SfzuwAtjV7HUZfsxsKBu/MqhKfBaOT42O441/CyUtfhRrCGqkIUFGsQBursikALxXibdSM3mtS5F6FQ6kBSksPWN3j5+A2vUdC47mX4ydZh5ejz1gH1fCYDUBFM457iY2MS3POhHIOWLHxH99QEj8/vRsHhfBECdWF8M7ahaecMD+lcTzGVCwgNNtyWH7+ZUeM/fzvna0rjUDVUVghHuxgYbGjMJJs8xfYkpvc9DDOzTHcPXO6dNxRTdjxj/6uoagkPEZnY4o9CifE94nl0ncRot0N9AYSQbLetONoZLh4QnC/W7nZcn+AD0p5zEiGnSBuqpheSVsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 16:23:01 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 16:23:00 +0000
Date: Tue, 9 Dec 2025 11:22:53 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 2/7] i3c: mipi-i3c-hci: Stop reading Extended
 Capabilities if capability ID is 0
Message-ID: <aThM3Tubx1FVCuNA@lizhi-Precision-Tower-5810>
References: <20251209115104.124156-1-adrian.hunter@intel.com>
 <20251209115104.124156-3-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251209115104.124156-3-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::7) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DB9PR04MB9626:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c35e52e-94eb-4fe8-b9a0-08de373f3823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|366016|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2zq8ci3z2IoyUldH0J3r4vwDfm+JCnmgkXKior2MW9gz/MhTbSNeg4gxEIFV?=
 =?us-ascii?Q?4e+SKFN0h4Qmt/BnhLcAyQEk6WiAdGxEc3m2MNAS/pjv95Dhpcx99BMdLjhn?=
 =?us-ascii?Q?fV1YFWa2SACRGpmLa9QQRa6jLypWgeHPcZ71v2ZycGTUgdo33KjNTaSm9rNT?=
 =?us-ascii?Q?m0qmH1NAtHNUZ+NGk/fjGl+1LB5Xl/aOx0SC2DYT1RVluhruzv0N8nlesjsW?=
 =?us-ascii?Q?yrgUF8cFKTfIjB6pnmGyBj4CiKcpdvBOIoAIDQD3R3cp5/8fadCuQPgXFSwU?=
 =?us-ascii?Q?DvYwJvL+cAjtrQsZEGychGq76PsL2yQkY9rEFhb/W8nz+MlwLwL7dNNSX9aR?=
 =?us-ascii?Q?n8+vTn3xA7sDcW40kZ2/9hwKCyDYYP5Zi+1YuVbWkHOMIFkKPPwJDaddHBym?=
 =?us-ascii?Q?B3YaCzMmERBJ0LtBuCgJbcukv+kiRPhjOY02DZvOpR0THUqUz3JpXrqBlq5T?=
 =?us-ascii?Q?aa6dVlvcv1w3LpRgZeO7cig3BUJ+feJvS8e73U8qPmU3ekYQLjydTSGyTH2k?=
 =?us-ascii?Q?MWRr9mABgFM9ZCi3o2GIGkIP1xMlkcZs695gZvZ9n1OqbB+RELod9p77TvmS?=
 =?us-ascii?Q?3uvioxskw3S/fZVORMM+r9d96VFTMDkqKWrL8wK1zc/zAYgXasM9QEDdItWp?=
 =?us-ascii?Q?84enu2p+1LX69aaSjUDhZZJlWR9exynbNYSZzc4WCOmxMvMol99C0Zktwb0K?=
 =?us-ascii?Q?xC0yVzBdK/naTTFaXEF4/wZ42/tgMt5sopKat8SKIuP43F0EDgRdDPr3pDmH?=
 =?us-ascii?Q?LXXaXa0GX94eRLMgQ33C3wOaBIEITKvewcQnuVsA0wWmlWg3z2w2SZOm5GHU?=
 =?us-ascii?Q?6BGylaOknhPCJqHsVGOf+jCdKX9ENKKmqIsjPQ274c9yuKThXTb+Z0qrzvmN?=
 =?us-ascii?Q?Me/KffP6vaKcmValKwMiIzDw8a+YBuhwg7GjWRZoRCpZWivnXnwgxgEbEdsR?=
 =?us-ascii?Q?3ZYpe2T8qAb7N4pXGnaPkaMSK4ez10ZnTjBOn4Cn52aomrDMSy7sQw/AF/U/?=
 =?us-ascii?Q?DGhuL+EZ1XD1lykEvHP7aDKwIoO9qRqzWlnP1BCbU71EwthA+qGXBMjPCaq7?=
 =?us-ascii?Q?xNZ5Xj94mbaCUuJzVmJokqi8rd3c0pSgp5aEowUBwDBc13qoNqBiTvY4QgA7?=
 =?us-ascii?Q?OrakMTTbsWZEHslWzrpgirBRmBBZmsnuutG1TcLdC7tf+/JauUP8lYpdfgFM?=
 =?us-ascii?Q?UaZ4LPg2345dD+GRRig4RWmBEk1zwrSRlHS9P3A0RlTqtzZQkGxRE4ebCBF8?=
 =?us-ascii?Q?w2jIw5i5xNXNsmStsPN6YmeeKXCJeaciuLAbme0huE/f8oXX3+qjItjoSpxT?=
 =?us-ascii?Q?Y1/Ss+Lp7ACjPmzR6Y7ZqMqXdWCaIkPR6QMIJ1uCZFbTGKoH3ib7F8WoxOIC?=
 =?us-ascii?Q?UDZkKKPxPoF4wKDdHGWNbLHkoXlqtHxxCEwtm3K9Ta/BhnyER+594yBKPhLE?=
 =?us-ascii?Q?coyAqBzUD3/2QTvw1xwzBxAolnecAkFM1Kz+XEssZS2oIw9hIKxDTrbRMVmi?=
 =?us-ascii?Q?IzfiTsXwvdssEcdXfL70hHeAwkCA+qT8vw6+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dUaudR1yq9AWFEPx+yrfLQ4fl7Ib4jTz4Z1Y4FfsjuhdbprcusxjSS0qWd3W?=
 =?us-ascii?Q?ZcHMtXCMxBN8zfQgHubT8blqYapQZSUvQ4p5ySlO9Ns+nuLdp5reRCQYA79Q?=
 =?us-ascii?Q?t1qgz4iHyf1Brw1akdgfKrYLbitAnjoPolFrEGluf3p1i7wuodr353aC3m4l?=
 =?us-ascii?Q?sD+7gnrs5YGpYXyzVwapUXLO70y+aLpvxpZAkqvD91bWZ6GawVIHQiNEDNjp?=
 =?us-ascii?Q?0yiPYIZ+C4Sknex+KuryUcpLZzpzPBPsIV6OAhmlbVA78z0geuCkKC8c89p2?=
 =?us-ascii?Q?9OfSTFNPOXg8iwrPiXXcDmd3gr3yRtGtjEwHk1b4xEY/j4u7QEYYMdMAise7?=
 =?us-ascii?Q?fkPgLwWBfWgLaH0yLO6boNcxtBlxwAIPaVWK63Wt845m3WRMXbPki25g6DD0?=
 =?us-ascii?Q?aXmoIxm+3zmJ+SEQfbVhkhrUUYWT2n4fpEgDmU0Sz1SGA1KPFgRisxRC1rH+?=
 =?us-ascii?Q?2iE65dtXPa+RZMAwT2aXieQZzvYJlzEqLQyeIcvk/VXWsFVVF1qdBzFG61xj?=
 =?us-ascii?Q?foT9ccJWmAOEA08A730kvb2WWJdw6Nv+GGo5fAcT4Nu5wfAMYi7wXd8s7jz3?=
 =?us-ascii?Q?53SwiABCHscvlEIDejpzI2iNwq263PEM1W7LdSH/YgJ65KyLpMaUw5/wwQ5N?=
 =?us-ascii?Q?E2JuG5XO/pX13RHQ8xJMUTe+0KjxgXOk1AjDEStO7qQ55T1t0Iz1GobbBozn?=
 =?us-ascii?Q?+aXa3EzhAM4iFzOmqLSbT8vQpKzyQymY93QDciAnsLQZRSlU9v34wEDEZoJn?=
 =?us-ascii?Q?owFndc0U1EKbxaaPEXO4PX80wxvlOZ39sAlLCsG7+zDDikhDoR1JTNiXDxTr?=
 =?us-ascii?Q?Rbq+n4na46aJ2esFspJUp/FFhxk104WIRzScnqVDyFuTZYyx+/GA1FdO6tDi?=
 =?us-ascii?Q?7aIuil4D+SoEl1iV2iTaXDJKJzw49EpSGEpqCYrGk200sT+PYAtk4zEDKEJO?=
 =?us-ascii?Q?ysPViH7kpRcQ+/gEUh0PBpTFLiEpbTbEOpCnSyJ0/3hQy1I8g/EVmYmoxoev?=
 =?us-ascii?Q?Zp2uu2TpSBe8gVrrWPJ6GXeKGXNYIOP62isikH/MQp17inNuiYfQNbHgJdlY?=
 =?us-ascii?Q?vwGlFVjcnyx+mDXzddBiJlIoj3dlteemPSiDLmdnz/lDPV+1/mAqWY8FK166?=
 =?us-ascii?Q?JZvhYI1c+hXu4ERxMwW1pxyoSoJLJ4Li3NZvN9xlXtdFyjDTOAined6HlYGN?=
 =?us-ascii?Q?v1uJBIkv6nAaIhGGIv8UGelGMGf2/Im5QZA0qzngO3j2YOLqZE850iYQxtDn?=
 =?us-ascii?Q?Fry7x74AzNTldpjWQV+iIro2a0oZpeE/vMAN8WlsBjjSiVVtMyFJ7ZiZrX5V?=
 =?us-ascii?Q?2xdajnTR+kEwKGzY2Pvz0NF+zuzuqFImpitMTchICe9Gqu5FVuU/6XYSkBLz?=
 =?us-ascii?Q?eJnK3rCCuQRqN7s+L0N39pUufwVVW21fhLIIpB8LpCGTbmbfAQOblfU0jn0M?=
 =?us-ascii?Q?v7pdr5xH5HJ4Rj+ZR1JIRYqZzDqy9Gws/b7q9rGJzSlwkhNatzb1DkUi0d2x?=
 =?us-ascii?Q?u0k2p2OkUtot5dhkTfMhYlS4XTDUs39a2syLUE3RPzt8uI9T2ntR2JkRg+ft?=
 =?us-ascii?Q?I2Wpm15GyxIc/rT8q6iiurRxlAjeytiEcQf3Aevg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c35e52e-94eb-4fe8-b9a0-08de373f3823
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 16:23:00.0837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svWIWh+upLu3PZ+iFUZ2LW71wVVM5nK2StKe0/AMwiaP/ElI6X3pcUcZM40UXwvO1s9sli5CXJyMPHzuweBHlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9626
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_082307_385115_26D72ADC 
X-CRM114-Status: GOOD (  15.93  )
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

On Tue, Dec 09, 2025 at 01:50:59PM +0200, Adrian Hunter wrote:
> Extended Capability ID value 0 is special.  It signifies the end of the
> list.  Stop reading Extended Capabilities if capability ID is 0.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/i3c/master/mipi-i3c-hci/ext_caps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/ext_caps.c b/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
> index 40939af0b0e3..024bccf23fd0 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
> @@ -271,7 +271,7 @@ int i3c_hci_parse_ext_caps(struct i3c_hci *hci)
>  		cap_length = FIELD_GET(CAP_HEADER_LENGTH, cap_header);
>  		dev_dbg(&hci->master.dev, "id=0x%02x length=%d",
>  			cap_id, cap_length);
> -		if (!cap_length)
> +		if (!cap_id || !cap_length)
>  			break;
>  		if (curr_cap + cap_length * 4 >= end) {
>  			dev_err(&hci->master.dev,
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
