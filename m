Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026D7CEACC1
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 20:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jp7oGsHVseCBleog4AZnL8kVWoq3HxjKqTzyFhAJJ+M=; b=WrwT4kle9dHVOV
	23TYT9C4G61Ov3nKOIH0DYVC+xeCb29Nm11ZrHcejPPOW8PCJpDPo6VOgli6g836aBOCvmI1TVfR7
	GfPf5F/u58Bhq08tvaA2dJLVISMMuypS/GNjh+kfZQSs/HgMrWDE7PdP3XUmqDxXa1nJuh+u16bAr
	nHKQW2X/FSD389lWhQeuWTaBnWtHBStQchlJVg0KBjiQX6dgzMHlOiHoJms8NoP4KNbFn0lLelCVy
	eZ3eI1QSqVKG7vxJE8WirJM/69p8u6NcSuu73FIAtmFW3Qm4cZEVuEqTVpQmyhjC/ApZdehMZKDIZ
	5zRd90lncGspHU8uNqag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK06s-0000000D4A2-2fV8;
	Fri, 14 Nov 2025 20:09:30 +0000
Received: from mail-northeuropeazon11011019.outbound.protection.outlook.com ([52.101.65.19] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK06q-0000000D49S-0oZh
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 20:09:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRFF3tBHGwr8zd5ocYRHloKGteG2r+HeUXjLH4FroCcwBxjv16i4nljQTWnTsa+TezlabcmR8owK+6Imb+xQDkpvPOeLFtTQ+48UgaPtM/B19M/Gxjo+0kbj/7otDXoGJvZPZdfh8J0l9FxJDBj/tFimLhL7W5KcftiWnpLvmfWnJCMXH+jgfLLpSs6LEZ44JWa3tuypM/8XVe8CQX5yxhLKnDtqglCi/V/sp8Y4ec8ULShv+ZsUPEDn+F/QqEmMHfUSMQKFZ/1Qbl541FLuYEcI/Vpbd+MSaXdyEPldqWHRSHWf7QrdQHEZtxH7kaFtkTqoO0PHVbibr6RISoyfMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNObx7F/L9VuiJCsv/efCk3hyK8wlYDSzvgqYD/zXD4=;
 b=kzlNjQAyhd/1xFA9qHNrr+QSt/kvgYziz930sLiIPNj+MXCpl9Vg8f/TByMsYntlDa0XUYz0DrJKYeSQYaQ6RP7o8+/y1L5rSWvyyoTOJ+hAWsY7tPLG9crRVRGwILFTFZEPKDwx1sm8yWEC7eeOVpGgTepeMBpolva4fLpfIY8ZAZ5pCPllUmByvw+QG9/KdzJnYX7XtXDYDggSDiB3Lc+P6+hDU2bkPeszzqls9OqAsOCDByFqZF1OszvEqcEWwngR5KUzI6/b/xX2ej77DfPqTOuy43bDzuZnrI2FlUmVLuNdtbT5idP2UNXOQeYUBMVgzSkHOkPnf4kiRe/zGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNObx7F/L9VuiJCsv/efCk3hyK8wlYDSzvgqYD/zXD4=;
 b=gbjNzRjVhZxQozNQWvxsuK8pvkK+fs6VkGVVaBwIbVWlPSpHJ/txscjg65gLvUoB060fSD5Zddxl3Wi6B/7OtvCv5lI7qZtl0RAwRZkXnEQ6984YrwjjEsw/oVWN77Tc34wNQekcneTzdqr6ljoYP+X98nf0OCdjl7Wahjmdjk+HGwBu3sYQDW1tboIZAIT3H3S920H0ECI3dkpvlepydLDPX6/MBoRNerx08ajSNV4tBJOTS0/AjepaoFKgVKu58NBdIkJ9E/FBtBLgyEsqH9kbuTPWuxrI7kYo9ROpPnpwvNc4Rr7i6Xgz6Y5BMJreuqlwQOn4ipCYFqUexxaBBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB8PR04MB7004.eurprd04.prod.outlook.com (2603:10a6:10:11c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 20:09:24 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 20:09:24 +0000
Date: Fri, 14 Nov 2025 15:09:18 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 12/13] i3c: mipi-i3c-hci-pci: Add LTR support for
 Intel controllers
Message-ID: <aReMbhYuSCT5RNnX@lizhi-Precision-Tower-5810>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
 <20251114181356.66515-13-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251114181356.66515-13-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8PR22CA0016.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::9) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB8PR04MB7004:EE_
X-MS-Office365-Filtering-Correlation-Id: dc48dbb2-215b-47f5-c6dc-08de23b9b488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w/aq3k08MeAGVIQ6a2FzqVB81bGgXYnQSuv+a1tmGlOYfQuOM6wj+6EyjJeG?=
 =?us-ascii?Q?9fMMZs693zPx6kavRH5HMOoNZhBhAMKqdcKx1WoH3DuowkJnOFXvi43xFCu7?=
 =?us-ascii?Q?PVsQ5l0WE/irSj6bChiUfos+kMt2IUl5I3n5T67tGB91/wbMDlOm7t5oZHUa?=
 =?us-ascii?Q?lYIskH55VqGj8kwEKjD9IcaT9kmekbr6j4AbdLDWhcGUKp8zoi2Rz4ztNQgu?=
 =?us-ascii?Q?upeAgqFM+2wsHydyivQ0I17XHmyk7Zpb5haO4zLsFLbBWKyELYFgB2BSWNlH?=
 =?us-ascii?Q?kl4bsmU8dCvLdFWBJZk0/0skUmOgY+4W3LQZmvItYYVK51wG5g725AAMczS8?=
 =?us-ascii?Q?HJwM79PTkXFxO1jTk8sxcTzR/vpwUbj5/PpgivwcCWzPac9pD2hNL5Wt6N4C?=
 =?us-ascii?Q?EV2NJaxcmaPFD60RgMaiDzdJwbfXkCFzhp9X/7uaqKmu1IZx7U0BFmYbv0gH?=
 =?us-ascii?Q?C5Ej+GKXzN2Vr9Zg2afw3L4pp+dWoSvQ0J/y63NTOi+MfUvf+Q7DwkPJvlHe?=
 =?us-ascii?Q?igp9IHf442VR0q7gJ9hUtvtpik9SNQ4v8S0uKHPvl6t2iDnbBPvy51hlKjkL?=
 =?us-ascii?Q?MZyBE/vEdrMOlhIvFt2MK2ghxYOVxJbxzONCScDs/BxPIL3dPEfJvReyhcW0?=
 =?us-ascii?Q?2VIOZGpe8+HFMj9Flp5kpcXLbfNyL2S+dCE3J+oaMc/ZUCpaFEKp+NKerRA/?=
 =?us-ascii?Q?Mr/BLb2MamaI9399F1cX0FR0yytEKUTa7er1NGtT5htUJDC5GVBVmAipMJYL?=
 =?us-ascii?Q?P7Z0qY1LYzsAvSlBiZUQ6MaaAa395ybj68wf2+XGMKyQevGLKDqoWKy78Jlc?=
 =?us-ascii?Q?jTaTLGn2dShofolAbPOfNFvsG1zCH3t2wyRpE2ijBm8MonLx60l4+IxIk2Zq?=
 =?us-ascii?Q?1p6Rzuuby7D6WJd11WTALi/hKeK0qGU3YVO6+YiLNSuyCVRSXLrMWHbZyCIp?=
 =?us-ascii?Q?pMkqZPLJhNndiEBQUzz5z8WbYoLzqFa9ejr69YMgsGCvq1hZWwOEJ3VyYMta?=
 =?us-ascii?Q?Wrpye5xNs5TWqsD/MjrVnVTv0s5bHth+y5LjUiFCLR0xY9EhsAni7Gw7PKsP?=
 =?us-ascii?Q?+Jok5EKeuf62/azVvUnDEOcf5d7gX2jgAKig5PwY87EQnJqObcWyU+Bkf3Nd?=
 =?us-ascii?Q?GUPxaU5KBNqK6F3JN3Zckp/gYklhBPH2x3hGhl/R/JEtE0IY3BVrSEANXySE?=
 =?us-ascii?Q?E6xRawYQ1t/x8pHDUO+C/mmj9vzxiT7aMqbGBTzrdkuQcvQlP4bkHYf4ypTD?=
 =?us-ascii?Q?YER5xYY5nxsEmgw3jgka03uuoaJ9PG4xiOpQ4xTszMJ1wFj0kdDmNl9NowkS?=
 =?us-ascii?Q?602v2RLZf66bsOWgrD0PbjFnJxRrYvEcWmlD6OgiyRXCfmll2pVuRMtHClym?=
 =?us-ascii?Q?YcN8Orh8OvbH3xrpnORs974rmfckec4mGFwm95HpAtM/v/Yh7vn+l4W9wosK?=
 =?us-ascii?Q?hESp8bVYiKTSuczuZuYJOlJ7hGDe8VTYA2EGCLWgBXKAA+usgLi/+Za7fdT3?=
 =?us-ascii?Q?2xWoPMv7/YMvIdlq15XjSF4mPPpRoLG+KOUh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/g8HRWVWnkOu7FULlRGZ8yNpjhucaYEGcPGhANhNHanXvNRHz0Ur9CnHoEgu?=
 =?us-ascii?Q?XmK1avuPHiqXaFnbsQ3pYl/gkHgks/2uo4qyiuhDE0ca2s+om6jnVux5GGrM?=
 =?us-ascii?Q?3BRDZUmQtJP16Dklpv12diMe3fZ33rQNMl0eUjyts3GqempDyS26wU7IA+tn?=
 =?us-ascii?Q?mZXKZaDi/pvEhUPriPB0h6+NMAZ5O80rq+Z/ZfKs0jGPJjd6CRh4dBhLSCkM?=
 =?us-ascii?Q?/9Ljcm5w8BV9CI+zWfGqF7j7dLvGPA2mrwU+ATF6pf5Lbkl4gEjNuYwPe6VW?=
 =?us-ascii?Q?qf4grYJIWjMsEYCw2EO3L33Eo8Znh/m0Ngi+XKCEI5ssBDV85Y4U+FoSjRTc?=
 =?us-ascii?Q?9uj1ck+mtI6/HdLE+oHS1AikWg88CUTWxE97+EZRocVxgjGhv+IAo6NY0bPc?=
 =?us-ascii?Q?Tm48FZS6d5lP3YHBseN0075D9L9EWvoTUXCvfzk5o5likDa8u+ua7KP6P894?=
 =?us-ascii?Q?wVIF8yIfTC6wE4bjaU5xaJ1RBXZEGt1FPcocOXo3HhkMFTgfEn7oLhz7X+DV?=
 =?us-ascii?Q?oavZ29wb5GzUMXnVnvhORzpWlUx+hsxtEc8EQkHp0vSlBnqvdrDNEv8ucDFq?=
 =?us-ascii?Q?kkm7mRXY+2PNbylxeeJF2ju0EsbJmN9FtMvrfqaSZnkM8Tn9fiKgUn2LQXbi?=
 =?us-ascii?Q?UWlfrj0OwzlTs0YGFDiVQTFjvHXumYmTouJjBiSzqYxo72WP6AmiZz1KFeh7?=
 =?us-ascii?Q?QuS9qACGKEKCvABtEkgIpAgE5tr58ainaOheSWmIXIMPxiXf3rKeMJ2hdCbD?=
 =?us-ascii?Q?qfJnynjIxUUH5XDbc91z+1jHkbW703pfvZ9Epmhkbo4lLIDTkvWEwqiZqK26?=
 =?us-ascii?Q?g3AxvBWwRRld6xVla0hWfeEKior2DKvsUrEndxInMJgPXH+1sLkBK8PvN+Hu?=
 =?us-ascii?Q?by5JqcLfeKYObKRuAlYU5rCrOM22hYFDASO3izzvNogS29K1a/FcCGO7cnoM?=
 =?us-ascii?Q?+ixXAFOY1kcSi+yxEf1y1rpoO+uTceLUiw/joh5rSQc1bWg8X2hSC8ir0cYu?=
 =?us-ascii?Q?G5RdYqr7g9qV6g+4v07SpFwTwANGTvbxCuv6R/0A5pDxWF2ZM8kqD77cJiG3?=
 =?us-ascii?Q?g2kXuPmlYgLR6AeYeT4BHbVIsCldRfYec+WfbUy4opTZiDvvDCCIiaYsuWpb?=
 =?us-ascii?Q?BF+/b4RlMuIA5/kZ9HTTmx9j9CUWjuAqTtGdU1KTV8c4Bi3SbRCO8ZflHf60?=
 =?us-ascii?Q?0KaqvvnBxlr53xCIe4cX+2L/y56qifUilbK6bv94WGx6+wG07209rw5Z9gd+?=
 =?us-ascii?Q?TCv9oFI1CPBsuI0Cn0IrgLmHNau8CI9cIBkxFKb/8om4rsmqUoEj+ApjnXmO?=
 =?us-ascii?Q?TsAVrHDVb0feOf0NnhgwP5T6DLnYLLZArSzCEs6E0TTCd3LyKD0NCPS3CUAP?=
 =?us-ascii?Q?Hc1HyfStUGSqhJNLIqeorqL+nlUWD76tNbiSiYGaSpGTdJJrlwEeAQgJxCgL?=
 =?us-ascii?Q?+pdWo0rkp7PKZP2X6T+ulfhSOwqu1IcMMJvZVI3pG/7ObjcG5NCHU5BChehP?=
 =?us-ascii?Q?2Vsy0zEGn+Ryj9+rqg+qWojf0pSILq4WXKufKHXMxlPx2sHCMoUTwET3nzqv?=
 =?us-ascii?Q?e8BTjsAqPlkipPnDVDY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc48dbb2-215b-47f5-c6dc-08de23b9b488
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 20:09:24.0062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7y6pD1wLEkb35vBxIMMgEetS7vFRlhWzfbPUPmkPZ122NHf2AA2AY6rHODmp23+S7DPkkuEsgfX+yUa7yC9NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_120928_244316_4BDE564E 
X-CRM114-Status: GOOD (  18.40  )
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

On Fri, Nov 14, 2025 at 08:13:55PM +0200, Adrian Hunter wrote:
> Add support for Latency Tolerance Reporting (LTR) for Intel controllers.
>
> Implement PM ->set_latency_tolerance() callback to set LTR register values.
> Also expose LTR register values via debugfs.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Changes in V2:
>
> 	Make use of FIELD_PREP()
> 	Improve handling of values that exceed the maximum
>
>
>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 125 ++++++++++++++++++
>  1 file changed, 125 insertions(+)
>
...
> +static void intel_ltr_expose(struct device *dev)
> +{
> +	dev->power.set_latency_tolerance = intel_ltr_set;
> +	dev_pm_qos_expose_latency_tolerance(dev);
> +}
> +
> +static void intel_ltr_hide(struct device *dev)
> +{
> +	dev_pm_qos_hide_latency_tolerance(dev);
> +	dev->power.set_latency_tolerance = NULL;
> +}
> +
> +static struct dentry *intel_actualize_debugfs_root(bool add)
> +{
> +	static struct dentry *debugfs_root;
> +	static DEFINE_MUTEX(lock);
> +	static int ref_cnt;
> +
> +	guard(mutex)(&lock);
> +
> +	ref_cnt += add ? 1 : -1;
> +
> +	if (ref_cnt) {
> +		if (IS_ERR_OR_NULL(debugfs_root))
> +			debugfs_root = debugfs_create_dir("intel_i3c", NULL);

I think it'd better to create common "i3c" debugfs root. So your device
use debugfs_create_dir(dev_name(&hci->pci->dev), ...) under this common
root.

Frank

...

> +
>  static const struct mipi_i3c_hci_pci_info intel_info = {
>  	.init = intel_i3c_init,
> +	.exit = intel_exit,
>  };
>
>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> --
> 2.51.0
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
