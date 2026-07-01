Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B208C43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 18:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RUN77JD1qTDpFx3sSiBD0EUT/LxDZYthVxzBlOH7/Ds=; b=rZqaS6nUjy5zS9
	VeFAnqHIMyjnDSad2j3UGyTIF+35FPhMniWmn4ajjyeE0cEDV+JREPX/QfbEA5SPj3Ku52yJd95yj
	xascsky6SxGCisa651x8HFguMIffNUxG9/b5CHRBcEDSMV3hWH30bf2HPdYmeaGhwjTl3fR59O3x5
	MGTzgb5Gfxf+sh0eRcUmdax3E6f+ae4sss15ktO1NBV2ebb2Q6BhYkHT4p8Hm6PW0+8HthqZIkk0V
	6ytXuBDMLw9tgNA+tIIdVp5KclHaDYVEEdSyXVilnD4dPoIXsQhzIQSl0b8qPIOyIoqNyNLs80KKS
	ZOPJc5I0H9odV6gPo+EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wezei-00000002pEf-3QMG;
	Wed, 01 Jul 2026 18:27:28 +0000
Received: from mail-northeuropeazon11011070.outbound.protection.outlook.com ([52.101.65.70] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wezef-00000002pDv-2vNo
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 18:27:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oby8kOT9SMLl8wiLJNhZsatNfU1yHTlfLq0DHRjToj0j7DkwDUmIO+KjiN84ukUWHUqPv97Qk1ldVuxjOs2XBBTEA/LNNWDpSvFu0TVNEH8D5YkvyeQfPdZl85ldwh26ELobC7UhFLRhRCkaJ9MqC4QBszOLNZbbnmweLdTZFhbR05JuIiuvmp98ghl/RwfqffzUTNBYtyYU/jxdq/skICN0hBjStMtCiBdhtmI4dTon0UTMKrZApeDCaqLRPivhUkHFCYeAYl75x7z3eN/IT9qBk1yg3DP2ZQO6Lz1FOyTmuuskU+VwbXXC2hLbfAQUQCte7Y3O9LusjgFW26oTzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nk7g9WD8fMVVUZGT1SnTvpRwoEK+1q95Ew+4wu029To=;
 b=WRB+H0962VlTVfbRFb2pq88zoRZohElHCoZ7jhIg/T5DT9BhP1fE4ybB15143W0nBzq9XT11MdXWbnvB3b2dNMbqyHdKAKLEIOKahP0xq7ZYXcgwaKFxOlnS9awNtzFiJ/8S7MhKIAJiLaSmxgqZR7ZrWqhuLjFZRYAl7MUAVeAPYrtyZHS/YtBTyrS9ExJyv4VbqEVC8ixwCA/3NGxAwK+p7OG4zfnXx6rjNREO7FnR4TcOEviCN8+1HpjB7LgLEYPYKQUxsQrEnUhDn8GhvzKvjuEiNIKp4I22yXcTCwogMu5sfKZzVIzX9zP0nZdr4qhVUYekei1X5Jwrny2HGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nk7g9WD8fMVVUZGT1SnTvpRwoEK+1q95Ew+4wu029To=;
 b=avzS3yx/co7c3XvmvJS5nCAKkKCJb3sqhe++87Qa7UFFugPkekZs3bRSblEkcI94IgEdQC64k8JylBzgPl5YzjAZDXG+9OQUAX/eowhwUhGGStQFXzHQrmeiH3xBKQwddvrSxO3PUm2VQF5sCuhpxEHAkfupYqhHAICh1ZHr//aA6az7N9rnmjXXi0zmRIFK4iFanJgmGL8Bo6mlDGCEUFKJlbzH6uS36szvfwpVYwpoOeJLrPUwtj951xEnPA9SAPQB0smIYnublh9oRdu3zg+CrJCPv1G7v5CSEJNvxskQ7o6Sl8X6b+olgVPfepjfrz1Q5+8I7hLOi1sBl9wqBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10663.eurprd04.prod.outlook.com (2603:10a6:800:260::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 18:27:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 1 Jul 2026
 18:27:20 +0000
Date: Wed, 1 Jul 2026 14:27:13 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com, adrianhoyin.ng@altera.com, ustc.gu@gmail.com,
	bbrezillon@kernel.org, vitor.soares@synopsys.com
Subject: Re: [PATCH v2] i3c: dw: avoid shift-out-of-bounds when DAA assigns
 no devices
Message-ID: <akVcAZzT-WGHZNWp@lizhi-Precision-Tower-5810>
References: <20260630172904.2662160-1-kuba@kernel.org>
Content-Disposition: inline
In-Reply-To: <20260630172904.2662160-1-kuba@kernel.org>
X-ClientProxiedBy: SA9PR13CA0180.namprd13.prod.outlook.com
 (2603:10b6:806:28::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10663:EE_
X-MS-Office365-Filtering-Correlation-Id: 80eb0653-5892-407d-3cea-08ded79e62f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|18002099003|22082099003|6133799003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 5OrUTyMSSdsL0kNhVjB+2p7+7pMXriTttj4Z+zxIE6lSUUXvTg+bzjkaKWk4ryGelya4fO0PL+oZXjT5RCOtnkzma6lslYBaMmo48iEB4LHzFCRJyDwHAA2M3OtI53lJ8s/dosKcsyQC702AwbEaf9HH2sAeIbudgj9E7RDZ5zik4A/zRSC9DaEqiWd7lbHqDeQxXpgtRX71Patyw+xqplecaWHLevGfskU9mqlu0ydZHtEaHFFqymTPLxZxOaBtzAb1t2JQ/BeBvMeiF6y7o6WQxJRxqF1UUXH1Tpejcb7N7XwdfZun5deDNg/AvEPzBdWjMtyseruTz0kwj4Kt9KjkCRB+ZGIGdymmPDyU9F2EFa5bJoHFncaEKsdChOCBwNjjYzA2sf6F1Ya3hTRwLApFAd+z3PenJxZkTQMqoPtdfpr+XC/ytj5xTryE25XJ4pP3Uf8TD2lscHeSsnRf56mpLqZHY8yJxeOGOjWclCCBY4V6rMHbagqnpAWWNW+pUkP9GYL31VEcpdEISll8NXnu95lCVMnlFEO5BL9tV514BaQ/yR1LEBj1BQvz9nGRBnAY3Wl5iaE1fYePnsyS+EXy/a5TpCm7K/UE0rTyuq4PU6XYiTJ4Ct/LGq6d/M/jIVo/ihlisGmk4FtAl3ZdWSRSkczb/bnKpqQkydN6yTU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(6133799003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h72VdQwZCsRuThifS1x+RidjPyet332/Is2kUBeNB2BB6YhO7Fl8a4SUS0hW?=
 =?us-ascii?Q?ibTZO8gGK1sL1qhSAGSnzBZLHBt7GBW+1vuWxVxMa6ceTE56/ccog5pmbFRm?=
 =?us-ascii?Q?EDYQxgcTamOS8LhMbWxKlvnDvgLQs7jILBPD2gVtwbzm3xOeXq1LhR2pRWT6?=
 =?us-ascii?Q?UqOGf3UVCDmtatWIlGyloSJ40uBBZAeeJVpNJwMEd+0gC+Bq0rUzmp+8uVA/?=
 =?us-ascii?Q?sq2ZZV4nS0GUhn4uM+rg/X4o/dMsRhnz3aaZgcmyRS3WYNNjUp5siCLGdQse?=
 =?us-ascii?Q?VIjAJ5YqMrAc/i0fWQO7FJ5D1bohUjsY+7LyairEAesJ7lcfjWntgvWjRq+k?=
 =?us-ascii?Q?ZsA1h9gCN0/gdQtU33L8+br3u1/WQWmY6Kd2uwWr2XQf3EiSKE5QYg6ktpHX?=
 =?us-ascii?Q?m6GQ6xjMqLuHDcC2Rck41DB9LOMjVYaaoaf/WQ4PyQiqFlgBCYNu6KKrS38g?=
 =?us-ascii?Q?5pXltyM6IpS1h8HBm5oGLqVOQGaio73dZXsJT6lS5l/O2NYlESuoAYHhmskx?=
 =?us-ascii?Q?rowuT3FZEC8n7IzbAHkSKE9FOxA00Ap3wi1Rvo0u6AO6sfnt0WLIomIsJSgo?=
 =?us-ascii?Q?jLz2lRrTZ2TwgyuRT3jK6ishRvYWWFluPPLX8fcVbODe99B3tMmSnc24wOiK?=
 =?us-ascii?Q?oi7OVLX5cdoi/yaakgUfzTNGLnaMaxthx/YEWCx5dZ0IYojuSEUEhk9JIseG?=
 =?us-ascii?Q?+2VrAz2+VgGzOvXBdCgjc6xTfHd4+S7MS3IxLISqrFYpKjhY1n5pmGkfrCsa?=
 =?us-ascii?Q?BXED+zG5Ze+Fi2AsQF2uOMgnva6tTJozvpLr5YnRl2loLQmtUxDozkDc/Q3O?=
 =?us-ascii?Q?kcsVAE9Kh6b84pA/TpjRV7Ef5xXrZtSddqxWgmQq8CBpWf5gtMv9vjW6NnbF?=
 =?us-ascii?Q?bZpdo1hP5UMW9V+y6VSLkexqeOKYyTAPVHhFbkcnYjybXQpEV23diT1RiJ9t?=
 =?us-ascii?Q?bLtveAgCFTjW9OX4SR7rhvXROQSZN1+ykcvx3Gi18uMmbrMFTQMOZNBJl46S?=
 =?us-ascii?Q?gP2pdPQxxdQtwflnLoqOI0WWOmBaZWOOvI7l4WDM9TTUxGWPJcf9He7XUyur?=
 =?us-ascii?Q?iTvdyZ+MZ0ASLBVT4KPLNmrGPum+Pp1pPLEVkShErymLaZcUC1GszkvLcVKk?=
 =?us-ascii?Q?AjzQUT6TBMo46jLJhCUVJ5n38p/PkjcK12DQah3CqIQP/EHLxPiBhDpUk2/S?=
 =?us-ascii?Q?dmZkkiImAjTcq7LhtjrtKO84bNHHNAD/lhes/CCv3sayZt4m7uJONJ6xSbEu?=
 =?us-ascii?Q?PFPbqwP8RNK3Q0ANsFt/7llDoCtiKaixOk+O9TMFqm/FLKCafsEewC338UoT?=
 =?us-ascii?Q?/yBh5rQ3jjhlCxpz1EZ1le9T1NHGG2oYsKJfv7mI4+sj0+HvX7Nhd/wazO7Z?=
 =?us-ascii?Q?5m/LDQl7UGSmriCl92bOT6y3IQwDY2oo6rGz6Vj8p2lD2bxGIIh4arNgEcEL?=
 =?us-ascii?Q?KETJIeCgHxtcbT1EQzBeamK8tjJiGUzwsu+IAR6WemoHbgbbmiG3GlBtlhCA?=
 =?us-ascii?Q?99ft5tDkHqemzl7rOYdZOdhLPxuVufY7Og3r0nyXMJbxGICVMCU/affKguc+?=
 =?us-ascii?Q?vmfyOBNhsYH0BEnbosOmXlg76xXJDVQgn/EyFzo8FgQaL8RZ8GGgBBiVY7nB?=
 =?us-ascii?Q?EqCVF79nI+Dmj8gERvr4KTUF9dRIJ0g0P82+A2UXjbONgcl9Tql0JZ98+Je5?=
 =?us-ascii?Q?S4TJCg5q6D4vJvtoIKYtJW2pecrFuqmTvy+SoXZQKeWcHbiLXF74XGRMQUM5?=
 =?us-ascii?Q?NqOTdBbaag7EYfkrSLTBrru+qmPwRcMcJ1IY4K7pLmJNm3OuI7Yr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80eb0653-5892-407d-3cea-08ded79e62f6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 18:27:20.0107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfMDL1grSJyG3PHsZRQuTbxfGlj1v/a24/7m4DYdosBttPGJDRZl+3RbZJ0I0pYg78hW9BjG0VljbLM36SbtebU5uhI0R0ipU6v++QRHBaUO1yUIJ2UQCPL406QAiHd4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10663
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_112725_742751_4EEA6AAE 
X-CRM114-Status: GOOD (  20.64  )
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

On Tue, Jun 30, 2026 at 10:29:04AM -0700, Jakub Kicinski wrote:
> On an empty bus ENTDAA assigns nothing, so cmd->rx_len (the count
> of addresses left unassigned) equals master->maxdevs.
>
> The GENMASK() index master->maxdevs - cmd->rx_len - 1 then becomes -1,
> which trips up UBSAN. This happens every time on boot on a Gigabyte/AMD
> server:
>
>     UBSAN: shift-out-of-bounds in drivers/i3c/master/dw-i3c-master.c:905:12
>     shift exponent 64 is too large for 64-bit type 'long unsigned int'
>     CPU: 7 UID: 0 PID: 963 Comm: (udev-worker) Not tainted 7.0.11-200.fc44.x86_64 #1 PREEMPT(lazy)
>     Hardware name: Giga Computing E163-Z34-AAH1-000/MZ33-DC1-000, BIOS R32_F45 04/01/2026
>     Call Trace:
>      <TASK>
>      dump_stack_lvl+0x5d/0x80
>      ubsan_epilogue+0x5/0x2b
>      __ubsan_handle_shift_out_of_bounds.cold+0xd7/0x1ab
>      dw_i3c_master_daa.cold+0x1b/0x96 [dw_i3c_master]
>      i3c_master_do_daa_ext.part.0+0x3e/0xf0 [i3c]
>
> Skip the mask when no new device was assigned.
>
> Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
Next time add change log here.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> CC: alexandre.belloni@bootlin.com
> CC: Frank.Li@nxp.com
> CC: adrianhoyin.ng@altera.com
> CC: ustc.gu@gmail.com
> CC: bbrezillon@kernel.org
> CC: vitor.soares@synopsys.com
> ---
>  drivers/i3c/master/dw-i3c-master.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 2f8c0c4683e0..dc3b74822f8e 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -888,7 +888,15 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
>  	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
>  		dw_i3c_master_dequeue_xfer(master, xfer);
>
> -	newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
> +	/*
> +	 * cmd->rx_len holds the number of addresses ENTDAA left unassigned.
> +	 * On an empty bus rx_len == maxdevs, so avoid GENMASK(-1, 0).
> +	 */
> +	if (cmd->rx_len >= master->maxdevs)
> +		newdevs = 0;
> +	else
> +		newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
> +
>  	newdevs &= ~olddevs;
>
>  	for (pos = 0; pos < master->maxdevs; pos++) {
> --
> 2.54.0
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
