Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2E9CD5BB0
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 19:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6B+q0hYbTSGWYrilwBmPe4nr3gB2zm6JUdtqlbuZVP8=; b=gWSpHwkLMC/SGn
	V4FwkIsqQyxMiqP3SBfRB8fO88bJBFY8CaoXDFyOLfzkzLQNcdw6dI1XZZ/L6QX+alrHcX4BUof7a
	XhsVaqP7tNm9mTrAsCVZtB4KX6dvjNP5jMxAeQEFJmZNNK4jbTAMltv2kIvEPkufSs4qo1f6NGsQu
	28tSFQRDUHZtbOr0FXN+NpCw4TBqqt8/7OJv5FjEP5j6co56fwPYyIfJyQkrknaRD4z7trfOGSIsQ
	FCX1koBkAn2L2hyBSHsQUHmuIZRBWURlr3I6Nwoi1pBwYvAG6seHuYQcogAAgpcjXzV9UZJAD4tBG
	qhO0mzgnFeSVsc0FvbYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQV6V-0000000BjOG-0oZT;
	Fri, 22 May 2026 19:00:15 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQV6R-0000000BjKO-404G
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 19:00:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKtHhYRSh7O4u0oMjDJ/Agg+cdXjXPhjgyc54YzCUxXL/Y0zKh84/IgEYqDhVMlggAizkt16ILtVFUurJcxMGEywgTCVMondAxDSyXOunWiwNc4HDO0K/OtmnBtuloLcLwmCX8B6G5tnaih+F98O0wXYUJpaWzKTravQ1eN5lcbv8q3IQ14PMsmPWiCErbF2PiVi023nv5cdNvQSruSudwY0SCskkXY9bhA1S8fZGw1JuLl2wQs6+3cUMew/4dD55dm9y/oBwbkMCa50la964u3i6D81M7qTf4dyakZGQmCBa7C3S4grHkYNRa7m82hDanXzUgC6zuwWNYHjvYyhng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S12xEiLF1qXI7oIaMC6TpO0YTJPnxeMBqC/i3QyLT7E=;
 b=aVkBMgx8LBhuDVvbRugirTmOnT6YeN1SlKqgFphFq8ggO00nSzYMSMEoApkyyCyESD8n5YL+ljRoBbBRG5PrvPLApOoiIv+c8ABov+rE0KIG4/fF7P6WJ600OGirGZF0uKe9Kf3ik6mz98dVNwcFY9Uw2PijeeDTPNjIkCD949Uzwa511bKuMOv9E5kWSw0GWVzLkKkpfX2/yLMKNTrhXMeI7YW9MEGMUGP0dwKsOQ066YywK5lg5bqLSTh0MfG1dyX01CG3C3c9n120QHKdjx0fDsYVpisizeFtTp3C+qN5VUQ0Tfq+fSfsChFWCuBwlm/ll2p28IwsnKstnBskXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S12xEiLF1qXI7oIaMC6TpO0YTJPnxeMBqC/i3QyLT7E=;
 b=LDN4ys1U3woPjMTx/BcF7pGzvUyMPn0zUqpW4wYkmJC8f0wwa7tHfnLf0wqEmcKnqG1iw5cOcEVtnJrVGXlQhM7KpoEy1uqNfgrc0sOFsHQys+8gF+YdQgsqva+1Z6Zy6kHX69ZuA3YPnj7tZ8QQlH6IBO28hrP6hNGY7vu88F3btxSsvcA77dczffjAyaCqcqMEioph/EUt1FC9L1R6UeNamDX5bnJymW+xel0YugqLjmx+RBUmFZxHPH5JhW8fN1hcHu+DIQoznpbSOGv3iym+RiyTRtOUhufdqV2qTjye9ATe6GHy/mtbCWzljzZGMN9/dzDFgq09A2jbNDvMlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB6909.eurprd04.prod.outlook.com (2603:10a6:803:13d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:00:04 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:00:04 +0000
Date: Fri, 22 May 2026 14:59:58 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] i3c: master: Defer new-device registration out of
 DAA caller context
Message-ID: <ahCnrlfZZFPI4C_s@lizhi-Precision-Tower-5810>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
 <20260512121732.406009-7-adrian.hunter@intel.com>
 <agNXuQDsj_bHSA7s@lizhi-Precision-Tower-5810>
 <01df8e0e-9041-401b-ab73-634701c4acdc@intel.com>
 <agTK5tMCHdLEezCR@lizhi-Precision-Tower-5810>
 <417993a7-4a4f-4ba5-a815-aab63ed03a3c@intel.com>
 <ag9PyMLhhwYJ_yRB@lizhi-Precision-Tower-5810>
 <de8f3e0c-200e-4da2-9f8e-7321d2b23717@intel.com>
Content-Disposition: inline
In-Reply-To: <de8f3e0c-200e-4da2-9f8e-7321d2b23717@intel.com>
X-ClientProxiedBy: SA9PR13CA0104.namprd13.prod.outlook.com
 (2603:10b6:806:24::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cad8310-99f2-4f2e-5d0e-08deb834554b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|56012099003|22082099003|18002099003|38350700014|4143699003|6133799003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: RjEKzPwpKQGA1+2bRfoBvVYOwcsljfuLDQzzoShwgEjJiRKUVAOtXR1z3F5e9KM9Mj1m6epFFZDM4V8dsUnaVZ+9YoeUBT4ceCJvgOLyl8otgeWo7iq+X7Zp9kpUxvB5SrHi/yRtkpSclzKblQGKLJPHNC8sQbXkGBo32B4g86LiS2JluKBVnqwAIJFhgJ+XAT90bZ2wKaePx8O9DV0mu0V7DzOsBYmtEHyTLJ46MBtchg12ZT/E5VkbuBXDtnDNt6GIUJh/sakROJCf9oP7TNb+sCDlvFVoYQZrBTjQhCZV8p/7oKIfwdexozl/tu2aE+kWWgkpKn2pFnSYmVea3+4eePtS0DhgQlZvHQfIFeFOaXQHtdeisJ2B+MfvsrXwryZg3gRZBDz0WIeEkNJpHp714Z6ZO3vVJCa6js4/6ddlZ9mpsm8suQfAmzGUP6mgW0/NhAiBsjnXosndXClmCf7rn4qyw6FMW+eeyv58b5sZfSM2vFj9WsnU+pHHVm5yXpc8apglbvVb8m1Fbr63jgNu2DcY6nCSNiXnHI+XiT0PTq1MlAGpt+XgEy6lsrpwEfgCxHxZE0zGFX2kB+IZrMcFs6bxLQpcAosO8SLH9JIHTA5+Uu0NfpcTD2JGwj0s27ZH2IEz4M0voFdwUEipsX80SnjeyIogQsmVWtqkhDwLF8UE1LE1bMRcUbEJMB+nyr4N1TevSFNY3YzLs+wSCTaSq+D7E3JiOK7sbi2jDXE5hpiboL3fjasywGxfVbgE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(56012099003)(22082099003)(18002099003)(38350700014)(4143699003)(6133799003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Eqhf0IfVPWSh+1lIJmLtoqrHCKNbHGmA4xcUQp2tP8HeNUZzDuR34M3PgFDy?=
 =?us-ascii?Q?tjXedMD2tJ78gshd5ayTk68BjHwPS+UerSBahLvLA4Rr/tzarAgwVpOyhd1+?=
 =?us-ascii?Q?PcaXrTRCm49DIN0chyfuA7qE56uBMY4IohzkfWpNMiLBRK4EtDyvFemCT3rw?=
 =?us-ascii?Q?nOp+70/dTVQjYqoyHBs/hXNgnKzCCIbrvvLFDGlJKHdHfaQG784h/8w/2rwe?=
 =?us-ascii?Q?3HTB35CZ5u+92BSVoToy7slmKA9NbDWAAPiUhUdrWGzEyvffE+I7DioSZrbk?=
 =?us-ascii?Q?IbfuHFf3G7zn8u8GaVJzU6hghQ9/KXTuBLmTR+YpruR1XgQLfk1ZZ+cENwIP?=
 =?us-ascii?Q?mhyCQlbkgrSg1Yc1Sv3DfaaK6vlNOyMEHjXJzpjdUauokjZsXLZSyqELXs4o?=
 =?us-ascii?Q?bM3l2MosMJGn9A99UfvDHtNvHql+joQaBepcj2PAmAYZOqrWKZgHH8IWc8Jd?=
 =?us-ascii?Q?FfBjI8hIGtEEFxI8zhM9vhimcJaBlmcQElGoI+B1J7/+Wf8BhyC+a1eYbqsT?=
 =?us-ascii?Q?KjWbXWC6F9JZHrwLcd+h52BVKnJ1t4okdMT7ymg0Lc7iLPKc8k+O6otCAOrP?=
 =?us-ascii?Q?hxt1JVsSiIXWtBxVhd90+ZP9ZnP5V09YucRoKm9MAV1B+5XiDx04QEXJczpB?=
 =?us-ascii?Q?FduhyfQhYyfzumrVOYvvfFon4YxpYsPyHVCXqxoWH+6rxVV/z6Ec52QDVBVh?=
 =?us-ascii?Q?AZ2pJ/kVMxPbqCIKNvV0YLdDx7XdWiYuK0w+gv27NPjGDKn5+JidnVDDDUQd?=
 =?us-ascii?Q?Nssp/5pxgZM8NSRDYnnN5W1RD9TyoeKFz/9U32ZZIXoJVLXHcC27yy9hLLya?=
 =?us-ascii?Q?SpUNLxaiPFolz2f3WJvy/yPdhYqOsrBYokdjCxsg2XqSNdqhGAM6Ue1/mcrz?=
 =?us-ascii?Q?eu28FWPM4fH120MbX5a9G8oclKSYhnP9ZQPafQF4p6RDQVIPxpv6NOxr0qrE?=
 =?us-ascii?Q?0GDEQTd2VHmVGIyuZDLJ1c1TtKtotV/SxW2C0prYTo51Iy3D2QQCDdEpXwjn?=
 =?us-ascii?Q?32UkE5F48ej8wzZNdj1RqdF1HC63BL1r0P+Z+1rUHGqBm+vMB55ZkjJ4CIIb?=
 =?us-ascii?Q?97h6ioTIgFuFLGaegga97454OLyJ8hX6XW8ejbtSaB6PYfvAtue/Y3HBbiBQ?=
 =?us-ascii?Q?LmtbCfPG3FxtvqdJXXOUdwOQSCL2tUK+JezniYaYM/gZlAelOFPBtn+SwDyY?=
 =?us-ascii?Q?gl03BhtOL9A0mDfNmQG80eeiFsZRJ0DSdWNEG4x3A8KDtUw/yW22lWE/W/VA?=
 =?us-ascii?Q?NhUwkTeenjTTycH7T1EMlJ5RiYjJdpBBf7uy7ugu/r0kFNAIV5oMKqWKwtDV?=
 =?us-ascii?Q?w0mAYdiuOZimtrAH/YqU2QSEaXQFkVjkge7RPwpFhkZ1er9tkDkogHEghMEJ?=
 =?us-ascii?Q?ZQJsrkbNjb5E9BJ2PpTwykj8Det+zhu7FpUR9SgKzMmr7ojpcQ8NiNib0SQ1?=
 =?us-ascii?Q?xOykEXNuzgUTCFnul4Q6CrTJqKn5vqYbrQ2q83Fn66TEIZcdFrXNbqHa63xc?=
 =?us-ascii?Q?9CljqQJfVGrapO1Kcq4qypMPmBtHD7dYUA5TSXngb/jK+0GsJI3JkLNIK8N8?=
 =?us-ascii?Q?GZufz2ZmeLsm07n7eadilx4AMUdTC9jS/WSEr3xbBTrgjztDp1iqgwSLNlcL?=
 =?us-ascii?Q?575Y4lb9jia5aKcNh5TvP+kfX4O16sqGeth/9YDImFzrFSGJlNJF7IvaCno4?=
 =?us-ascii?Q?nI+uXe98Q13YBn++sW3XccXf6UNwZlSlg1jI2t5f0BCVLtKz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cad8310-99f2-4f2e-5d0e-08deb834554b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:00:04.4384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cXoSm5lLP68YYtVACRB5cDkoZ9yHEbcYou1EeqISdgEIzYsaVsG3VlFeetH97Qyv5Xw6oqhUSXiy0Fp1v6xMdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_120011_996788_151A84FF 
X-CRM114-Status: GOOD (  28.04  )
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

On Fri, May 22, 2026 at 07:52:17AM +0300, Adrian Hunter wrote:
> On 21/05/2026 21:32, Frank Li wrote:
> > On Fri, May 15, 2026 at 07:42:20PM +0300, Adrian Hunter wrote:
> >> On 13/05/2026 22:03, Frank Li wrote:
> >>> On Wed, May 13, 2026 at 08:45:55AM +0300, Adrian Hunter wrote:
> >>>> On 12/05/2026 19:39, Frank Li wrote:
> >>>>> On Tue, May 12, 2026 at 03:17:30PM +0300, Adrian Hunter wrote:
> >>>>>> Master drivers may invoke i3c_master_do_daa_ext() during resume to
> >>>>>> re-run Dynamic Address Assignment.  As well as assigning addresses to
> >>>>>> any newly arrived devices, this restores the dynamic address of devices
> >>>>>> that lost it across system suspend, so it has to run as part of the
> >>>>>> controller's resume path.
> >>>>>>
> >>>>>> A side effect of i3c_master_do_daa_ext() today is that it also
> >>>>>> registers any newly discovered I3C devices with the driver model
> >>>>>> inline, via i3c_master_register_new_i3c_devs().  Doing that from the
> >>>>>> resume path is problematic: a hot-join-capable device may join the bus
> >>>>>> during this same DAA, and registering it immediately would push driver
> >>>>>> model work (probing, sysfs, etc.) into the controller's resume context,
> >>>>>> where the rest of the system is not yet fully resumed and the
> >>>>>> controller driver is still partway through its own resume sequence.
> >>>>>>
> >>>>>> Decouple discovery from registration: add a reg_work work item to
> >>>>>> struct i3c_master_controller and have i3c_master_do_daa_ext() queue it
> >>>>>> on master->wq (the freezable workqueue) instead of calling
> >>>>>> i3c_master_register_new_i3c_devs() directly.  The worker performs the
> >>>>>> registration only when the controller is not shutting_down, and is
> >>>>>> cancelled alongside hj_work in i3c_master_shutdown().  Because wq is
> >>>>>> freezable, any newly observed devices end up being registered after
> >>>>>> the system has finished resuming.
> >>>>>>
> >>>>>> i3c_master_register() also routes its initial post-bus-init registration
> >>>>>> through reg_work, using flush_work() to keep probe-time behavior
> >>>>>> synchronous.  This keeps a single registration code path and ensures the
> >>>>>> worker is the only writer of desc->dev.
> >>>>>
> >>>>> why not direct use hj_work?
> >>>>
> >>>> i3c_master_register_new_i3c_devs() use of desc->dev is racy, so
> >>>> i3c_master_register_new_i3c_devs() must not be allowed to race
> >>>> with itself.  Having it only ever run via reg_work achieves that.
> >>>
> >>> Sorry, I have not understand these, Can provide some detail?
> >>
> >> >From i3c_master_register_new_i3c_devs():
> >>
> >> 	i3c_bus_for_each_i3cdev(&master->bus, desc) {
> >> 		if (desc->dev || !desc->info.dyn_addr || desc == master->this)
> >> 			continue;
> >>
> >> 		desc->dev = kzalloc_obj(*desc->dev);
> >> 		...
> >> 		ret = device_register(&desc->dev->dev);
> >>
> >> This is done under the shared i3c_bus_normaluse_lock(), so there can
> >
> > i3c_bus_normaluse_lock() may is wrong, suppose it should be
> > i3c_bus_maintenance_lock(), register new devices change i3c bus's
> > hierarchical structure.
>
> If device_register() probes the device and the probe tries to
> access the device, won't it deadlock if i3c_bus_maintenance_lock()
> is held.

Okay,

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> >
> > Frank
> >
> >> be 2 or more instances of i3c_master_register_new_i3c_devs() running
> >> at the same time.  They might all see desc->dev is NULL and then all
> >> of them try to initialize and register a dev for the same I3C device.
> >>
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
