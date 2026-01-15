Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78406D44C73
	for <linux-i3c@archiver.kernel.org>; Thu, 15 Jan 2026 16:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryijZhjZEMgzLtb3NcxWF5DawsdAys1JqhKnTTv2v00=; b=t2vVQMGgiS0eVv
	bF7IMLj6riE97NwfVhzJsOSVYl8vI/NxgEMQrtGvqBdwIcXWxbBnxAmqjHHQwrD1M3hCj0S5MyzU/
	6zoYYW+9aMM0hfBTO0UF619G01gmNpmG+h1jTVVuw895mt8niDIXbufd+8UR2zxSVm0u8ZfNV3XVT
	/N6De7wJnGqZCosrke7JoDacfumklZgTzQ0VJ+UGKgfgDfvQfJvEAJdZY7W4bqcgldo9vk3dBQ9OJ
	5vhFKfCqMAJuV4AaB873bjwHvNmF54q3l8W6meQbZUb/2jY01uJWw4uhMzXe/FTWgqa5ji4TM8V70
	+NKkDMXg9EHslxeuas5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQQa-0000000CnYM-0mXC;
	Thu, 15 Jan 2026 16:42:32 +0000
Received: from mail-northeuropeazon11011024.outbound.protection.outlook.com ([52.101.65.24] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQQW-0000000CnXP-0cmM
	for linux-i3c@lists.infradead.org;
	Thu, 15 Jan 2026 16:42:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8Y9E+Jnok4z3zsj57R/gB6+WYzmyl3LIOrwYVvrcARsT6XII9zC+TezdTo3ASiaL2VJdpnr+47r/vTGBGaU6aXYrUtG2TibfcyMXF5O8a7g2bklgyLGwMUmmdfqR6GZQclCPPXz+mcIGPevfYwKhM+RZy6fmKWSfJhIsruqbu/9MFVzlmHc85Babc6nSazwkrKXhkgHD4lItBlJw8t5PKB8xES9OmdsR+wuCchWuL1uGfpNtffH0zZsmemV+KpNKIr68UnTq5HipZkQh9ZBxkzIDPbCHSc3+wyct2jzWlILqvuGJu5k1NBxwpiMtZSI5NbiHWrlsZK+GBUbMLwFvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qi6ROrSWxSvIltdfBsC7t4zjysu43XtSvL30csOdDmU=;
 b=P2unpVqiKEG/PN4/56C9br2YaBWGeUyP/RiB1b+gHE/ejCjXIy+Gnh/PKevMYfwb6oRgWttHjCru7W4acaHSeNMbRxpTPiUqsQ6o2Lxr0kplj936nSZKAqZhzO7W0yKjQ4t3ByLNWLuaeJTaurjxS4/6X1lbLreFFNph6GFiX9gTPdHFdUENiD7fziwIywtgdhEHOhsy1S+x/wuuY1BOsocYCCrAfX4Y6p+QoGUIVk1y+5aLg0Kroy47GivL7FhU+hY78vnX2YLcNOifFvb5FrP8Zu/y3672mhjlkdbMdx1rx8MRl6vE3SX7ti8rB3cOmJc6T3yTK4BWmnW9J5G6nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qi6ROrSWxSvIltdfBsC7t4zjysu43XtSvL30csOdDmU=;
 b=Qm5VSE8m1C6tY+4EoEYmd6C6G8EE2RNigdaPmnNrTFtmPU8jUbCbVae68EyaSBZrSlNH40H9ZXyp0F35QU0gqMRrm3hMpNoH6Xmz9m1fbRP7MAS84J+EQkc1FldysvCXx1RMqgI3tC+ZASXjsZZCHOU4VgDIqKnfJo5xxSb7aEE4LeaTe6UYE9u8iVNg/jtZQWKTj0izeJ5YEM9K37NoFyYNAdUMav2j3tUtDCrzE/z1T6ci9jwWS/vLvwZTcDuAMjzQDaFnmlWu8L7q9fe4lbVU88Sv/rjfcPnSkqzOx8K9l0V5mbZpRdPDHROgNGA0oYg9OlVoM1qP2k2nC5Jc5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 by AM0PR04MB11931.eurprd04.prod.outlook.com (2603:10a6:20b:6fd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 16:42:19 +0000
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e]) by AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e%4]) with mapi id 15.20.9499.002; Thu, 15 Jan 2026
 16:42:19 +0000
Date: Thu, 15 Jan 2026 11:42:12 -0500
From: Frank Li <Frank.li@nxp.com>
To: Fredrik Markstrom <fredrik.markstrom@est.tech>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Joel Stanley <joel@jms.id.au>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jani Nurminen <jani.nurminen@windriver.com>,
	Ivar Holmqvist <ivar.holmqvist@est.tech>
Subject: Re: [PATCH] i3c: dw: Initialize spinlock to avoid upsetting lockdep
Message-ID: <aWkY5LCmhcTh+qN0@lizhi-Precision-Tower-5810>
References: <20260115-i3c_dw_initialize_spinlock-v1-1-b9c5bfa8be24@est.tech>
Content-Disposition: inline
In-Reply-To: <20260115-i3c_dw_initialize_spinlock-v1-1-b9c5bfa8be24@est.tech>
X-ClientProxiedBy: PH7P223CA0002.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::28) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8948:EE_|AM0PR04MB11931:EE_
X-MS-Office365-Filtering-Correlation-Id: d7f3bd31-1297-4563-041f-08de54550c70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KiVGf14hYNFWu5ePbzcWX29OKjMVbT3xyRER640ys79Q9G96hHW80bM2y94S?=
 =?us-ascii?Q?yoYimUhi1YniGT5GVHmQQHZgnGANaUJBMJl5K07ArZ6f5UH9maimVQL00J3d?=
 =?us-ascii?Q?t6F1rDn53qKB1gbjjMkiKtcBFWzUgKnC+qeZv5YCAcT7ZD4/4bVJU6vKgXXR?=
 =?us-ascii?Q?VJjDEuGwNZzgLmy6JG66e+Wm27QrAWkwNeI3PkpHBJSo6eHdCYf3c2xfl3Yy?=
 =?us-ascii?Q?wlqOz24QqHVOVnDb8fQafLhS1+/xFGryqA9Kd3W4MU668MSQjklSk1gjODzK?=
 =?us-ascii?Q?07XMzPhxjMxz7Mc5y7l2Dp4eJ250+eDRJQkEjmG2n/gnDxzMphI5vsT+T7nw?=
 =?us-ascii?Q?7fducIsCyxkYWwZguvqRNH/LDOZ7K36xAEIMRX5hTeBBoerAkqJw/w8VVyT7?=
 =?us-ascii?Q?u5y6e9p9ARaMAWgVHTQRDd2h6KR6YVARhcRdO4Wy83/nZwjnO9SBZjWBIxtz?=
 =?us-ascii?Q?ZZWMF9oNso8isystJmKVR5tbJGHwqHLyvgb/hNXTa55YZQql5ztVi+DOdVn4?=
 =?us-ascii?Q?Id+ZFor5tk6P+fX/0tcth92QOf8PlrHTsq2n+melGuR9NtK9BcJhqNZ2781K?=
 =?us-ascii?Q?dlJF4O1NchUXR/xUQ+VQNNlAxQIiKY1qfC5DMJ8s8OhehB9s80bCzPekP6JP?=
 =?us-ascii?Q?5tFORQ1JzosnkBKOuMVAw7IL+iEKnWyl46Krkf2hNek9B4VdVStzAv8DllxG?=
 =?us-ascii?Q?xsxhKMrd3/XkhjQ6Up6k+yLIBsaec4NwU2TlVkYbddBIgpGkCVJ8HQ1H82v7?=
 =?us-ascii?Q?YNapTdjVYUB1LH4DvzCyns4nEMX0+1IgBLn0U1a291+FCbHLpex0otgAAIH2?=
 =?us-ascii?Q?XmcZJIK9fc7LfmuQ8y89iMVPmsl3qD0rUtRGMEgs8ny6f9FGYJF3S/Pqr2Z6?=
 =?us-ascii?Q?4NXqf+os6LHrYYGxCDP6lLWN5JULS2Vag/GVJKP2WfS0rirK8YuXIZUzMeUi?=
 =?us-ascii?Q?BZ7W03NdXcnhI2LtjAu0RPJHU2WyQzCiSzI1ZSDdPrlRIelXcq4cTUiDdbMX?=
 =?us-ascii?Q?/uMzkAxcJY8WwGWqH3yB3kIym2nJxZqU6waqMe05bhknrwYlJn+LHXbFXgbk?=
 =?us-ascii?Q?tk1T7ptowgFlskCdPKjkG254LImUk6f8IpDNwS+pZbavH5WvhMCe1Ipa68EJ?=
 =?us-ascii?Q?UMzX75rzzkIIJXvwPpdgAeLKCuSUT2wi5xkyDXdlDuADJ0tL9x43NOo5wrXL?=
 =?us-ascii?Q?WM3pkfJWfJZSzLVwLoyOHDw2VwTXz7DWg5BP6E6bqOHzqDoRESdB13pX5awl?=
 =?us-ascii?Q?Qqib68wICXeQf/PADoB8eMwDGIMyB6wDQVRheelcb4mp3J87f4PEJRFtEb4a?=
 =?us-ascii?Q?3743BkUq/nhczScYTnONOjNgn5lPKBsiaucST5leNwyG0nf+Pp4g3/435T+B?=
 =?us-ascii?Q?Bc18NEA7vwf4V5FSWf48pL5tAzFqrlZfcjYh/IIxBe1W8BmbrfFc00h7EzJ2?=
 =?us-ascii?Q?HEIKk4OOU8WmGOm8OgHE2yXI+TKFv1x6wdMcIsRmqcATqVEQhv8i3NV44OoQ?=
 =?us-ascii?Q?ZlA62wlIyki7CCifR6YHAPqFBL6YBgAngLss7k1Lm47W/ReVLcLkh2WTrVH4?=
 =?us-ascii?Q?m8a5axofTnWsO9xTdUfJuSfju8lmrtbrG3lIvcU1S+wFqWik7OJXjSaDf3eW?=
 =?us-ascii?Q?ZWYS6nwnLR8ISZHnPqMTFQE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8948.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cN+3nFXahHmX/ChEAF9KEjQgc/W2b1gG2sXENEA4luKosKHEoBjZt7tUra2q?=
 =?us-ascii?Q?UoVCfA4GYMtqt3mtaioUXQ1Tdu/qryGsGwHdLU6GI2NE8JqYR1rtrJmLbNk8?=
 =?us-ascii?Q?VL4CLY/EhHkEae2iZ60K5A9xR3sAQDxkQtW5gnDe9rdfO4Lvu3H4+y52oxKL?=
 =?us-ascii?Q?aORTEGf/v9xuUatDZAbPR/lrXF/rVlWHpAdJtDiByiXtzZfekwOgIeHZRLzl?=
 =?us-ascii?Q?8r24QUomvzzo8Lo6zmD1qqKWQ3FxZC8CCGvEdW6b2c/2jDlP5v3ljuHQYh60?=
 =?us-ascii?Q?b4Fca6I1EVMCW7u92rkvS3JhSeQYZ18OQnkMFaTfCfa95cNhyJmmHgaVOA6K?=
 =?us-ascii?Q?Lb0S6s5ER0pf58WM28EqYv/SNfHKmLczqLjDoMJ/h0ThD9JOnRNHtHXl/TNP?=
 =?us-ascii?Q?estNOyoTlrio4xheXuy6+5k3qpWn7iRvvHR00VU9pRRTnqGcHzV4X5f3C85V?=
 =?us-ascii?Q?vQ7kfqhfMtOKekSwc4ydBVcr3/Ej6/duq83VOjuXM3eWbKsyBCbLpUOBHjc2?=
 =?us-ascii?Q?XeAKIpn8kt+nkbKgs5iyjeHAehu4Hs0C1ldA4qONnj+1d/GYG+vrlWsYte0F?=
 =?us-ascii?Q?dOJnmVz9hBjo71/UDb/URkPGxQ5e3GhlHAHNifSaTKJLib9st7k+rFUVj0DG?=
 =?us-ascii?Q?rv/lGLpJUEZ+CneT37/C3CYZ6F5jWjoQPLnQh7HJPobfij4HQnxKfXfETXZ2?=
 =?us-ascii?Q?IhxZ9GT4YupzvfOlskY+10omQ403MlZvwZnG+iOIeCZyJoha45RSapoN55iY?=
 =?us-ascii?Q?bk4/3rBFar2kX+Man3/Jyrw4IOF0migFP62ttbh18Bkw5LO52y1JB7CGEZ3z?=
 =?us-ascii?Q?kR+MFSxbOtwk59X+AUrY8OgA8Qk4OavWNk7cT8rbmiMTkcSiDbRQSomBWfKa?=
 =?us-ascii?Q?m/HkoA8CPkVcVr6RO7TRoCxVRLiV4Wi7haIUSW+8I0BxXID0jDXebbSvNvYA?=
 =?us-ascii?Q?Vdsd1nBCY74lCxJj3NrCX4t6c73I247qvoOhPMLNqSbhK8YebIO7V+agg1Pi?=
 =?us-ascii?Q?qZNfXpyzAHzDTGi087SQT/LmgXzwrKezaAUIIdghtcl1pXuP2jZeOgvxfyvn?=
 =?us-ascii?Q?j03tXEY1cgMqU6UIA3vJkNMJETSZHydNB4Ik3+6S7rClmqAo/nVgiWbMBiEi?=
 =?us-ascii?Q?PqokOPRwu+oMfQbiZu3JZFTqi7aTduoZ2vLqARmwCGW3ZtyCnUniMQmJ1NzK?=
 =?us-ascii?Q?dUc2nlsedkl8J8gZSBwPQGXF0LgSBcgOZtVUtBSynA39m1DVgjl1UYo4eR2u?=
 =?us-ascii?Q?HJx57TQzVSUC9Qb85ht1b0wrYVK3ZeByYzk466Mw2VBv2hKhoWyp6NguxQPb?=
 =?us-ascii?Q?irmUs4JrLlh7U5SlgRw/j6gd3mAACovp1ROJ7KtV9rkXpnmia1sy0WofUkP4?=
 =?us-ascii?Q?maVreLKlNxt0EoZKpjFBFgymkXjl673xNDJflk62B8FGEc9z7SuifI8cM2vv?=
 =?us-ascii?Q?+v0GIgFeZMT/8bvsFub9db2ExKd2bnXd9RuPP86d83wCHvjOZf1Jx+K3ubEj?=
 =?us-ascii?Q?zQf1+DkQ/RpOMAuKjnBJcA7I89VZESsDGAhOYODMJGoF7IBII4ACNTOwrYdt?=
 =?us-ascii?Q?E5yBzSAHQGAafxEPETjxi9iFmI1NJLeejAvCAQZXapzbDWAxgFqQdsSYZbTJ?=
 =?us-ascii?Q?FVfnhONALjDgshZ0ynChQTVg2PMi1vGlLC1VRjMrs43ceqas4n8Bsn3gs1IG?=
 =?us-ascii?Q?r+CsKbufttMeC34QrdWCgtKuI4msAQqqEQWJFi5LblyRWqtq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f3bd31-1297-4563-041f-08de54550c70
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 16:42:19.1948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APB9aIY3iaN1lFirWV8NIVVagnj9OQSWRPTsMPqR9NQvfHUUQXSLFret60rlXm1Rw814/7XoWsTo9zEU/+IuyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11931
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_084228_190070_EB6DFB2B 
X-CRM114-Status: GOOD (  13.24  )
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

On Thu, Jan 15, 2026 at 02:25:29PM +0100, Fredrik Markstrom wrote:

Need context here. You can duplicate subject.

Initialize spinlock to avoid upsetting lockdep.

Frank

> Fixes: e389b1d72a624 ("i3c: dw: Add support for in-band interrupts")
> Suggested-by: Jani Nurminen <jani.nurminen@windriver.com>
> Signed-off-by: Fredrik Markstrom <fredrik.markstrom@est.tech>
> Reviewed-by: Ivar Holmqvist <ivar.holmqvist@est.tech>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 889e2ed5bc83..d5b070404056 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1570,6 +1570,8 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  	spin_lock_init(&master->xferqueue.lock);
>  	INIT_LIST_HEAD(&master->xferqueue.list);
>
> +	spin_lock_init(&master->devs_lock);
> +
>  	writel(INTR_ALL, master->regs + INTR_STATUS);
>  	irq = platform_get_irq(pdev, 0);
>  	ret = devm_request_irq(&pdev->dev, irq,
>
> ---
> base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
> change-id: 20260115-i3c_dw_initialize_spinlock-d878212a846b
>
> Best regards,
> --
> Fredrik Markstrom <fredrik.markstrom@est.tech>
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
