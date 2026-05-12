Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE97CD343F
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o7s1V3eb4Uy3lK6cRQbw0gyKmrmyIwkLQ8dGzSZ7dmI=; b=w5zhXjWS6MM9iu
	jinisX9umnXZkPcgso4hfDRHHsi/rQnTQ34uxznDHD2PBsK3l9/1X5Jj0sfItmRzZO7+4fKyp2DLn
	KT75UqscXM2PED3NSqFHDEt0swz1Y7DhtoRFTrlONNhzrplUQUeA8Z6h/P/fWd4RypVKud05F1jo8
	e7kfuKanAcZv6rxRuxK/jbu7d0OpKlWCeTclSyP1CPzaLWW8cvND3H05iOdCvEK2uVoj7t9cQyAJF
	lLtqX6PW7/dxuLTqigVCZsVEM6d29s6ggEQODjsQQbXhSTi7Mw/osGpH9HOPwyvPz5pNCmKeaVSkp
	SjwAfGK96XaGEhZG8NzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpxo-0000000HMOF-3sw1;
	Tue, 12 May 2026 16:28:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpxn-0000000HMNH-1Zl1
	for linux-i3c@bombadil.infradead.org;
	Tue, 12 May 2026 16:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+Qjs2xsWR/e6KaXjOS0bQyfEEo6jCJsP+DdVDbLTSfI=; b=guAxx4k9bhB6UOYLoIW8q9rnjv
	2EBQWm/ojJ5SFeWCiDAE9Q8gKd/JLrQ9B7ca2S39IIYZEApR4cqKIHjMDiBtkL/WwYr23rW4lE9Bm
	U6AbntuvhDIZ3du1TspFA2E7LhROIpr63NdwPx9H6Y3Hp4zxj1VfxJRhw6uoFf3WXM260o0gkrbox
	IHuUE1haOy9bzSljKhECmzMm9Xh2vMgGIMBCJ55+lXzLdAp+4EUHVV2fVNEkzonYmwjWrJmomveu0
	RsvbuZE0uBzFNUO+ChFY0YkeirEAaJgwwyg23KYWyZxsZihyWO1rm++jfXufsDYk2Opx/sPJsZbx3
	1WnzWq5A==;
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpxj-0000000FKOr-2l5Y
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 16:28:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEc4gTx8iFxFEAI1rGoVs3KsJsKFQx5ZsdKetkbcUJWVeMbLAHFC3+k8Q5qeoD+lSEnEjMD3x3LB4bcldnbamn5l25dOxZdv/JYgEIkSsNMoZJW3WP9g+hxn1yZSYLUFNd2HfkvJGpmkIoliISFkB6NnFxFsZwxnerfUMHxfTkBXW81d74RbynmDUgb9oBRJvMSbxpYJJGiHfHtnSQg/37Af8JBwUuHmR/kANZW1o08J/Hh2wz8CGCzl1J34NKkH+E5Hfm06W3xFW27uEKhUHgO+k4PZsVIkluNTOVV3YclpY9h2ZcYd80FgOA2I2dQO35V0irnnqrDDLzmWeJJvdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Qjs2xsWR/e6KaXjOS0bQyfEEo6jCJsP+DdVDbLTSfI=;
 b=cVoFV0M8YTXFgJhj+w+qNymempfhO8TWo3R0KeGfCooWNKoXDe+ZmZuhcELp1xHVMK3gVSfTJ8dfUhLasbQw/8FiwHJskiV2F5SysYEPr7mA5ujh9CSYD0vfyZdv/K/xE6V70v30UnCljZLYeIB6E/DW9Z0d+S5mcIGMkQW+OPZ7pWAdz2E72JMy94bj+Ngy9RKQpTyk/YZAHC9MtFLD84sLvBUnG5WGID61XcrrH2ruT410cecllzpFuf7UNd590HO0Kfo519L/wfFKgxV4rd/vhBdJ+QlJ7xveCUOvo384H2yX0YE+TKfq55iPeS3NCx9SRZloVA1h6OEhbiGA3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Qjs2xsWR/e6KaXjOS0bQyfEEo6jCJsP+DdVDbLTSfI=;
 b=RK37k9CLneb57+4Cbxs6BO+1Fkzn3zDxPlnNHwDfK5m0iaHopWDp6DyY7kTyUvbEVTyF3b24yEujIJQsP++mSOM71+39JCJiRU7uUzu3UUr7iUonkNm//6K9j6idw5jVeD2yn+XmfTn+SEJZk3nwBZKTBkYZ8/4TNh30X5fmytsCbV321I30fXlRORXTRmoEfTParjvmC3JCVLuOE9GnzflC8Ljc/gKZ76krmbevrpsNguuAFIlqV69p2LYx3Lbt4XZdFQ9Ji2nWGhiXQvDClCgWE5qir16vRUus3p9AOhz1eF1NfNSoX4rWf1VE83o6BdshBBN+YTGjCBRAHL1Vtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB6866.eurprd04.prod.outlook.com (2603:10a6:208:183::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 16:28:00 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 16:28:00 +0000
Date: Tue, 12 May 2026 12:27:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] i3c: master: Ensure Hot-Join operations are stopped
 on shutdown
Message-ID: <agNVCdZ93XwtBHjB@lizhi-Precision-Tower-5810>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
 <20260512121732.406009-5-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260512121732.406009-5-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR13CA0052.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee2166f-edf9-4c8a-72f1-08deb0436ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|52116014|38350700014|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: BvbB52pXOwI4n4ByiQJyjrgbgDcqXQ6vqnEzJOZy/GA+NACdK1vlLNK10t++bfP8tCfDvdJ3XA3iap75uK7MiQPp750n5PJOCQV1yFlb4cm7QYAXa+JbsgOuN9fuPsJNf7IIzmS0/tnSWX9qnziSqgKlPm13ddrPs6GmTFiyLi5OLGfWvXqVjKL6HRiBeGj96JW0bcIndP4ZRxDm0YagimtwcgcB/5r291f5oauJTPCUCARVUNuUDFr4yqLVSLR122C0/df7q3hciTVASPeZEGJGbXmF4Z6+IdyBW78UVS2V2q+MItD8UagwYtEmGfpWME+QCPPTRaySd1drjRdcT+0SmG7ROyL/iSGiWoDVQdp1r5n0BTMUA+d6X2Z+4uTwNoGWX+CQ2MJPyWwZvcSncpRZKnHAeUGeScuypBJVB40N+gAdwJNrFGQS5BXmy2gln9omGC66idIBQJsF5hKT0684mmO4dmP9EZvrB4y5UIBNxTaU27/CzBsP9S+Wl9Of1zzOZ7iJVPj1lWEP0YQBLYM3zPp3qjn+aX1hGpSewgZ4nVo4+u+lrGD/2UZEJAFSdpvIjEqoYqGlgnx7ZHUmt0SMbuJ01vpScspQZ1tFYZjN+xO1JYm13oiguyk63cjOhFrInw2507u5oRYzDMUtnjCCyln3W2GFi3y8TgqOldrGYi+C5Nsf3uVV/u4IOCO/KI9QwfAuYhLDmeqAS/1bgiuw9RNEOdZyy2i1B/hS/qMl/NECLagFf/fOG/6V3Nqi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(52116014)(38350700014)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HibzL0ywyOnJsjTlD4oqHFDB9nkLUCeJMgAe14vwyaj5SduoEfE56zRdj0AZ?=
 =?us-ascii?Q?kZp88wBikdiMbmaxaUi0D8lKOOSzH4XsoIkzTVkfYwQ34mZf4gtysLvgO8QD?=
 =?us-ascii?Q?iPG1A4jwlor0vXyW2vVeYJgrwzHEb4GjQdryRtnBSEtIyg+6FeaNkKNjPMWN?=
 =?us-ascii?Q?ahsznXbPG62E3sKEI9K1vhJ10EtWA3hYmNfgAr+tCUmI9dnelGTipuuZm2B7?=
 =?us-ascii?Q?83JAEeoiWjFk2vsdOmDsgSn9Hc9Tq1nWJKKU0dL3sjr36ymPy1nVAxrjkBdL?=
 =?us-ascii?Q?SVqjWLUwTqHIhpfnICckIF4mol4viV5tNVkJv56SIby1OTuMPE8CHcArmTRW?=
 =?us-ascii?Q?jB7V968e/+XXvY58QUj1RWxFp7LzMFTzVJ83akhEhvueL1P/FV4YDQSrIixW?=
 =?us-ascii?Q?eRQWey3oGOwldc8GDeYdMreE3R2dHm5MMMO+VUdqKlI2bd8QrTJaDdxsu+k/?=
 =?us-ascii?Q?4POQLX/WyMJeZxn0QZdKwrVgdyAuWg16jepZWNPsrCaMg9Wu7wSw89Pf5sVf?=
 =?us-ascii?Q?5kaG382cc2/Dv/9KOOsZmpk0F62CX1V8NS7qaTbPYBvWozJggzPMypZd5rr3?=
 =?us-ascii?Q?DhK82Q9y8iIedEpTqtrpBCh7J/sIrKnxHQMGtbyth7UPwIwbYD1vHvitIjeL?=
 =?us-ascii?Q?azRkKc/X0jSQJBifMia4sNNuxheh7qkE2X981nR2D8YZzIc3XHRhJjoql1xC?=
 =?us-ascii?Q?1DBZtbkwcB6XlW4PcBrZC305QokQU4upiGkrvn1bthpj41BuC6nPRRXK7+/T?=
 =?us-ascii?Q?YwV9irEsuVszWbAZ5N1fcrL/RlilNgJhkbZEgcOsmpX815raqb6E953S0iRX?=
 =?us-ascii?Q?rHbHTKxNVuLrTcBzXjGt5Ypnc4XaMBy+QxJdg2Jh89ZiAiS5jiGswkUNX/Fn?=
 =?us-ascii?Q?JWPm3i7qt/rALeR+qZLuQvXM5z3cNm9ajOEBFWEuY2JUIYctY0yhCZjI0C2D?=
 =?us-ascii?Q?4hXISTtUs8gTWqzMz/PhqpI3zRDTRahQA4KxpOM6JNgWmJ5p5ZYuP+IQCmj3?=
 =?us-ascii?Q?FYJxpqhqL1o0IRX9wIZvYmz8RT6IN8Hw06AGR7Bp4GvRT/7PJ+uxmq8tAERh?=
 =?us-ascii?Q?Zka4SCVkSkVoWWHRbyZY9CJoaU/uOdm4N3w8rR4jxjgVlmrLwFweEcb8pvxM?=
 =?us-ascii?Q?4MLEYqi16+LbGp+gRSneIV7LBt0s8cxkz9artLfQNaIrQkZDu/1wGiG1H/n9?=
 =?us-ascii?Q?J/pTVjRnQTMt7d+3ccXfl8a9I0ISO/TcpxrA1f6juvqGtKrllkaA6C16Oa+s?=
 =?us-ascii?Q?1Q4KGtrKmlG+dPs8BInSU9o44qJ3uhhY6RNy3fPelooid26iRZcrJRyx6J6m?=
 =?us-ascii?Q?pg38lx04AtuXatbu1gtlU6QtP2C9TSuyOupvHMmUSRAGHOsQeDrZmbQINHYq?=
 =?us-ascii?Q?NapuQUPrNObdT5pS/MqSMFHDz74vcWSwS4Qjo7ih+mWXw15nESkoPztyqMOr?=
 =?us-ascii?Q?qOKynTEha4JhQWqGIydDrBa7XipqaXDLF2ZJWxH4PriZNdgMtQwXShf3Dz1Y?=
 =?us-ascii?Q?PvwfFzWb493W97yBOHmJoRokYjOhS6SnuMefNEEYUHxNqrq6pFVYsGejvZ/s?=
 =?us-ascii?Q?nioA1I869xDvF8xODpE7+XvfGjz5Pki82Rbr6p7C9PF/4+yg8oL92mjujOTw?=
 =?us-ascii?Q?wLN+7/hDDMWcIvQ1RIO313CcDToi3GsqrK39yDAgt1TlhYf3Upp2iAcXrMar?=
 =?us-ascii?Q?GtoIZJ9ZgnyghmbP+nHiLLm/K8xtyRuBTFyXiTBVM1Ptg410?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee2166f-edf9-4c8a-72f1-08deb0436ec3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 16:28:00.3676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvIk+Rc7JAJVcdFGqDEQ8vXq2jy4HQBEaUYTdNH9p0OgPYPDshameCx5vcCmuwxLuzlXSwa5ZjuGZNaPkSlaSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6866
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_172804_267044_E297B38B 
X-CRM114-Status: GOOD (  25.19  )
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

On Tue, May 12, 2026 at 03:17:28PM +0300, Adrian Hunter wrote:
> System shutdown invokes each device's bus shutdown callback to quiesce
> hardware, but the I3C bus type does not currently implement one.  As a
> result, on shutdown the controller's Hot-Join work and any in-flight
> i3c_master_do_daa() can keep running (or be newly triggered) while the
> rest of the system is being torn down.
>
> A similar window exists at i3c_master_unregister() time: cancel_work_sync()
> on hj_work prevents queued work from completing, but does not stop a
> fresh Hot-Join IBI from re-queueing the worker, nor a concurrent sysfs
> writer from toggling Hot-Join via i3c_set_hotjoin().
>
> Introduce a single "shutting down" gate in the I3C core, set under the
> bus maintenance lock so it is observed by any in-progress DAA path
> before pending work is cancelled.  Install an i3c_bus_type shutdown
> callback that engages this gate for master devices during system
> shutdown, and use the same gate in i3c_master_unregister() so both
> paths get identical guarantees.
>
> Once the gate is engaged, the Hot-Join worker, i3c_master_do_daa_ext()
> and i3c_set_hotjoin() all bail out cleanly, so Hot-Join IBIs that race
> with shutdown become no-ops, direct DAA callers see -ENODEV, and sysfs
> writers can no longer re-enable Hot-Join through ops->enable_hotjoin()
> while the controller is going away.
>
> No functional change for the steady-state runtime path; the new checks
> only take effect once the controller has been marked as shutting down.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master.c       | 52 +++++++++++++++++++++++++++-----------
>  include/linux/i3c/master.h |  2 ++
>  2 files changed, 39 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index cdb5cb2aa65d..a59c4b744b36 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -368,14 +368,6 @@ static void i3c_device_remove(struct device *dev)
>  		driver->remove(i3cdev);
>  }
>
> -const struct bus_type i3c_bus_type = {
> -	.name = "i3c",
> -	.match = i3c_device_match,
> -	.probe = i3c_device_probe,
> -	.remove = i3c_device_remove,
> -};
> -EXPORT_SYMBOL_GPL(i3c_bus_type);
> -

why need move this tunk?

>  static enum i3c_addr_slot_status
>  i3c_bus_get_addr_slot_status_mask(struct i3c_bus *bus, u16 addr, u32 mask)
>  {
> @@ -637,7 +629,8 @@ static void i3c_master_hj_work_fn(struct work_struct *work)
>  {
>  	struct i3c_master_controller *master = container_of(work, typeof(*master), hj_work);
>
> -	i3c_master_do_daa(master);
> +	if (!master->shutting_down)
> +		i3c_master_do_daa(master);
>  }
>
>  static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
> @@ -658,7 +651,9 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>
>  	i3c_bus_maintenance_lock(&master->bus);

later, consider change to use cleanup, so
	if (master->shutting_down)
		return -ENODEV

	and avoid use else if branch.

but this change is okay for now.

Frank

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
