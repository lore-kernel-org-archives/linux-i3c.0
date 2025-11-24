Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C62CFD313
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Nov 2025 18:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGR7ppY7iSLhtFKKcc6Iz0Zx7Pa3INuKFR+c60oSBcc=; b=SGJBlp95iP3OuZ
	8ipy8XfnPMmGEq0MkzjoK1rMTp1kT05QJm9IPaOpGlU1jBYqzwRNxqPug2dHsulzWCPVn4nlUFd9P
	ag9aI1sfzhRGUEprty7iUM6OziWFyFGwIzTp+pwkQBuywn/hc45K9g6xmC/VIrnN2vf1dVwe5tixq
	eKfDDVV1fhLxnaMTBJtZbY7eTVgdToVEOOYtL96DrnPr96jkNJYQlj2bDCKZfqoIKiJQfo3abHPVb
	oQE+VopBH4CF39LlGzjvqk6v1ZxV7CV3R+rnxNgh5IHr45impqTrxWs/XG/bw9JYYsaLEKkhjQAse
	G90Tbw0B7szuJRq5wgIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNaxs-0000000C9Wg-2hDE;
	Mon, 24 Nov 2025 18:07:04 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNaxq-0000000C9W5-0joB
	for linux-i3c@lists.infradead.org;
	Mon, 24 Nov 2025 18:07:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FyaiB+5VkDzaJcgwTVCNlk12HA3q606v9V8b0303V+xm39irAjM97PETjfYZz/1PkZL8tW9VUTuYEx9/+ILuFz6imwLjtd35/NrMsksu++T8mo6z2hihYRx3Bte4FqKcbTdNVJPf4cQdaWOJMMeaXfH21wX1g3VhIBz17jpGOI0rHT5B4EIXQwHmJP8y5ewIYL3GWjAjBdSimckjNMzgYKPgvGWdNtaI4HUC9EUMJzcYl7wq8SYjWDhmBERoCIMjpOV1vPb1fOusU/vWGPGvS9HC4Ov7kjVva2ScmzwSeuhQGrUsFJJdQpJkwGxVBfkJYslYk6uxSfriwWkxJbrcdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7e6mFPAeQ8grYSIg+9jT73jEYb9RNW6vTpfwd0M6hI=;
 b=O/XKoXerCtelrNyiPzzTxsQa2++ZxO79iQY+QWL+RXJUhZIY2NzEMDE9UNB8caOIb5dRwSaZIubxuRtbu9Odovzv/KnpPyyOEjk2ujuO7+Hp1eFQUmp4SoBZ0w/pw9UdBTc7Lv31r6ruiWFSVbnJsa/pioug2GuyX0A8lBEly1UXRoSHMVMknL35jZUDKf0CbSvNW/JwSIgZwLlF+p2n8Dv+wGkdIxhNhbi/iMZ6GepcE1CfWy9+2YK2Oi4Et325zJKpM8wb+GOBQkn+XwRfKXnwIwxnlW2l9No92/BBLwIjgk73PVHFz0i2HEg5wK7r6SwKjrqLxy4uhThC3fzNYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7e6mFPAeQ8grYSIg+9jT73jEYb9RNW6vTpfwd0M6hI=;
 b=T1NCtwgEYZlIf9JzR0bA2Mm5Ns1SDvfXm9vRnD1rvsBQhVUOtC5sAHEopv+dIayKOCAcKhVThUmjTKkMzMYpFB3ePboaqaPiJDLtP/BX1Asfg+K/7arpOB1iElq6fS0Upe37zJyB2lAQjH/IGnbvUD6v9iT0EaPKmCvIWvLNYBBxB4fZPq6DaRd0aWTzOAa1B37x7oOBKcVMPbrsHFkzSCL/8eYv2BO3xiaU/wv+N4bBPb/9dV4q/wsMC2F+HR5x1syMlAAzFMdc2lgX/tjf/tqW6WTre8/wdNGXTx5KOe4WuiLmoqKYaUOCGTKm69oWUmo/575rMnB0pz0A3OkmPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by MRWPR04MB12118.eurprd04.prod.outlook.com (2603:10a6:501:9a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 18:06:57 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 18:06:57 +0000
Date: Mon, 24 Nov 2025 13:06:51 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] i3c: dw: Preserve DAT entry bits when restoring
 addresses
Message-ID: <aSSeu6HFXLIcVjZz@lizhi-Precision-Tower-5810>
References: <cover.1763747151.git.adrianhoyin.ng@altera.com>
 <4e73b935ea8283114a4bbdec1a1ca38ff9f5df92.1763747151.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <4e73b935ea8283114a4bbdec1a1ca38ff9f5df92.1763747151.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: PH7P220CA0074.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::6) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|MRWPR04MB12118:EE_
X-MS-Office365-Filtering-Correlation-Id: 171dd1d5-0e3c-466c-4fcc-08de2b844176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UVkwHzWpmXoziXtO7wKhme6FBO3/FldsCP4AhtS5wOVD1iCLJuL/zA2LDrjL?=
 =?us-ascii?Q?FMuQFO85/jorUUsl8ppqxtjWjvc76am8P4xR59B1tTKIkY+HRIFxUhUulgc/?=
 =?us-ascii?Q?BQ3PaJTTj2nFpF5Ve1NP3s1Aaa4nwSDMJwXOF6zcOJNZPlfuC4tAQvbfOLBo?=
 =?us-ascii?Q?qYrS/vm8KldiZ595/dSnKwSHui7N1Gg7TRPYQXXqvs45w3spTjjL4ed8wPFZ?=
 =?us-ascii?Q?v+fYt/uDeoPUqADjtqs1sSLNbEQuv1LT8Hrqt3yqNfXPxT6W2b114IBjA3+a?=
 =?us-ascii?Q?pRETelJJzLcZzku8bBs+Gr13EKJOHetpe0nFKQMXsFEelcv4nuuckQFklZNL?=
 =?us-ascii?Q?/6mMY0zbnrcL6PlvhrOYl1+tNTQZBRNtnXPf9eNqMOOE7ihL/SWD5r/zXJpg?=
 =?us-ascii?Q?QPMw1hPd+ENqVwlM3toTViTCdeVKxF6gy78JNy4swQuRmW97fOfGT8kYbsvv?=
 =?us-ascii?Q?QRrxXFyGyU4jM8GnYTO5ZBsqU2xb61MmVZgDdpoFYNme3zKF/31148PzIcPz?=
 =?us-ascii?Q?ymWp506oNcjw9PkMxP623W/sKq4K3N7TCGD7fQICcc6EOSIu0f5SJZx4YCKZ?=
 =?us-ascii?Q?RUH7fvECvr0WdIwfp+0qiflo6zThyzxW6VH5yqlRRgHP4oCKH5NokYKiQibS?=
 =?us-ascii?Q?2rhzz11/wkcYAqRkoIeeEBv6hOZ/PJyvAMcJO5e0p007PlrLyO7qZWG2OEZm?=
 =?us-ascii?Q?cZycWh6dGABb9LUcPusExAqvm2gohTeXW0FmI1deK++1UhcL3T/WrrXaHMfU?=
 =?us-ascii?Q?zT0V9ajt6/05nBqf5rDgtw+Clll9AdHlReMldEXMZ8uU5BrxzK0LcfJf3B5e?=
 =?us-ascii?Q?9dwodNHx8hBZQ0CB5yQ5YmZXWJ4k5mUMePm6oCP4KDop6YhJ49DvhUDJnjz7?=
 =?us-ascii?Q?w/W1k440gYOtC67jRFCW7y+wLyWGREIyFrwdpOUmvdGhtmTBk48ZFCXfCDAl?=
 =?us-ascii?Q?+aZsanfCWZiQxzeb3b3bpZxd/ccBT0Hjx1jkDgHwyOBj/sW1mTXLwUU+u7jA?=
 =?us-ascii?Q?LYTvNQns0fT321xgppvFUvk0nC4XXwy6Jk4kGIqGbT0zLDvMZxK34lJcG0fJ?=
 =?us-ascii?Q?mYx/f36m2ymY2zIVjZ6AHa2BqwtNGVciwF83+7lxoPCqzUqQTcFqdcrt9Zkx?=
 =?us-ascii?Q?ua/8YZvhs58Eq6u4v6jt0+1S+B8CbAlx5m4MrZ193VJ68d/fZBAHjrwX/IE1?=
 =?us-ascii?Q?v7Sn1VqnbGX336ytIVnSaPhQTCqmj/957YoFNtoWS0wrVJNjBxaPXxy477Z6?=
 =?us-ascii?Q?1w+BdT77qkyzartdFJA3KPvWJVb+lZeXR5yJ4xHqZ+DD7FRtww+YB/lbD7+o?=
 =?us-ascii?Q?1HHf+FM5CO8Wwhjvpxxlya//37s6yVRXzMHVVHPzmgVHoMsS4At1H+GmndbI?=
 =?us-ascii?Q?ZJlp7Dzl68LsJCLHspe9QtN2uOJ7T+0+s7rsEFXf4skExoYRPl5Eb7WNW2iB?=
 =?us-ascii?Q?LzexnTuxohZOem+3fGgJv4UOjRCI4N4rrPljaq2M8OGYUrrjZP64gvqX2IqM?=
 =?us-ascii?Q?LeHtIU2t69CjUluSprw/2m4a8tGhPTJRK3oL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vEpbrES4IopJaJStovQ/e9IatZtl4oAvM6ENbrffOCA3qnREHo4gMuxsERd1?=
 =?us-ascii?Q?WWsqJrBHhYgEZFQbd9hvfZydtbl5LYFy9jJ2bOnUH3RFYxx/SRb3aXI07+KG?=
 =?us-ascii?Q?5DMC3/H+KQy81BGHj+LyS6ZYUpceUE+4qfTFzg5LwbZwG9DnLYE5h0KSqSkz?=
 =?us-ascii?Q?hV9C+Bk4hZhj/tBiWg+JjnC+bLGG7BwqPByiOGA2xcRFqeB1h61buvJjiSNR?=
 =?us-ascii?Q?EA5yi2+M+MqckedxfD9uZGjFnd28i0vTe0Hx3jfKrID06KdTAn9yLbj+Ha1Y?=
 =?us-ascii?Q?m8xLBbVX2O83S5lD8y3/NizGltOT/QX88DUGttkf897CwqTNMJp+rFh6oSxF?=
 =?us-ascii?Q?VFZ6TJ1pbMM+x9QZk2mh8SMomgOoZ3DerKX33qt83hlFpTxMN4sQrZAmCj9A?=
 =?us-ascii?Q?I7jPd8ufOdNohXVLzmg81UQr7Iev2yVEfB7g4qpHdBuTg3kPAk2/HibKnJ0O?=
 =?us-ascii?Q?PtpalXWkz4H1MhZ2ue+Bz9UbpK9MABK4Iy1kGbpFJqXQeTK8by5WVCVqoycZ?=
 =?us-ascii?Q?utRODxhpjVHMDTxb8S4Xug26z7fR67Km9yKxsGFfv5UyvANOU5W13423yLC5?=
 =?us-ascii?Q?vgJPlPCk95aa/Ou2MvLP5fB/KQ/N18XSK/93Q2hxusG6y0bnCs+jqb4N3syP?=
 =?us-ascii?Q?HqZRBDjV8Q8i2Bno1dAC9twRVxbzUQ63iykcu+I6P1HV1WbOPtmncyMzwSJE?=
 =?us-ascii?Q?0laNQQtuMJ3NXWF0DyrJ2tQmMfsrV/7tQnmtqm3d9pqFMg/Auxnj6EtuVrMm?=
 =?us-ascii?Q?3iS4DLoQ/SUDAEAQrp+IcT6tZgeFWe3cZUKoylVzeVwe7KYJkz2JWL8H1SMZ?=
 =?us-ascii?Q?sjDwxje8W//m8Z++QhjfmxZ4fkzBOUWnIMKo8Un3m5RL700WpaAt9p6vfYdq?=
 =?us-ascii?Q?HGMW4T87D/txW0Oeq38PxKe0iQ0IWe704SA2EMLLj9uODBKABb9ge9AeiZRV?=
 =?us-ascii?Q?ZsYRR7ASW/L6Z1PLJWOKeMUFOJKne7dz7coJe7ShOU8t+WUGtiSgBGWHElkd?=
 =?us-ascii?Q?Gh64pQOKxknXo37J/ALvp71bHIq5gUh24oLKE0a9wSm7sjAelpQU/P6NZ53Q?=
 =?us-ascii?Q?9e3KRboSE/F97YEU86sBZKZeLKyF/Jxq628FmYBBgYW2rIHMcbCRq1nCXi/U?=
 =?us-ascii?Q?0nCMLvOWEo0JmNFQMWGbKY/NFXC0PmH/lXv4Sug7u5wpNz3sEA+96WrKnvlz?=
 =?us-ascii?Q?yFdw4fHR9rqIEZmsCrzLPkQTC7MpLePY9X39XVkhzxmMcLB1tPhsf4Z4VHQT?=
 =?us-ascii?Q?dSNHlVCVG1K5kuoLzQGVG8XuQvyzU3zhPMNcNAhC/SSu83mKV/eEO64Tv1IJ?=
 =?us-ascii?Q?jmtfXXtkoG8sLD52IBBws4LCH3KX2Ueg67MmIrmW4NIEt3LJuUMZnfQSiFRf?=
 =?us-ascii?Q?AR4zo5Hcm6z93QF3guyIcXsiRmXTfNswfM3JJM1q+t/0qQCmAF8fv315OYwQ?=
 =?us-ascii?Q?rR3frtvBPsijyqNakjWU3asBrGojXEJLz0/XTHIN3/vCLYiHntSvFk4KFoom?=
 =?us-ascii?Q?wwzQ5Qxea1FFJ+QKojjYG1WG8kgib2Kjl9Ai40/IDS3S40bBYufJAfv5EZe5?=
 =?us-ascii?Q?hM1DotT5/cZLW3C/YH+Xqk9uIi2BS3ZreDdWe+EA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 171dd1d5-0e3c-466c-4fcc-08de2b844176
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 18:06:57.0427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cohk3VHx9rJheUgfA1r0h0Afb1vYC11ZuQddyfWvAnSCKuUSMM5bL3NGSZsFdQEI36BHF6yLFAi0cS3N5HSsZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_100702_245934_41CAB4B8 
X-CRM114-Status: GOOD (  17.28  )
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

On Sat, Nov 22, 2025 at 02:00:41AM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> Update dw_i3c_master_restore_addrs() to preserve existing bits in each
> Device Address Table (DAT) entry when restoring addresses. This prevents
> overwriting configuration bits during PM runtime resumes.
>
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index e228c60840af..37275f7b6c61 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1723,11 +1723,16 @@ static void dw_i3c_master_restore_addrs(struct dw_i3c_master *master)
>  		if (master->free_pos & BIT(pos))
>  			continue;
>
> -		if (master->devs[pos].is_i2c_addr)
> -			reg_val = DEV_ADDR_TABLE_LEGACY_I2C_DEV |
> +		reg_val = readl(master->regs + DEV_ADDR_TABLE_LOC(master->datstartaddr, pos));
> +
> +		if (master->devs[pos].is_i2c_addr) {
> +			reg_val &= ~(GENMASK(6, 0));

#define at MASK for it

#define DEV_ADDR_TABLE_DYNAMIC_MASK	GENMASK(23, 16);
#define DEV_ADDR_TABLE_DYNAMIC_ADDR(x)  FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x) //(((x) << 16) & GENMASK(23, 16))

Create a patch to just change it. And use DEV_ADDR_TABLE_DYNAMIC_MASK at
this patch.

Frank

> +			reg_val |= DEV_ADDR_TABLE_LEGACY_I2C_DEV |
>  			       DEV_ADDR_TABLE_STATIC_ADDR(master->devs[pos].addr);
> -		else
> -			reg_val = DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr);
> +		} else {
> +			reg_val &= ~(GENMASK(23, 16));
> +			reg_val |= DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr);
> +		}
>
>  		writel(reg_val, master->regs + DEV_ADDR_TABLE_LOC(master->datstartaddr, pos));
>  	}
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
