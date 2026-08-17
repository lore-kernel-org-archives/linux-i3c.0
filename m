Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E682C5B572
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Aug 2026 20:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6b9MWjxg8oaghIi9NssYoHDZARHiuaGneFLtw9wYJY=; b=FsM0epWkI4kIWs
	F1t00bBj2bmdmx3qhOYRX0jwTr16o+5y2cNMLoYk60ozF4yNAII+6bHdH3mVl9Etn0w2YgYPlMTGo
	L2n+aY/tmoB9Yz3DbShsN38o1k6ptz04K/LbGxAnqxQjFaWRD96rrLZ4OyzJKWO5oKjuehib4FjZO
	KRKloMKES2V53ZXikpz6Mu7Fc0jsclJbeCjuV4C37682gNj3cyM8Ui1/yXiRqRzhmcDey0lw3oZ+1
	KgNPoSnWoGAOoeS7zjiv4ZdrR1DywrvHY/GJ3nwCb8y19nEOAZHRPbCcZ+aDfMnOLpMAs7bbJ7GVe
	N88HDt8RBdrreMFtAgFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3Xv-00000006lD3-0CIC;
	Mon, 17 Aug 2026 20:02:59 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3Xs-00000006lCR-1sLs
	for linux-i3c@lists.infradead.org;
	Mon, 17 Aug 2026 20:02:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGL+/jLxrWzoLlvpBrwIOUZ9eBHu5te0Mo08cGajZ/PBzlgJ9ONkGb4QKFV9bX+2cK3wdmHXpu0yIFdssdFFZxOnnCT+sbS1h1GKXaB0SxOeopV2OSqUeK5pQ8lQmJBEjAtS+HMrKCUVymcOT/hobsFzExqfM58pRC7ePQa0h3jb+/tyOfTTrCBGxS7dnquhYExI2VNRILZDH5UyegFm3tLfwREuZb3hg4YkpdHxiSgyRkhd7s+91hlNYSyiQeVCmD0mX0M5LolqPybVu8+Br2lPFLm49LoCYTMPkojSIti0BKlaEQt0ZY59A42v7FUrJJ3devxECQ8JFEcmDECMng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPZh3Sn4uA95xngzuJ1QCd//2bc6zIt0Y9ldeB9Np7A=;
 b=vVZ5fkDq3HYez5GgfjYGu9IuFJM+nRYsidMnN2m+PDCL6U+UfZVrm7hcOZgXQt5Hb312VbEIihRYRGJG7YRzUE69tuQs03eJvAtnfKwTJFOAPCYGY1RvptlzdiRVVqoS/EpWdESlC+HiMu08hlBtg1o/yIocOChaOuSdFvnmmgj+CEBWPlp1XhZlevOIzxGe72CskqKdttfV0G2DQTHX8ClTLbBSDeSpfiBqc3x236ieLOXdtAFu3fZ89Bs7KzireJW9s7vP51aph73fx/2JqbcERy3rMYY6dKkubFdpWmZrmzlatWXEYWP+9uaJExTaGbfrKkZK0pmk5uaTIRi2Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPZh3Sn4uA95xngzuJ1QCd//2bc6zIt0Y9ldeB9Np7A=;
 b=Rj2uxVrduw06pSONa7KTX7KLV1u/8I1x6qNRhhc8MnasfVXSwA2jMkQyZSU4PnVK8F6X9e6JkOJ+wCEjqlhc6xk7M4ivOOIfQJ3NyjruTwuPbSvFnTWL1zMjQTcbkmcroNxgpWyJlZplQw+0uwJEOUQ8KpifXAcWwbi4Rsl5M0jHFtOfEoDcjDOBJfKkVajimV2WvwH3WTISFycHp9S95Y6hYb5JFbOFVUcYoP6OAzv/VmGO/rq1cSecb3O+77J3lEN3HNnCWySAqqHSakjd8HBXv0RotdAK6Cw1iMXXAxAtfA3LEHuzaqvWY7TFXcWDnJ9+ZNIDVvcpHdRmkLtmNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8759.eurprd04.prod.outlook.com (2603:10a6:10:2e2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 20:02:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 20:02:51 +0000
Date: Mon, 17 Aug 2026 16:02:44 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>, devicetree@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, robh@kernel.org,
	Frank.Li@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v15 1/8] i3c: master: Add APIs for I3C hub support
Message-ID: <aoNo5Frq1ypam1XE@lizhi-Precision-Tower-5810>
References: <20260817103844.2142802-1-lakshay.piplani@nxp.com>
 <20260817103844.2142802-2-lakshay.piplani@nxp.com>
 <20260817105058.71ADB1F000E9@smtp.kernel.org>
Content-Disposition: inline
In-Reply-To: <20260817105058.71ADB1F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH8PR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8759:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e48a9d3-9083-4636-f47a-08defc9a84bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|19092799006|376014|1800799024|366016|6133799003|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: rTj+FAmFGcu7ATAbi5L54A6RcPeGfy8I3LlrctqlQduZ6n9ZPLkZNyjf5YiRL4YocwObhJHSxGgFYua85EDNylvoufbzYKE6x1kboLgjPHw2IsRrYODD7vWz5nq7wX/lSaqw5+yyJwkySjbsoA36eS63cwAHZbMc8V4Ciqv9HObLbQv2tNWXQ14M3sSrup4UJrc7VZRD2slCdL6UrAxaJhx6fsHRjlGaFN1fZ2kK4MiEF+V4+4YyzuyD+qvdN4Iw2Yz28WIeh/avwcCkLvSuJriyW9M051acUBrW8eKPYoFOyUhv/kut5kV9QH8jY0taAUhjcSJPCDwPsCMPBbpi4TKI5liDyJkDdhdd1kOYRLMs1U8rG+M8EaauFBxv7psTGZWPrho+Dx2yrsxeIJatvJXaQ6u38kbqE76NOyupx8Ar7r9zvy2ITkd8o4Lm9XV+dbZxZsPwTOhpQKlPV5srHBXgtLuxqrs0NLeMAK612975z0Vb/Ei/26JXQ25sE42zKe0booUsIRuz0MJbDShDT8Uxu4ZDx3Jv2V+gVIbpz01u+hf3I6xNre0+9U9U5aD1rKWY/w2jTokTTs7u2eYCHfLO9plXXhLc/KBbIvT8/pc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?a/S6bnTQms9dEJc9gvOB5TKBLYx7X9R9LWDKvZ9x3t9fCOOCrhARBeEXXS?=
 =?iso-8859-1?Q?s4Ps8JhKJtHxhG7axQJLaaGAekLhPoo39pGgf8WVdNUY3hjJe8iLXITVQH?=
 =?iso-8859-1?Q?I6v4gcMNqB//80QXbr/4aV+UfhfJXjwBmQyVjaaMUR6hjmL0bcRRQgAlxV?=
 =?iso-8859-1?Q?uyGlJij8Zx6iYBF12hDhozOKC3H5AwOKRd+xPsYWX6/MXTR3Ko17dOz4f3?=
 =?iso-8859-1?Q?c9e4Etcoaebny8LupyErR+T2rxHheuhC3v5tOoS/+Vtin48rJgA2mWWUi0?=
 =?iso-8859-1?Q?h5L0CYb0pjurscZXmPlH8946FaYet5xHBT0QHpR/veAjC+Bs4kMUQ/5HQX?=
 =?iso-8859-1?Q?FNoRxG0QB2jFlzJVbp9AnnhbDlc4eb+E7umIarumUl9TEXkkUpTEYcFEki?=
 =?iso-8859-1?Q?3Ir1MqD+UOApu2VhtuyuUgVLR7YjuEz3/MwjKLdId3aSLj8D0NRdoGYND1?=
 =?iso-8859-1?Q?wuKI5jHX4NxMmNkLY+/xWuGBdPBGtxog8IpCHHWUB+9rryAglg14v4tyoX?=
 =?iso-8859-1?Q?CupKp2afva+KlRgXHobHj51fphfkRcScnov0OAZ20ZSJeNgYuW6nJDUu5E?=
 =?iso-8859-1?Q?UFMnfhgherj6iV2tl0MzftNbeSbskYxgHYOwfM0z4sfejjdd/FI5y8VblQ?=
 =?iso-8859-1?Q?Pkqsfcex68Sgb2JGXs+hvhulICcgnWWBzpk8WA0tN5g/23Jy3z00ZZzhF8?=
 =?iso-8859-1?Q?/VBSM++Xg/kVsf8R9swODXeTBuYUToGnV6fh5WOUKZPCy7Vb+wnbKEa8X1?=
 =?iso-8859-1?Q?H1++L8xTCQAoEuVyRNIPzt3+A+kyeSFwplNzTuXzNATaeX5NvOGDSIWGmK?=
 =?iso-8859-1?Q?36LpDGlNkpMyk+AZVRDHH/JJXNkvAY6gtpXVI+bv93HuB8PnSl9OlcbGb9?=
 =?iso-8859-1?Q?yNIUeTsWJP4iF9NfCdTHtQI8VvrcGFKOhqsKhiK3mhLvHI7MbGM98YWMoR?=
 =?iso-8859-1?Q?CyXjU+ftC7yLDTkgn59uC64P/8Tb4Wi9Mb2iduixOeY9yZ+0U2mpngbXHI?=
 =?iso-8859-1?Q?4iRaqblR9A2CQ+juC92xrOAwIdlQRx2+C8GZ0YkggMBbTrdlTUQCapZBPC?=
 =?iso-8859-1?Q?5EPNgi1/forGRPQWW4sevDiGnzCCsWUFcoSqLukhbYBj33cFoqDKeTkZcG?=
 =?iso-8859-1?Q?xukKhcNY7iYhCw0mSpb5bvMbK6OGFKKwK5TWENyGIlNelc9K6lSyZUjHcN?=
 =?iso-8859-1?Q?zuJjpJctoGf9NBKbMBenq7fyI3C4+c3ON/adqoOmVp3/1QCmkv30Pm63jb?=
 =?iso-8859-1?Q?f/MZo7iKS0rtjA9oIrxJPniGLF5OS3EZQaOEJ4eS33OVRxUruZZBXX9tgs?=
 =?iso-8859-1?Q?Qvjxdfi1k4uZmjNtKZKmIMuQmje4LpQnEfla0/Hv5bb7fFhkOCeESznMAO?=
 =?iso-8859-1?Q?taFS0B1ti1DsAL8Uugc/SWE0fA1r+Wm9gJGjhRlwDoqT3toM8qlFhqNhFa?=
 =?iso-8859-1?Q?nnCB8GI7RgTft1cg+sWxeoyT6BPgEyDfh3Z6NQenYnleIxeYh5EFlHyKvy?=
 =?iso-8859-1?Q?Qzpc42f2WGz16zyG01xXmmvcR7V5fZAjCAfKIgzPaIc9Nzb+ae4kKKb7Ju?=
 =?iso-8859-1?Q?rX87BVu4qjxGNoqIKW7GeH9v44TxvEjhfk5cdxjDC8mP/TlnYE2d3gUeb3?=
 =?iso-8859-1?Q?A2aOPsAnnBts5RV2GL4hQ3R9r2R4pH80fR0iklFDHBrPJxj7PrvqmAq6v0?=
 =?iso-8859-1?Q?XoDx7YoMRFkM/wUSbZlg1sbgdoc4LQ9+fbBR2JOab8Rp+9+oRebsD0EYfi?=
 =?iso-8859-1?Q?d2QWZfuMGZPcQnAFydHj37cr41dJKax0ZGYD0T30lhbDNICq7GuIyI95sR?=
 =?iso-8859-1?Q?3SG5v8z+8g6U4dXi9JCjKawHmsoFmyyt/rcZL6GWO5MnlDqSdoh/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e48a9d3-9083-4636-f47a-08defc9a84bf
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 20:02:51.7302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gH9N8tVTNZBmP/Pg1y1XnDbLqojZ6RjZd5FCO6muMv6w+7C/ATOH9nZoHY6jG+aeKGjADYePItxNHCCwl3QUwYHgW4J07dtMUeTaqt0jvlGv6pr9/x2OQXugGxxfYvNM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_130256_491868_A1D898F9 
X-CRM114-Status: GOOD (  21.97  )
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

On Mon, Aug 17, 2026 at 10:50:58AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Medium] The commit message claims to add helpers for attaching and det=
aching I3C devices, but the implementation is completely missing.

Please update commit message

Frank

>
> Pre-existing issues:
> - [High] Accidental removal of ID 0 from `i3c_bus_idr` when `i3c_bus_init=
()` fails.
> --
>
> --- Patch [1]: [PATCH v15 1/8] i3c: master: Add APIs for I3C hub support =
---
> commit 14f349144e98c1c3eedcaa4123a53bf24704569f
> Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> i3c: master: Add APIs for I3C hub support
>
> This commit adds helpers to prepare for I3C hub support. It exposes
> address slot management and CCC command interfaces, and allows registering
> virtual masters with an explicit firmware node.
>
> > Add helpers for attaching and detaching I3C devices and CCC helpers
> > to check CCC support and send CCC commands, address slot helpers to
> > query and update I3C bus address slot state, registering virtual
>
> [Severity: Medium]
> The commit message claims to add helpers for attaching and detaching I3C
> devices, but the implementation is completely missing from the patch.
>
> The changelog indicates that the attach and detach helpers were dropped in
> v15. Should the commit message be updated to reflect this change?
>
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index f1be38a640ca1..03fb41f0786c5 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
>
> [ ... ]
>
> > @@ -3352,6 +3427,39 @@ int i3c_master_register(struct i3c_master_contro=
ller *master,
> >
> >  	return ret;
> >  }
> > +EXPORT_SYMBOL_GPL(i3c_master_register_fwnode);
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does the error handling in
> i3c_master_register_fwnode() corrupt the global IDR state?
>
> If i3c_bus_init() fails at idr_alloc() (e.g., due to duplicate alias in D=
T),
> it returns an error while leaving i3cbus->id as 0:
>
> drivers/i3c/master.c:i3c_bus_init() {
>     ...
>     ret =3D idr_alloc(&i3c_bus_idr, i3cbus, start, end, GFP_KERNEL);
>     if (ret < 0)
>         return ret;
>     ...
> }
>
> Taking the goto err_put_dev path then calls put_device(&master->dev), whi=
ch
> eventually triggers i3c_masterdev_release():
>
> drivers/i3c/master.c:i3c_masterdev_release() {
>     ...
>     i3c_bus_cleanup(bus);
>     ...
> }
>
> This calls idr_remove(&i3c_bus_idr, i3cbus->id). Because i3cbus->id is st=
ill 0,
> doesn't this accidentally remove the valid bus 0 from the IDR tree?
>
> This could lead to duplicate sysfs names ('i3c-0') and crashes during
> device_add() for a new bus.
>
> --
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260817103844.21428=
02-1-lakshay.piplani@nxp.com?part=3D1

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
