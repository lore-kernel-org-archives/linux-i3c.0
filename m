Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BDACD8C9D
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 17:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dm00Y3YuV6C4KeVlZutFH7tw+HVdx82BEfVqBpdKDh0=; b=kJ7sjTw5LQIs4a
	yPN3GEyhetgIF4rQ4WRxjFxzO0LbP80ng+Ev4keV6oGs2qUdFKqetMCRofHWWKfbEiJts4v/VgyIb
	SQ33/4EVKcd7Aqm1CvbhFw2lzo5hGLY5SBgAPT5FDBXd6s2SlStn6ms5k2gPHqKnuAYCh9NVEjIYA
	vrdzyRQz6/OoXeZ2ZSHkh6bFOH6TXW2bpAjM24fAKm+Dr4Aq88tmkqOwt4HgDRiSdUoldrkZnCY1s
	g7UnDWrP69McPKd8lLt0pigG9WhQJy2ko+DipPiQnSdxMorz9qem0p75psLu30atW4HRk3KyW107R
	97+VwfjTmj+EE8FsuOMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdog-00000004CVG-3xzd;
	Mon, 08 Jun 2026 17:31:15 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdoe-00000004CUZ-3bZl
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 17:31:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5XEmi3NjFnYQAGX8RhM6ZBGmVi5+WT9YbYWSHNvpNBAAZo+EJuA3k4P4S7H4quL7FPpQnvd5pIGpR9iJbL3FnL5PPNzLZn+bT+Yd3/aj+8DBoN9tnLCgGIOUYVNVZY79en1nZJmh7IWIHAdWzYWQGg77BEB5qEl43KrMVrfatO23ECcozQctJSuCkpdvvpM8XH0oyUDZRXPiiOIuSlXVG4t5UYdvD8aOfGiS6F3iDp4Vo/WP4K87IKMGdnJ7cdDxc5vJ715j+b6DD27toN8sagFdUmZPtlvj5VJU6eeFInGZYOZam3noZ43LlkCU1oNNnEMvuj8P0hxVtCSS1XxVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9S6JyzWKoTv8JWGYhnwUfVgfuNwFVDEn9C8YWZz3cDo=;
 b=MIAI2YXgdlzHwIQmJyvLPsPjOtm6Q+o01Ey0UwKe32mloW6xeuq5PoCUyyP4Zne4hUPiiuzM5Nim0dN1zgDEt/jFwl1DWvLAFObLgPkAvipGe9c1cWb/t234/wiOTGtFhTkfzHdR78PCKQX+T8E3EZF/g9eXAtyxOIamApg4TCOcYjlBO7Bijd0FV2rWvPlhvdpG5Jn5i6qqTmmvmmocH5qy/sD/GLgmap0u+D+Vvz37ayq7u/1CWP24rUkJpFnVm5R6rmyJ0Ahp+Tv8sYE6FUeQ+hUSF4UrIboMqoorqnRlv5HymTepDD+YaR2ZALibH0B2emdQ6/I+uPXJ00Onnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9S6JyzWKoTv8JWGYhnwUfVgfuNwFVDEn9C8YWZz3cDo=;
 b=bSBHpV1AsYwSGvUKAfioIqnIv9MRzommLN1rPzFYcptHBaKakdbIY0Mm6b3DryYqdf2Qk0b7f/tT7qeGXooJKa1lqDbetqZ2V8N0iQx9NGQRDRxq2Apn5ef+vJILQ3xeuBwb9m9rZTKHJbLu4YzPOotkkOW1RnwjrzeJt6EqZM99BSFrf+4+DXjraqUcKtU76IciU6i0Mp/DsSLHDT1tU0wucS8QBOSpIZ1WfjYxJST1B0rsiJkHrkcGBArCMCKrfd7mWFmVvo8U1Qtq2JiBwJPmfLuaKQwYxt9HOWBH+MaaCf+QAQA746HyCEAKFeR2JsFkAm07SBSseG+1uHcMFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB7095.eurprd04.prod.outlook.com (2603:10a6:20b:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 17:31:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 17:31:07 +0000
Date: Mon, 8 Jun 2026 13:31:03 -0400
From: Frank Li <Frank.Li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/7] i3c: mipi-i3c-hci: Fix race in
 i3c_hci_addr_to_dev()
Message-ID: <aib8VwukdlXvqJT2@lizhi-Precision-Tower-5810>
References: <20260608075801.16111-1-adrian.hunter@intel.com>
 <20260608075801.16111-2-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260608075801.16111-2-adrian.hunter@intel.com>
X-ClientProxiedBy: SN7PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:806:f2::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 061b46f9-2623-4f48-4f0c-08dec583b956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|22082099003|18002099003|6133799003|11063799006|4143699003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: Nag6GZ0YPEW842TllnTC8dg0BynUfuF2t3Y7cHicLuYBPXp5YA6rVVzUrFr/5DWH4NbuOKXQagNW3Ff4Fe/txL2ID1VVBFQJvpE0x/FK4cazFn/Gjmr8H1f7UHDDQeo0qaKpsGboucm9Ix/KiHDdlv2EmarTnkibmZTaCGnpWAR52uFrMN/nIkcalBa1YRzc3SdPjVjDscYAE531cqts6kEEOD2TV5IAgs/fN+mSfhcuHgLcM0odMv+0AJJLGfnaffeF/g8WXFyvDFLh8NSa0B/qJfFQkPGE/PDNh3IwsllD3RKZ1lHaHVpHgRuT1yXJa/88aMeY4ZvBnlu2qRZAWZdp/9AYGjYApRtdfDsaIusNRos2BWISC9M9vcAAmEXiQz8AghtHM/zG07ju0mr6+8rGYLjVSnCo+NImHfbr2T/bYcu75cdyAY0mevc/nWhKh7ND8vI7WVboE/XRab2DVi4nveWHAUNHXX5TO9fG/jzR7OHX5LrnezvSicEBmf0CEV6FQVP1ZpiyG8p19LG41Jg87UZ9iL9xi9/556LtqyJJTqhp1013ve8NoPAljZo9in0xs819TnP+DEUFF6p8VGjwgGC+RjLrOIw8lmbtxbCkhD4oEE+w0GaYByteXTa0CgoBZJK4HAKSkNpXQtKcUPzFMcdN4qN35RKULBjj9hVvBU22thqYy4eA/JDhaujN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(22082099003)(18002099003)(6133799003)(11063799006)(4143699003)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JIvJ72oTIXGbHFRg/yEuqeAowc1jXMHUHUE23jRuPrU3asE1eY1gPb94MxVd?=
 =?us-ascii?Q?5+Vr9dTywQHK5xmxyJX90Y15sRNepDWwN1L4EWzpw4vP/7N7AZQCwuxRV3cJ?=
 =?us-ascii?Q?HQ1C93/2duDYCaM3D3MXJzjmaPK++VPeslsld3UnzI05PtmfLNvfEWqRnqH6?=
 =?us-ascii?Q?ROmvz/E71AI9cKTldoCG4eLWGBlrvPSYSUzDgQ+n06jHvfTkgNxx+W1YSMkg?=
 =?us-ascii?Q?2a7L5gZah+1dEle074GNu+j0XWXHcR67DXVQtIWJhngNUrHXKqzJUrvO535/?=
 =?us-ascii?Q?EEiqBw0pnhzdGsTIP4xrlEVBKywee8RNpVdjsXXA0FzUCQ+RY2TP+F9AWVHJ?=
 =?us-ascii?Q?Qk+RvoL88xTO/vVDrGsUy5+qCZWzbvYUcABaQ9hE1Tzg7Yzh/0XWq/tNbgRG?=
 =?us-ascii?Q?njQihhxkON0FOUiapxGBbCbvyEFegoSMWLPzGtvwISbCXZEvyN4w85BgN/Vk?=
 =?us-ascii?Q?Ft5/Hv8B/Y1LMYgR4OU7GlQRs0zE+gSLoTk04Kwpc7+oYUgePWssh60mMXfd?=
 =?us-ascii?Q?PpVI0XwalVRhiDNIOO/rEbIMSSrqlSwnO2XRngY8QkJNDfmErZgH808cwXkU?=
 =?us-ascii?Q?QJ0NG9ycn2eicmUtL9Mp+3m2lDulBQI2EzWc5xA8v6gqJjHH5m65crww3cOX?=
 =?us-ascii?Q?bAwAmK/XcH3UZqBGdV8bI9aCidqYvpF4m98Aj3TAAHfzmYhNcWczxNt3BaW4?=
 =?us-ascii?Q?RFswXHS1YfgF5QiYb/bPX7uKe0PjjHPTC2zLs1wlLTlijfswKBRNoL6Znh4+?=
 =?us-ascii?Q?TgyCoVD/lSkL+2WSTU+XlQfO//CNHWAPuKuKNOb1EBUvkIOmht7Bo//FSJ0b?=
 =?us-ascii?Q?YbTD9x5q83HiLQav/rHPYAutQ6jBqx0C8uC099F7BMgiHGBc2wamhCvsa+fv?=
 =?us-ascii?Q?BvatdVh4V2gjmABK45jPXwd/jIEqA6sw3RtXIiQxFoTWdqOdAy7PlU7+T3Of?=
 =?us-ascii?Q?B3bOyMNdZSIDym8NUpF7hLqR0nP/fNqs5FWsxRE+Zzu5jbB9RynRV8mWjv1A?=
 =?us-ascii?Q?BkHStwUg/H6by+x0BNZpcEARyj+PdvLFDQoll7HGOkuToX9WAU99RRLH6gaY?=
 =?us-ascii?Q?80cb6NU/7V1vxicKsrjrsrNjiM7GttVW0S2lV10kltturkLNUHVgnzjzLm5t?=
 =?us-ascii?Q?7lcEPU7fk8hMOC9SqNuv6tSpwbC1b5jZUIvlx32ahZp1G6jj+emqMPz5P5aQ?=
 =?us-ascii?Q?wPMdR0M5X6Egot2bAnkYGzRrrF1OY91JmODOU5KWiyaVrt/1bBjJVQHuNJB3?=
 =?us-ascii?Q?aTwjipMDpLRpXeOg/vIZhtEx//xgG0ikfvhgUGEpjsks44bMfs2HNgTXRpyS?=
 =?us-ascii?Q?jHTlIF4yBD/gP3G90i6zaHo6EoXKESnD0z/caReGF6eKOPyHYeh/i8rm/GNV?=
 =?us-ascii?Q?MAsEhO7pOXrhhbI7NveWGd+Y/0SudNEbQj4zbTXLXCQj3LJ9s7+Wqcs1M7pr?=
 =?us-ascii?Q?k/sCuaFgqQUBUQ1euQHmp9a0tfdb5FBZ038Wm/1nabFuOiriHAjfqce6WhmM?=
 =?us-ascii?Q?Hiu6xSY4DYwe981C+QsP3j/zMDC8Ce66cc3M3IiPtNYRUCtgZA2goMMT+Jy1?=
 =?us-ascii?Q?vXpx+kjS6SIRsmlY2AmE/TujBgO8mGqBWiXatWJYtPDM9mdNUebedCugCdoV?=
 =?us-ascii?Q?Cxixz4EOd9QiIiDXM8+SagS740U6yMwEzBo27+DNfZguszlAXxr8fahGybrB?=
 =?us-ascii?Q?OIG8iwjPSNT7jVTcVbAQKpMfuZ7LTWbMGbnAzQgqjfotLh2w5U0+ZTVZSDyb?=
 =?us-ascii?Q?h6rDo8UGi/l4YRVjHDwtLey3WSzEyLabteO+ulkRX1EJRZhVpWJT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 061b46f9-2623-4f48-4f0c-08dec583b956
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 17:31:07.6332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KvWf5mfOU2338KsTeXF3TSfGZicSky+CAzM7vMTXT7rIhKbm8b/TXX22crTKOplHs/8Zl7d+W4nfP8Hh90vEMTxM7FWi9bmD6zXOTRrPzGThR6lsMR3msu9bw0/72MLc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_103113_053400_D30B4158 
X-CRM114-Status: GOOD (  34.60  )
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

On Mon, Jun 08, 2026 at 10:57:54AM +0300, Adrian Hunter wrote:
> i3c_hci_addr_to_dev() walks bus->devs.i3c, which is protected by
> bus.lock (rwsem).  However, it is invoked from the MIPI I3C HCI IRQ
> handler, which cannot take bus.lock.  This allows concurrent device
> addition/removal in the I3C core to modify the list while it is being
> traversed, potentially leading to use-after-free or crashes.
>
> Remove the dependency on the bus device list and introduce a dedicated
> lookup table.  Add an ibi_devs[] array indexed by DAT entry, maintained
> under hci->lock.  Update the array when IBIs are enabled or disabled,
> so that it always reflects the set of devices allowed to generate IBIs.
> Also update when IBIs are freed, to cover the corner case when an IBI is
> freed without first being disabled (e.g. oldedev in
> i3c_master_add_i3c_dev_locked()).
>
> Move i3c_hci_addr_to_dev() into core.c, reimplement it using the new
> array, and add a lockdep assertion to enforce that hci->lock is held
> by callers.
>
> Demote a message in PIO and DMA IBI handling, from an error to a debug
> message, because there is a race window when the condition can arise
> normally.
>
> Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	Factor out __i3c_hci_disable_ibi() to facilitate also clearing
> 	ibi_devs[dat_idx] upon IBI free, and update commit message
> 	accordingly.
> 	Demote a message in PIO and DMA IBI handling, and update commit
> 	message accordingly.
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 37 ++++++++++++++++++++++++--
>  drivers/i3c/master/mipi-i3c-hci/dma.c  |  7 +++--
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
>  drivers/i3c/master/mipi-i3c-hci/ibi.h  | 13 +--------
>  drivers/i3c/master/mipi-i3c-hci/pio.c  |  7 +++--
>  5 files changed, 47 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 53797841b63f..1e1f05aff092 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -22,6 +22,7 @@
>  #include "ext_caps.h"
>  #include "cmd.h"
>  #include "dat.h"
> +#include "ibi.h"
>
>  /*
>   * Host Controller Capabilities and Operation Registers
> @@ -124,6 +125,7 @@ static void i3c_hci_set_master_dyn_addr(struct i3c_hci *hci)
>  static int i3c_hci_bus_init(struct i3c_master_controller *m)
>  {
>  	struct i3c_hci *hci = to_i3c_hci(m);
> +	struct device *dev = hci->master.dev.parent;
>  	struct i3c_device_info info;
>  	int ret;
>
> @@ -144,6 +146,10 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
>  	if (ret)
>  		return ret;
>
> +	hci->ibi_devs = devm_kcalloc(dev, hci->DAT_entries, sizeof(*hci->ibi_devs), GFP_KERNEL);
> +	if (!hci->ibi_devs)
> +		return -ENOMEM;
> +
>  	ret = hci->io->init(hci);
>  	if (ret)
>  		return ret;
> @@ -639,14 +645,40 @@ static int i3c_hci_request_ibi(struct i3c_dev_desc *dev,
>  	return hci->io->request_ibi(hci, dev, req);
>  }
>
> +static void __i3c_hci_disable_ibi(struct i3c_hci *hci, struct i3c_dev_desc *dev)
> +{
> +	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
> +
> +	mipi_i3c_hci_dat_v1.set_flags(hci, dev_data->dat_idx, DAT_0_SIR_REJECT, 0);
> +	scoped_guard(spinlock_irqsave, &hci->lock)
> +		hci->ibi_devs[dev_data->dat_idx] = NULL;
> +}
> +
>  static void i3c_hci_free_ibi(struct i3c_dev_desc *dev)
>  {
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct i3c_hci *hci = to_i3c_hci(m);
>
> +	/* Must ensure the IBI has been disabled */
> +	__i3c_hci_disable_ibi(hci, dev);
>  	hci->io->free_ibi(hci, dev);
>  }
>
> +struct i3c_dev_desc *i3c_hci_addr_to_dev(struct i3c_hci *hci, unsigned int addr)
> +{
> +	int dat_idx;
> +
> +	lockdep_assert_held(&hci->lock);
> +
> +	for (dat_idx = 0; dat_idx < hci->DAT_entries; dat_idx++) {
> +		struct i3c_dev_desc *dev = hci->ibi_devs[dat_idx];
> +
> +		if (dev && dev->info.dyn_addr == addr)
> +			return dev;
> +	}
> +	return NULL;
> +}
> +
>  static int i3c_hci_enable_ibi(struct i3c_dev_desc *dev)
>  {
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> @@ -654,6 +686,8 @@ static int i3c_hci_enable_ibi(struct i3c_dev_desc *dev)
>  	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
>
>  	mipi_i3c_hci_dat_v1.clear_flags(hci, dev_data->dat_idx, DAT_0_SIR_REJECT, 0);
> +	scoped_guard(spinlock_irqsave, &hci->lock)
> +		hci->ibi_devs[dev_data->dat_idx] = dev;
>  	return i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
>  }
>
> @@ -661,9 +695,8 @@ static int i3c_hci_disable_ibi(struct i3c_dev_desc *dev)
>  {
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct i3c_hci *hci = to_i3c_hci(m);
> -	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
>
> -	mipi_i3c_hci_dat_v1.set_flags(hci, dev_data->dat_idx, DAT_0_SIR_REJECT, 0);
> +	__i3c_hci_disable_ibi(hci, dev);
>  	return i3c_master_disec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
>  }
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 87622d6f817e..0672ed1132f8 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -967,8 +967,11 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>
>  	dev = i3c_hci_addr_to_dev(hci, ibi_addr);
>  	if (!dev) {
> -		dev_err(&hci->master.dev,
> -			"IBI for unknown device %#x\n", ibi_addr);
> +		/*
> +		 * Either an IBI received just before IBI's were disabled, or
> +		 * the controller is broken. Assume the former.
> +		 */
> +		dev_dbg(&hci->master.dev, "IBI when not enabled at address %#x\n", ibi_addr);
>  		goto done;
>  	}
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 41d31a53abd3..b3d9803b1968 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -65,6 +65,7 @@ struct i3c_hci {
>  	unsigned int DAT_entry_size;
>  	void *DAT_data;
>  	struct dat_words *DAT;
> +	struct i3c_dev_desc **ibi_devs;
>  	unsigned int DCT_entries;
>  	unsigned int DCT_entry_size;
>  	u8 version_major;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/ibi.h b/drivers/i3c/master/mipi-i3c-hci/ibi.h
> index e1f98e264da0..073ca67b7d04 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/ibi.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/ibi.h
> @@ -26,17 +26,6 @@
>  #define IBI_DATA_LENGTH			GENMASK(7, 0)
>
>  /*  handy helpers */
> -static inline struct i3c_dev_desc *
> -i3c_hci_addr_to_dev(struct i3c_hci *hci, unsigned int addr)
> -{
> -	struct i3c_bus *bus = i3c_master_get_bus(&hci->master);
> -	struct i3c_dev_desc *dev;
> -
> -	i3c_bus_for_each_i3cdev(bus, dev) {
> -		if (dev->info.dyn_addr == addr)
> -			return dev;
> -	}
> -	return NULL;
> -}
> +struct i3c_dev_desc *i3c_hci_addr_to_dev(struct i3c_hci *hci, unsigned int addr);
>
>  #endif
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index b5ae1cfaa9e0..ff2657ee220b 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -869,8 +869,11 @@ static bool hci_pio_prep_new_ibi(struct i3c_hci *hci, struct hci_pio_data *pio)
>
>  	dev = i3c_hci_addr_to_dev(hci, ibi->addr);
>  	if (!dev) {
> -		dev_err(&hci->master.dev,
> -			"IBI for unknown device %#x\n", ibi->addr);
> +		/*
> +		 * Either an IBI received just before IBI's were disabled, or
> +		 * the controller is broken. Assume the former.
> +		 */
> +		dev_dbg(&hci->master.dev, "IBI when not enabled at address %#x\n", ibi->addr);
>  		return true;
>  	}
>
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
