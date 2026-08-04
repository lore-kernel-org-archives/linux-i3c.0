Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD05AC55184
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 16:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oRdFbILyAWkwQW67bfDY4xaj34dF4KQnsWMICJYJIwc=; b=4OLMwYRDAIaoN9
	GeJPSmws7R9T19QQEBXJalUwSvXv6KTYINl42kNnA6aLvbCYapIXZdpMspDaDRxb7dYNisM9frwwE
	fxv8VtCw4JSjP2qkH9GQIJxY9mhn1dT6CcCEuWiJB96pAjATCbzrsDuncKQnvHar76Bu85yY/hRBl
	2d3BRS4aHSC1uJs11oh2rxa5Hv2llk5FaDp88ZFNQ5OCo9JBqzGe63MtHJIBkSr+nHvnfOL6obsr0
	R0eBMT28hEzfrQ91yU+DtKOjAPRIaMvyaJPqNUFdeCIAWHl+E5VfaOkIuhiHdShJYqSarQD16QxR+
	Qtus1f+Czk/oYKM0ecEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIHe-00000002Non-2Qky;
	Tue, 04 Aug 2026 16:46:30 +0000
Received: from mail-northeuropeazon11010013.outbound.protection.outlook.com ([52.101.84.13] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIHc-00000002Nny-0Hhw
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 16:46:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7K0sp0aawZ7oGMLRxCYBpKl5gFsKXuRtgeUKrvLFxudAR14Wi9RMbR0VR7YzZbycE8CfhCs5jQF36FkSOlkY9UyZauuxKAQxmJidcMgIpe64zcV7rW4frE8pnN/i7tyqWSMP42Pp4CN+BN9iqcR48774oETgk9yYn34pyALPP0MZJy5tvl9vcw4+hV3cXvZhnJ02SXHO2a2yPgR5U9dl/fJGM8w2YBtiJlET0LyYM2Ipsd8d9rKmU2q0LixQMwKVrCctSBoTqjXYWwzXfBVA8VHPIbzY6yQ3sXqmgL7l/g+5PMCKl87Zf9fMQnaIgM0s2JHPeutQaLhOswyVniNJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIITKjGjvR1wYgiZoY6dol6RQ3ISwjgcIl4b9HZzGeM=;
 b=vTwbMk4BXk5NjFjuLEm8ohkcjkKLhfW0zoOhwamcu1b6DaQf1g1jeSUdrcQJcN7P95arkVKlSGE/UjRR1Ox3NxMMMo+Joa6xPFLHgHnuYR2Fa2XfVO7vo71rKlfXxkeUK2TlXqYK71LQH6xmBxLf+ECtACOBTmt2SFkIwauiONB3/4OFC+MzK1w1Qv72oDJvBaLeA2JH1C4mbn6P93RIKMcMj2Hj08WFlfg7Qvn+QZ3gONd6TeHJf2S+xBOsHyyPzoCo6/RepDWXS1GbAbbJIUHPeoRD3tQxqw/JPd1F5p60faamJbinKo7Yz1bFMjItgIZ6aiS4vSduRW3FkSxI7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIITKjGjvR1wYgiZoY6dol6RQ3ISwjgcIl4b9HZzGeM=;
 b=FchcK7//0f6jg+uQ6karRtxBvqmGvErOsyA4xV9Rf0r/UAbZrB2eq9wOicj2YExYviKb6cFCvl9WX642X1wBkOcmVZ7va6Ub7y8yXtBOvdqasVwnwiQyCryR7kxNmrTiBzarSbctv2ormHyqNEY+DRivRCIowRUt6Byyf3HrNBWrGYZUHqfAQIsJ7fD0JGAhDWVa5imeyb9QU7IIeRL2jyylff0oSRwqOqjxiSelMkCWy8sbcrJGXzY6FR/9Ru+0Efti1kZVpgQEwG8tVVGBiu1Z5cEwnJrWR8G8+G4UuRSjAZ8BIXoo+j7CSBZrlR3kKCHAu4szcZpBC0znOmNccQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB12302.eurprd04.prod.outlook.com (2603:10a6:800:31c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 16:46:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 16:46:23 +0000
Date: Tue, 4 Aug 2026 12:46:15 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, akhilrajeev@nvidia.com,
	rafael@kernel.org, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH V3 01/14] i3c: master: Fix recursive locking during
 device registration
Message-ID: <anIXV7HvBxCtJLFD@lizhi-Precision-Tower-5810>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-2-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260804133810.184905-2-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7PR17CA0044.namprd17.prod.outlook.com
 (2603:10b6:510:323::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB12302:EE_
X-MS-Office365-Filtering-Correlation-Id: 45786731-81bf-452c-81e0-08def247eb2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|23010399003|22082099003|18002099003|4143699003|5023799004|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: NAK+tqG6mC3dl/37d1Qko1rIzP0WVv/ecafHLHnVWO0HvUeWuXuW7LpcTJ/owA8hOZxxBWRt7j9AvVMm6gBZFZ80Dh2pq3EkOGWm+1D+w7RvXBQMLyYMCRAq7d01c7VW6bIjiP100aLsUG+40oP8P5A6hdQUfcPlnP+X9sAYCpda4iLh+yXX8gxhufB0yWAK+rswpDlbzwiN6qLXkCxjnMxenWKBa/2KuKT+BT3Mzs6GEe/iPiHyq1v3C7IIB4M1j4mxhCw1OOgWOtz5a/Vsdf0hO4KlhgReizGpSAO77YwLqWoBQT4LIOwJC1uHJT15pMb/BDQob3N2reMfCfM3Fw14Hoe8T23ooWSLyJ50fU1pVo931GmAgMSSncXwHMNiumA3c4ZAjadrGvVaQzn9uPISqDJE8+LibKHLTvE4Ub/zVmHfgzxfPioakq4bPq9X/10KaI/7kGPURjJI8vkDpOqLucWxCQc4UWfzS9qCs5pLGQU/k21qlyfVu1iKi9mGr7DIYdG8iXqlUF//NER8oTH5WD3wmXW8e4pwjhybGLl7MuhK5/KFB/g5ENeRPewnv16K98JSfyy2fNEV3dOzVqKIzkxJf1Hr/wFncWd2bOEv+4iKH9MHz+e6okPzqWtucjbFr1r8GQH4JYb0QX4qoo3S/0HINxF6eHSLAPQPZhQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(23010399003)(22082099003)(18002099003)(4143699003)(5023799004)(11063799006)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?omHqCJKyAmWKwe4t4a4JQV2lpX1c+Tk9OOr0GHm2PMOCfGz9d4R9gGLu1Yxt?=
 =?us-ascii?Q?DIPJywC2wn6eX6Xmztbkh4vFSX7qURnAcc7duulsn87/jhb9yHFQvXYiitb6?=
 =?us-ascii?Q?y33JofD7ra2kTdwjGijzMq0VGkilJvG3Ub/GNywyipcVeK41JcatkMwfgLiR?=
 =?us-ascii?Q?l6hBlXsDBEKDX9Q9R19w45fzZcHg/Ji//tFwWVxupMTaJJLOkeA/7qU6ebFN?=
 =?us-ascii?Q?E8Mx8AXRRgm1LqaXdDu2bRm/s9Jt2wAwY8Uj3+seDiAw+xX6Bvwoi/RfHupM?=
 =?us-ascii?Q?iZ+tbIZUigozp+I1ZoHb7ZTGZZcPugFXfdlkcprtW5QJJWoI45GaCF9SXn0L?=
 =?us-ascii?Q?jzPm0SEWqOJJPJKZT2awpZpgnWH3KYyRTWcgQewTXQBV9SfSLMtcg5k5QmA7?=
 =?us-ascii?Q?rjv53zZcImodUrutwJmq6e+IoPZhra7OfVCO993cGErUWcJKKTd18+Qdxgyq?=
 =?us-ascii?Q?hAf2CSnPIz0bYvQiRkVwoxtG/0tc8EYIZYxCxNu4RdShYnFENh/7ErTR8E1K?=
 =?us-ascii?Q?NMhOOj9OiLM6wxLIaBYjaZ7l6X7FepIMYQ+9xo7o8k7qiLQEgvsVvBDzgwH9?=
 =?us-ascii?Q?XqjdgRm2oFXgeuNsr4MPiw8NqKWbCE7GELIzDGtbXyi0Tl/+FYGTq1AC3m7N?=
 =?us-ascii?Q?AKqmZoPz9y6vIVynAD11Mdi18SqY67fx1MI3I5Zgkdezutq6YP1D1d8D4Vz3?=
 =?us-ascii?Q?CsQyhDt598JTRRnduNWgcOYbRpgf61KTnjc2M0nbmi07nbXTl5IkRtgjHf1t?=
 =?us-ascii?Q?SIJeZFpt1Zx7HHmDAvNG7zAXQFDIbLHO0uWE2MiG+1Yd9IG/XePfAL2/gIzB?=
 =?us-ascii?Q?gGcaLACLrAyckdV6tUXBRAiN3q2/iOLyWZMsWCumf/hCW59Hg0fkpSfIB+yN?=
 =?us-ascii?Q?EJTrwMkS+KHaNbLEP23aVPLjZ6/Sx9X6COllOff89x2VzWkhbEczDGWOdpBl?=
 =?us-ascii?Q?Sosm2lyyTWeiMItkPdJSfvj9gxfXmEY+hvmSARpLw/u6816JZqkcCkjnZLLB?=
 =?us-ascii?Q?H4vyBXEATMb41GYQQsiFhgzEZD8f4UE9L3V4OMbv3kUKOmMRtDkPfuSxd+w7?=
 =?us-ascii?Q?oD2Ul9xX/mghgVxwK3p2t9lvOYMnjoopWidRn9ZbvI28ssBEw6TBTps7YxM5?=
 =?us-ascii?Q?81UpPc/TxLpwJDSSigBIkPMlN8hFDwDlQ9+11Qt5uZHPNrerUslIDu8gXcPB?=
 =?us-ascii?Q?X+/TIxYXQmeXYUOckWYG9ggamlGVszwPqxUG+uluCu0DLs4waXJZwo+RNpp+?=
 =?us-ascii?Q?3mwmR1fR6voo+RaY8UMLlP+lJ+gKFFXkNpkWvCtzguLN1maJGiLO/FvlWIGW?=
 =?us-ascii?Q?WJWAN8l1S+3lLWYVqJm257kNIIt4szcAUSgs1VpLc+LLwn/mZvM//7WQVfHS?=
 =?us-ascii?Q?6HvFhKrSU+dY6ZAASKJ7mxJjvkMKEVs5G0EcU+2kN5h61PC8ulNbl7UgC6+X?=
 =?us-ascii?Q?QWCN3FWSa0+m/1lrK7JLlJsZx1+Ih5a7v4dJh5qLpeu9FGjEdipRqbRbMP/d?=
 =?us-ascii?Q?mbjITLVosFquSOa2Jm1pw9YyKLrfGDwNTsz5cORwIAHwNA7Nd1MjCBsawQAs?=
 =?us-ascii?Q?wsw8c/64Gcw+kRRzZ6AcwGDbzGyxYTsmMtqLkAXQRasi98NgwDisNcsbXhtV?=
 =?us-ascii?Q?/TyZC+GT75mM+14uYTmXazm35eNy8KX/0+ykFK5yDX9yN1KEOccXsd/fcm5a?=
 =?us-ascii?Q?3a4UU5VZc4cc54ZLMSvZeG+NtFVNzAdZ8D3x3J4PHt5eRuqVlOcLNr2qq649?=
 =?us-ascii?Q?5H2dLzszvHXtAoJlSE/c8kt/wEJGXjMFm1Qsg0KkySsnqKN40z9V?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45786731-81bf-452c-81e0-08def247eb2d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:46:23.7526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kY929/BvR6C5ex3u59J/Qj1VjQbDjH/2p86N3J8F3FwimYwRNzf1UnNB+oSGoZ5/vjyuq6fMEzV1y0/zOpilADhJ8IcD5Q/hhThL5yZjKmdjkwdqN0pZoBwMz4/D3A0z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12302
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_094628_150887_BF309973 
X-CRM114-Status: GOOD (  32.47  )
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

On Tue, Aug 04, 2026 at 04:37:57PM +0300, Adrian Hunter wrote:
> i3c_master_register_new_i3c_devs() registers newly discovered devices
> while holding i3c_bus_normaluse_lock(), a down_read().  device_register()
> can immediately probe the device, and probe callbacks typically invoke
> I3C helpers that take i3c_bus_normaluse_lock() again, leading to a
> recursive acquisition of the same rwsem.  rwsems do not support recursive
> read locking and can deadlock when a writer is waiting.  See the
> "Recursive read locks" section of Documentation/locking/lockdep-design.rst.
>
> For example, with Intel LPSS I3C, LOCKDEP generates a WARNING like:
>   # echo intel-lpss-i3c.0 > /sys/bus/platform/drivers/mipi-i3c-hci/unbind
>   # echo intel-lpss-i3c.0 > /sys/bus/platform/drivers/mipi-i3c-hci/bind
>   WARNING: possible recursive locking detected
>   kworker/5:1/94 is trying to acquire lock:
>   ffff88811c810d78 (&i3cbus->lock){++++}-{4:4}, at: i3c_device_match_id+0x45/0x370
>   but task is already holding lock:
>   ffff88811c810d78 (&i3cbus->lock){++++}-{4:4}, at: i3c_master_reg_work_fn+0x21/0x5f0
>
> Fix this by separating device creation from device registration.
> Populate desc->dev under the maintenance lock, collect the devices that
> still need registration into a local list, then release the lock before
> calling device_register().  Finally retake the lock and clean up any
> devices that failed to register.
>
> Use the maintenance lock rather than the normal-use lock while adding
> device objects.  A write-side maintenance lock prevents readers from
> observing a partially initialized desc->dev during initial device
> population, or desc->dev disappearing if registration fails.
>
> The local list requires a list node, so add a list node member to struct
> i3c_device.
>
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Changes in V3:
>
> 	Added Cc: stable@vger.kernel.org
>
> Changes in V2:
>
> 	New patch
>
>
>  drivers/i3c/master.c       | 45 ++++++++++++++++++++++++++++----------
>  include/linux/i3c/master.h |  2 ++
>  2 files changed, 35 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index f485b98805cf..d2fb1a110521 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2069,12 +2069,21 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
>  static void
>  i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>  {
> +	struct i3c_device *i3cdev, *tmp;
>  	struct i3c_dev_desc *desc;
> +	LIST_HEAD(i3c_unreg_devs);
>  	int ret;
>
>  	if (!master->init_done)
>  		return;
>
> +	i3c_bus_maintenance_lock(&master->bus);
> +
> +	if (master->shutting_down) {
> +		i3c_bus_maintenance_unlock(&master->bus);
> +		return;
> +	}
> +
>  	i3c_bus_for_each_i3cdev(&master->bus, desc) {
>  		if (desc->dev || !desc->info.dyn_addr || desc == master->this)
>  			continue;
> @@ -2104,25 +2113,37 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>  		if (desc->boardinfo)
>  			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
>
> -		ret = device_register(&desc->dev->dev);
> -		if (ret) {
> -			dev_err(&master->dev,
> -				"Failed to add I3C device (err = %d)\n", ret);
> -			desc->dev->desc = NULL;
> -			put_device(&desc->dev->dev);
> -			desc->dev = NULL;
> -		}
> +		list_add_tail(&desc->dev->node, &i3c_unreg_devs);
> +	}
> +
> +	i3c_bus_maintenance_unlock(&master->bus);
> +
> +	list_for_each_entry_safe(i3cdev, tmp, &i3c_unreg_devs, node) {
> +		ret = device_register(&i3cdev->dev);
> +		if (ret)
> +			dev_err(&master->dev, "Failed to add I3C device (err = %d)\n", ret);
> +		else
> +			list_del_init(&i3cdev->node);

Is it risk del node without acquire lock?

Frank

> +	}
> +
> +	i3c_bus_maintenance_lock(&master->bus);
> +
> +	list_for_each_entry_safe(i3cdev, tmp, &i3c_unreg_devs, node) {
> +		list_del(&i3cdev->node);
> +		desc = i3cdev->desc;
> +		i3cdev->desc = NULL;
> +		put_device(&i3cdev->dev);
> +		desc->dev = NULL;
>  	}
> +
> +	i3c_bus_maintenance_unlock(&master->bus);
>  }
>
>  static void i3c_master_reg_work_fn(struct work_struct *work)
>  {
>  	struct i3c_master_controller *master = container_of(work, typeof(*master), reg_work);
>
> -	i3c_bus_normaluse_lock(&master->bus);
> -	if (!master->shutting_down)
> -		i3c_master_register_new_i3c_devs(master);
> -	i3c_bus_normaluse_unlock(&master->bus);
> +	i3c_master_register_new_i3c_devs(master);
>  }
>
>  /**
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 2dc139a217bf..2b96c4ea75fb 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -238,6 +238,7 @@ struct i3c_dev_desc {
>   *	  every time the I3C device is rediscovered with a different dynamic
>   *	  address assigned
>   * @bus: I3C bus this device is attached to
> + * @node: unregistered device list node
>   *
>   * I3C device object exposed to I3C device drivers. The takes care of linking
>   * this object to the relevant &struct_i3c_dev_desc one.
> @@ -248,6 +249,7 @@ struct i3c_device {
>  	struct device dev;
>  	struct i3c_dev_desc *desc;
>  	struct i3c_bus *bus;
> +	struct list_head node;
>  };
>
>  /*
> --
> 2.53.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
