Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D955CD37AC
	for <linux-i3c@archiver.kernel.org>; Wed, 13 May 2026 19:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L27FtFBtbGr4DbAyIZvfP9iEx69W1tt1CxOwSF49ST8=; b=R8QHqDnU7lg5vV
	FTDzxdBpPqTEIgAcvWHAAF2EA4Etsgv8s17Xm+xQ7kiIU44F5s9IOqk0mIoR04/JVQNpzjafBcMS5
	32XMRHc1BQ4oC5El+TLHRaFyx0yxAb44En40NHVRdHYPSbixFLO3JGU6VO5u0akKq12z6z3ilnQOl
	hd4ujCL7ofREvRRfPIR2QKDCtieOYdmS2kV7VAHIt9+8SgTqjppT+rgx7fe5DNZ4QJ5y3c1EKLoA2
	8Fz+3BNtVLV+cYwDJSMB11OmKm5517z9uOePYGUwN6WqpIb0xbrOm9lJMALrEESZoe9LFVf8ZGBDC
	3hDdZm1UfAV6JJLNAZdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNErV-00000003Wde-0WrP;
	Wed, 13 May 2026 19:03:17 +0000
Received: from mail-swedencentralazon11013031.outbound.protection.outlook.com ([52.101.83.31] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNErR-00000003Wb9-1zVx
	for linux-i3c@lists.infradead.org;
	Wed, 13 May 2026 19:03:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fb0mYXmyfsFSTu/H75Q3OKVaRLADRImNMJurOrt8DobjiTS8DwUUa+vMDUiCodxpsBTA4QqU5b2srI5e2BwhsB0zpVIM9JSzQtgLbKhCMcwUJjGTvRoGfsW5XMADoyy1oOsOYQsaEjC05xjyMWT07DuRyMnbB/CgZ+f5Yc4aNO5z3yIMWuc8MzrX/ng6mdGJkSZTpNezuBJw5C/95tHvKiwkR7MhWC6jzxSH6uevbk4oQxNTxpSVIGHwxnSRe87lO3u2lc4HSjeouv+AkSRi8nlX1cEe1J0LXijV5P/bZ5sTA7pdoOCBYIQbp2afG48WRi36Im/mK5bkYdqjOthlxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/94UAkOPoK7W485xO1ghJLmt5oO/3eOmZ9prv4labs0=;
 b=JfNHAhT8Q3/nS8CMFUrOea7hXvT84PqmbRIKv0RKkezqbCt3Ev6sqTUSUJH2/gQz2yyRjlyGwSyLRBr1nulXur09bb2y3nXZHnURk6NIZSOvRykyx7pnxJam8K0UPXcILQr/gGjXOm3g03u0d+gKumFsFHnm0nJvpyJY+TxrM/VTFc0/KtCTXB3Lwp31/No2OjJTsiIx6/KiAohrby+7TeVUZ0RCkMbSulCZSfTjx18HSEsfb892gjz4yocKBqtchWcH/vqkkA22cSmtN+yRSGfrS383EkmfkCdCIbQ6XsSfO6WImo0TQ6fHkgZKT21ZCVaG2WwXtizJMQa2fl0CDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/94UAkOPoK7W485xO1ghJLmt5oO/3eOmZ9prv4labs0=;
 b=grF1nIWAXWgIaY8E6HqE7p4p0nAfxUQ937sRgKEkBuBNw4Sbikg2316wdHK030Q0zgdKX2lcxwKxDE6dqhfv7cGR2iM7FVaUTXTReW4QmbyFHefPcFWTxa5drRtV5W6eYPs1hdW6UpCoNkp7TlJWk/NJSKhVrXqmFFL386woa1rqT+55Ar08bM5nrS62Y2mvmBt/z5DEd5v9DTinZF93MlRFdX/DQd2zhnp/jpKZfJhYQyCYsgM1E9QspfR1qQBmhDwO12FCw9QPn+guOyueOSJ3LkhAygRb3fOvrF06GMzO8JDyUL66ieswPaJcvrWtwizSlH8Vr+0CM6pEvHzrYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB9180.eurprd04.prod.outlook.com (2603:10a6:10:2f7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 19:03:06 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 19:03:06 +0000
Date: Wed, 13 May 2026 15:03:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] i3c: master: Defer new-device registration out of
 DAA caller context
Message-ID: <agTK5tMCHdLEezCR@lizhi-Precision-Tower-5810>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
 <20260512121732.406009-7-adrian.hunter@intel.com>
 <agNXuQDsj_bHSA7s@lizhi-Precision-Tower-5810>
 <01df8e0e-9041-401b-ab73-634701c4acdc@intel.com>
Content-Disposition: inline
In-Reply-To: <01df8e0e-9041-401b-ab73-634701c4acdc@intel.com>
X-ClientProxiedBy: SA1P222CA0003.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::31) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: 641c15f0-b49a-4259-b519-08deb1224445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|366016|1800799024|38350700014|56012099003|11063799003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: gbSCirg5MaU14o31yRXlSoe/Ro/5vIrhZw1/I0FGBUB0y4r3GH7XE2FmHAkcb2bjxY1zXGuoHgh124hN/3cUw0wb7iz0Li6hHcQw/96l5x+v+7dk53j9wLzui17PecDGxG21nTVwWNByvmUR80DHbl9ps6YJprCO9VBrbaLKzcaz47nGMh4QZDtzOnLghZGEH9NjA0SVWMESTx6WDAK2ojvmAp8X4DaXSZVLQ8QcdNow3RfwJwEa9IDtkeQWKCQR1N2fgGJJHtouX4NTb/1SArZHsXmzvjehRhwOpniLb+HZjWW18KND05bZ+lztw5D+rfQBpf5uU//yZTpPr8kTlHkv3R0tMdoA/SBALOC9A22NiA+w3p3ctM9I3EtbShX/QJFQoHIt7dnq6fQrTy+OadckiGnHhBF0yO84Nd8DCMp+89z9WU0HrFeVFEPULT6EeDz/kH9F9+iyD08I4eQKXIpgNEWUYZiVJTXTU5cdJqc6yocjn7CMRKEKyFXNv/OuQWPk3uwJfNJXjuqfr41crMB2MtWdMztc83vA0i88YgSfKm1m9h8v6D5bMsLSJPJ3GjsZBvc/qRZi3W8g+lla1pYzsmsSbv56MeDWJhNgN+LbNaRaI1VCU6GBP3oulfDm1Nl1Clk/PAumwGD7VFbDyxUkRnK8lFMxMD+WppT6ZOc1zhtl2WEkoTBAUMoA+mAjQnsVsAegl1lX3HcHJeFujWRt7z6Gc4YTKrIEet/FPnmUU/lpypuBctQ383kuKG9Z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(366016)(1800799024)(38350700014)(56012099003)(11063799003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i41whOGwj3FxtyuMmLtpAiOL0SYks6XTD8j4L6lytPCX5Q+yXrh23pPLa9AJ?=
 =?us-ascii?Q?gdzEeOVNHcExfVZ3ou/qk0vC0v0z+zmFs9aGCc7/ym//nYJxIR7dGuqzbdtB?=
 =?us-ascii?Q?jXYH9riQZjT7i5MeTlXkdwHWCesjb4rSqqI8MBnlLeS+aDw1SjKs4r1E9jo4?=
 =?us-ascii?Q?gmxnVdNLeo3sj+88NWl9GqdJ0N3p/d0LIuaYxCifXmYkt5trzQ6MuF8onpGu?=
 =?us-ascii?Q?Q5gXrQwkEPegZ9cdx56nnGTbTTOfu/ULyiQv7XNvf1G6TVVBDdjgZzhDD1o0?=
 =?us-ascii?Q?0V07Xi+Vl9x7xWH5OEg+doI2SlqQJAKNJzkZ7I+PoFhQW0Dyh13bpBsjCxim?=
 =?us-ascii?Q?58nAqxRhD5UKNLq5FowCzuQ48tEPdmiscj8AouvpquX7p+/bF7VqF+5xE6Hv?=
 =?us-ascii?Q?pIhht7j+57am8QTSbudhbiCd0/QyK5dW8G/wvB6HPwtdWhEO3DsobDM1Tr7w?=
 =?us-ascii?Q?v37W6pXycOu6cOp9AbhbstDzCzdKlIEkjTrQGttEydrQCAH5RaMI+JOJXI/j?=
 =?us-ascii?Q?rf3v3wI4THzG15wQrYcxNGtEZFf9LqYLWqwymaezQaWN+uWzWWMcLa9QOts/?=
 =?us-ascii?Q?zQFZniDGxgcNY7j/JtxfuOXufA90u5evJ/X4KmvJjC2EdBVYmupD0sqrxQD8?=
 =?us-ascii?Q?tbAoQ+jc2eHXkDzonntto1YqkC1+hXU8Io+Ss9jpYZMsmpM5wWsJNvJDwfpJ?=
 =?us-ascii?Q?01UndhhXOXauQuW68t7zE9RTY5yON2A4u2TC7X/4Jsk+HxqVp1osRpqGNggQ?=
 =?us-ascii?Q?cdfWlFSsZUrYyCl3d2RrnLtvTNefhqtJ43pzhHeEiCu/Qm5os2wkWrzn14Wc?=
 =?us-ascii?Q?ZZqdcihGoREijFlLgtumCzY92iZPyJiH75CAZZOjq7tiq22EjhHqml5dVId3?=
 =?us-ascii?Q?9jxTe22HnYA+yrupOCCFHHjdq0HAZayvP4JSIcctiXquScfZyg4xuM452sVq?=
 =?us-ascii?Q?YGkk2WaEWKS8zbbuSw/h51y+TsTXZYHK8w9lbhMUjuD6eSvM2Z9xdQ/u7eff?=
 =?us-ascii?Q?UP4l2jDZOzkVTdNaMyW8LF596SovcIc+ZVGMuDs9RD42p9lMll2o1tOGPdOw?=
 =?us-ascii?Q?E7etrduH1xQG3JsnNrgMRz09j64SsU4eCcA8Q5KKiDHzUQjkUqu2QyoN+c9d?=
 =?us-ascii?Q?DPprLplNQL3/BpBbhzVJVa/Q1l2hXSN0HPJnCzBGJ/nRRzAJ+j7Io/zp0tJV?=
 =?us-ascii?Q?axgZXplxWeWv5EKIttt4XflrodWcujF96mCLsrzbOJuB/ChEtSWnQTo3wNZb?=
 =?us-ascii?Q?GNqkZFKP7xCJJML7A0xEIFbtiRcS94GBy+Vp7stjGIDUSxdqgc5/x/9Uoj6X?=
 =?us-ascii?Q?1Qvi1ehqALmfH/K9IEfRLb7ZVLdS/XCj78MGa0YBTklibYO36Ggr3lN3Wzm5?=
 =?us-ascii?Q?lqL3Lmr+z1KkRc/9whqek7GAx/DmbGWOkpT1bT/hdvg9f+4tsDoA3rLE56Wb?=
 =?us-ascii?Q?VwRA4iAO4kMproEz+7dI1HaOrRAWRUXk7lmeDjJMa0Omd96NTVKqyPFn9FB+?=
 =?us-ascii?Q?8K95fB53IxyAY+A6JoM4sAqU9gl1oaX0p6buN9Il7OScaOk0BB4Ze9sR5axT?=
 =?us-ascii?Q?JKzNMdU52RkiICs2YcN/viWTdUsqKY1KByQAE4hix41bnjicQy94vyRtp8EY?=
 =?us-ascii?Q?bUYmYwYHAnbmmbmVixzsfHu/TB9WF6JHKwCiCp0c2iZV5chvhNu/VumLlc7g?=
 =?us-ascii?Q?Xemv36timGD2EsJa77w11dlNUNnjIxJhGUxTzFqJ4eFeX6k6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 641c15f0-b49a-4259-b519-08deb1224445
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 19:03:06.7150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcVVMrXltiPOrqC6OPV8E8CfzoIkihot1t5U7NjYdWkc17ndlRrxiWK5i4Z30ZR4LiE/5EQLCdH9gMgkWDRXhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_120314_094462_47C73316 
X-CRM114-Status: GOOD (  21.94  )
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

On Wed, May 13, 2026 at 08:45:55AM +0300, Adrian Hunter wrote:
> On 12/05/2026 19:39, Frank Li wrote:
> > On Tue, May 12, 2026 at 03:17:30PM +0300, Adrian Hunter wrote:
> >> Master drivers may invoke i3c_master_do_daa_ext() during resume to
> >> re-run Dynamic Address Assignment.  As well as assigning addresses to
> >> any newly arrived devices, this restores the dynamic address of devices
> >> that lost it across system suspend, so it has to run as part of the
> >> controller's resume path.
> >>
> >> A side effect of i3c_master_do_daa_ext() today is that it also
> >> registers any newly discovered I3C devices with the driver model
> >> inline, via i3c_master_register_new_i3c_devs().  Doing that from the
> >> resume path is problematic: a hot-join-capable device may join the bus
> >> during this same DAA, and registering it immediately would push driver
> >> model work (probing, sysfs, etc.) into the controller's resume context,
> >> where the rest of the system is not yet fully resumed and the
> >> controller driver is still partway through its own resume sequence.
> >>
> >> Decouple discovery from registration: add a reg_work work item to
> >> struct i3c_master_controller and have i3c_master_do_daa_ext() queue it
> >> on master->wq (the freezable workqueue) instead of calling
> >> i3c_master_register_new_i3c_devs() directly.  The worker performs the
> >> registration only when the controller is not shutting_down, and is
> >> cancelled alongside hj_work in i3c_master_shutdown().  Because wq is
> >> freezable, any newly observed devices end up being registered after
> >> the system has finished resuming.
> >>
> >> i3c_master_register() also routes its initial post-bus-init registration
> >> through reg_work, using flush_work() to keep probe-time behavior
> >> synchronous.  This keeps a single registration code path and ensures the
> >> worker is the only writer of desc->dev.
> >
> > why not direct use hj_work?
>
> i3c_master_register_new_i3c_devs() use of desc->dev is racy, so
> i3c_master_register_new_i3c_devs() must not be allowed to race
> with itself.  Having it only ever run via reg_work achieves that.

Sorry, I have not understand these, Can provide some detail?

Frank
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
