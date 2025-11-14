Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF12CE8D4F
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 16:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qVs00oTFamfT/5eK7dZh60qD9l4ZXiri+5FNrIeV5EY=; b=BR6Tcuq8oiUhkj
	za6K3Rn92505rE01saXyENtOs8pwadd4D5ZAeklOmoEL+tECjuvmvKko67nmnnwtuyWlvz+H8cBn/
	o2l2R2zeLVQqVoAmruOE02NUyB1fT1jgRmFfhhV/0VIQfx9FOo89cgEYNnCZs+1dEVRcSreGldE2v
	eBcbtYKX6V+xmr41i4B3OuKEwMK6kSR+N4R1SgCJNFmu3pmvCD/09t0wZTvprntKEM7uJW8a79upS
	EeuwDoUNmku108q9n5tSLmyfeWs8W+/7iLWsoaQlPUTfd7k53KIon2YH8peSLhIA57oy5WlgKbHws
	nETKQfDrzeUZtBBDDefg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwtq-0000000Cl3l-0WQk;
	Fri, 14 Nov 2025 16:43:50 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwto-0000000Cl3J-0uIg
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 16:43:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LXhPnVF8Qej5dQGdnb7gt+8VWVEaK31zn6QLRPNrN6mmClzr/YKaD0x4griuR//CmS/15dEwmEkTtYHitZhJ8Db6bVPw3CwMAy5zOB6hJ2NuwhLGqqW3+5v8L1j1/nhtMirfbG3FHy44OmZhIsOKO3h8YiXeFw3IX7RfjyqVAO+QzlomhOIfHK6J73cL/wjpiswulFtjRRBionKM7CatOGNe1VlikoZ5q4ey1YKOXq3eWmVDxKZrH9rIQSpB7G/UYUlvLWq91JisAKN7xEDdxmXHQURWf29/Aois295+lDPGaSujrrqBmXgn5LxKf/Y7hsvLl5dfBm2/MpjkRFszkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddyCEwzVmXoz9ya39oYYNouhv249I/uCcRUnSziemuA=;
 b=SnUYMqqjBSND4Ohes1vyjLXXUIPqt7V/e94opX6zfAmydywiTrMClUGWnzwsRxa/DNvGPd4RCMk4oGFjxWGzvlzcBf/p3Dzw4nBXLH4y2FK9SGkwlNvhzIcFjjBxqtZXHm5ofvUK0fR7q+8UbP4Trq1zeMk5F6OpykNtmutPuRKLQBuqKnlPrgG4Z9sJwE12ByPJuOZoQnUrADNo2xC6B9E0czPuIrQz57/7Gx95HOz3gqpplpqxLsfDvgCKeBkDk/9tFkN70c/bvbYUfMv2uu0W2imeqXqwBkPkveKT/b6pPwpDuz0LA71Hd+MQLC4JA7FpHrsUNo5kWQ8iOKATrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddyCEwzVmXoz9ya39oYYNouhv249I/uCcRUnSziemuA=;
 b=DjjiQYdpTwG1hI5Szeyvkw+eDJEBGEodF+mMjVxjjgtDPucnvJmx2SjyL205LUrXO5idJAwWae8E6VLAxwpT8z+tSPbRxh6Q/vilO80w+zbxNkcjgFnyaSByElPocO1Gz17Vjjem+gD2VaEzvLKELrsZM+Sg26xpsaX3xdghJKR35AaIvMbHtm6nOgUAaptAP1gHuu6q7QALQl0UwQ7Q9l7NqL82zkxzdrLDbO9K1HdsDmeEinUZm3tDDSntH6WviiU1azkdjZ+FCMDkPbzwjVnS3x7aKoI57j4ETe/VdXZXtE/ByvPiEcDEvEOBDS5H9IxljJYlmybGVZQHrO1nYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by MRWPR04MB11490.eurprd04.prod.outlook.com (2603:10a6:501:74::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:43:43 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 16:43:43 +0000
Date: Fri, 14 Nov 2025 11:43:36 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 04/13] i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
Message-ID: <aRdcOH3vXPkxWScy@lizhi-Precision-Tower-5810>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-5-adrian.hunter@intel.com>
 <aRSu/cH5/m1TtZil@lizhi-Precision-Tower-5810>
 <20251114160205b95bb565@mail.local>
Content-Disposition: inline
In-Reply-To: <20251114160205b95bb565@mail.local>
X-ClientProxiedBy: SJ0PR03CA0207.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::32) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|MRWPR04MB11490:EE_
X-MS-Office365-Filtering-Correlation-Id: 976f3e19-e2f7-4531-a9cd-08de239cf8dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?G0XQwGvAqRzFb49SnFeD4mm59m/p/2tBahSwibv6ghvTXoLbGSjwIYKmeq?=
 =?iso-8859-1?Q?C3Kf3HrWhe+zvsoV57mki7diTvLu/ld5GY3LxZCuyroNDVMLb+HInvJ011?=
 =?iso-8859-1?Q?suL6M7lCBDgBrpDb2LLHhX4doJ7jVUG0m8q73vsQpBW4VOTK178obpqmcd?=
 =?iso-8859-1?Q?Z4+kPpjFsqeqaOMwaf4eafJZv3wzi+kS6/1U6aAq5exHAfnAPfPZy+YbM2?=
 =?iso-8859-1?Q?tMERk0SRTyNH2WJpBbo6v6xFJhausUhi2AACXiQJg32+xRZMMMMicigufR?=
 =?iso-8859-1?Q?oij46dDBytUa6CKZPLC/fV+cW09zKeZertLORTpaKjJTAc2htV/NO6B7NI?=
 =?iso-8859-1?Q?zQ7oyRi/ZxnzHKxFYKTZpyempXBrdIzeOpwvJv/Vp7sUhfBWNR/1QLhYTx?=
 =?iso-8859-1?Q?SUHCU14CJ0/UBv0lw2LeuGcHk5bsXbORYVrJZTbYUNwpSbV/+Lwsr/0+tm?=
 =?iso-8859-1?Q?ZvGTARWHSUOMKUzg70vt1glixY3rBYNbJGImkGIhiB3///VXPPC26IFqL2?=
 =?iso-8859-1?Q?LRMp7gYgQoQ89elXiH923fzdvHMU96bhigWUBSdvIKpZzrDIEEDd8TrRSX?=
 =?iso-8859-1?Q?GIgR3b594RWcFPBz6sDrrL0IVYGj3BYHINVelx5gGHGaC81gXnXb7fAjhd?=
 =?iso-8859-1?Q?GxGj25JVY4lyYyzZpICwL08AhHw6q/K1NeQb8/9/sgQMIJ7WiQ78iknI8T?=
 =?iso-8859-1?Q?5TfWMP1iM5Cmpk7qtUqVbov7OBdWRYnkJw3ord2hZz6cUw6be0pmq5bp/0?=
 =?iso-8859-1?Q?8IocIZJCDKsTWyxGzthe7s9WUhXRwaySf/Bn3QG1Gm0hPTS+EsJ/zfDw9E?=
 =?iso-8859-1?Q?5LJOBbYvgqW6hzibSy258o1xLSaq6yPwRwc3H2JMnrH8moNHW/rF2Lboi6?=
 =?iso-8859-1?Q?CBo2O//IwolNnTPkIZ51nziGLzXSd7gE9m6jLfzRQxxa0qWcYU8y20zRfG?=
 =?iso-8859-1?Q?3uYucmmO9qOYwDxRyFpyR186kdKvOisy9iTYU16rOh3wveW37WzKJy6KVG?=
 =?iso-8859-1?Q?jGvJ2Lm31m9MwiJZcQxtMI6UReNWgTCequmM9wwLqWnDwuKaRe9tArLW+H?=
 =?iso-8859-1?Q?5NG0fZs8vJO6ssUrrTHkAZ/tkvahB2HJsLSPM/QPnwz/ZLNhKo+Y1+QU2b?=
 =?iso-8859-1?Q?yLIUotLZlA+sTzq88ANNB+w1fd9bsl0aBdwZQ5RM67d8zOs6blVHihqztZ?=
 =?iso-8859-1?Q?nGyAGKYyu3DaGpnymko6SXUa8ulU9LbRuh335B/TyQfuzIRyOW4kmEf+0x?=
 =?iso-8859-1?Q?/vox4h+/gfLUL8Vibzk/Y0JpGxmD6rQnh6Tw3hRy5JWGBH5CY6G0ejEsAy?=
 =?iso-8859-1?Q?UCc0WPDH0hXONq2oeoGp3MHQwUKV93vH7rcD4aaqHMCL9Ijr0Jz9NFIFEU?=
 =?iso-8859-1?Q?EW7rRhuH/JXfzqyPwnWnQZuxK9R5iWsXDPsDugHcHruXR0VsKL43Aao5nr?=
 =?iso-8859-1?Q?XiRkzptiolzUfGoHe+kdx59zdXOqbfppXPPFA5OHxbJFChAngOL7AJi9sL?=
 =?iso-8859-1?Q?8FS1mykOHKydoeHoXoaMkoqA7K+mug/Q8YH4jq0FfKQw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PiY9yeS2wuC24cOEfprxO1Iajp4rrPwNvU3CEFAnzNdFqYTmroWq87Uphy?=
 =?iso-8859-1?Q?d4kkahctQwf5YMu0jbkMWlCTmHaqb6528ejYimt/AWs1adhGu0xHvZlqvu?=
 =?iso-8859-1?Q?YGt0LaxAiFyIAj4XmWIF+DHEuxJCh8DZckoes5qqdDI4eAPoUhWGt9RyB7?=
 =?iso-8859-1?Q?LlmO5nsi44CiQ0ZAROqEmp8bNYlnLGnauyCz0+vJIOcbb6Mn0DJUyr8SJQ?=
 =?iso-8859-1?Q?6IACVOpzVsLSZSZ46w0Qv0CQV4nD34ez9vv1JRAIYecubFtl9HVwkb+lXE?=
 =?iso-8859-1?Q?BjHWm7cKM2xyBL9+gR+FWZpROpOCSXlDnj17EASFoMJiXpONXWCwxUNE+a?=
 =?iso-8859-1?Q?sIx3ufxEKNq6S/TyCoYZZIteB1y5U0ZEQjLcEBG2jhQWubjFc0IRGZxzV/?=
 =?iso-8859-1?Q?Hc7zR3LpR4zHTctV22vxRzz7Xyw5cURTsADKE25SzyAYN3Zt8LM4VsdUWn?=
 =?iso-8859-1?Q?tyowPLkJ4McgIyKbsAtwtijo2KUBlHx629skd07BQ2goLHjRo7IGXPgvCO?=
 =?iso-8859-1?Q?ssTOQ+rQvhbvLCP8Z90QYtGAdRtumYPSqjj8sAIZyffi9YsQ+/RHCIrslH?=
 =?iso-8859-1?Q?tZHdHhv6boNEV/4mqTOSRewRmCQqoBOEcg7rODU3T/3fc+I+aJZZyatdKj?=
 =?iso-8859-1?Q?4CbLaoRjlDxnROMFcAEsozsMDsZnA6nMReP3j3eWQMzCDNrEJs6hXW1t39?=
 =?iso-8859-1?Q?FcEtvn1QpsUJNGCfalfKDYtVuazpkwE1zBJIGMRgDz3uQbmgsUvL2pNc2o?=
 =?iso-8859-1?Q?bi2G4UaWwGBlyG1cMk+bl4UHV3vFPBzhfATT2s7IzRBBfYcf1AEs40p89M?=
 =?iso-8859-1?Q?lwTvaFNk4fBdpkspMn79sT03CVm3yaaG5bImWo8SsCjoX1yZGHoDXhWmnC?=
 =?iso-8859-1?Q?IZCgxTz9hLDDDCtzq8OeGblVhPK8Hwh9WyW3e4n3ZNZ4dm3CnF8birhfDK?=
 =?iso-8859-1?Q?nVQkjHSnN90+ZGKJ+G8soeALShn/oej7lhKGbcL9CL4TDLikyxG4JV+HYr?=
 =?iso-8859-1?Q?SkN23CwtoiLnk9lNo6SF4M8zfRfQKHeaBDJuJ297xLZiEBu0FDVXmzZigT?=
 =?iso-8859-1?Q?aNy2LTn0J8WGQnCts/ZoPgN9s4scVIIhUHIUds7EA8eohdXXYcpbqaKTQI?=
 =?iso-8859-1?Q?r6okMSPqk1BrBSx9m/JxyW11GN3R94wOTainEo8icXDog6J21sTuDqt9lv?=
 =?iso-8859-1?Q?72TGXnMfKzvVwasDHhlFA7P3XxDuefyBM9+W7yYfQhulOi+BIua2CgUQ3r?=
 =?iso-8859-1?Q?2NzI6xsfgYAsmIC+KPS51IE/+w87mj6gm1Q1cTWnOaxMAwHO6r0Qt9RGmF?=
 =?iso-8859-1?Q?mjTHMRjQa7sjm/jjORyAvNIXKiPhDQJxdtCUdJK6yWZ0yzcSxcssk6n7Uj?=
 =?iso-8859-1?Q?Kqvm7O1uHXckrdAc+qI2JWRgLDAeNGeZ4uCPFgLcJqMqV0B4IwougPw/kw?=
 =?iso-8859-1?Q?niLbZY9uOE1oyK+7v8PBqqbIq46p9udUz4QJnfeCLWCH3rWt1sMBN21v2r?=
 =?iso-8859-1?Q?EDUeoMvnxTxHPw/obaTLvrpmUQzBWRC8k/qblf/4pkLluH8A8HCwoCEYi3?=
 =?iso-8859-1?Q?8Fp/lWnXJGQ1CWFimJxYfUSWsHaR/r7jgesBx/9O8vqrRkECmbQ1Nr79Rr?=
 =?iso-8859-1?Q?+zXPA+kZ745cSQkjDO+iAfUQW+4edLEoqO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 976f3e19-e2f7-4531-a9cd-08de239cf8dc
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:43:43.1729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wgfq+4AspQXgzZvGofvAQTM1vcTxZ1m67xkPBXtPe4BsqxPus23ZmWy61Q8kh/KjPvFHIaqcT19gC4fnlrCRbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11490
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_084348_259932_E7EA9616 
X-CRM114-Status: GOOD (  22.55  )
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

On Fri, Nov 14, 2025 at 05:02:05PM +0100, Alexandre Belloni wrote:
> On 12/11/2025 10:59:57-0500, Frank Li wrote:
> > On Wed, Nov 12, 2025 at 12:03:30PM +0200, Adrian Hunter wrote:
> > > Use readl_poll_timeout() instead of open-coding the polling loop.
> >
> > nice
> > >
> > > Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> > > ---
> > >  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 14 ++++++------=
--
> > >  1 file changed, 6 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/dri=
vers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> > > index c74cc511a344..c15e0556a691 100644
> > > --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> > > +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> > > @@ -8,6 +8,7 @@
> > >   */
> > >  #include <linux/acpi.h>
> > >  #include <linux/idr.h>
> > > +#include <linux/iopoll.h>
> > >  #include <linux/kernel.h>
> > >  #include <linux/module.h>
> > >  #include <linux/pci.h>
> > > @@ -24,11 +25,12 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
> > >  #define INTEL_RESETS			0x04
> > >  #define INTEL_RESETS_RESET		BIT(0)
> > >  #define INTEL_RESETS_RESET_DONE		BIT(1)
> > > +#define INTEL_RESETS_TIMEOUT_US		10000
> >
> > 10 * USEC_PER_MSEC
>
> This is super hard nitpicking, I guess everyone knows 10000=B5s is 10ms

It is from
https://lore.kernel.org/all/aPnrc-Z5WVJorGr7@smile.fi.intel.com/

Generally, I only provide such nit at early version.

I think benefit is avoid miss count 0. Maybe C23, 10'000, especially when
number is big.

Frank
>
> >
> > Frank
> > >
> > >  static int intel_init(struct pci_dev *pci)
> > >  {
> > > -	unsigned long timeout;
> > >  	void __iomem *priv;
> > > +	u32 reg;
> > >  	int ret;
> > >
> > >  	priv =3D devm_ioremap(&pci->dev,
> > > @@ -43,13 +45,9 @@ static int intel_init(struct pci_dev *pci)
> > >
> > >  	/* Assert reset, wait for completion and release reset */
> > >  	writel(0, priv + INTEL_RESETS);
> > > -	timeout =3D jiffies + msecs_to_jiffies(10);
> > > -	while (!(readl(priv + INTEL_RESETS) &
> > > -		 INTEL_RESETS_RESET_DONE)) {
> > > -		if (time_after(jiffies, timeout))
> > > -			break;
> > > -		cpu_relax();
> > > -	}
> > > +	readl_poll_timeout(priv + INTEL_RESETS, reg,
> > > +			   reg & INTEL_RESETS_RESET_DONE, 0,
> > > +			   INTEL_RESETS_TIMEOUT_US);
> > >  	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
> > >
> > >  	return 0;
> > > --
> > > 2.51.0
> > >
> > >
> > > --
> > > linux-i3c mailing list
> > > linux-i3c@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-i3c
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
