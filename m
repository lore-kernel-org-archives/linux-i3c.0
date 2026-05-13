Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DE3CD37AC
	for <linux-i3c@archiver.kernel.org>; Wed, 13 May 2026 19:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cd3QTCDnHpNhI7TRqaYwsofHGeVPshOQb7LHj36hyco=; b=gJiSJGDkTqGc1C
	5vc5PCENWQUn6HAsR/M7r/OfQ1wArUaG4bVdCxu2NTe1/AQU93ptFovlO+bT+3doszADY4xYH34Ct
	GP2h/VLiyJP5KDkDTSvgkj9vzKlfXX4iLdo6IjZjNru5yZskKDMxkoaSkHkgBDxCKZKHKzsa7wMxR
	busG7esdS84obJQlxqdsPrUwh1edRiljx/BcFdJPRuZaaFTXi2t1wZZTeUlBVUgwcWE3qLr9XwZkj
	Gqc+JqX6Zx0I8Mxsd0N2aYTxs7c0vT54VTjGYCTCbfENA7gf9gn7/An1X1Vo3PLWwpE2iL6kEA7bx
	Kev82qLPxfHZ28FWZOzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEt6-00000003WyG-1Bkw;
	Wed, 13 May 2026 19:04:56 +0000
Received: from mail-swedencentralazon11013070.outbound.protection.outlook.com ([52.101.83.70] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEt3-00000003Wxh-3Tpf
	for linux-i3c@lists.infradead.org;
	Wed, 13 May 2026 19:04:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvHa/4xexf1K/NUex6t1yWbmqDnf78DmBYqZiibv0rqdTmknezOMoQjzEmQ2o133NPf+0S0OMCrkusqaBstuG1yDNRJ5UOeltckMt1YV40KcYnJbwDt8sEQYz7Bd7kWNHl979vdMhj8qhk/4D/zgk/M2de9ammKcPny0WXQ5zoXug3Rw4j+EfCXpyPr5rtRjBXHnBzl5qLKTpLQ45ruFuFA5+g+MCyxF+uqbKewMpJ3xXsO46BsUC24939gvJDix0jHCQ/YWbtAYqvIQ/ib5d1E0l9pG5XeIfnWcmbiAgvK2uz00Ke3jE05seHMCan3FKJz1vKYcFz3OFw+minmRzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIhiENbXrVAXo8MGWPOwrujUU4cgAJHuvJ++4FydZy0=;
 b=T3tqrBEggKLa53FnUlCGDGuIZPrlF9qteEqd8F+WnXpo2uDnO3Ch4FsjFAHNaI6PAx0ZRZKdJP0YLBXLXYV//f4qr+ghnlDagMHmewmdb1g4eqzd0msacc7EaIyazZNcR5jAfrpGweWOq9Ic5IRuYkmL+p4f5RozKX6bNAzxG7fECRrveLC9v0+yRV87N8PWcl9daqzIZtFQlqnaymF5Mb79/V4tkWNyqgr/SVePthV+6UBKy5n6/6SU4f5Cu3muXlr3x58BvdZHfC1LGPahbJWfZV2ZPaxPmv+glwap6NKUwNi3xTS5dfU3ByOs63abCqO6Fb7Rycf9GL1B8UDi7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIhiENbXrVAXo8MGWPOwrujUU4cgAJHuvJ++4FydZy0=;
 b=fivs6g9RpEkgpjOC9xCgjReYCmMKSjZMAi6wSEuesoGhH59xexnDMMu8UV4jFT+Zk1XQTZTc92fC7h3dCPGfrHuOB4sX9oQlDSR5G0pudEbUfEgqn/G6ZERSgu+H70dlM9FttXhEdLvBjCZj1NXp80WY5FemvJSLCZ7/NZuItY5IJubjp3p8NKDFC6bIPr+IiLd+87iF7BnLvf4JDd94dpNCC0b8+DGM9KjU1uDEWoBZc5wFUwC29ETYcgW+dGpztFdjjyuaGNve1ucraTj3LY3ARNCZZQIKo5u4Zt/3BM+LstbhT24ESNOMKApbizybsqcU85lryFO4tnH4/FKuoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB9180.eurprd04.prod.outlook.com (2603:10a6:10:2f7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 19:04:48 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 19:04:41 +0000
Date: Wed, 13 May 2026 15:04:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] i3c: master: Ensure Hot-Join operations are stopped
 on shutdown
Message-ID: <agTLQ-IjH7MZx95y@lizhi-Precision-Tower-5810>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
 <20260512121732.406009-5-adrian.hunter@intel.com>
 <agNVCdZ93XwtBHjB@lizhi-Precision-Tower-5810>
 <9d2a7c42-7eb1-4de2-ac9c-c1777d7fcb13@intel.com>
Content-Disposition: inline
In-Reply-To: <9d2a7c42-7eb1-4de2-ac9c-c1777d7fcb13@intel.com>
X-ClientProxiedBy: PH7P220CA0127.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: f23e48ff-fcf9-4b69-0e06-08deb1227c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|366016|1800799024|38350700014|56012099003|11063799003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: rM3kvNgtA6EQKSB0Ri6KrK78bMHsBubUe0QcnU8Zv8ZQ8iU+3jdzQySxjRBLd4/6ukyx2qDQ91YLptTIVVmj7PbbyB4xayTKMnM+6oyTw8FC3GAekqCWyXFpbiiDKB7P8d2Wefaqt/cgKlblr7CkNtz2GhPm1qCp0abvMoMFNsH0EYT7WeXyROCzWDiK40vFgVvqP7kkhELBjWCTm4UKJQXIUZhpeIdUFnAhYq9L+ZVXVzbN7mMRAV5VDxIrm1jR+UBsGcTlSdIpmubdKsalBODYGYXILp+i3qwSRgQtEPdUtftLnV9G/mPdj18haRQXVzAT6lWX+Vf+s8zDQvKGiyf8ppjgWkjJABVS5IkwIq1+WjTRnn64yn1n6cxK0bLkLauygdg9/UoIz2uxd4K1pCgtb1LgRbBVssvuU4yI9iWPaQY2jy8k/dPYi3t84mxr7rvCOJ17jbmKpnGtb1o7YmLJcHZdgvAnjHfz0YpcNPqXDHvnNuZ9PNXCwP2BNE7kyaUyI+m9peuR/x/fwogD12A4rOkRWnimcyqVt+/yb9D6pjBvlW6pyWqwGLY0fJ+S5yHxL9FOO7AZWEe78+Fusu42R0PcJuBsgW7K9YxyWv9kkGE0Iv8642iQdDEmPDCt/qbDCW6xb9KVRc+Tlggj1DzqXkjaEx6d5SUwiOxdTzpQQyZPze2YyEliYAY/o5aZzYnPqfDVaLxUKNIrShwtEPEA5I3XZZm4KUbYvanY3GOWLBBpRZ8+l9Z0+hRCcUi2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(366016)(1800799024)(38350700014)(56012099003)(11063799003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d8ffjjI3rNuJ9/KVwxLpZP5T+b1UFvJcBGlKyNDLutDysrEfbHO69toHgDmn?=
 =?us-ascii?Q?YZHp9Dz1xWbbbQqXDsvV/J411sLX+zuvqGbY9rc7gAi+6khOlStgq5TFcO7N?=
 =?us-ascii?Q?veCcAIKUwY5zSrcWv0Hfa47Ye5OmTQjg0IveZ3YD4HyFyeuQ7fO034cKAlem?=
 =?us-ascii?Q?CMicmQRrV6mjvoeVQF1J6vcsygMIH6zsfVUXzeDDsKLbAXY5/IEthW7Gdvxm?=
 =?us-ascii?Q?24QUwePLyH0/mShp0fJd5CtYvK+s/6a5HFjbLD+/m4SoC5NTH/AwUZ1mg8kr?=
 =?us-ascii?Q?Yq3ge4IWqd+10N3xvJszs1mDbSF7ZE5qNBX6T5ixM3xZtg4+6+Jfo+1r+MsJ?=
 =?us-ascii?Q?Wj2R60IWj6B4s1WyNdaB011qsRAKu/V5IxOAYn5uvX2407lSzKFIf8lrt9T/?=
 =?us-ascii?Q?8enod24wpENyxXNRAx/Vr0Tis6HqldNIdviR2u8h4I7w+ikhE8sBs+GWcnba?=
 =?us-ascii?Q?lWJFKMWScF9MjBomhSm4hEq3oGfzWw858MNYYKg+bTYoK/LIZlOBPNATcScL?=
 =?us-ascii?Q?GkOmqoDcN3yIHKbWXXqIGAx24wDn0n3ln5MQbKZpcXpbfgQ5B7kNCTEqIrfX?=
 =?us-ascii?Q?PgPV8IgO8Z8g/ILC7SAhsvKYRsFWhizVY9n/tNJvoC3dEak679VhZ5O0TVDO?=
 =?us-ascii?Q?TwBf7Dyr+gPCOanPcd+g5ZMA08zWDlQ7jchwGf1EZ8fDILHCZkYaQ+e3vZlw?=
 =?us-ascii?Q?CtTnz5KHw/BqRiPEyEwM7FmZoc20UmSEIw/oBzcKVVx9fNHq7td4e1OBTF/S?=
 =?us-ascii?Q?dLABI5nKkG5a1HN+vtMPURWdqZWDPDuMlK161BfM69mHeJbUCRMs3BiypxFU?=
 =?us-ascii?Q?EOLGrqQ+JayJTZvUX70YcX1Kj9DK67GQTXMpwmhy/aHuYyGKo4ljDVg2iACy?=
 =?us-ascii?Q?ZHuE2niNpgpxRLcSSmAXVZ6exKSP7zZC6astPnro0yz5J6mmRv7m144snGNQ?=
 =?us-ascii?Q?z+9oRDTtqshPmaa0BztB5rrxzhPpSzADqbVI0T/ZlCFzYrhKpIJQ20zuSOb+?=
 =?us-ascii?Q?o2AgkmBQ7DNfEIBYQNXc6SYfrWqNtlPSx/sXBwEepeN9uPu2EvTUIbMFgFWJ?=
 =?us-ascii?Q?ANt2E0cumIROO2UHsvPgZOGjP+U5qqXPZcsClkVBau0rBZOS5v/aKeLslFAc?=
 =?us-ascii?Q?It/1hHfPvxEwasNO+plK3ybJmsF8VVGOE3NOWHZ24ifQzgVPFec3/QH6aWlF?=
 =?us-ascii?Q?Go18EEVrUigI5xHjR1a0TLbN2tennlJ2tk3PeKZBpXDYyYMe9hGzl1cpbeP4?=
 =?us-ascii?Q?CslY6qExCb92eR9/xQwnhyJ3Wl7+IzrNV+d8uetthFtJi/0dZSOTe8z9ewv1?=
 =?us-ascii?Q?Xv5pEFMD37nVo6NREgG+/oT5qg3b4M4E4ThIhQS3JmnAMCIxFKO/MuuhUZrf?=
 =?us-ascii?Q?cUnkH+862G0aJbKCdUv+0+Dtuo+qLGDp96gjiHZ6jc6AkEeSo6u3K6LISykW?=
 =?us-ascii?Q?kYRag5ccLQZSI9NwxVLTEDv0hIlgPMfEBfyhaegXUD2OY/EIrOgeY5XTA1i+?=
 =?us-ascii?Q?mlaQ/Xyg711Iy25dKBB6ooqtfkHA7yfEU2vJTWOdeVbS6oNO9TLHzBF3ACiL?=
 =?us-ascii?Q?SyWxRudg5if596vIeytrMFF2aazPg6b81v2Y/Sy6L2FYh9VEjkECDqlV20od?=
 =?us-ascii?Q?5tzeRIGFQ3//ufEsyuY5qzS8nvqOM6srs177pGQhLvlMoHEBEhGaCnqqzMeW?=
 =?us-ascii?Q?rQdKrpwcTz4qF1OBaXtTf/0peMZ466picLHt/F3r1wT+LIVYd6ymjCxlJTYH?=
 =?us-ascii?Q?P2n7FUlsfw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f23e48ff-fcf9-4b69-0e06-08deb1227c88
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 19:04:41.1419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQS2c3JI14tDAPF90oywztIG/15N3S+EPdve7avzC/CMuUU+enSHuoD2kQZ9Fh4oqNuv9tdcgKlAcqy7SoqmPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_120453_872599_5A986E0B 
X-CRM114-Status: GOOD (  30.83  )
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

On Wed, May 13, 2026 at 08:31:56AM +0300, Adrian Hunter wrote:
> On 12/05/2026 19:27, Frank Li wrote:
> > On Tue, May 12, 2026 at 03:17:28PM +0300, Adrian Hunter wrote:
> >> System shutdown invokes each device's bus shutdown callback to quiesce
> >> hardware, but the I3C bus type does not currently implement one.  As a
> >> result, on shutdown the controller's Hot-Join work and any in-flight
> >> i3c_master_do_daa() can keep running (or be newly triggered) while the
> >> rest of the system is being torn down.
> >>
> >> A similar window exists at i3c_master_unregister() time: cancel_work_sync()
> >> on hj_work prevents queued work from completing, but does not stop a
> >> fresh Hot-Join IBI from re-queueing the worker, nor a concurrent sysfs
> >> writer from toggling Hot-Join via i3c_set_hotjoin().
> >>
> >> Introduce a single "shutting down" gate in the I3C core, set under the
> >> bus maintenance lock so it is observed by any in-progress DAA path
> >> before pending work is cancelled.  Install an i3c_bus_type shutdown
> >> callback that engages this gate for master devices during system
> >> shutdown, and use the same gate in i3c_master_unregister() so both
> >> paths get identical guarantees.
> >>
> >> Once the gate is engaged, the Hot-Join worker, i3c_master_do_daa_ext()
> >> and i3c_set_hotjoin() all bail out cleanly, so Hot-Join IBIs that race
> >> with shutdown become no-ops, direct DAA callers see -ENODEV, and sysfs
> >> writers can no longer re-enable Hot-Join through ops->enable_hotjoin()
> >> while the controller is going away.
> >>
> >> No functional change for the steady-state runtime path; the new checks
> >> only take effect once the controller has been marked as shutting down.
> >>
> >> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >> ---
> >>  drivers/i3c/master.c       | 52 +++++++++++++++++++++++++++-----------
> >>  include/linux/i3c/master.h |  2 ++
> >>  2 files changed, 39 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> >> index cdb5cb2aa65d..a59c4b744b36 100644
> >> --- a/drivers/i3c/master.c
> >> +++ b/drivers/i3c/master.c
> >> @@ -368,14 +368,6 @@ static void i3c_device_remove(struct device *dev)
> >>  		driver->remove(i3cdev);
> >>  }
> >>
> >> -const struct bus_type i3c_bus_type = {
> >> -	.name = "i3c",
> >> -	.match = i3c_device_match,
> >> -	.probe = i3c_device_probe,
> >> -	.remove = i3c_device_remove,
> >> -};
> >> -EXPORT_SYMBOL_GPL(i3c_bus_type);
> >> -
> >
> > why need move this tunk?
>
> To avoid forward declarations.
>
> i3c_device_shutdown() references i3c_masterdev_type so it needs to be
> after i3c_masterdev_type definition.  i3c_device_shutdown() is being
> added to struct i3c_bus_type, so i3c_bus_type needs to be after
> i3c_device_shutdown().

Okay
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> >
> >>  static enum i3c_addr_slot_status
> >>  i3c_bus_get_addr_slot_status_mask(struct i3c_bus *bus, u16 addr, u32 mask)
> >>  {
> >> @@ -637,7 +629,8 @@ static void i3c_master_hj_work_fn(struct work_struct *work)
> >>  {
> >>  	struct i3c_master_controller *master = container_of(work, typeof(*master), hj_work);
> >>
> >> -	i3c_master_do_daa(master);
> >> +	if (!master->shutting_down)
> >> +		i3c_master_do_daa(master);
> >>  }
> >>
> >>  static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
> >> @@ -658,7 +651,9 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
> >>
> >>  	i3c_bus_maintenance_lock(&master->bus);
> >
> > later, consider change to use cleanup, so
> > 	if (master->shutting_down)
> > 		return -ENODEV
> >
> > 	and avoid use else if branch.
> >
> > but this change is okay for now.
> >
> > Frank
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
