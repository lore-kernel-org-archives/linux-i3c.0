Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBACCD5BAF
	for <linux-i3c@archiver.kernel.org>; Thu, 21 May 2026 18:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sCmnCrG67qcz6nloQt3ikXAzkja4Fy+O1rswgOkpEhE=; b=FCWJzcUSufMXEN
	mUA0Nn54upd4I88IyUT0JC44vrDIIMwNkbplQ4nc1wTinkyfO9C2R1QctT/e1pXKbJFlTZuh+Mn3/
	uesdE/Ku8XPTZXIvxFRsOB78cV72fEtzhi3Ej5xmh2z01/Rotehsa6xZJLrs4pViB2WATARAlw+P3
	hdBNdDYVhyE+j66NrcySxiCB4ADNl9h+N+B3kkEAqPHpc59X9uj1Y51IIGwWq6RAzGYZYQnHCiWZo
	HmBEZXdJztPMGEkQW44DNoZiyq2d/60jXp8FZy12RXX2CyPQpZyvn8+1YgaTMwisKfUGzmQY/L01G
	nfc+V/Lz6lnMiKaMhBeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ8CY-00000008nP7-3APQ;
	Thu, 21 May 2026 18:32:58 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ8CW-00000008nOJ-3oyy
	for linux-i3c@lists.infradead.org;
	Thu, 21 May 2026 18:32:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctDbJgcq2dG/fY62xstHj4T85g6EgmRaZ5xH0lfUUuImVatj3giYY4lm48yvC49ne1aIujAlqWNsin968pGUs7fZaEe9CUuH6mZYXfkOzm9JZMRSL7NjkHuZnyaBUwAJ2NGlMmvylmyit8dZByerOHaw7r0rrm38XfDNG3nir8TTjmOlBn9Al6G45FOUlBeMpYK+r2FbHzq2STEuVyA8HSLDxFH81ajVT2Nzq/hOn12Z8ertIHnYfdr+TEDimHfTynSFcfGjB6f0S78UlnWHJOsIqJrHCMEiMJCiFOlJvCR+bz1c9iHZ20YL47hIfg4I72raTiMsRE+KbOKDvM5ZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xxz2qUswk5LBFb4Sh4Jxl1wCP61+qxJubUrzbnt0lPc=;
 b=eww1BJhjMFNxcQ1qoklB/mO/kZg2+mRJxi/8W7or+E2J2tKdM6LH87ugMfnC/g68LKvfFu6SXwzkG6rsG7Yqh6HGYYtMU9K4AiFbDP9hgPnwukEwOIMfLaCRSuASHGRDzkUnYj3YhpsArPRMj31EDkyX05nckw3e23JWxmujAARlH3jI5Jef9S135Mi2TidcpYsU6Q6rhpSig7pQgL6ZO8XbF6EJPtf3woEoCKPBQFT5DNBMY7Cunc0rBhTaAqAC0Gk2bnx72XisxwHJ11+2xGJI441mq4/0/WMHHgaGOOB4zbiGfuX6yrAfD5vrDKOo7YJIGVe10TEpPP1L74KWYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xxz2qUswk5LBFb4Sh4Jxl1wCP61+qxJubUrzbnt0lPc=;
 b=Z7YmziOPp5IUedqhAd7cLjd2LvRw8ZMq4ju2wKQki7UuDpZ0BIxPSxKMmRUhHDjxkiORSPxoLCP+BGwv+f+X1lsPagX/uhOr2f8XNrTmPvW7GTwidPON+jom4BfdQ6s9jD2F0xbPQ9yi8bzCT68bybJ4cfM8kIWh0TA5ud+qF48ig8BUN6eW3E8GGbt2lohlOGXTP3aTTeZ3U0VMrhhGGPj8AMJ02IZGP1eWOv2PgR4eHtSXqRCZloCUh4yGGjZEaqYpQ36oDVXifreI5g/NHJ5mTdF6GZr48zBEihHzFAcLRCB8RPw7CJgdkhVrajQacYAJpLL24E2utaJsjNfWDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by DU0PR04MB11260.eurprd04.prod.outlook.com (2603:10a6:10:5dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 18:32:49 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 18:32:49 +0000
Date: Thu, 21 May 2026 14:32:40 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] i3c: master: Defer new-device registration out of
 DAA caller context
Message-ID: <ag9PyMLhhwYJ_yRB@lizhi-Precision-Tower-5810>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
 <20260512121732.406009-7-adrian.hunter@intel.com>
 <agNXuQDsj_bHSA7s@lizhi-Precision-Tower-5810>
 <01df8e0e-9041-401b-ab73-634701c4acdc@intel.com>
 <agTK5tMCHdLEezCR@lizhi-Precision-Tower-5810>
 <417993a7-4a4f-4ba5-a815-aab63ed03a3c@intel.com>
Content-Disposition: inline
In-Reply-To: <417993a7-4a4f-4ba5-a815-aab63ed03a3c@intel.com>
X-ClientProxiedBy: SJ0PR13CA0076.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|DU0PR04MB11260:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a73fdef-9c0c-4d26-c1ef-08deb7675c49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|1800799024|19092799006|22082099003|18002099003|56012099003|11063799006|5023799004|4143699003|6133799003|38350700014;
X-Microsoft-Antispam-Message-Info: WFYxREXbYXWTywenPZ+BFv1mSj1iPatIJz/RVwe+Rz7My9tUnPTs4niCidF/IA/oywy2fezPdqOcAGITCWye2Xpu6/r75VPdz2NQVJX/5qeKsqkcAMpylqvMT3iT2UkCEzrrJO3/rDOA1k2F306bjvW57guPMjqL7tnPXeOsVqX9U6es0pkrzNdxNOzxQmDXHcmJJGQ9rpZ/xXihpbtOoiJDyLY21FFmWGUQvw4KCu6qQ/cJAhuAZN4HU4I0tz+YTHOmX0kncXsOPnogBWFc90FEKHlGRBw59mZCClNOuQcKgqk+DVmJoxp37Hqmi18clZplrdp46QAJdHDAsF8U+iB/JhGSrZR4rHYc0c4enP0tikOVUDMV9YcWk6gkPU5091kitiC2EJ9hJY8/v4wFuMCGDGhwRAQjW/iOj85D5ILHLmVR2ui+HJSGL4ih/NQX9mExvIYmgYIQ/ku8b/imP1rxRl3X8fqHYGCG5DAo5GxeOSRNYK9OiZpuAcj0zPp0RtyDA5USgVf59giEJGfrLMCf8fiWDTBbmznGhJqgTfa7dozjVRGkU0G16Th/cbnD/hjYd4DABzONh9V10CNkG0ogwpLACYOgBpbaD1yMvmSpDw8D34HZZ14gOcwWuTX8RivuJj/gMRoMQoVDCySiLx1y4Ctb2cIEOhg+5EYwg1blpJvhqO8M1zFaNUOv6M+XWimtv75nn9UzFMqccsUdeH4ZKb9+73y8GrJGjVIyyMiTBTiqcI1GsAswYC9zg4VL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(19092799006)(22082099003)(18002099003)(56012099003)(11063799006)(5023799004)(4143699003)(6133799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OV+BBBPhcBkTsRZdevlYyXy1wLVY9caxK2JBgZ1/dkJfSWE9GwFXJ3g272JL?=
 =?us-ascii?Q?KvndEU6LrPo8BMhS9IH/SNikyYVKZnaCNBYs3ehR+lGQNGcWPaGYHmMRBA4X?=
 =?us-ascii?Q?TJo2wu3GIWaXu8bO34Zx57EkVqegin7hjvqWvGB4N9D0neH6c4TtmcP+QYfq?=
 =?us-ascii?Q?ScD77Xon17j4eQTa6t0XVfgGCRVdlW2wXjWuDfio98NxwOSEXAhxw1raveZo?=
 =?us-ascii?Q?FZf4DErQYG1n7Oa451IEvzCyn9ATDoi0ypAzgl4JyTGsyXezHORqAYDpGy2B?=
 =?us-ascii?Q?nDww+wv12BBwZAyRena9Ab9iYxlZ2Gh2yfaquCmB74nmalkqMl1N7Qh6U3oY?=
 =?us-ascii?Q?raCx+4fQHOtXP28TJ6h8135Yw+FdczTcOSZNKLec4vAQ7YUD4FXKiAMROy2D?=
 =?us-ascii?Q?15MdqJIkFgRsYSbWWi+uyzs4Me2SWrSAfcKfpBh19drJk/AX3dgfQ3OUATi/?=
 =?us-ascii?Q?7nUJx0X20IjOTTesnJasvD06KFkBDFGOVc5kbCvPH3TnCv7c2gkncfh5Wzw6?=
 =?us-ascii?Q?SMH19nl9ArvJZ4TXkGkETjBNlzdAaM6LWdmfDDON8oFveHbPRWNe0E6huPpE?=
 =?us-ascii?Q?/fqhS0qLeAJoQlY60etw9hIPmS5NpnzNpZQrQnbQFMwQnL5WOsaMwUBJaxzg?=
 =?us-ascii?Q?ltrg1eR5ZkvmqTNlxjjXhMlr7BShy956+AZ3yRZRP0iz5bl9MTYE2tPJPxPz?=
 =?us-ascii?Q?z1T2AMFw4wISakn9EZ2B99KM42tPN/rkBkPYPdKyhM7hJrQAjmXRn/qTIhmx?=
 =?us-ascii?Q?ZwTlHVnRHuvfMW7skd8QmQCZgEBBaZ8LabMIngtAL+jPk0xlCBp5lEC5+6U+?=
 =?us-ascii?Q?3SZbpVJ2Eq9LcS2QTX1tCoJpaWvp83R/9SXa4ZIAw9auapT06Shxyf81PfNa?=
 =?us-ascii?Q?WOD9DSScWOoR2AvaLSbg9P6C+o9SCL7PiSmVeqns/of//YWmKrbOvuZpbLXS?=
 =?us-ascii?Q?FsC4budVAnnuo+ShauHAoEbvnHulIYmjvrslFsV8Xcf+Kl8myuYqzcBuKQqG?=
 =?us-ascii?Q?Ba+x7tfW4pqtZ0Qky2yrEATmu8vh58C0aDyENklo/S2nDUJRRv7mrQVjYBJL?=
 =?us-ascii?Q?4oSd04uBEnhJ92xuK/Ys+rAc91w93LNJNFlRwJh7NmZrhwy6ROR32abtKoBW?=
 =?us-ascii?Q?9lVsTagpMDsKyMFCEGjSk4fE6Wkc9E2moANob8QzM4fJYmM+TkWo9WGtd2ie?=
 =?us-ascii?Q?SBwhMkJRjtnbnGrpwn1AKWO6Q/h2+7QJlCts4wJvzclhuZ6kmp6q4obbJe1D?=
 =?us-ascii?Q?u4czYahsEHJnMYTtUNUKmzG/gnrzOMeMZaTr8lgo0PG77rchtzMPoTw9uDK4?=
 =?us-ascii?Q?C6lKAyMBntDp0iLMiHZ8g5t2/NKyTQfSW9kNgVFPUNYunhEVIX2eYh1VGr+T?=
 =?us-ascii?Q?IHosxLmgPRsJQOp68YIcQuzMGLIl6SfEfkIBC15ccEzCsw6huWoWerLY4cYA?=
 =?us-ascii?Q?TfyOCkPQqmN3knivrnKt40l4lTVF4b9Ui1YRrv0DzSFXIPHy+rSs1jRtPRc+?=
 =?us-ascii?Q?glJ+PY1xsK40i6oWwuYoTFBfcNqvcpRfRkoj274pSj11SLLixGfcWZoAyw68?=
 =?us-ascii?Q?AbszDUzMx4BBXio528YCsFMBuP11QtgkhAt15NqPSeFtxEC1Qjg0HlpA7zVh?=
 =?us-ascii?Q?6LBX762tUcuDdIJQ/82+oYTA7lnp1qltV9qqdtxAN6LuR0qnd3Dn+1A+YAMc?=
 =?us-ascii?Q?hLwMEgBvylWm8BnPxw8NvZX3BZ8mKOku9issticXUL7S5wGv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a73fdef-9c0c-4d26-c1ef-08deb7675c49
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 18:32:49.7081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZiCSuVCvrGGkL3bKSpaKjj7391CU/4aJ8NcDY+R9dSpYN3LDhVsYkilJby6BO8bvqImp9fz4qmor+XcS725wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB11260
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_113256_968172_E1A6C765 
X-CRM114-Status: GOOD (  26.26  )
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

On Fri, May 15, 2026 at 07:42:20PM +0300, Adrian Hunter wrote:
> On 13/05/2026 22:03, Frank Li wrote:
> > On Wed, May 13, 2026 at 08:45:55AM +0300, Adrian Hunter wrote:
> >> On 12/05/2026 19:39, Frank Li wrote:
> >>> On Tue, May 12, 2026 at 03:17:30PM +0300, Adrian Hunter wrote:
> >>>> Master drivers may invoke i3c_master_do_daa_ext() during resume to
> >>>> re-run Dynamic Address Assignment.  As well as assigning addresses to
> >>>> any newly arrived devices, this restores the dynamic address of devices
> >>>> that lost it across system suspend, so it has to run as part of the
> >>>> controller's resume path.
> >>>>
> >>>> A side effect of i3c_master_do_daa_ext() today is that it also
> >>>> registers any newly discovered I3C devices with the driver model
> >>>> inline, via i3c_master_register_new_i3c_devs().  Doing that from the
> >>>> resume path is problematic: a hot-join-capable device may join the bus
> >>>> during this same DAA, and registering it immediately would push driver
> >>>> model work (probing, sysfs, etc.) into the controller's resume context,
> >>>> where the rest of the system is not yet fully resumed and the
> >>>> controller driver is still partway through its own resume sequence.
> >>>>
> >>>> Decouple discovery from registration: add a reg_work work item to
> >>>> struct i3c_master_controller and have i3c_master_do_daa_ext() queue it
> >>>> on master->wq (the freezable workqueue) instead of calling
> >>>> i3c_master_register_new_i3c_devs() directly.  The worker performs the
> >>>> registration only when the controller is not shutting_down, and is
> >>>> cancelled alongside hj_work in i3c_master_shutdown().  Because wq is
> >>>> freezable, any newly observed devices end up being registered after
> >>>> the system has finished resuming.
> >>>>
> >>>> i3c_master_register() also routes its initial post-bus-init registration
> >>>> through reg_work, using flush_work() to keep probe-time behavior
> >>>> synchronous.  This keeps a single registration code path and ensures the
> >>>> worker is the only writer of desc->dev.
> >>>
> >>> why not direct use hj_work?
> >>
> >> i3c_master_register_new_i3c_devs() use of desc->dev is racy, so
> >> i3c_master_register_new_i3c_devs() must not be allowed to race
> >> with itself.  Having it only ever run via reg_work achieves that.
> >
> > Sorry, I have not understand these, Can provide some detail?
>
> >From i3c_master_register_new_i3c_devs():
>
> 	i3c_bus_for_each_i3cdev(&master->bus, desc) {
> 		if (desc->dev || !desc->info.dyn_addr || desc == master->this)
> 			continue;
>
> 		desc->dev = kzalloc_obj(*desc->dev);
> 		...
> 		ret = device_register(&desc->dev->dev);
>
> This is done under the shared i3c_bus_normaluse_lock(), so there can

i3c_bus_normaluse_lock() may is wrong, suppose it should be
i3c_bus_maintenance_lock(), register new devices change i3c bus's
hierarchical structure.

Frank

> be 2 or more instances of i3c_master_register_new_i3c_devs() running
> at the same time.  They might all see desc->dev is NULL and then all
> of them try to initialize and register a dev for the same I3C device.
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
