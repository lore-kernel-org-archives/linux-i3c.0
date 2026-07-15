Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8CBC44508
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Jul 2026 16:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3pfGpYPOcVtWRdN0KHloVD7HVf0/FxmgMgyB/6Nqm2g=; b=M5386fTwBqz+YN
	2ep4s1NhMMJjvjxiuWe739bTsjtw/toaT/U5JbcxArCc4NhclQRiniek1aEgR6x5IOCZek9DTSVak
	g233hXXKOW1akcga1SPWK5IYttY+zOZt22hbMCsRt3mRjmuXrEP5LhuWW7JxxiThpcq+6/WLpOajt
	Hc8mAgNxjkBHTOhVGkUPmHYoqxcvmbQCuLPfuu9brsvLTuCSCbbahiIt52BNB7r1pIZB6Rj/RNhdd
	jPh5pOH/+1aiRHLfmEvokepPKpJXIXCXrSCvP0vPbnkimp3wWiOFtVqP+/Y3yfPBP4asDAaVFED5Y
	jwgyMdNJnlkGRZ9k/pVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2v2-0000000FWUO-2Yrs;
	Wed, 15 Jul 2026 16:57:12 +0000
Received: from mail-northeuropeazon11011031.outbound.protection.outlook.com ([52.101.65.31] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2v0-0000000FWSo-2GI3
	for linux-i3c@lists.infradead.org;
	Wed, 15 Jul 2026 16:57:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhGBUFMsjeC9KD5n24mJX9YZoyz55lQEHyRvrqlkuo/9ICq1sw4qykYhal2dnsQXat5+xuKz0KysGfjYG558ZItzLuHHo/7h0Lt9Oiv7Mue7U00GczISm7UtfpmoFKmXFMsERPhcvjA6pwwnlSjuVxITU0eeRAJEfm+ScmRDKabCMVBAqURfBOaDSMGIsYLisuiIuBklpQYkrpXeIGmgSNtEOsZOgPLWOFSVn7jQQKjZbT/g3Yi0jfhor+cXvSAjYA0cOOcaBfGJhw8ORO71A/EBCGLR0bEIIGJtEU5NwisQ0UOaVxUxVn9rgfmFODg14rkvqERlcReOpXnqlJVKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEmUHkMF4m/b75GkI7gZ/3tHjPrR+Rk7TrtOQ3br3Zg=;
 b=MBykiv2oFN46FUWETUTv8nHPX++JBW6jcDxxFcgJ1Tyh0FT4OehZPvb/83BloP1bvbv8Lhmbib5QDYc2XB4+wnLYFAB/5/armi17DIVFUQvT8ZEvWb6GT+2Ios2NceLBEXL1qqI/yOfxqkiMnWr44hc/91jY9nYJFc6KPemElcLKFz4lvcrHwNFwCXKuiS3NowgkHFWJIuZWwJuHI2z8xU0eWlKn8h2DdKDbb+1Ho9XJ1fCASXOrTu8e5y0Tccue3ilDguqWOVJvU4RJ2XOWLyHXczwG/BXuYoQbxvUwZKlrZNXwSvq0YCNSA3cro68S3dG3u/03dCdQpjekcyl0RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEmUHkMF4m/b75GkI7gZ/3tHjPrR+Rk7TrtOQ3br3Zg=;
 b=HaPuymxi0LU8JdofeSLJ8JW8rDvxPYCAXT53zhd7slrXGAhKBeYkV2xoW/SSzPNXKQYJFmRWZtksBKwRxs2FE+jZ1NV08fexAoYCISIpbxF7c3FfTFexH+uuVw91qUzJSNyPG3Vqh9uzJvqTI6cY6wmhGdGb3iMb//OJJLH1rS/NqbnOCxXu85BqQcVFqEmI+M3s4iyIVKgF1G8sL/525n8ISEFjeEKNQuoNjOeXIVb4op66qGZhxynLASY/b0GjB842wW36lLXaePNyTRISGEI90sA2VFZcSw9eKkvGMxSQFP1/dOj67w49KqgDB6FdQ38b8FWeNOF3SDYrKVI0vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB11853.eurprd04.prod.outlook.com (2603:10a6:20b:6f9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 16:57:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 16:57:04 +0000
Date: Wed, 15 Jul 2026 12:56:58 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Can Peng <pengcan@kylinos.cn>
Cc: jorge.marques@analog.com, alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: adi: add OF module alias for autoloading
Message-ID: <ale72nOwPyDeAgho@lizhi-Precision-Tower-5810>
References: <20260715012949.180245-1-pengcan@kylinos.cn>
Content-Disposition: inline
In-Reply-To: <20260715012949.180245-1-pengcan@kylinos.cn>
X-ClientProxiedBy: SN7PR04CA0192.namprd04.prod.outlook.com
 (2603:10b6:806:126::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB11853:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cdcceec-3723-4d30-a2ec-08dee29218f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|19092799006|366016|1800799024|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qujbsmNLEF+xZZXD4p55G7vBzyvCn9bEXK59G++jtZm8zmyU9qZVuO0UWDms0v/ddMfkXqaILyybBiRKtaHxFEYjgzqzNL8KuCldI0Kk8LPWZRMgR2uv/7G8Os8z6hTySu/Ksw/X+uxa5U3ynOJUkaReS0cKLL7CoL/ovLbJdvHszErAFksMf+P9fdzh9My5nhs2cVz3u+kJzjR3Chor1gS4CfA5EM2Pk39VcjAZVZVb8cDUm3GMstY8VYXBoO2yx6P/2BW8pee3RAYCIyEGp93zT1CTq7gL8EQ3DlwyZBuixZUewPxlnKHEVD3E9FGjSXM3KrDeTC4ceD4YXuvRQP90qEnfJkLoL8Xc2z+03Py27zHtmtpJwj8//Zda4Ad1wnTndCqRto7Zzh6czbgLUfLyIIezNpDVJqjht56fz7GrKBW5Gegemv0xrAqdccSaijQHOU5aEGADaXbtxbHfVSjjg0wIzb8LpnwiPt8WjYhiiHzMkxDKP+e0p4ZJlRXzEmsPOvRlYsNUiQBetBFmIqlUtCKQl8/iNFYjd0lIZYJ9zhUJp8QfgYqTqi0xNf9bwLy2tL2WniwAGRQM0xKs9Gi6J0C1LyxiXO73shcr1Mv7nMLW5cP14DDjMWX1ddnfsjPg1lNigsHq1axjxnaoHWjXf1xgqLNXPxsRo1+tHL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(366016)(1800799024)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?evQmPaumR7YmRFULMFwrchHrVdlCzzLicoG5yW6t5xF294OS+3G9VvyoXnv3?=
 =?us-ascii?Q?BqkfG9Q2Ob0rlzojIBWeD8No3PqlmlQg9ypGATz86Ezqbb/+DbcJzNh/v4Xm?=
 =?us-ascii?Q?WP63zNbGBTbMXCUxRL5Q3Yx0WnaosGsNlg6fPGGvQwgC9FlauXlM+1RVUuFn?=
 =?us-ascii?Q?C4OEuUf0mYNCVQ99WLmkKkyy4N2nqfY7Ais+NMD6NVvzLbCww1eV2TKZ/3UK?=
 =?us-ascii?Q?etK9+C4BhHNMuOFgb2S8GZ14qp3T8vj9SIXOD3yxGhIp0gfvApR1RMvpREMO?=
 =?us-ascii?Q?OPPMvAi0kiEo3MBGx0QEE8zGS9uQh4bQvWrr+oX9M65fcNHza2+JWHPnMhtv?=
 =?us-ascii?Q?oKli3bSvkHjVBQ9x8TLUM1Dmeyg/oozfslunYSQHOadMqfLKRJ3vjnu2Sl5T?=
 =?us-ascii?Q?6VqkEDvRdT624qJYQfW6DwQrryv+9YkarO3T4bpvNQ+M2MeloU9kkPtpvFf3?=
 =?us-ascii?Q?wAe47X7AkjO2JXtu7Mg/FZoIH0oXiAvHNS2fgm+8ksXF0WbH+QlqMKm9NfBX?=
 =?us-ascii?Q?507yZyo5spYN1LcYlmx9fEsdUutD1+a4IYzJglnYP48YZvjsAlp1/DzsNcXB?=
 =?us-ascii?Q?Na8gA5Z1Nr/gc9AYTcO66rOL7u0/GZs7troBQeclIt9Cy6sOO5JCrjpKv4s2?=
 =?us-ascii?Q?g/4CPFeqIIivKH1/po+mU+7j+cbRXtzCQuMiU21v2Owf34fTNNbnquizvehZ?=
 =?us-ascii?Q?4JpvhIGMr3RmHxnWgtkeTe+2fUqokBbZganz/WYNMSeR9iXe3G/+ZuU6sGbK?=
 =?us-ascii?Q?zuAiSKLPguBhSvNfyFT4pht3WSVOAxV3Ia1tGeZprQNIf6gMZtcGitwXvqxF?=
 =?us-ascii?Q?YMeWASABdpY0K7+or+XmhSsVa5DN3MCSuqSRjWDQi79iinnR6Qr8Ke30m4R8?=
 =?us-ascii?Q?cLL5LdbDqwy/PPYzbD/sJVhAggXrqlDkWUi7lobYDephfjCF9LZRgICOATHV?=
 =?us-ascii?Q?1usTH7DwKQc8fqAaqIgD5s5XbK35tV5xphnjF2X8BpPFV5nzZWvnvHWmswH0?=
 =?us-ascii?Q?DBtJidZGcYnbEbzrZr11CpZtCDGPWxrzfWt5cxJRHgPxhn/jVryswU7WHMV5?=
 =?us-ascii?Q?cC1EvywCjocLvsFK8PlrgM0WPLfeQEMOE69NgjWpwELpixNJxZVltcGJLCFA?=
 =?us-ascii?Q?jQETs5CRQZvM34ipdO+MSUJoiVxyeOT/gVTKtQDzsQFXBCGR2no/ox9QId//?=
 =?us-ascii?Q?3qI/x8jIR0U3ugU/7Bkcibb3ku9QNIKSSRdT6DGNArFzBGRkVMf44osXy2r5?=
 =?us-ascii?Q?5/MsZCxLHD3mz5JRF3nVPXXr0+Ffy6RH5RDDgtc86uSyfF4hZfVa4zFVQsdH?=
 =?us-ascii?Q?hmaEgHUMz+hqP0mI8sHBKtXo1KaxNhZtMdjm2uGocM6vkzUw5mQXabo29lai?=
 =?us-ascii?Q?I7ITM+s0OeRRbc6DeieuZtZJQyjCSYgvAc6yeeaCu1WiKxmD5V8+9BFpxCTC?=
 =?us-ascii?Q?ktrvMEb2snfGCWW1V34TGNIKVYgZNoGkbA66tsXXasyKRH8Zid0d3UzWpKrO?=
 =?us-ascii?Q?L2D3PWb0jTDsOAAL+WlmksLGENh1zAVhOQQLuru8mGnPyW39sYhGX5tlAn4v?=
 =?us-ascii?Q?3jsId4/3kvJ3ubN8Cy6Qmk35pH1+d53wrdUBkm4Eeh5HXKyDh9S8X0PhsiMz?=
 =?us-ascii?Q?LIiRJx0wY7f4LLEhxrghs/cA89zmu4JsmhPg8AnIjV2kN8WtjSVJKPEc0oAR?=
 =?us-ascii?Q?Xu1EFRMmIX+bClB1IFKjXsij3sjuQGiVcivrYQxLaQriK0VNR1IFmnelMXeY?=
 =?us-ascii?Q?kPWqcOLdUwtv7XaevWDi1DOttBSO/OEzdDS3xdDeaVj1zVU79hYK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cdcceec-3723-4d30-a2ec-08dee29218f1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 16:57:04.6641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFv+8nwKwQAZnmRV8D02RCPLjaYgn8p6z1ZFZ3tsuSqD+aNolW8XjYG3CsQ6ocIiruJxiGC94Q/RNhiJ0QI6RlaAJJuECBvLdUXvxB8ujA9E75hCRar4qO3g5634lbBk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11853
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_095710_579730_1C5EF3BF 
X-CRM114-Status: GOOD (  15.68  )
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

On Wed, Jul 15, 2026 at 09:29:49AM +0800, Can Peng wrote:
> The Analog Devices I3C master driver can be built as a module and uses
> adi_i3c_master_of_match as its OF match table, but the table is not
> exported for module alias generation.
>
> Add the MODULE_DEVICE_TABLE(of, ...) entry so modpost can generate OF
> module aliases for OF based module autoloading.
>
> Fixes: a79ac2cdc91d ("i3c: master: Add driver for Analog Devices I3C Controller IP")
> Signed-off-by: Can Peng <pengcan@kylinos.cn>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/adi-i3c-master.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> index e29aac286957..fb4cfc9026cc 100644
> --- a/drivers/i3c/master/adi-i3c-master.c
> +++ b/drivers/i3c/master/adi-i3c-master.c
> @@ -929,6 +929,7 @@ static const struct of_device_id adi_i3c_master_of_match[] = {
>  	{ .compatible = "adi,i3c-master-v1" },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, adi_i3c_master_of_match);
>
>  static int adi_i3c_master_probe(struct platform_device *pdev)
>  {
> --
> 2.53.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
