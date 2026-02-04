Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF888E9D407
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Feb 2026 16:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NcURzz1OyyoKFIHDB8MGd8eEWnYYARlQ7H9q6MeaOC8=; b=MchoY7wlhBJq38
	0CJSvNzZfsXpuyZVEl2OWjNyIdDJUY3Q/ez8dgDC/SfEw3B5EDvBVarGLB32/c+ceqOeLGlFD9KU1
	Za603EUUAzpmVZg7jM0YaYlGqISpfqunPc1CAoQMeBQpKu76sKFlcLOkLZs4odSFgMoGrwlD6QHOs
	mMXXVScZFJN6CLET6mpgd3dNi/nVY25a2cQ2Tpy0P8W0QxogLHlcjC15vZ6l1ydXff5CmDPVogzfF
	kuMiNubCm2JoU2s5GOwB+nzwFYKby4/RyGYYT5uGipBNdcxda0szEo0Css7Qmu4lXyXtPU6SWvwXL
	PjNRBB5H6mhDtzGblTaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfSv-00000008jWp-30Ae;
	Wed, 04 Feb 2026 16:10:53 +0000
Received: from mail-norwayeastazon11013048.outbound.protection.outlook.com ([40.107.159.48] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfSr-00000008jW9-0fOS
	for linux-i3c@lists.infradead.org;
	Wed, 04 Feb 2026 16:10:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBX+RvFFImlE8VtB0xK7xEVe8dYZd81a+OE3l/eRR2W0BCSUGVlJuJVyMZz8H++GH2j9EzxllgfdINYEDqhKzTEiWen2xx7FnuRR3DKAAKVwpPebjWz87KXJXO+efhaaLS19R1KxHyfh71LYObc/B32ZSqI2jHzYvpbO1vCh6f39f/bgcQ1G9G+uOiK1rGPaRVkIAo2Jv19pW1ohmHVhfpanTA1mEiP2Nbu/gbRd5VpND9FpjITTQOw6qtLNjrWKq3FRPTYFy90e+V3mI5eUlAi9FnJzjHd+BeYgLqn0KsIxNi4K/EbTz42dr3HNxcotGY6UxhArhCZrgCrKDgnhLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YOGmp4I7EIMQcYU2h693+VoBrgU0QlnS04fzCSdDy0=;
 b=kgJ+jS2ehmg8EQZfBg38fU/KQ/4GEb7DQKhJzX7Gj6NwUgkt+DtfZ+3bZ6QxWMw73nTTpebcSbELN4/Z5Nn6VtvRvEQiigMPrAy9P6mHOTVIPy946c2b+WAB2FrJL5psAryenKYoXg6EHCaCRByRLS0vX6uQiDWRl99slvg7Y27cbSEZ+wb67xxnOUgtvPAPL+4Hb5tR5ZEIPLv1P9tr+aVVxfgvKiXHEKbgFTY8Ss6N86cHOZAOC+t4ne3IkMuAeju7n8NYGmpwKj17xTrH0y2KvksXNILxEsJQUEPav+jFOOhIcrR3VteOyO+Coic7NVJP5mmclugwj9UPV0/5jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YOGmp4I7EIMQcYU2h693+VoBrgU0QlnS04fzCSdDy0=;
 b=b1FjXAuj1j4w205dmmd9kocp5ZeukbKYvJ5KNcMm3Dy3KVPw+Ook8KP8RThzqSQfbMpxgJ51edsscRlFHLJtuRrXkDoIm5hI/bUoSd7kv8zGVcG2FO+qnY+vhxMPqk9nAcxkIrVgEe6Gd6k7bI4tsD0GO+pAFvxpWzK3wZlTdQSReEMBmYJM5x2FqUTm88qELXUEhkekJvUG+0HukM/l81QKbLNX4foQVfPwur6PmCEEX9fC+H+/9MGq1ZZDudjK9DlrBV1r0QL+fOs8s5wyV1jrmY12qhosxrXLf11RPqq1dNwiUFMR0XDnHXJz0UPyB9iE7ynmcpabqntBDnggDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VE1PR04MB7325.eurprd04.prod.outlook.com (2603:10a6:800:1af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 16:10:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 16:10:41 +0000
Date: Wed, 4 Feb 2026 11:10:33 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, rafael@kernel.org,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH V2 2/6] i3c: master: Mark last_busy on IBI when runtime
 PM is allowed
Message-ID: <aYNveVUsiixWWlWL@lizhi-Precision-Tower-5810>
References: <20260204111511.78626-1-adrian.hunter@intel.com>
 <20260204111511.78626-3-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260204111511.78626-3-adrian.hunter@intel.com>
X-ClientProxiedBy: BY5PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VE1PR04MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: 7325d5b3-cbdd-4cfb-38bf-08de6407f187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KkKH+qax4wekfcWgRURliBmXNKxnTWXJbq6ZrGvDB8gCTCG2dSUtUMdf4wxh?=
 =?us-ascii?Q?3gKFbwQZ0yNXoNHbgLcHaljSJM1hcstNVZaoU1/tlW7UJL0mLOemK4dmmbVh?=
 =?us-ascii?Q?uTYqLtJLcqHVCAbkQHaJ5TJHZ152SMnFBNRrl6roD/OKsQcml/dozpyfABFt?=
 =?us-ascii?Q?2rIAT1m8LePO4c99QGQoeQ4vpoDTYIf0RdE35tlEekpEJcVt0TuivE852MfH?=
 =?us-ascii?Q?8e0THkUqOCSp5hUxR65WyN5Rz2uRwTTjaCnxMMnOOfIQU679F/NQ/wAOhL5+?=
 =?us-ascii?Q?d7JbVrwZrJjJkVJ6UMsN3vSyxO4CxOnSDgilNXR/6/Sej5HytU/YDpPxF3jT?=
 =?us-ascii?Q?nq9M5UV1nQSh8mExLloxHixkvwrRJltfUA2k5ygVnMpv0EtodURz5o/VKJaG?=
 =?us-ascii?Q?SFsZ4QXewlLtG4OVFoNdU8lbRg1iaU2naXEeRVpo0jxNDVlynKL3KGKVKXbs?=
 =?us-ascii?Q?jDSlSBgdIaffswEdolyHyMcj/mA3hpPeQngFhdp8hdiTIvMJKrrGFme2/65S?=
 =?us-ascii?Q?/mljBQpf6Y0tAmCAcbCXPW0PH0uHycg/QaUAfAlvn59n8zUfymR+p3s1y9GO?=
 =?us-ascii?Q?CvbHe5I+kEG2jEjTCSZipc/XKhUsDSSNXb9ZnptNZ/6qco4we79If37eFqGm?=
 =?us-ascii?Q?0eRLlGjbOSUHY15WPYQjLbMn2iX64howB9e7jzk9PB9HjqMjshneVoVCGEYy?=
 =?us-ascii?Q?B7S1hZVk9iapj8aH9w8m1/LeAHJQfFEpUme7LePmnr/LWD39tRjgBdP4FCUQ?=
 =?us-ascii?Q?rCWghenuPaaK+57zLYuEWf8DsyVJWHS+KHhQnCwv5lUiRcPOaNU0EOymIBv2?=
 =?us-ascii?Q?k8zQWfX3cD4Tlnv8RZXnQuSPMegiZcLMgnzKzZ2+pJtzzUx9AUwevqin1Uic?=
 =?us-ascii?Q?lRBLSKnzm6RIA8YKG+f2VKXgHvUQzyDtkhRkSrKwB17VGrgNf9A6qhi5cR+j?=
 =?us-ascii?Q?PxEjWCtG1QUMn/LQDuKacA30BaXm990JZB4eaqRHkaTs7/qMC/ISV7hMZOCk?=
 =?us-ascii?Q?oQhRb3MtaqsojX7YDdH+9/novhsYq+amiDUPknMIF4QUyeQ6IGjZEuRXVe5A?=
 =?us-ascii?Q?jvQXZJXZbrA236yhjgS5QofLFaZnvvEmZLIRMQ3YbwenESKgHOs83UJJry8C?=
 =?us-ascii?Q?hYZf6yTyiz0GypjKoW4k/7MBiZ8rmzOlhwiiyoKTL04AslLqrhc9r7ynUoSf?=
 =?us-ascii?Q?enpw538HZwxjkKHA3/V5P1TYvx/ykPdMAFeJQyBLSK3pPAqlges+fopxGIyp?=
 =?us-ascii?Q?wcb7jLeofGvNKfdw1p4I+PCkuhuy0mTXgrfVknfzFqABveo/HR3WQwf6GHvG?=
 =?us-ascii?Q?L5TX331j6QUSqMjhjGcfLWfEtBiJpZF6e9rshCgSUXymsz4/V0Py8kh3j2N2?=
 =?us-ascii?Q?sRovawQtOd0Ws0PVsEogjWA1z6AnpTRBldD3gIW5Ogfk4omsLol8YhIgEMmZ?=
 =?us-ascii?Q?GliN6cJCV/CA6593yEi8MzlWlloSIhpzgWJmjKCgqNYPxgJ1ouNlg+mYXdBA?=
 =?us-ascii?Q?3c1nsEv8ugFMqAEsC5tJxd2p5xw9SLYwp2yRqxRzT6CmkVT5ogn/I4wzjGdE?=
 =?us-ascii?Q?rSOSzYpwsRNZoDjM6JPQHgNf4tj1koPFTv5k5OAo8QsgQtLZVGWt8uKLpHhs?=
 =?us-ascii?Q?YncSglgGZBC9s7WuKxP4gWg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZXt3AImEpMBHFb6axBqQdt3gma6wrhFNsBL4zReP+xXdl6DZI0T8h3O2vBxm?=
 =?us-ascii?Q?eGk5mLVD2v1+HkQnce8S4LixIcJqYvJvUYtxnWeLhk/WmTPKw167uVW23hXO?=
 =?us-ascii?Q?rfPuNZNdpKx+woQWrTzO+A16vxcQEqBVbTDdzfj7IDinnU5Aw5KYzJM+BOGu?=
 =?us-ascii?Q?3uQ/FFCHdOC4TuP93PeyyRZvRRk/Z7SBAPajMO8wsNWyCZFZ/bFgQwCIqEu9?=
 =?us-ascii?Q?nxpAEzXI+DQisjoKsCYqAf8CVciVKOuq8t4FGAAuWiuccUigF8IrMd0zrjRq?=
 =?us-ascii?Q?jk0xdpefdSCzdQAsa1aZ8yaZOUgaZCA4aF8JTEcFPrEHB5EGnEyEJN4UwBnP?=
 =?us-ascii?Q?YBdipBmJjuJL/huyFlNm4O3EDExl5WJJB1owyOHFKx548lhWovm12MHhK7Ll?=
 =?us-ascii?Q?Ef02xoiPMUG1SZeKvMy/d1zjqt3TdGllVTyyEjmUae8vw7W6eX+Czh+dG5wq?=
 =?us-ascii?Q?AvyXhxMRoJfYeKYmeNpW5kl/i62TJMK+ckQ69BvanoyiAf2ElpRXy4qM802T?=
 =?us-ascii?Q?Lm4A1Y78dd56QepxzAnAH86+BH+XzKJ3iOacsFb3U5W/o94p+QZuU1Ok6qIF?=
 =?us-ascii?Q?tHM9ElKxn/mhwP4Ajv2XkbRb2CiDl+oM4vU+Lg+qinTkn9LUz9V3+dkGonrV?=
 =?us-ascii?Q?BLS1lkBmDmRoSKyF5Lu3kyWENEmNH87U4tkRxmDxctsxb+lGrB23yNTu7XZM?=
 =?us-ascii?Q?cyy5nNhWtRYTcGNpPPcYKVwLvF7tjxCG+QhUIcp+9/U4VyQ0/JeEdYUkqT66?=
 =?us-ascii?Q?7wxAPaK7JG8sBxTIv2XacFs0xx13j3Fr6keH+3YuC+L7cG1G3lUw34rqv5Jc?=
 =?us-ascii?Q?9fbMiWQtEQ1Wp/VXyJxPr0YDZv48ZdLzHidxfULzvH2nSE+rsdIRCKOnszLF?=
 =?us-ascii?Q?ZGzcmoGrAihYbyFrTrw8c+7RXHotGvGtal+nk8nCA4G0Pg1Yefk5GVSMr8OI?=
 =?us-ascii?Q?Lw1z4zlsAvZRFQVmNJgILiOnmwjTInngC2uzdNvLxQ1j7Zq4OH9sU8+vJIwG?=
 =?us-ascii?Q?SYhzGw+3/MEa9p8d24kyjxJTQR/us1u8mqgVxD5qq9SNDqafZN0+msbbL+OK?=
 =?us-ascii?Q?C04xXvBb4OnGcmN7ngvTfpt/t1xwFv8SebBJgguP/ScQE6mFmVrvqHFAWluU?=
 =?us-ascii?Q?3WfBjvNMcDBVnl731t2WXHHxwJIG1tnDWxfwPXwnRR8EXpZTuxAHaII1T5Jh?=
 =?us-ascii?Q?S42B/Cq1ZZVt181fqrx1RZ5KWxH6Ax9DmUsvE8gr87OxwmDQYEHLppCbPBeA?=
 =?us-ascii?Q?DCdd8RgIin2w84Z7N5e1mp1rCUiBuCBZAr+bg0RA2MKCBRw3Q9grbEG0gqNi?=
 =?us-ascii?Q?wSwwFk47xUCQ/ekIaltw7rd80LQX6R7tQvl1c7+5ypiUTG3KHUPTO/I83fHP?=
 =?us-ascii?Q?k2n38dZUKjErfA41/XMGBfyUcT7VT5Qw6kR+AqITmd4XZ2ElVQ6T0EkEwTOz?=
 =?us-ascii?Q?JYlS8fH/aBmdm7nYsUsgFk6LVniNQejnemKmHBUuea28EPjC8KOv7Omba7pT?=
 =?us-ascii?Q?v+c9eGWlakkvZVRclBK0L1ANsuLc20CUwZ0VqDHOoPtR19HICo9V7GNHuuRK?=
 =?us-ascii?Q?kBPLc1H8o5RlANjnP0Azitwbrxr1o/zi55eJSkUBxEyOtJqHCXlofZ/IXIqu?=
 =?us-ascii?Q?G6NnXlLpCKC+N8x+iDYaI218ONCGAy0DhdjdI7qyGvQkeUp2Zz333ebtkzPI?=
 =?us-ascii?Q?8iwj43D6YhhNdXAbmsoUlXCSIYjYY2pPrQax+iE67BswjJEr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7325d5b3-cbdd-4cfb-38bf-08de6407f187
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 16:10:41.5014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4BmIm7Wd8U8VvXUH9VsVBybo2dXLUEsmIqAGaoL5mGCIL/AmLXknf6CDPYFhgApmnFmTR2DKcCM4LCaD7Aalg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7325
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_081049_195754_BC28526F 
X-CRM114-Status: GOOD (  21.86  )
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

On Wed, Feb 04, 2026 at 01:15:07PM +0200, Adrian Hunter wrote:
> When an IBI can be received after the controller is
> pm_runtime_put_autosuspend()'ed, the interrupt may occur just before the
> device is auto-suspended.  In such cases, the runtime PM core may not see
> any recent activity and may suspend the device earlier than intended.
>
> Mark the controller as last busy whenever an IBI is queued (when
> rpm_ibi_allowed is set) so that the auto-suspend delay correctly reflects
> recent bus activity and avoids premature suspension.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Although it is no harmful, I think it is not necessary to mark last busy.

schedule's workqueue task to do i3c transfer, which will call run time
resume.

Are sure it will block your function without this patch?

Frank

>
>
> Changes in V2:
>
> 	Adjusted slightly for earlier changes
>
>
>  drivers/i3c/master.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 49fb6e30a68e..48d1b1256290 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2721,9 +2721,14 @@ static void i3c_master_unregister_i3c_devs(struct i3c_master_controller *master)
>   */
>  void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot)
>  {
> +	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> +
>  	if (!dev->ibi || !slot)
>  		return;
>
> +	if (master->rpm_ibi_allowed)
> +		pm_runtime_mark_last_busy(master->dev.parent);
> +
>  	atomic_inc(&dev->ibi->pending_ibis);
>  	queue_work(dev->ibi->wq, &slot->work);
>  }
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
