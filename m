Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFB3E66882
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 20:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=walFfRwflJlOXwuUFYjetvLfz4XbtdM5UI+jVVG8ktU=; b=HNlMqoqf1C0yoh
	PubVpNuOLMmJPeeGSPo0tmiLqeoTSu/Rq3rqPWHfRFR/HfUyUIIFwdgOpMTQXZ43e9p8acZxRXueW
	DntnPa6RCtaoZwBG/8Vu09mpvRkHsHnAlRpMmSfCn3bHPeg3SdmSWLQl1RRlY9q6f+42cfM2W91Ov
	mc0LsdP3Za3A95PyQR3H99ogUPzApe5i3aw4YQ12Nm+Ti3QhNfm7h37JnRjMCRL++H05l/iy8obw8
	73HEYrXmnaa797/AivrAtY8W955qSxtZgTJ0cThcMtO0g338ufHc5+u/oWddO3+3TP1ddrNbxKJZ+
	YEkDK10oTqvAz2mPOJLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWgpN-0000000AvT8-3TD8;
	Fri, 19 Dec 2025 20:11:53 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWgpK-0000000AvSa-2c3c
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 20:11:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDaHGh4xBlvBsWbbjISiRoVvWaGvw4ZpYdaoXGYN3DHIZIhVR5M0K45ENNtIR/v1g6mI9zwWMPufzA4DQ2Htt4fe5ewO+Zc2kLMsQ1TtZjMIMhJICpnqWlmi9MX+wX9QuAnTtu2Lwzy6ZcCFbQzT1oroR/DcUdD6hLAnugSeBWv9Z9dPu0HZApYpXd7+yxL+yxhtk6mxSuE0d+QolUCJtvWA4R4xgNK+aXp3gH4kb5ruq9RX4Q/SMMwFPWxnF1uJenxzI3/C4okEZv2QOOg9G57NQ3vGU4m2F0z9vDWwRalDcobm4cMnEMf/AuBGvMCejXxUeE6UDWf4Vm152IUKqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2gPWcFwTE66ST3pK4Fcc91wntatJ12f3VtM14mej7o=;
 b=JDSU9QNMS/Ek5539ypRkEMIk+Z4lYzUcBkXspTfYSk5mBaM6tntCCIivXcvS9pMZKPDMKQHOxtWcSZ/5infPnNWRGl/kXF1PcmwscvqfSJJSqI8dFcm/tS8suOgQEc1qCiES/MZPta5OPuR+MYyNwTXAEPRYyzh1eZgy41UNY+F4AkQiYVvmMUzzHA3UvT3zsrCTtTN3nZS0rxgGKWlPeb6jHATLWj68wTNYCyvwi6A7ufUacxPfaIZBTRvqfh7FNHJMey6JQJ7r9Wwbm/LXIcs90PHYF4SoJwNDdwI/SV3gc7Y7HPVn17ooOCxXlQ1b2rcJBPaGt+Wu/6DsatBJ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2gPWcFwTE66ST3pK4Fcc91wntatJ12f3VtM14mej7o=;
 b=Z7DxVidza+/60dGktC8z+bkabfjPjfcpSj9Rp32pudnsAKViJdxJS5i1GN0cC1YJi6no0J34H4W+7WuN+kCdSfOAMJHi1+jeSxapPng3Bsm5NUSXymtVzEPizZNh2mj/06rnLUNY9WURvfg/CQCP4k0P2rnPfv8eaKywtlOZTO0o3BxfYa6uEhkn1sQPFZIc781g+9Glqa+672/a9eSBvLOx7vu+Me1rkusoAhugmam8n7oGa7rh3FcpRxPKaMih+KAVBuK/Chekx9ev7BUsGp12I8xUCVs+2QvkI3Txg5qmvMCWZssKIxh9RVMWosRD+YhAoG/oLU1pecT3ozoWbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAXPR04MB8847.eurprd04.prod.outlook.com (2603:10a6:102:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 20:11:45 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 20:11:44 +0000
Date: Fri, 19 Dec 2025 15:11:36 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 15/17] i3c: master: Introduce optional Runtime PM support
Message-ID: <aUWxeOTczXavUbOa@lizhi-Precision-Tower-5810>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-16-adrian.hunter@intel.com>
 <aUWGhscb+6ZYRhzx@lizhi-Precision-Tower-5810>
Content-Disposition: inline
In-Reply-To: <aUWGhscb+6ZYRhzx@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: PH7PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:510:33d::21) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAXPR04MB8847:EE_
X-MS-Office365-Filtering-Correlation-Id: 72635e0b-cacb-4ca8-db78-08de3f3ad4b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|7053199007|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aZyS+xqPLL5tno8OnRR1xgdiBG6c6Jj4W5aLb8sxL4Twp+sbsyG+yNzwJgwa?=
 =?us-ascii?Q?cwHauv5UhH5K/iR8CtHvAZwJYq6oaTJBt6DTwxE8QSopFcegxBscraEvWhEy?=
 =?us-ascii?Q?ZFvnGeamdjEPxEFPJiNXQlilZijC3tc9HvDd6KEH1R7C2oUyGidxT/270Zbd?=
 =?us-ascii?Q?W571SGLWZIliMGvBWsGkb7URV7+xqJpwsHD419DJiYi0VWLkzdO8e28yRIkt?=
 =?us-ascii?Q?Tq1DWjg9a88pfZgYvRJwMhgcHY3tpivNttLhF0am5Up3MzhG31MZq7DM8myW?=
 =?us-ascii?Q?ruwjRc6pKCvPl+b4KZLhf3tr+tySeAF5LILbhoDN0x1c5TI/830Ob0qSHKXR?=
 =?us-ascii?Q?6v0RS4IgnRHw2KPo/9BWdhrXV0eCxDO2swUYMpwtLbkudgjVuT+DESkB+CV/?=
 =?us-ascii?Q?beNHYeedlA8CDsDe6OgLr177WPf803N/hEmjHNgbpQItIm2KyX7J8D+zIN7x?=
 =?us-ascii?Q?lIRA5cAH2X1ggtmsjloDtx6o9zd8SHC9B1szu/gxwH7gg5E131z8VQr/vYMb?=
 =?us-ascii?Q?QQkgUZFHWhAmRWolbnYQXR++MLsKn0lILZfb89fs70m8y4lpty4REYwz6Qco?=
 =?us-ascii?Q?ZpzoNMuTHy9emuiMsJTF+3ODg6LGVCTR1JMBUN1h9cBaHOrnKYggUgrJiaUU?=
 =?us-ascii?Q?hnDXZC0cIf5j9KLpiUHl6phQ8PFRCZ+aWmZviSME3oyeQtoBsvwhXZSEDAJ1?=
 =?us-ascii?Q?6NUM36GNq3b9nxVzeC+ORNEcU5KvQYY1pLsPrwTvyqkM+P33QyF2HAiYV9IJ?=
 =?us-ascii?Q?/DB+05dKkhZ2lH9TUF41yvJpFbN2BYJLF8qOsiQ566Si4zGVuK8Wg16Erl85?=
 =?us-ascii?Q?J1tbx/K174ovkdeEIdzWvkiNqy6ZGbJjETnZ8m/qLc1sC+4Tg+bXBagL8z9W?=
 =?us-ascii?Q?lxp0WKvlOuynJrIKGROrhthII60Oo1qe0Tic99FeX/BtizTV4eyiAzbjPdga?=
 =?us-ascii?Q?I7yGY0u+JpVdWleJfsS0kgKZKNDh8zgUcmR5LDj/IFPGHZvs1Y2KjW+kJK8o?=
 =?us-ascii?Q?R28H/oB3/xyCwELDgMx+lhTvRDO2oSJnAIHZsOvgB9TCnyPwY8xGnYnddDcx?=
 =?us-ascii?Q?umpWKSFC7dwWj8QmmvIdQGHezYhZsSGGut6j4Vy5H9oSlS1iZoOjZItGCWvf?=
 =?us-ascii?Q?K6rzHPAwW5A8ZbO3y9z6icdmLPCFxUHnRLKUtgnqLl2c/SBkTQqb164LXG5W?=
 =?us-ascii?Q?Ux05nzecApgfz89eQqoAbkmO+EleiPu25lR3J6HwPzui3nr1ZMpTiaQpLJ+U?=
 =?us-ascii?Q?be6AzZZ0QDRJpEzdBFHloZ8/66HyoACWGnhDFJrOINL99JlWO4d1mFFmcvMG?=
 =?us-ascii?Q?FTp000ONvrS+Ty9Elg9rXGxuvK6/CSqDLClNNXkXKXjZqLFXR72aBaJy6UU4?=
 =?us-ascii?Q?+LA+tQOs7SVfbC3RNz/9alJn9HJ1T/YGN+s8MbcwIwh/G5v8XmSbJlvA8xHY?=
 =?us-ascii?Q?yzDX+jzP9DxwZaFBOh1FH1LzBwIf/aGt0kXuhj8STz8uG6nwOzKI4EWRcnge?=
 =?us-ascii?Q?WWIveybsALx/59FZ9BoajVgQWv/QShOXag+A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(7053199007)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kix69gwJjYugJ7XKkTJjdB4oXOM8L5vr3AMbsiDCjvARlYJ5kvsC/fcBRWwg?=
 =?us-ascii?Q?xHXGhuVqe/3HzMsh5b2NSuMkPSUUkqzIWB1ADzC8Nu8dUqUMKrLOwq0+lis0?=
 =?us-ascii?Q?l8yPaqp/DFQHDIkiVQlHSA3nixB9V7hvuD8QySLZKIRT5Z2FqSGINxLlxuqi?=
 =?us-ascii?Q?gSXQt44oF18aO0IS2RfMyazU/K6b26L1r+xpHlu+L5ozoebyx8mc5hn8Jg9f?=
 =?us-ascii?Q?BSe+DKTkNihixIdrz7fWa5z2Y7TXWECmyAeiZ+DVxNuIgGd3B0UFt1H14q9I?=
 =?us-ascii?Q?CZX98yM7XY5QKXHnhDhyrDzm9/Cc3pSyPYZgkRyIOTygf92DV4X1g2QlbWSE?=
 =?us-ascii?Q?u34NvhxGMd55dYuyPqHDukLc/JlcIST4CFr1QA2aRS+JYNW9b2xgta+SE9If?=
 =?us-ascii?Q?Cl1JC8p5M4KPVM4R6xfHyDLVt6r3xVIglt9dVrknsRINEgKGqukkzJjVfrlr?=
 =?us-ascii?Q?Uct+GIgABLcFDT+vKF80JGxOgb5o5qjr8dhC/yotlZWaXDiMOvLVSYcFUdM4?=
 =?us-ascii?Q?ECdyiRAWKUA8FGsinOwOw0bx32LXJF6b6wnDbrb99jv0+PXhBB/rWXpjHKx6?=
 =?us-ascii?Q?wao9QbAKupe4ZOIP2m46OF3PdDvJJ47TP0C4K8sfZICX02uKKHEXAHawgznC?=
 =?us-ascii?Q?Ded8WRbAvlnRoV9+0956na3J74k2qnuT1oQbY5Udu/o9b6ioCVTPDLx8e5oy?=
 =?us-ascii?Q?BSpRCt3jGX+Tfcq9lM+RMjUwxewyFxAd178ZuO7rI9+mADKsDOq6QQ6fUBvK?=
 =?us-ascii?Q?X2Gy8JwpUOQmv60IKbWVmHJoHyOMsOzqj2w7ibmobv0TpXuQMtzAxQXofa7k?=
 =?us-ascii?Q?AV2QxHEg8rDBGedSm+GBygQuDzJ262UCrgJD9Kebmfhjl2KFvuq5cBR2Y1W5?=
 =?us-ascii?Q?rwZpG4HTJWJV7MP1ePKeqXrNEAJRNQX/X4L6HeLyWFTWJMnwYqBBxoDV/dry?=
 =?us-ascii?Q?VC4hm5p5WU+WWJq/QcJs5okXHYfUWy8y3GQLwMzXdw6pXcTZG2KkpOZPK8CW?=
 =?us-ascii?Q?8HBQWUwklABkPa447Q5kZdDiGglnvQ0yR5haf6USBAltpZ5oN4xV8z71KS53?=
 =?us-ascii?Q?cyWhDHOZTYjIW3EzSMaBAEaXhjx7yDxJMmZPxZ/Wr5TimPfd6rGEgnIsRktE?=
 =?us-ascii?Q?VA8YshYJaoSn77BMFV05cnp/BpelHJ2qbsnwAcdF7MuLLoNr8uf0Hsv4Vmba?=
 =?us-ascii?Q?viROL22sDpoOK7W/LZWUPmg6E7WeiJ1fSPkUIb2c4f2APO4x/vUm8nYizcKB?=
 =?us-ascii?Q?Zqp0rp7c87vrOeDUgewqgXy0ojYqVvO261iBxeEc9RqkAahfVygnWa/5Mn45?=
 =?us-ascii?Q?q3PUBxgmEvE3XmZBz/hggXcPbVkE+JHM5t0O8KkmWf1HX+a+B0iSkLobMiwF?=
 =?us-ascii?Q?buwBGnA7x6O+7bF2jfNaILUH/cfLUR+9xHbRzq10prDe9Do3CO/kgDgeoUtE?=
 =?us-ascii?Q?NcmFtAOYBXpHkpn0a3/ZmI7wVrmluxBl8bAmwsuvZJjyq5fIcNi70WbElAcX?=
 =?us-ascii?Q?DwxAmpfoDiIIjlrXnhUhR1iitIxTuZo48qGsYS0hCZZY1Wvcw9lKuRMxBjtY?=
 =?us-ascii?Q?in9YUXW2nomq62ph8soEubUu00sTgn7TwBdLfvaqp8S35uJZyrbdMURKWNXM?=
 =?us-ascii?Q?zuY6PiSBqDb5a6Sfw7RCrlYdJOvf981N+23jcJxnL/qW74cg02RUycZo5mX/?=
 =?us-ascii?Q?dv1eRDxQj5kocrBma/rNqhWBmUlha0lPeb8kDTmLbF7u+Hza0l3M1T+max5M?=
 =?us-ascii?Q?CzTRMrtJeg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72635e0b-cacb-4ca8-db78-08de3f3ad4b3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 20:11:44.6928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6HmOA8/ljR5pFyDShn92Q37+sNT2E6YgJCXoXXkOtotOB07+0had2JcCaxfsKCv58teFja7BYh24O5pkZFOOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8847
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_121150_878737_027C4A7E 
X-CRM114-Status: GOOD (  27.22  )
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

On Fri, Dec 19, 2025 at 12:08:22PM -0500, Frank Li wrote:
> On Fri, Dec 19, 2025 at 04:45:32PM +0200, Adrian Hunter wrote:
> > Master drivers currently manage Runtime PM individually, but all require
> > runtime resume for bus operations.  This can be centralized in common code.
> >
> > Add optional Runtime PM support to ensure the parent device is runtime
> > resumed before bus operations and auto-suspended afterward.
> >
> > Notably, do not call ->bus_cleanup() if runtime resume fails.  Master
> > drivers that opt-in to core runtime PM support must take that into account.
> >
> > Also provide an option to allow IBIs and hot-joins while runtime suspended.
> >
> > Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> > ---
> >  drivers/i3c/device.c       | 46 +++++++++++++++++--
> >  drivers/i3c/internals.h    |  4 ++
> >  drivers/i3c/master.c       | 93 +++++++++++++++++++++++++++++++++++---
> >  include/linux/i3c/master.h |  4 ++
> >  4 files changed, 138 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> > index 8a156f5ad692..101eaa77de68 100644
> > --- a/drivers/i3c/device.c
> > +++ b/drivers/i3c/device.c
> > @@ -46,10 +46,16 @@ int i3c_device_do_xfers(struct i3c_device *dev, struct i3c_xfer *xfers,
> >  			return -EINVAL;
> >  	}
> >
> > +	ret = i3c_bus_rpm_get(dev->bus);
>
> Is it i3c_bus_rpm_get(dev)?  dev->bus is parent of dev. in case i3c
> periphal need enable clock or other run time pm enable call back?

After second think, it should be fine use dev->bus here.

Frank
>
> > +	if (ret)
> > +		return ret;
> > +
> >  	i3c_bus_normaluse_lock(dev->bus);
> >  	ret = i3c_dev_do_xfers_locked(dev->desc, xfers, nxfers, mode);
> >  	i3c_bus_normaluse_unlock(dev->bus);
> >
> > +	i3c_bus_rpm_put(dev->bus);
> > +
> >  	return ret;
> >  }
> ...
> >
> > +static int __must_check i3c_master_rpm_get(struct i3c_master_controller *master)
> > +{
> > +	int ret = master->rpm_allowed ? pm_runtime_resume_and_get(master->dev.parent) : 0;
>
> I think rpm_allowed is not necessary. If don't allow rpm,  i3c bus driver
> should disable runtime_pm.
>
> I remember pm_runtime_resume_and_get() do nothing if runtime_pm disabled
> (need double check).
>
> Frank
>
> > +
> > +	if (ret < 0) {
> > +		dev_err(master->dev.parent, "runtime resume failed, error %d\n", ret);
> > +		return ret;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static void i3c_master_rpm_put(struct i3c_master_controller *master)
> > +{
> > +	if (master->rpm_allowed)
> > +		pm_runtime_put_autosuspend(master->dev.parent);
> > +}
> > +
> > +int i3c_bus_rpm_get(struct i3c_bus *bus)
> > +{
> > +	return i3c_master_rpm_get(i3c_bus_to_i3c_master(bus));
> > +}
> > +
> > +void i3c_bus_rpm_put(struct i3c_bus *bus)
> > +{
> > +	i3c_master_rpm_put(i3c_bus_to_i3c_master(bus));
> > +}
> > +
> > +bool i3c_bus_rpm_ibi_allowed(struct i3c_bus *bus)
> > +{
> > +	return i3c_bus_to_i3c_master(bus)->rpm_ibi_allowed;
> > +}
> > +
> >  static const struct device_type i3c_device_type;
> >
> >  static struct i3c_bus *dev_to_i3cbus(struct device *dev)
> > @@ -611,6 +643,12 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
> >  	if (!master->ops->enable_hotjoin || !master->ops->disable_hotjoin)
> >  		return -EINVAL;
> >
> > +	if (enable || master->rpm_ibi_allowed) {
> > +		ret = i3c_master_rpm_get(master);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> >  	i3c_bus_normaluse_lock(&master->bus);
> >
> >  	if (enable)
> > @@ -623,6 +661,9 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
> >
> >  	i3c_bus_normaluse_unlock(&master->bus);
> >
> > +	if ((enable && ret) || (!enable && !ret) || master->rpm_ibi_allowed)
> > +		i3c_master_rpm_put(master);
> > +
> >  	return ret;
> >  }
> >
> > @@ -1712,18 +1753,23 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
> >  {
> >  	int ret;
> >
> > +	ret = i3c_master_rpm_get(master);
> > +	if (ret)
> > +		return ret;
> > +
> >  	i3c_bus_maintenance_lock(&master->bus);
> >  	ret = master->ops->do_daa(master);
> >  	i3c_bus_maintenance_unlock(&master->bus);
> >
> >  	if (ret)
> > -		return ret;
> > +		goto out;
> >
> >  	i3c_bus_normaluse_lock(&master->bus);
> >  	i3c_master_register_new_i3c_devs(master);
> >  	i3c_bus_normaluse_unlock(&master->bus);
> > -
> > -	return 0;
> > +out:
> > +	i3c_master_rpm_put(master);
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(i3c_master_do_daa);
> >
> > @@ -2065,8 +2111,17 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
> >
> >  static void i3c_master_bus_cleanup(struct i3c_master_controller *master)
> >  {
> > -	if (master->ops->bus_cleanup)
> > -		master->ops->bus_cleanup(master);
> > +	if (master->ops->bus_cleanup) {
> > +		int ret = i3c_master_rpm_get(master);
> > +
> > +		if (ret) {
> > +			dev_err(&master->dev,
> > +				"runtime resume error: master bus_cleanup() not done\n");
> > +		} else {
> > +			master->ops->bus_cleanup(master);
> > +			i3c_master_rpm_put(master);
> > +		}
> > +	}
> >
> >  	i3c_master_detach_free_devs(master);
> >  }
> > @@ -2421,6 +2476,10 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
> >  			return -EOPNOTSUPP;
> >  	}
> >
> > +	ret = i3c_master_rpm_get(master);
> > +	if (ret)
> > +		return ret;
> > +
> >  	i3c_bus_normaluse_lock(&master->bus);
> >  	dev = i3c_master_find_i2c_dev_by_addr(master, addr);
> >  	if (!dev)
> > @@ -2429,6 +2488,8 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
> >  		ret = master->ops->i2c_xfers(dev, xfers, nxfers);
> >  	i3c_bus_normaluse_unlock(&master->bus);
> >
> > +	i3c_master_rpm_put(master);
> > +
> >  	return ret ? ret : nxfers;
> >  }
> >
> > @@ -2531,6 +2592,10 @@ static int i3c_i2c_notifier_call(struct notifier_block *nb, unsigned long action
> >
> >  	master = i2c_adapter_to_i3c_master(adap);
> >
> > +	ret = i3c_master_rpm_get(master);
> > +	if (ret)
> > +		return ret;
> > +
> >  	i3c_bus_maintenance_lock(&master->bus);
> >  	switch (action) {
> >  	case BUS_NOTIFY_ADD_DEVICE:
> > @@ -2544,6 +2609,8 @@ static int i3c_i2c_notifier_call(struct notifier_block *nb, unsigned long action
> >  	}
> >  	i3c_bus_maintenance_unlock(&master->bus);
> >
> > +	i3c_master_rpm_put(master);
> > +
> >  	return ret;
> >  }
> >
> > @@ -2881,6 +2948,10 @@ int i3c_master_register(struct i3c_master_controller *master,
> >  	INIT_LIST_HEAD(&master->boardinfo.i2c);
> >  	INIT_LIST_HEAD(&master->boardinfo.i3c);
> >
> > +	ret = i3c_master_rpm_get(master);
> > +	if (ret)
> > +		return ret;
> > +
> >  	device_initialize(&master->dev);
> >  	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
> >
> > @@ -2960,6 +3031,8 @@ int i3c_master_register(struct i3c_master_controller *master,
> >  	i3c_master_register_new_i3c_devs(master);
> >  	i3c_bus_normaluse_unlock(&master->bus);
> >
> > +	i3c_master_rpm_put(master);
> > +
> >  	return 0;
> >
> >  err_del_dev:
> > @@ -2969,6 +3042,7 @@ int i3c_master_register(struct i3c_master_controller *master,
> >  	i3c_master_bus_cleanup(master);
> >
> >  err_put_dev:
> > +	i3c_master_rpm_put(master);
> >  	put_device(&master->dev);
> >
> >  	return ret;
> > @@ -3114,8 +3188,15 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
> >  		return;
> >
> >  	if (dev->ibi->enabled) {
> > +		int ret;
> > +
> >  		dev_err(&master->dev, "Freeing IBI that is still enabled\n");
> > -		if (i3c_dev_disable_ibi_locked(dev))
> > +		ret = i3c_master_rpm_get(master);
> > +		if (!ret) {
> > +			ret = i3c_dev_disable_ibi_locked(dev);
> > +			i3c_master_rpm_put(master);
> > +		}
> > +		if (ret)
> >  			dev_err(&master->dev, "Failed to disable IBI before freeing\n");
> >  	}
> >
> > diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> > index 6225ad28f210..c1ec597f655c 100644
> > --- a/include/linux/i3c/master.h
> > +++ b/include/linux/i3c/master.h
> > @@ -504,6 +504,8 @@ struct i3c_master_controller_ops {
> >   * @secondary: true if the master is a secondary master
> >   * @init_done: true when the bus initialization is done
> >   * @hotjoin: true if the master support hotjoin
> > + * @rpm_allowed: true if Runtime PM allowed
> > + * @rpm_ibi_allowed: true if IBI and Hot-Join allowed while runtime suspended
> >   * @boardinfo.i3c: list of I3C  boardinfo objects
> >   * @boardinfo.i2c: list of I2C boardinfo objects
> >   * @boardinfo: board-level information attached to devices connected on the bus
> > @@ -527,6 +529,8 @@ struct i3c_master_controller {
> >  	unsigned int secondary : 1;
> >  	unsigned int init_done : 1;
> >  	unsigned int hotjoin: 1;
> > +	unsigned int rpm_allowed: 1;
> > +	unsigned int rpm_ibi_allowed: 1;
> >  	struct {
> >  		struct list_head i3c;
> >  		struct list_head i2c;
> > --
> > 2.51.0
> >
> >
> > --
> > linux-i3c mailing list
> > linux-i3c@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-i3c
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
