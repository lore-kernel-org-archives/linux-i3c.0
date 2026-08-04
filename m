Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0635C55822
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 22:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nos9g4aP6nKeitc958bmk8VT9ObhOm3BolFe8NCzyEE=; b=4E+qV9MLbs735h
	VHPFs0kx5Kgwm6w0bi98pDdN6fGzHHTFwvlg7EJXrVs47pMTYu4Kp2lzw0eBGLizTie0a/wdcX9HP
	Ao6jEtdhNK721VtprilB4zLRlD9FpolAOTreQYCPMU0ArD826p6IevlS7jwttSY6IVS7vQXnFBiBJ
	d8Igq+8rFz5Jz8TD9UOzrbPc4ncBCXucgKo4pWgcoX+Hz7pZJsQskBddVryZX/82F1SKacSWHTR0Q
	Wm9F2O2ylLLdj7lYoY0UWM2QLhveiTzwmAJ4PS+XYRCzaDeH1IDTbEmulft9Q7+dBa5rXCsZ+aMyI
	9HPooRDnLAgHRxJPw+5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrNLg-00000002rJQ-1kyV;
	Tue, 04 Aug 2026 22:11:00 +0000
Received: from mail-northeuropeazon11010068.outbound.protection.outlook.com ([52.101.84.68] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrNLe-00000002rJ2-1thF
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 22:10:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlVg4nDLP6RyTCkq/3Pso3wqp0FrWC8dJ3WxiF4jb6KcMJB3tScSs2sUBtTXnGGZnCDDw47/4ad77bUslbXB98b4bd16a8XwLD9DVskfFHa6X4guj62aHo+Vg+dw6UXv3DQyg2jZxkTjK/c98eHGktkia+r1lbaKQnpkI63OBEVXTgXvHKMWpcy+2zy501juVJ4UIKwK1AYJhwkdKG5CD80HuzNd4XY9UHFroLIabPmcx4OZlZq2tne3z5mWGw2MyRLOvZfzNQ939XK9Ggx23sOYL10JIShoEJXJUXKf7lImTdf0ExnFuEhOHqpUbAME3QUcrdtuRyKST7BxlJZTXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQhbk+M0UtBncp1C0+tKZoxWKz/IJluPkKLJFrAddIA=;
 b=HWpxObTjrC/hdXEvgfH4UMhaM1mlwKr2WrDZ+/5/mz1gz81WFUV70rqkuKs7eiUVvr1kuE4PymQICg4gLmLCT0DPkoJd6cNrcsnJjRbvVaI2w+Zcr6wQcOP8eTH+6jMYa9LY7UXGqTL45jy6yZ7k1QVcFuHyON4JokHQ/SVSjXsHAD3Bvp5bFjtvzHIfbz4Zo2/cOFoAVGtBGm5ZkdwkobUDTpUDAhYjw9jxZ2kwIDSEGCu30TH9K4Mq65dF12pv7BWm4eapJuoKMhBwKerL2XWneb7ufgKiK5KvgO6romllPJmDk+vn3COv3t3WWH3X9JCilnS+NCybVxcbrDgN6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQhbk+M0UtBncp1C0+tKZoxWKz/IJluPkKLJFrAddIA=;
 b=S8kh5Eps5eB6Akx8wYh2oNzouEKrB2O3rAoayfP4rl0Xxv+3fZI+900ZSNULuqYXHDt194xEoNOy3mOOsTNLFLuEkqqXRFNyAqi4zd+vMpakM9P9z6T6NwsunArlCFPq9im+yl81shde63GQ1IXSKqjdERQGPTjZe8zsxVe2YBJnLU6h+1qw5K3D8ib/htABOO7pGU8dvk6YpBTLQMRnDRmQR1WnP4/6gxu5VqVd7B7YFzHUJTeYljNFJhEqkInwlHQLD2vCnzbBCJK1xsNwx1ufQi5IGbSIpeApKGrrh+P8gq0QbCeMSwc/LzDljFT7RbPfm6itIWyTELoNqnzDvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB7099.eurprd04.prod.outlook.com (2603:10a6:10:12b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Tue, 4 Aug
 2026 22:10:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.015; Tue, 4 Aug 2026
 22:10:53 +0000
Date: Tue, 4 Aug 2026 17:10:44 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, akhilrajeev@nvidia.com,
	rafael@kernel.org, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH V3 01/14] i3c: master: Fix recursive locking during
 device registration
Message-ID: <anJjZHxv16-bXnkp@SMW015318>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-2-adrian.hunter@intel.com>
 <anIXV7HvBxCtJLFD@lizhi-Precision-Tower-5810>
 <5b0ed4bc-2f14-4d09-a099-9d69337fbba8@intel.com>
Content-Disposition: inline
In-Reply-To: <5b0ed4bc-2f14-4d09-a099-9d69337fbba8@intel.com>
X-ClientProxiedBy: PH7PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:510:339::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: 63194c90-b6fb-45c3-ac7f-08def2753fcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|23010399003|56012099006|5023799004|11063799006|4143699003|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: F4BnwGO8bEGPkcbl5bUfIfT30zqvx+Sc/nuXgUaiAXwK1dwdY2vHmm3SsOkY1aGZjT7wD1q1dvIneISnBH913AywmFlT9LjKlDBC5VAb4mctTrLxWoU+a5jfUWPrOYzfgLU+Y9rsEsPKLxEwk/EZigHwRUHMq68Y1cmsnKAW/oqLWa9RWE+PE7qPfKGvLyJFfQUF7DifMdo02y0zPALD2+KTIAVE6W+WHKKta6xO9xgm3VHo2aZbqtV1T2EUznNhbpGcR9E1LT84po5mjE8TffKPvcan9ipfCQX0eCbhXhaiv8m7tcDZ7Ejd5tHxI6p1k3EWN3eEIFcmOalFOEdEUljLKmW2pxQ0xIvP8Sw4k+XU5x6yrZ21Dku5IzB6FbHg2yNLf18ejMhCYuEK7hHz+2LShvq9BP7kB+qGR9G1glU6UiMkPFFD6VMRrnM0fTi4/kt2T8xb9bFmIECoGNaifHt1jZJbjn8nugiV5fjQ2ho2QpGuvzeg9l8WIBfJh/t2xujmTObad3rgjWFPrbNy0xDmaQExqyAB5EnlBqhVdcTCcDA7tQ6iXB3u6foi+pzQnL/3sf1BSC5S5BAFPbAXJbZtWkeNuFX6f1CdtnzJ0sxGrZwByPqt/5WNvxGKG3lfC0r9a5tBkB6BVP86HygXWHWkQwq3HGJloF0T3vIEWt0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(23010399003)(56012099006)(5023799004)(11063799006)(4143699003)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pZKm56j8UVawwSg3mvCOhF/XELvGcvZ0YZUZ7CAsmAQ5udvSp9fS6XKH+Yim?=
 =?us-ascii?Q?EpPGgbcB4k9BAKKi3lzW21SCIkIEx8YFgTaG9afjLwzrcIPzyGkeBb085cQs?=
 =?us-ascii?Q?TrlGrzUr3UP4+HLsFu/4k9mj6/HVgyN3BnMADKGNPTIdaH7mCK4sqY9joCLF?=
 =?us-ascii?Q?GbIFtPtpfMUUVSMtCWzTmVQ8lSmRDmugfuhliv9aLsTPsmOPXYyd2kSkcSk+?=
 =?us-ascii?Q?SAZDpQsA/XGZjs60WCZa5IhJXTJ4Tlm0dhpFA+9siMvl25iO2nfbUaWE3N25?=
 =?us-ascii?Q?twHp+4Ql/TltHA+fI7vj6F86IcHbEIMQLyARg5V+j1b+sWW7MQd94qEkMgpH?=
 =?us-ascii?Q?qyiX5niHVv5Dk3ets4d/cqFKRZb6dDW3cmuaXCUMIS8lTxkDsLMZIN1aKxzV?=
 =?us-ascii?Q?cNimoidrsg5kotcf+p93mEwArg7ankFrhDOZkav9x3WMfnEyJVjMFw0sbWCG?=
 =?us-ascii?Q?oP2D0214rKxi2EAHWo6fZ0u01EsO7MxRUTu/GK1C3ZyX9hTKNPkaQmzBqRIL?=
 =?us-ascii?Q?5Niqrq87GDox2PvcdUrH3BHKgfKO4PVeJaZk+nL3Yc8DO6LbVJ7exAPyEbLe?=
 =?us-ascii?Q?him/K+otSshPQM1ZKqS4/Rec/eMasUCSJ+Qsxxpfll82dSbnx7ndrdAxLQz5?=
 =?us-ascii?Q?F8nhYGf5ltoaLyZ5dilthHLtXknOS3s/mgzRPDVrb6cRTfH/Cg3gEeNwb/aN?=
 =?us-ascii?Q?3+06yCdVPHqNyT1fcEzX4oHmu7e+YW82JfOJWPNsmJ+6MiFcqrO8NJpIm4P8?=
 =?us-ascii?Q?F/5St51oJXdX8BeYLKEp4waCeBbiQOZcJVP+Cbi6D0RsAIz4MToHc7JkpNED?=
 =?us-ascii?Q?Vn+ZdB17+Z0Dle2adOmaUDUwYzs6b/YqrwJ8Zshw5jJTJ+RDUXR2zD5CEqE6?=
 =?us-ascii?Q?8VZkYqY8Pq6MMsEafrp/0YF/PSGSLxK+KX0kZeaZCdNR37HHqQ3z7JTBN+rV?=
 =?us-ascii?Q?nukMAsxyTgMv3hLS0wZgk2u7gSshn8hmAZq0sAX6EDD04m20phabK3WVLRIZ?=
 =?us-ascii?Q?wc6/aRkZMvMZx5vTfe2PUe9z5RMKVyRNmq3/zOAI1sN640tAeac2bZDwFlDX?=
 =?us-ascii?Q?rTo5oX/gqUE5c3kQ3ltKJFaND8D+qFKGgX9z+YzFO++ZZX2KEAe76IqmT2XK?=
 =?us-ascii?Q?+qGcU88oji1rMPRy6iomX3/ay8mhDu9C3x8KWEBTdevjLrz3Z5QPpXWUQEay?=
 =?us-ascii?Q?OEImGkbyJGwHj0TmjS+Gi2ZWDknJ/T9uXZNkoHhcDXymppx2+KTk+LstEvtl?=
 =?us-ascii?Q?01x846JWsJDn8LdCvOhIYCvP/FLgHVAZtXmyJU6PWQiwdloCTJSWnDv+bdJe?=
 =?us-ascii?Q?EDLlQ2ZgpWC14rDqNkk/l63eY5Vfp7+uFbL55F0HMCzefwKYKHIdhQp3wjfp?=
 =?us-ascii?Q?8yOq126De49j0jH2IJPy8++B0TS7DZ74hQQyJvHF+EvF9k2Ht+2noaJktc2o?=
 =?us-ascii?Q?9MXj+HuKbTzkaUzEzc8X5ItchZxUrFU36yp9nltfh/bY30rNfLr2nKB2tEEi?=
 =?us-ascii?Q?c87DDrOBaPMP9NoNEo3PIrLDF6SGEjrKd6/0xd4+7xo/8BRaXbtSbSBfIYmb?=
 =?us-ascii?Q?aTukvVu+5s0s2G45QXpDKE6dyefgb+80u6FwLkxc2fg5eqgtcMdlqvTcsOCt?=
 =?us-ascii?Q?whwr+CfKpJ5+RL1DEwPv4UKGyPv2jVIM/861ctCjR6TKlP4vbpOQbdNXrk9C?=
 =?us-ascii?Q?Yk6k2NUHOlLd7s+I5iZah1KUQpH5ir6yN0BK2AmS5ZHyEwKn0CyFNowuHUri?=
 =?us-ascii?Q?nqQkbx0tzheWIqzmOm1erVarNrlvNizdW/5g9wgMzCGTM2WwguJg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63194c90-b6fb-45c3-ac7f-08def2753fcc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 22:10:53.1445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwl37Mywf8UesGlJK08mIZrIbiyspOU+2GTMEkP6yXUaRSTSjGv6IwsZ6oelGiUKB3e7ia2SfgR3g1gdvhZFgK6uj5xDk4gVgeaPSyIOx9tZ+tPlP+D0fIsAgF6peKX3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_151058_528977_605C4693 
X-CRM114-Status: GOOD (  33.83  )
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

On Tue, Aug 04, 2026 at 07:50:35PM +0300, Adrian Hunter wrote:
> On 04/08/2026 19:46, Frank Li wrote:
> > On Tue, Aug 04, 2026 at 04:37:57PM +0300, Adrian Hunter wrote:
> >> i3c_master_register_new_i3c_devs() registers newly discovered devices
> >> while holding i3c_bus_normaluse_lock(), a down_read().  device_register()
> >> can immediately probe the device, and probe callbacks typically invoke
> >> I3C helpers that take i3c_bus_normaluse_lock() again, leading to a
> >> recursive acquisition of the same rwsem.  rwsems do not support recursive
> >> read locking and can deadlock when a writer is waiting.  See the
> >> "Recursive read locks" section of Documentation/locking/lockdep-design.rst.
> >>
> >> For example, with Intel LPSS I3C, LOCKDEP generates a WARNING like:
> >>   # echo intel-lpss-i3c.0 > /sys/bus/platform/drivers/mipi-i3c-hci/unbind
> >>   # echo intel-lpss-i3c.0 > /sys/bus/platform/drivers/mipi-i3c-hci/bind
> >>   WARNING: possible recursive locking detected
> >>   kworker/5:1/94 is trying to acquire lock:
> >>   ffff88811c810d78 (&i3cbus->lock){++++}-{4:4}, at: i3c_device_match_id+0x45/0x370
> >>   but task is already holding lock:
> >>   ffff88811c810d78 (&i3cbus->lock){++++}-{4:4}, at: i3c_master_reg_work_fn+0x21/0x5f0
> >>
> >> Fix this by separating device creation from device registration.
> >> Populate desc->dev under the maintenance lock, collect the devices that
> >> still need registration into a local list, then release the lock before
> >> calling device_register().  Finally retake the lock and clean up any
> >> devices that failed to register.
> >>
> >> Use the maintenance lock rather than the normal-use lock while adding
> >> device objects.  A write-side maintenance lock prevents readers from
> >> observing a partially initialized desc->dev during initial device
> >> population, or desc->dev disappearing if registration fails.
> >>
> >> The local list requires a list node, so add a list node member to struct
> >> i3c_device.
> >>
> >> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >> ---
> >>
> >>
> >> Changes in V3:
> >>
> >> 	Added Cc: stable@vger.kernel.org
> >>
> >> Changes in V2:
> >>
> >> 	New patch
> >>
> >>
> >>  drivers/i3c/master.c       | 45 ++++++++++++++++++++++++++++----------
> >>  include/linux/i3c/master.h |  2 ++
> >>  2 files changed, 35 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> >> index f485b98805cf..d2fb1a110521 100644
> >> --- a/drivers/i3c/master.c
> >> +++ b/drivers/i3c/master.c
> >> @@ -2069,12 +2069,21 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
> >>  static void
> >>  i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
> >>  {
> >> +	struct i3c_device *i3cdev, *tmp;
> >>  	struct i3c_dev_desc *desc;
> >> +	LIST_HEAD(i3c_unreg_devs);
> >>  	int ret;
> >>
> >>  	if (!master->init_done)
> >>  		return;
> >>
> >> +	i3c_bus_maintenance_lock(&master->bus);
> >> +
> >> +	if (master->shutting_down) {
> >> +		i3c_bus_maintenance_unlock(&master->bus);
> >> +		return;
> >> +	}
> >> +
> >>  	i3c_bus_for_each_i3cdev(&master->bus, desc) {
> >>  		if (desc->dev || !desc->info.dyn_addr || desc == master->this)
> >>  			continue;
> >> @@ -2104,25 +2113,37 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
> >>  		if (desc->boardinfo)
> >>  			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
> >>
> >> -		ret = device_register(&desc->dev->dev);
> >> -		if (ret) {
> >> -			dev_err(&master->dev,
> >> -				"Failed to add I3C device (err = %d)\n", ret);
> >> -			desc->dev->desc = NULL;
> >> -			put_device(&desc->dev->dev);
> >> -			desc->dev = NULL;
> >> -		}
> >> +		list_add_tail(&desc->dev->node, &i3c_unreg_devs);
> >> +	}
> >> +
> >> +	i3c_bus_maintenance_unlock(&master->bus);
> >> +
> >> +	list_for_each_entry_safe(i3cdev, tmp, &i3c_unreg_devs, node) {
> >> +		ret = device_register(&i3cdev->dev);
> >> +		if (ret)
> >> +			dev_err(&master->dev, "Failed to add I3C device (err = %d)\n", ret);
> >> +		else
> >> +			list_del_init(&i3cdev->node);
> >
> > Is it risk del node without acquire lock?
>
> The list head is local i3c_unreg_devs, and i3c_master_register_new_i3c_devs()
> is not permitted to race with itself, by being called only from the work
> function i3c_master_reg_work_fn()

Add comments in struct list_head node; in case someone reuse it without
lock at other place

Frank

>
> >
> > Frank
> >
> >> +	}
> >> +
> >> +	i3c_bus_maintenance_lock(&master->bus);
> >> +
> >> +	list_for_each_entry_safe(i3cdev, tmp, &i3c_unreg_devs, node) {
> >> +		list_del(&i3cdev->node);
> >> +		desc = i3cdev->desc;
> >> +		i3cdev->desc = NULL;
> >> +		put_device(&i3cdev->dev);
> >> +		desc->dev = NULL;
> >>  	}
> >> +
> >> +	i3c_bus_maintenance_unlock(&master->bus);
> >>  }
> >>
> >>  static void i3c_master_reg_work_fn(struct work_struct *work)
> >>  {
> >>  	struct i3c_master_controller *master = container_of(work, typeof(*master), reg_work);
> >>
> >> -	i3c_bus_normaluse_lock(&master->bus);
> >> -	if (!master->shutting_down)
> >> -		i3c_master_register_new_i3c_devs(master);
> >> -	i3c_bus_normaluse_unlock(&master->bus);
> >> +	i3c_master_register_new_i3c_devs(master);
> >>  }
> >>
> >>  /**
> >> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> >> index 2dc139a217bf..2b96c4ea75fb 100644
> >> --- a/include/linux/i3c/master.h
> >> +++ b/include/linux/i3c/master.h
> >> @@ -238,6 +238,7 @@ struct i3c_dev_desc {
> >>   *	  every time the I3C device is rediscovered with a different dynamic
> >>   *	  address assigned
> >>   * @bus: I3C bus this device is attached to
> >> + * @node: unregistered device list node
> >>   *
> >>   * I3C device object exposed to I3C device drivers. The takes care of linking
> >>   * this object to the relevant &struct_i3c_dev_desc one.
> >> @@ -248,6 +249,7 @@ struct i3c_device {
> >>  	struct device dev;
> >>  	struct i3c_dev_desc *desc;
> >>  	struct i3c_bus *bus;
> >> +	struct list_head node;
> >>  };
> >>
> >>  /*
> >> --
> >> 2.53.0
> >>
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
