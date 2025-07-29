Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E799C83F26
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Jul 2025 14:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Er/Us2nvqaOU+kLGEfpHTCgZHqOu5+moiXipGt6E73c=; b=qOafc52fHnyuvi
	QbmbdrVYJI7MiCijy9rtZfphWjKUtoylbWC9cwTdjyE9TSYhzhU/UcenDsr8AC5TRaaOl8qaTLfZx
	tIyF0l6dGoE5LLRid49rV5HM4oPW9Wnp5SU3nKcs51a/k7gdntVG4WqCdGWvaVc5XohuX9tl9FAFN
	r7npMKineiSF8rTarAw/ERurDtsseNPuF2duXYDUhw+pKMUi2YB7KCO51PTGcHie+bOitNNqzJdDZ
	n441w+uWDzW4KcqnatX2V+aeVSwoDYaX2NHoVRG+FM6U1UPt74OdZccFVJg+3AnfSBA1+DGYMq2bg
	205BBJzQrUwuSaNabN8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uglC8-0000000GtTt-1hmr;
	Tue, 29 Jul 2025 14:20:44 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugl6Y-0000000Gt79-21Eg
	for linux-i3c@lists.infradead.org;
	Tue, 29 Jul 2025 14:14:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TO47M/D93hCl1b3JLUkUCqK73cqAQ9RdHilW05Jhyo4FLOYC76zeb+W+lB2u6xoOlpXMIZCQWE+bKYE/Dl2eUJgEXKNdCSlYlhvMnBo4qJnWpxgI84gNiVc2C0eSyWYJIAEcMJhVIcWSEpIUGu79PlNsAuv7cr6jDSJK3mHXBFSign0P6xaEhvIVTlFgMkPbUJ71/RQ/TadYl5VOJf47AbaRpY7wH3v+Moka0JYcjO5wA8ITOLp6vQKluByyEdwvlVxN5aIW72vwOQSicIrjCy6IUONhJOCfwus4KtSPaypYvYYygduxjuE9dYhW3NO7BbuOCrX8heVyc+k05RO1gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/2aEMbor8SOIn89tB9yjxGbPE7D+CV6VwFmwgT1duc=;
 b=mEBAE8chUp36rVKKvQjkh/zJBFx2ygZXgUqNMNzKOapJJB37agAPyHxjYIJ0Mw+OLzO8tk4RWNEv1lAquRbEue7dKdu9U4vjeA+PrsZ6PLtJBIxNINVMnJc1Aq0wHR955Waek47nVwXRO1YDf46Br/A22FuxgBrfVJTgZi5IqBvHqb9DcihFLSOL7tvzZImaoqh4J4OkBvAlHqzeTUMiuF3670ru8J2QH0XSJdaixSL0+6l7JAehV4bd8qsiUZM6mRT2pNsvSlLI3AxdZDx5SR5glVTR11ZDdsPfiPF9xwaawLqOHTAmZV1VpRB7BFVOIDBNRoEY9KW1U47auFp3pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/2aEMbor8SOIn89tB9yjxGbPE7D+CV6VwFmwgT1duc=;
 b=ny+BQyqXcw/zUgYpPBYdXLHU7YbN/kFEHR6ClnDXHR+mopx3HYbqL5b2mO3/WAlbr/OBSHsbtN9X0GLLzV/1+RQWbVIXgQhfj7310TSm24e00kLPUsgaoe1yjDM9UbC8cz1DP+EiBen2I4URvS3JzL4I3T18c8mBFS9gUpc/Z6rIrNIhiw4vxHX6sqtHnD38HV/4Uo/DlkwujFtLbrq1AMT6N6WO5kt4eW0Psljkt3eDya4hWY4QHZcxvbjHfXjlZEGxDFt7oyTIJVfjW1NW/cHRWXzerGiLZWnT3c0hKd1qUHCjSW0fA7p0bD3YhcQ5OXniG90oif6f69J1hZ3hfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB11396.eurprd04.prod.outlook.com (2603:10a6:20b:6c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 14:14:49 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 14:14:49 +0000
Date: Tue, 29 Jul 2025 10:14:38 -0400
From: Frank Li <Frank.li@nxp.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: git@amd.com, alexandre.belloni@bootlin.com,
	wsa+renesas@sang-engineering.com, quic_msavaliy@quicinc.com,
	Shyam-sundar.S-k@amd.com, xiaopei01@kylinos.cn,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, michal.simek@amd.com,
	radhey.shyam.pandey@amd.com, srinivas.goud@amd.com,
	shubhrajyoti.datta@amd.com, manion05gk@gmail.com
Subject: Re: [PATCH] i3c: dw: Add shutdown support to dw_i3c_master driver
Message-ID: <aIjXTiLHoCo2cJFi@lizhi-Precision-Tower-5810>
References: <20250728104425.3878770-1-manikanta.guntupalli@amd.com>
Content-Disposition: inline
In-Reply-To: <20250728104425.3878770-1-manikanta.guntupalli@amd.com>
X-ClientProxiedBy: SJ0PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:a03:331::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB11396:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d91299f-51cb-4906-94d2-08ddceaa4712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|52116014|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/kU0VGhDaXP2151/svf5Ycpaz5UZaTMjJvWQm0yEMJwsCbHKNtqQf7P2+FXh?=
 =?us-ascii?Q?vsN4kOX06z6n+opaaVDL9TnfY1Qhejz9wYWMr9Au8fOfXqaz8NCpquJWtDWa?=
 =?us-ascii?Q?AbgBJpu+hoK8BAdj/0ulIAF3SurbA+VtwdG/KCE+tIkFj5jJ0QJihGtB9vln?=
 =?us-ascii?Q?MuaTeQTJa1LJOTbd118nM4VNmKwKEsYzHXU/M8WeRWq/gwpy721TjZOD3WEI?=
 =?us-ascii?Q?uGzv6m00rB/pWcAf3dsv0PnNGJ6R4Xrs6v3gM94yTGfFTcQqSuSyernNXz6K?=
 =?us-ascii?Q?piKmpmNTKJaytZ2mluKcU4Cd0oZnRSXzhmxTEn0YH0cPPhD63lvTf0ZjjRLR?=
 =?us-ascii?Q?w4GHowV87O9/H8D7UCMCuKv3UZNYAP1VmWB+Hot9v1ye5hhHjzzinJ8SLLdw?=
 =?us-ascii?Q?4p+mu+j63H0bO1pJidvhmRKkNhX5DCYscuwAFslE3DSvu/nCaLAIiWr3GSDw?=
 =?us-ascii?Q?v2XcDDsQl8VpeYTyL1J+ftC50ic0LdVbj+vta0LjyHhNA0FOL+dp1N26ZDOr?=
 =?us-ascii?Q?rJ6U660PqxfVW7vxOAKOpafOMPX5FMC5HYx8irIfZhcj+NmJhEwyA5Wm/vUh?=
 =?us-ascii?Q?N+YeBc+z5ti2Tpt2iMZHIzkzuo8wG5TIvi8QgmPay1PFz4YGALly8zHHdNbW?=
 =?us-ascii?Q?suO7Ll6vydZK3aobWUj2ew3wIol3ei948wmhqBG9iO3wkn30gJBxGJAXT+/h?=
 =?us-ascii?Q?lOeuLOoOls9qKK9kyhbkfvBUDrKVOyTppsXWRv33OaztGMy81NY2lWouq5HO?=
 =?us-ascii?Q?L9aqtBQlunNIUMBqUul4ERRFrndKudyRAgmSZpK1BsNM6RR21PtmljHfLuyy?=
 =?us-ascii?Q?0A6eQmsGBtQwbAQXP0RpH7KLpfxftxd9u8rZVglVH4rtjTot74cYXs8HprZ+?=
 =?us-ascii?Q?WNlDqeCNL2ubJEnlz2gtcYsUa08OCyzOKv83nHuvaRBSxE3uc4Er4tVSsh+u?=
 =?us-ascii?Q?Ep1/xSYPalTSweSlxKuPb2jg8GbIUxTB1x8J5QRbEvZ5SxLDvSD1SWL1p+7b?=
 =?us-ascii?Q?okMsapnR08nJAByGOQ2RYcFc8v8qxGrLmgmHqAAE0luzxKdb/rNjilZO0Juu?=
 =?us-ascii?Q?QYL+bxxJfLEvJQRY5Wa3peO2IDOEO3MqV2I5iGVIcfIjvivDxaDQzrCUfCN/?=
 =?us-ascii?Q?zKzww5Px7Wjc01x3kBZeYon16U0q6ga04yW0sHHcH7n2iV74o8vuPTvVNKSI?=
 =?us-ascii?Q?FLm4GjynftneBV1j+8QKBZISk7kKmKakGeaByt/6OcLBN7DD3tBGFEwlq9gv?=
 =?us-ascii?Q?bm/sica0MF/PvUvv0833YwJIqMJmp/w1CuWqWRjAQLLXufl2tmc/vJbCNZPz?=
 =?us-ascii?Q?wvpqt1hIlr1VAKkPwJHPGpjEfzknEk4TPNVeatmPJ76Gp6vcjhD7Tse51GX0?=
 =?us-ascii?Q?wtI7QQbbFi6hIcN/dKy3kYPrfjvr4J9qHyS3FZBPH3jgr/O4zyx0NmxCS/jj?=
 =?us-ascii?Q?TKRhEYXmCVTtx0f3WMgY/jtiimQ+DaFZ32pctN5tFSFF8ppZ+5Ks8w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(52116014)(7416014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kmu6Y4O2ar5xnbBVOtUHH3mO12JMtZbIhqI9csLtBES+/gVJHZPH16Rws3G1?=
 =?us-ascii?Q?DZ+bd40n3N3JgkqFHCyXp+z19B1sJ50QHqAcjHmKDgJb74u9DkuATNAdtTmm?=
 =?us-ascii?Q?m65tfUkZ3RnjGlbfdWLPruISktUS9RT0ZQGmLpB8zZNFm4hRZRsoVBsHWDYv?=
 =?us-ascii?Q?MPBzmiQUUTBI3elQd84iJ/YwhCy4QFhbX4uVbRX6ij6cgswcadmVq8IGmLbE?=
 =?us-ascii?Q?wi3WAf91A0thPZh0gs7UB4NsSZnrM9HcH/X81Yxpku/G0ICCefMyjfJNnSSD?=
 =?us-ascii?Q?3OXpMHLwfymfAYILQNVZsB48qcDX+/EgUGUIf5sqb8gt9XVghdCuLjxj2NGF?=
 =?us-ascii?Q?hkcK4gJK5qOpC1QSHXwncuE8rO68dZiIqYaUdhkGmVEBeG0iBF7XLmPDK3GZ?=
 =?us-ascii?Q?KdSlOuTUlrMh1u8hEug92udsh9E1J+GQARLcdsvSM19+wZCOjLumn9oAD40Z?=
 =?us-ascii?Q?IgN+EGSzUsLr2ycut9OPOfFaQClCdF5bBVbItB5+2PpF6vlkv9X8puFaTbfy?=
 =?us-ascii?Q?wTIv+fWRjQ41WSaEGipJHAvsQWbnGMyayTCqynENoT/B5otvnQETjiODUsPK?=
 =?us-ascii?Q?OM2Enc/HjntKQsgstXWPzWQCAx/0QI86ut+k42tsvXNneKeJKkuU4+INrrMw?=
 =?us-ascii?Q?GjCtjoz2quvVz2AXTgWQBwZNBWJnlVlS+B3QUM4z0x9a1MvCyBaszju38Imo?=
 =?us-ascii?Q?u7Dm1eLckUH7lCN2BfphH2Dz+HnGlEaZgxhWYqZWdIAOiHsh8hpyYzqzGOcI?=
 =?us-ascii?Q?/0yydinAfyuVXBdwzQ93ulSvMbHFDl2lNge4ZunNayNMHSVyyEOoK0yz+BSO?=
 =?us-ascii?Q?fJlD1SzQ4iP6Aa2DA6n24PyvQFGrTqixJAhCldZSMN9a5vPnfJ6o9wFD0ZZm?=
 =?us-ascii?Q?NZvwQJQCXYfDbqvg4V/3pkBNinPqHcElJyRZEzcjQCgkvlrNZRJcCbzooR7n?=
 =?us-ascii?Q?IkFwaqpMctgCl+la9D6FdHk0Duimt8c1uxTSqFkWuGCa2VYC6P6zDQ8tD/Np?=
 =?us-ascii?Q?O/InWeRwf5p4WXmOkn5TF1zGydvfFAHiUCQEaL507pDiLkmfMQfo/XSTjt98?=
 =?us-ascii?Q?SHZRg4iFnwqbgPAvcwEYm1Ng7Wy4Xa9s+hTU8dM79XetXadLgLSNkNN9z89H?=
 =?us-ascii?Q?lDF1IYJG0RZPHVtk6B53smIyfKoi1MT3FH0Eb0WMeisnygtIelabEQLW9lBd?=
 =?us-ascii?Q?ik5hA3KcJqnSVgh0v70mJFyPaIqgg6ByOV2WGbtrrnMjJLkPm06AiAD0ako4?=
 =?us-ascii?Q?DJdFKMVHvOuL7LMEGkQyX2Py71BhJBx6xyoRTA2E7MX5W/h5mVUmEOLh/qI2?=
 =?us-ascii?Q?ZEhsoqtxdkwuuWVzKZe7Zq+sYSptrzJnQGtEY/lpq3n9CuTV1lOeWNd1yRKS?=
 =?us-ascii?Q?hS3Or2rmZOhcDLu1FBz5WI6klklTR2TpItqt/m124Sxe6NYNCs7Yn1G7a7rl?=
 =?us-ascii?Q?SCcttiLdEGJErfzSrw2dAze/HScKwQEaDrZhWqrnZNYg949XFVXgAefUHeUt?=
 =?us-ascii?Q?erqYk//I+buyV7CF+XhnQeI3sOseRj6YC0BThNO0rh8YStyyEXpMU508J/9O?=
 =?us-ascii?Q?Wj3OUZnnTPrBCHimpvw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d91299f-51cb-4906-94d2-08ddceaa4712
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 14:14:49.1933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /wFBN0cEuQlNV0x6Q0gwoKRjw9su5M0Bnasvz3+FQbiowlTxU906cDXNIHpFXY1+naSvGVo0M9s43zUc7JvdPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11396
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_071458_532096_3E65E268 
X-CRM114-Status: GOOD (  20.53  )
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

On Mon, Jul 28, 2025 at 04:14:25PM +0530, Manikanta Guntupalli wrote:
> Add shutdown handler to the Synopsys DesignWare I3C master driver,
> ensuring the device is gracefully disabled during system shutdown.
>
> The shutdown handler cancels any pending hot-join work and disables
> interrupts.
>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index ae1992665673..6769def5580a 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1762,6 +1762,29 @@ static const struct dev_pm_ops dw_i3c_pm_ops = {
>  	SET_RUNTIME_PM_OPS(dw_i3c_master_runtime_suspend, dw_i3c_master_runtime_resume, NULL)
>  };
>
> +static void dw_i3c_shutdown(struct platform_device *pdev)
> +{
> +	struct dw_i3c_master *master = platform_get_drvdata(pdev);
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(master->dev);
> +	if (ret < 0) {
> +		dev_err(master->dev,
> +			"<%s> cannot resume i3c bus master, err: %d\n",
> +			__func__, ret);
> +		return;
> +	}
> +
> +	cancel_work_sync(&master->hj_work);
> +
> +	/* Disable interrupts */
> +	writel((u32)~INTR_ALL, master->regs + INTR_STATUS_EN);
> +	writel((u32)~INTR_ALL, master->regs + INTR_SIGNAL_EN);
> +
> +	pm_runtime_mark_last_busy(master->dev);

Needn't call pm_runtime_mark_last_busy() now

See: https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com/

Frank
> +	pm_runtime_put_autosuspend(master->dev);
> +}
> +
>  static const struct of_device_id dw_i3c_master_of_match[] = {
>  	{ .compatible = "snps,dw-i3c-master-1.00a", },
>  	{},
> @@ -1777,6 +1800,7 @@ MODULE_DEVICE_TABLE(acpi, amd_i3c_device_match);
>  static struct platform_driver dw_i3c_driver = {
>  	.probe = dw_i3c_probe,
>  	.remove = dw_i3c_remove,
> +	.shutdown = dw_i3c_shutdown,
>  	.driver = {
>  		.name = "dw-i3c-master",
>  		.of_match_table = dw_i3c_master_of_match,
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
