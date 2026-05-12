Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C13CD343F
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 16:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNTC8ssskPQGf5OraR1dWcLAD7Zukrix503uVnrNLCY=; b=NEqBE6R8O72l6s
	lkxgxit8eX2wOJZIcChj8GHlfK59qhkI/Rlok9ozhZOtdnkGFBQDkf8m8SDWGkDYTLJcjupca1vnz
	ac5InFYKcYqhaoqsEVQzdJvg5zWpYrbIZNil2bMWA2CGa8/SlHw+PK0hRap5Ykhvj3W9dmFsnXXTr
	cHW4Sntj0mJCx7kNpPet63W2NjOsqnHekC9jFAPhzIsSDQ+D8SCcP4aUGx+/Cruk6QW09RgX+9Xb2
	JQHt0k6n9oGlkiahPcOJOkX2IIsZAlNAe+oAxqUYMLJMC9RVgU4YGjLCD9t0U0lfMR2WG6B6Lsqt5
	ZVQfgALCVswtbSU+uxnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMq8r-0000000HOT9-2pV4;
	Tue, 12 May 2026 16:39:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMq8r-0000000HOSl-0WQd
	for linux-i3c@bombadil.infradead.org;
	Tue, 12 May 2026 16:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=31E16yZFTEba9wiH5BCpeNM4a9v1q9uzLvqvrwI8KPM=; b=Ca2l8kkxbApcH2fZqO3/dV9f0w
	rb3AN158vOgM2UmqO/AQtYBFo75t9vzpBS0pfJzFrIrxOK8+w0cLu2qXpA2hb7IYlernQjN3bRvwP
	8AoNTRsejv1gits83r2dcK4axvqAeaNiv/Nju3ONZTZGZdHwacZMd1xBof9sHi0E2UxhBqqRJzAqL
	9YscCIiunTKpzYyKi0EQYTzh71M09g4zCFSaqtcZGCnpLX6C7q7/z1NdWk8HkMpAcAmM4OJaIeQFY
	UCSFRFcsuKQ9X0e+fJXOsrp1V/icerQCjjjU3tlS3HpuBCF4DWgcQ3mDYzP0nTOreNbMjFdgZzLTd
	Zq3vvNbA==;
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMq8n-0000000FMlO-3XOW
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 16:39:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhN16cvrNZIa2dc5O0Rb1G2l1HJaOOMEz4lo7seVfmrVLJRgz5NvD4oR1eB34Wm+zrB14DJVZIfoZ7jQOMplz9TEXj3zsIMCMh6ghcjhzor397JyNKkcBswb1vwrjEQVNniZlem0RFRZ6u5mMASwQItrssC9Bhh1i3+iWuiwJg2j/zgHVLbDNGLZKpSzU78LEyuQnK7UQMxKtU1I6YD5VDo974VAgIPnk4ZZOIfYQ4wIJggtSnzCrTuLhfIunsw5qkrOZk71Ij3aM4SUfQ1/ZB8MJuRPSgoKzajmycqzzt0Nu875wYjFjnMpXWlBpjacbATq0a699Jbd61PSPMwHkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31E16yZFTEba9wiH5BCpeNM4a9v1q9uzLvqvrwI8KPM=;
 b=tuIl/bPaogKQfyaZ2mW0SZgcKT7x2mdnk4O5DJfUBEw/pU7As4etq8STaJRfhq5+JkZR+eqxGfSJOi8wE9X8GTtvUubs63KbiPP9o09HjByu65Fftlb6V3tW1mcNbmxScaSMlDrLAe9nX9gwgRhEfq2HuJymd8HI5I+/Qlk95k3Xfw+ZBtZ8pFSTPQKd3eC22M/MY6htaT3krMf77WwE9EcBvYQLoMO+fX/g2/Hh6Ox/SkYdqn7BL30eoPehedb/h/zBl6Zb6zfIkKzm10pMrg14xejtfYS+RbWADaoU7jMqzsitzaG5yL/u39Y8nCjxUkQA2MVyzx0FchRmxKbMSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31E16yZFTEba9wiH5BCpeNM4a9v1q9uzLvqvrwI8KPM=;
 b=bP+TAuDXIl5aPqCqlnocT6oJ6UeIaHKYFMTg3OMkuftEmGHrbds1i52c+2UZ9aRZewvCYMfAhxBJ42mv0+j7SQXXXs29Fb58w6P40Y+9ioycagndJngk2r8t2R3LlzjUVIo3fiPYtN/GO9QxjPDi7RnjSuGX1Zn1lWti/WSL07rVtfuUNPXzaVc3tdUd31J9M1bfkKJMqBQ1cUtaXA6b+BA5ruTk019DU3kHXnwOHk0wwKBaUFGb5xBBNdAJ+e7eGf7Mg49CQmj/jt950l+AqzIhq7KpzPtMMUHbtUG4dCmsnQDSSQHDFTRQO81J0ZApmD1GhtgNaghD6ryw6gFU2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB11834.eurprd04.prod.outlook.com (2603:10a6:150:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 16:39:27 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 16:39:27 +0000
Date: Tue, 12 May 2026 12:39:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] i3c: master: Defer new-device registration out of
 DAA caller context
Message-ID: <agNXuQDsj_bHSA7s@lizhi-Precision-Tower-5810>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
 <20260512121732.406009-7-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260512121732.406009-7-adrian.hunter@intel.com>
X-ClientProxiedBy: PH2PEPF0000385D.namprd17.prod.outlook.com
 (2603:10b6:518:1::6b) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB11834:EE_
X-MS-Office365-Filtering-Correlation-Id: f3308da7-76c1-4a79-146c-08deb0450853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|19092799006|11063799003|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: Zz5F2vvDSUA/eGYU9cSAQypCvgHQagQXXiyH5MgSu5paGTGuXieE+n/4pWjoQwuBwo2Ge0r9DNGH84hkclsgk31BeZNByAvxesOeRoLkYh5xxL6n060M/4BIURp69zkJ2GjOFahwEWowsZcs2+iA5B8lRN8IMUvT1qouJHPpgIlQ79j5LbgEuzIPL82ArcstHjKkfH41Xm6FElfdlANVargv7dfqA6ZJ+v3YKKDsN4H4pVUGpqTo8hSYiTcU7pfBNLz8gcac0rO/x0znQqXnnq3t63vQkC2A7jC9IvWP4hF2tJjrbODAw27jYq5wiISYCWNxeT1W8CEIbTAoj7j/S8vLK4fLMigh7VSIH3U9mhhosKY9pZVgS101aPtyEmM3IOFbseMJYycs3y0Ch0shJcXXSS0jeJg0dK3ry+9M9QmKk8JG8/O2YeqD5uBqy+sGba+wFzvYK07bsSmysQPnE2xBsjjknccT4QNTYtGrDQ88K5Z98N/AA4IfcPJm1C1mZNaz9Spejt4r3ruJjX2gOCFaWpKvD2cMwclinFab4t6X12QqHzxu+2NHKWni81bMSHg/vuf2tFSuilxZTtjubGNFRY30Ao8AjZFpjswgVE2pVaj1KYeqBNLj/li0r9rMbCQGM6Ueyqq2Id6kUdaGpnOaZewmPQgVgctnWnUTIlPVKLvHATpWKTrJGcvrUr4ydVUeA/VfZkCj//K3murHVNUElcGxo98qUoMV7KgpBw6++HvvMQA75zDo34Ey89Fv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(19092799006)(11063799003)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mo9j3gnKtVwmE2IYqZOZJFWcBuZYfNyzqs903apElUrb/kj0482LUW0cpzKa?=
 =?us-ascii?Q?QiDl3cfBXHaJBCCWVNEsCr2zpQf8fpQIxrvje8wYt10NML4/FoaUXlNFkl56?=
 =?us-ascii?Q?Vhj44K45oG0+H61Pt1wUHiSl467maQ8alKZTFIr8kIgMtet2kIgyyQbmDhwr?=
 =?us-ascii?Q?dOb/n8r0HDdQWHRutmIL3hKUl+7TyyT9Q7aO609f1RUy7UeP+HrAqKN4ckUd?=
 =?us-ascii?Q?zofbCJHJEUT2sdCKqvjKi6b0MzXQmiCcbAYXk2NCfaDuQNnJ5Qwgr/bnWqgJ?=
 =?us-ascii?Q?Bt4PiUdQUqmrEdkFGX4KOaK5rAavFZb7uPzfg+2vcPctYnLN7+e0fb7n3O8Q?=
 =?us-ascii?Q?gmiNBJdrpMqFSEHU6nNoL10F8yqAN8OURfTAvp6LVJoyv1+vJumphHvobNr9?=
 =?us-ascii?Q?SjH3OsNyEfTs5MZmTvKbc7RwztHaWS52ZGayeW1vQLsxROxpgUpkNKw0IY3x?=
 =?us-ascii?Q?rqrrNjWzf0T92yQcyUk6kXbL8oH+b4JRMeW4ZK4jzzdLqtzrgYP5YXUQLmb5?=
 =?us-ascii?Q?KGyD9wGZgvb4Tv9GWMDZ9WXiBeOsISr8XT+FW7F69/GKpLiif8MwmYbgO+id?=
 =?us-ascii?Q?52ERf1LcznUIfFmxMlMVmYGWT04WGxMYLDNrs8PEcJkuuz8cdMydnmYyQcwA?=
 =?us-ascii?Q?anm3bcZgKdxO1gqfRmD4FUGzvYm2UrNkgmT7kqxYk9UnP7ZYmGlOhcNBNZ+H?=
 =?us-ascii?Q?3L8j2L4t2zJiuIjh9O97h/CWm9eWqwlxh6MiafFtKcOc2lhruLQMqCs0n04E?=
 =?us-ascii?Q?qKec/YY/R1osP9PXZs1eufWMn5gtA5nhRHEwMT4iGfN3mD8Ch5gifkULG6JH?=
 =?us-ascii?Q?h/+unI7YffZd0NHAL3+WLccUc2Kf5UrtC3CvQp0GNxQdlBrJIEMwnMkjXAlH?=
 =?us-ascii?Q?Wkn8/fUkI3Sdu+aLObxyyuxVyi+1WPrDK7EajhVuXuMEngjGf5k1sj4/9I28?=
 =?us-ascii?Q?iw5V6v+pppaUFm/mYOYgNV0AqIcmm1VgVdHXXGKKVvm/mGJy75Uo2KgX6pHE?=
 =?us-ascii?Q?jNnE5go2DhAeSn8PxmFEkn9zk1dURqxaGhUVlS8UAaEX0RKIYBH7tplUA4al?=
 =?us-ascii?Q?lgBy3/Tb8RCj/Tg7SG67C0xyjKyxaJVCLxh9rGMQQTP367TmD3VsxDrOyvfX?=
 =?us-ascii?Q?vmi3SZrv3UrWsUlb3yJbwnJzKrj1nGsNLoG03UDt46cdrAfssGe6SWDNBCjh?=
 =?us-ascii?Q?04PFMVU9YIoQuH3GXKOLhTj68rGIwrbMU+cAYkm+2SBzAcOACT1CY4nN8ls6?=
 =?us-ascii?Q?DVEQGqoUUO6oUpgOqLW0zDUzX/hFzg7FOPdJ2jHChOpeNiIO3OcTWp0I4hLi?=
 =?us-ascii?Q?Pdty5AziQ7kMwRwVKbdhp7XegvzIb+m8EAgL3RZSRWETyJugWAY4vz/u1Zzl?=
 =?us-ascii?Q?pFdAKwuTwA9ijcLEEsuitrB8wf4M+rBPyxVFFWdbw5QWLXnbESxJ3AaT1VrQ?=
 =?us-ascii?Q?31lGcMvkp2o5thlTMd9RodIrqP7PKjvXlPLJyii9e8kiswHi9iMIAmPeScIM?=
 =?us-ascii?Q?GUBHLqSPSFN6OpzQUrJhxhtNEzK2A/4U3k58BUwTFaHrZl67ByPNBaXlLH2k?=
 =?us-ascii?Q?i3BHmaOFLhtwsm/wXBXFdRD/evaCzj+Wl0RONhIseiGeFRIXCXTeWJEGZxgp?=
 =?us-ascii?Q?r8+vosCfQip7eQZtQQ6J1hOh+Vzzvc9huRW8lDJtyuHIyzI4gwt707w0pGbW?=
 =?us-ascii?Q?wzSZPcJaFx/d0R4c2Ru3ogV6Nm7JXS7+XJzy557uX5+/XH7sTX8BS2AN6cUh?=
 =?us-ascii?Q?xUJz2X/Q1g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3308da7-76c1-4a79-146c-08deb0450853
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 16:39:27.3397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YvF1K35eqNN2pRaDGeUR3QEKDRZHWhyPTfyTPyi1j8OoP3t2Sud0SCrt82T09+5WpLQsH2PHVrasVJG7o2+iCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11834
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_173930_333728_889F1738 
X-CRM114-Status: GOOD (  16.67  )
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

On Tue, May 12, 2026 at 03:17:30PM +0300, Adrian Hunter wrote:
> Master drivers may invoke i3c_master_do_daa_ext() during resume to
> re-run Dynamic Address Assignment.  As well as assigning addresses to
> any newly arrived devices, this restores the dynamic address of devices
> that lost it across system suspend, so it has to run as part of the
> controller's resume path.
>
> A side effect of i3c_master_do_daa_ext() today is that it also
> registers any newly discovered I3C devices with the driver model
> inline, via i3c_master_register_new_i3c_devs().  Doing that from the
> resume path is problematic: a hot-join-capable device may join the bus
> during this same DAA, and registering it immediately would push driver
> model work (probing, sysfs, etc.) into the controller's resume context,
> where the rest of the system is not yet fully resumed and the
> controller driver is still partway through its own resume sequence.
>
> Decouple discovery from registration: add a reg_work work item to
> struct i3c_master_controller and have i3c_master_do_daa_ext() queue it
> on master->wq (the freezable workqueue) instead of calling
> i3c_master_register_new_i3c_devs() directly.  The worker performs the
> registration only when the controller is not shutting_down, and is
> cancelled alongside hj_work in i3c_master_shutdown().  Because wq is
> freezable, any newly observed devices end up being registered after
> the system has finished resuming.
>
> i3c_master_register() also routes its initial post-bus-init registration
> through reg_work, using flush_work() to keep probe-time behavior
> synchronous.  This keeps a single registration code path and ensures the
> worker is the only writer of desc->dev.

why not direct use hj_work?

Frank
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
