Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D60CD6E7C
	for <linux-i3c@archiver.kernel.org>; Fri,  5 Jun 2026 16:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ASAX4XRziEkXvCB8omAuk5StjeDa1LcBqP4xJ/7vH0=; b=0JjY5m7OKUHTBC
	qO80r4w+7+joc0jXgL+J9mUe0A/pFYiUkmtTzvTuxBLTXdOEOy7215bQ3Fyi4HpGn2XJNpgHmazpg
	csQLkfEJ0NH2wJljQuScBntUdbdb6yLxgXszRIgUnrDasA0VARuB/kr+FtfHVH6Y+0yjMr4Xq91A8
	OkrXOVEGJlNqZYVhKkCSH6ypAAy7tB/zSpre0gh96fNrf0GhOBHXw22q5l1VC5O1zrui2n5gwPtQ0
	pjoYQBPjZMqLoG5ozdTb6cxQb92HstT+79n5SMmQ2INlSCXHFTRZYqO/amcmwtU4Oi54YlZlCkSj6
	RE8bmpsbZKAnYrkUV77A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXH4-00000000u8X-0RvG;
	Fri, 05 Jun 2026 16:19:58 +0000
Received: from mail-westeuropeazon11011000.outbound.protection.outlook.com ([52.101.70.0] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXH1-00000000u7y-2EZw
	for linux-i3c@lists.infradead.org;
	Fri, 05 Jun 2026 16:19:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQljnzKjsA6iAzsQF/XG4RpIMy7cSklCMsbVzg4DWXuFKTHL/yVygnC3/RwDIfSS5JpIVbEFzUY2BpXRlQIFGjmejIcsHEfEiyNFos5U1qj7r46rHvOTYsMkjXekp4InNTfs2UNcSidegx+i87tBU3U/TzAHfE/EYQFSQlTpOtnRlMUYFe1Ig5JysO5aeg29hJvrqcM9PkB9KStyVI6Hqb74N7VS2eUFrsvdTTO9MjJzfd/liXvcFrOYud6EpdusbqvtR/am+O2+6/i/hkVOi/FKTX/nB4yir6CYTyTQmZFp5yuulgT6n31rbiE991H97hwhvd6e3ehufmlTGUYqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUrcxbwLprUuoTS4GCCAVnrYIhTsHoXKesq4kwC3jXE=;
 b=InoVB/wL1IcOMuKozgUGapMah3CpLdfHk5s0qyib7xLvNRanMsFCo4jJmpAoDuYVsUEZkU2PR/MLM0a8cg0M2blwKVsrLDV+N5pq38Jtsx3de7C7SUju3HQT2z/8xF4qb5gNeEdU0w5YwHCUE1IWrYQfX28vVpzdnEtwiHSP1ququlvXp2ZNvQDPjTXg3Bwbz6YgN7rebvHbJWaUntb2FqAkuapMHJMAA6pPzskNvbG2WJ6gEgsZbuiwrcZQWP0/Hm7HtBITk40Q33RQ7wYOp3LFVm5INBVJTxYiLyxrN3YOf8lFl5FeUIViR/Fj28wLdNHcw4Ek0hf7wK0lTA5cbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUrcxbwLprUuoTS4GCCAVnrYIhTsHoXKesq4kwC3jXE=;
 b=PcXywVig4tRhk7/I+qDCka160A2hZhE9w/SxyfEKAxAu8Y982rUa3jvbuhyZnsikwgwc0HMsx7e6X/kEY3RvNWYPhi4duQNSAzbYAyng+0N1+lm3K4L2dqqHunEQJnws1ir+rGUYJB7fRxTIjshfSZVnFcenI388oxnRONa7WVBQBv9TSo0F/gZvyBoYJ1jEdCgmhBfnTjLNpJhcPi/Sj98GWXpuB0uEBTJBq/Iu+T0ylZcy/QFSiEHQO8oKQbq8D9ZZykkQKL9smYQUgRqGcfW9jze9qS8lFZ4FDGFBgXkjqu6bF+3gXV+yH5UwFtWt3qtL451ojcl0nTuOnprH3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10304.eurprd04.prod.outlook.com (2603:10a6:150:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 16:19:48 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 16:19:48 +0000
Date: Fri, 5 Jun 2026 12:19:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, david.nystrom@est.tech,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/8] i3c: master: Serialize i3c_set_hotjoin() with the
 maintenance lock
Message-ID: <aiL3HeVshOLWdniJ@lizhi-Precision-Tower-5810>
References: <20260518115520.98335-1-adrian.hunter@intel.com>
 <20260518115520.98335-3-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260518115520.98335-3-adrian.hunter@intel.com>
X-ClientProxiedBy: PH0PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:510:5::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10304:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e1fe25d-f873-4d38-e9b1-08dec31e4340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|376014|19092799006|1800799024|38350700014|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: be5qZ5qZ7ydihtTWicb8XEYB8QZV6TcIPC346z9H0g5+icyXW8kby7IcImwEg3Ta5Qoa6/Y5i9YB65YNiQ5vD9QMJi2Xdh5hfYofzF2McFNKmAvwQewu/SO4WKI2qVoFZpe3YnNx/FG48tXinioafdbQp/cTPlAFkiSjKYZE9G1TRPZ9s56JwfqCOP017BLCPs6KNqSQe1xYKyV4KlTbovZJlwmeuzlCmrqX8UhHOb67s0EpmwlRGVMUAs+t2pShoZjcTV3E84pxIgbe+xOQ8WqNEbz08OP8Yy48VM97rwFFMyxfulIbSnFzBvdGfPLdxMWHqWuzXx0O65uJGoPTiFzYE0/m6p1uUfaQZV8r2z/oj03uhlrkzdZS3tUN4eFW8lX08gD29i23ei51BTjuSEkrzRYX0pLODIb9cPqdLDIfFvJr5PaPsz5z4vJHAbHqod+fVmVtu2a/NXzI6ptoqoefzfgHIZ5Zg07/a/pBoRut2vbs3gMnt5uSC4BuGC54oYORlYSuOj5At6WwQtSOV/6dUhGc5e3kDOuiVvcES4WwgP2sTLpl6LFEhcPbyxDAUifpdpkhhoN38vUjI3bXJhfujFWCjDbuZkIwVn1WwD/MFYn7nK0grLM8uOiV31HdX4TcdC+/UAo4sd1PKwwrswP2QVsIBh+pYlqa6VceTWvjohfQ610kp7n8sTlHDTyFHtD4TlRBzm/jqV6fiFKkqdQb7wSMz7bpXL7hCucVreVnbT3C9Lq5HUhY+bFqMIZ+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(19092799006)(1800799024)(38350700014)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ojBkoNouvfATh91YdUFWcLibdUKbfbLGGyJq4dUT2wpZVn6sfWKHYmdJbXBX?=
 =?us-ascii?Q?PDFBAfxQ1lepskwLuIUV/+k1N1b/FAQ0KO1WlXuqgJujv95U4acYe4IVHrMx?=
 =?us-ascii?Q?PKhaWq1/30S5IAztBwwHtKGNW0Q0SUyZnbJTvcYewIwpQTG63Y6QOEb19M+K?=
 =?us-ascii?Q?OVjFxAnvxQnSAVmMBRewti+vWmmIZRSKSUfbOJ9HfZ/SNJN7l8UDi3dQLcA6?=
 =?us-ascii?Q?LQnAeMl2boT+ioGFwXOyxTAoimbndzqXlN498kz9N5nL0FdjjHFvJ55o8Dh0?=
 =?us-ascii?Q?DW6u0s7A5FIxT+o3YmmQQMeVsjCXIR3lrrj1nCZQbzr3C1sOn0lRrcJaOodS?=
 =?us-ascii?Q?GocDlVYHe2/63yjZdWgc787Ul229mRyLPqKNA16Q1qKFDl82L4a43zknXOmP?=
 =?us-ascii?Q?SmwGDD1yTCIx2rovNtGapBodzBUpQS3X9KGZyDwwM7dm7lXkc0SqQ4q391JY?=
 =?us-ascii?Q?eUGKXn+h6ze9TOuJ3lA7+mXYOTVl5o44DOAn2tv6CH0zVFNMqjoqdR74qz7d?=
 =?us-ascii?Q?OWEB2Ussrm2wvfHt/LVTKiUL0ik+cEYPqnMVEoYKz4SjQKkhLGQlZu2QfaO4?=
 =?us-ascii?Q?tFBfeapl4ufuOFzNyRPSMKAju21UuJeVOXO2uI5UtTtvGecw5zlDbf+OfMtF?=
 =?us-ascii?Q?JpVPQCkKOwFOh0+zLBLT0uR2CWFg/R8Zf1GfHo0NtFF8XG0hlcIfNbYUs+TB?=
 =?us-ascii?Q?wseX+HONWDx5WfkrkfJeAqyecHj9rEdm6TecD+uq9dQNyt/9mq+Ffd3eL6E+?=
 =?us-ascii?Q?gLrw5DNOHWUs3hajR+EmOCy/BLKEQWdJpHc3yyuzYWvD61uGj1pYUFJbsjuj?=
 =?us-ascii?Q?zNdXmX4RL+iKd/0U7MxUMzJUVoYkN/lcuEG2Df9se3lv6jJQfhzwtQ4QeovS?=
 =?us-ascii?Q?Elb+j+z9TqdUB2EK50HxlFIHGCxbSp39mYQ+gKNe9t0GxFi522eliGLCWezm?=
 =?us-ascii?Q?Bt1UNpkCEoZj/Rtvt7UMGOf6zVYpIdDWAnes+aTKpQH9t7pEjtYI2bFt2LKx?=
 =?us-ascii?Q?DKNPfYHxJM4x+2+MPd3j04EbLwWh7foa5Wk6V6DIkqaQoZiNQmVZhfMDpVnn?=
 =?us-ascii?Q?CW+7Ynvi9YxijNJRPVUG0vtN5ut6f1zIZ7jPXjcqweaqrjb4VqG38w6PSnBE?=
 =?us-ascii?Q?vSB2r818+leu/qDLeoDAoq4y4UJzmsqq+uH/OnYm/V7HRIgKx7PXrvSBcIM1?=
 =?us-ascii?Q?gqsAe7rR9Hwm+WpIz2llQxBkjhqqQIcvuEOl9FPu4D0uPqQhQwQzk/pEU523?=
 =?us-ascii?Q?vb+3FqsL4HG0fGUWlgykwlzuYVMv87A2hFdojSlK88BG4XQKxgl6okEj28KR?=
 =?us-ascii?Q?oozhxzXSAUpIBqWFKpTigIjHa14BnBbWmvp6fm1Dcs9z/IRmCZw8p6H/3zQf?=
 =?us-ascii?Q?VQrJKdk7vZV/wbTbzdAxg4+SpTqawWs6GBttjYZkrztrrXOuaDUzHMtB2364?=
 =?us-ascii?Q?9JNbEWAr/Efc2xW/GItKsyAsW0nJanzJh8NzuO6p3tGx51wfyZ4i8yG+abN0?=
 =?us-ascii?Q?B2vFqQbo9pmTH1zwTkeJFx3mybWAgbh23fDsoyYGe5200LoltcTwOve62HhC?=
 =?us-ascii?Q?LQPvWMheMNAZNCv03Y2hs3n/wCsT1RoNmVUU1E1MvW2fUGQIRTSa/hYoygWo?=
 =?us-ascii?Q?uta3BWd+CeHTKJbOmgoM2l41wple12xNli2VxDCPLrkp1PxpAZRnVbk/G8CS?=
 =?us-ascii?Q?vnZRyP/92uVunzXz+i1S1dVomoaKgcuZpyI+SIxsDbkilLRSJBMS2VNXX6r2?=
 =?us-ascii?Q?JG+aRDa4Wg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1fe25d-f873-4d38-e9b1-08dec31e4340
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 16:19:48.0276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xCKyyHubnkXwV1Fi0qn4Kiz1QMYxo6wqAkBOxx2FzfNkWK/cVGehyJ63eYtmvzx4pen/z3PcJQHaTZei2J+Fjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10304
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_091955_602655_AA158C47 
X-CRM114-Status: GOOD (  20.45  )
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

On Mon, May 18, 2026 at 02:55:13PM +0300, Adrian Hunter wrote:
> i3c_set_hotjoin() dispatches the controller's enable_hotjoin() or
> disable_hotjoin() op and updates master->hotjoin under
> i3c_bus_normaluse_lock(). That lock is a read-side acquisition of
> bus->lock (down_read()), so it does not exclude concurrent callers.
>
> The hotjoin sysfs attribute can be opened multiple times, and writes
> through different opens are not serialized.  Two concurrent writers
> to "hotjoin" can therefore race in i3c_set_hotjoin(), with the
> controller op and the master->hotjoin store from one call interleaving
> with the other.  The hardware enable/disable state and the value reported
> by hotjoin_show() can end up out of sync.
>
> Take i3c_bus_maintenance_lock() instead. Toggling Hot Join enable
> changes bus state and is conceptually a maintenance operation, so the
> write-side acquisition of bus->lock is the appropriate lock and
> serializes concurrent callers against each other and against other
> maintenance operations.
>
> Fixes: 317bacf960a48 ("i3c: master: add enable(disable) hot join in sys entry")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	Add Fixes tag
>
>
>  drivers/i3c/master.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index ab11e2d79aab..38ffc8713167 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -649,7 +649,7 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>  			return ret;
>  	}
>
> -	i3c_bus_normaluse_lock(&master->bus);
> +	i3c_bus_maintenance_lock(&master->bus);
>
>  	if (enable)
>  		ret = master->ops->enable_hotjoin(master);
> @@ -659,7 +659,7 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>  	if (!ret)
>  		master->hotjoin = enable;
>
> -	i3c_bus_normaluse_unlock(&master->bus);
> +	i3c_bus_maintenance_unlock(&master->bus);
>
>  	if ((enable && ret) || (!enable && !ret) || master->rpm_ibi_allowed)
>  		i3c_master_rpm_put(master);
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
