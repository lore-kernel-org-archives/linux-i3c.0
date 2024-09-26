Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2275DCDE025
	for <linux-i3c@archiver.kernel.org>; Thu, 26 Sep 2024 16:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xw1YPbJ5aQL/7ZVRyUnbUHxepAJ5W5ZJtE6wbBXqqR4=; b=SHLGXV59kfotcN
	4+JzcdojNP1L2qLgOmuFpHTU1oCyz/t4OO9KJgcfwAVdc9rPlbmW6JmzeB/FH1V7XifMkduzb6Prk
	/IHbqT+kkMw6LkCQaTrM9wxWO2pveXVzD6vBiNovX6pfvg7ZJJz6r+nTbLXNHT0V0LUN8eJUbCb4o
	ZEdaDs3aZC5SaqbzKleLDvF1sLcB6auOWEMQcQtD6vXNvfPyNey9M0Q60+5IY4wrNDIasNbt4Y20g
	GsSnGLrq8n2jdUCxl+ns+8oRx95A4vsNpyGKSc8fHL4bsayPhCCulo2QnC6lfZfMoINBzo0JKFe7L
	XjWamR3Aq6fj0KbpGDfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1strl2-00000008wSH-1Sz1;
	Thu, 26 Sep 2024 16:54:24 +0000
Received: from mail-am7eur03on20601.outbound.protection.outlook.com ([2a01:111:f403:260e::601] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1strkx-00000008wRY-2aYB
	for linux-i3c@lists.infradead.org;
	Thu, 26 Sep 2024 16:54:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HkqtNk9KoEKfHcObnA5DZapZztV/yPG31r28jEc7yzT+LnM30kGq8ZJSbeQiiL4IeZXjJcBQFeSAilADE9Ry4SBXgUwYmWYJYE8xmDYEwyuwmaYFPkzVNzVXMkzMTb2UMj9m70wFEnA/jY/Ew5RPMBCtLl6FRW2QUDeRxyQCNXacMF2YEQmHx4j/vnNzsyV9P+cmOeUFaUUlWBcLHtv01s7PmBzn5ZymOPfAUjkZ6HVXOiU5OG94jIIb0zjK9LHG8C4ud9U/ve55Xd2ijjFW5HqHKK47LW6C26HMWgdimKenJE+LGiSnXz3eZ3AEv+QDQKwr5d22CuM1SriMew4Xpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUtldwz4uxdxNHmHn06LVJZpvxTGo8gF2Neay+MkPEw=;
 b=qnT7SohteIxF+adTw5jKMiJS3MTZBaxJ+m1WPZ3m5KKk8pcAsEDDbnWQI2yTUR7o46utHYutxS7c5tmdiNKXV9tnIx0evERQ7/TLBGUsUKiat0UtbfyehN+2cS8oy7M/hPPtJQqaz4WvZS2d427M6gMsbdgECSxDwSKxXaoWinHL+3fY4XdHkoqIAJfi8wMmp1wMU7Nfmd2aCUvoJxDm5hyUAVm/vGsJV8Vwblxct9tyMyj5onz55o0Iter0+rioPo7OxYPAn7DO1o5m/K1D39r9rPN2iyTkT9AVFE7NtahCrOJKZkAM0ZshNmjd1wdcI/1DGmrde0srk5fyPiwHcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUtldwz4uxdxNHmHn06LVJZpvxTGo8gF2Neay+MkPEw=;
 b=hmk01pP1PjTpsVzZWoGEZRZgKkQ/d9eQ1g6RcEOkHaJbdLwZb9+hS+yTJERC+T4fQJzj5oG4UFaz07McQBX+y8JNwFzZqPTyAYUF8OFbuQpbvH2ZQew39+dBvSDJiK2fVuMgD0gVdvPWHGyCgBix0+Zdj/nOy5XdaPLvFBj00n5DAT2p4ko/+6kPo7aOy4LX5iDeNZb6Lb09bfd//YrXtGtACFrThLiWSHryeHEsab/Z37F7qB6THfCiN1FBY81CGMvzPJahjnIG60XrIqpGIe9AmN1HCwTfO2XD7w5+vJvVP1lqhZAQ25K22xYAQ0mmfiCR+LiTxGPrnPbIxPZnTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8191.eurprd04.prod.outlook.com (2603:10a6:102:1c4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20; Thu, 26 Sep
 2024 16:54:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 16:54:09 +0000
Date: Thu, 26 Sep 2024 12:53:59 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
	alexandre.belloni@bootlin.com, jun.li@nxp.com,
	xiaoning.wang@nxp.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: master: svc: Fix pm_runtime_set_suspended() with
 runtime pm enabled
Message-ID: <ZvWRp1Bs5XP+mVOx@lizhi-Precision-Tower-5810>
References: <20240923034122.3007984-1-ruanjinjie@huawei.com>
Content-Disposition: inline
In-Reply-To: <20240923034122.3007984-1-ruanjinjie@huawei.com>
X-ClientProxiedBy: SJ0PR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:332::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8191:EE_
X-MS-Office365-Filtering-Correlation-Id: cf3ae8da-ec0d-46e3-4720-08dcde4bd6c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0qDMGB4/BHAIw65+0afEA844CqIquqwspMg4LdNYd+MiMXFUaP3jRcbYZ0EH?=
 =?us-ascii?Q?16QnKYruuRfoSRuURCVR+0cGv73muX3mUMLxsbgaMUwyklHSJ6xx+9ec266f?=
 =?us-ascii?Q?aNtOcYtzNLviTM4l2JCYFd+dHsYkpOXxLMPUmrxMJzVoW3WNQy/59d6FiFsV?=
 =?us-ascii?Q?/rut9BjGVwm7itMANm7V/1wLRfG0+Q1nuncQPc0O/ThuLwz/HjlszCa0MSq/?=
 =?us-ascii?Q?jri07hDOX8wBSQmZb7qhOx3cvUkOGPBvFb6jKVPDpq0jzTCZfGlCf9q5QLCJ?=
 =?us-ascii?Q?xULstxMCAEqO0D9Xbs/DRQwNrq+Mx4Uj0da/AdhCIs8tlum3x2ZybAppe/fG?=
 =?us-ascii?Q?CH9ac5Y31Jj6S6+mNNAROlOfn0e0cLOc7sibvRDtOYM3xiI0Kozq2ckOE5+W?=
 =?us-ascii?Q?p6Iuz1QNCKXFOfmr0ZINlc1E1dYrK8eXyE/da9O6IFSS4ug37vf2RWwhB6GD?=
 =?us-ascii?Q?2+Zrl235b6NZ31dYqF3WKL4GRhxkRVCDeb9TlYXAfh9oko6zRwKcLAlkawwZ?=
 =?us-ascii?Q?jlslvkwNbfzD1thVldPEJGse9YwJYr3+xA1cFDWQOCIhowPFWcb40kLuBA07?=
 =?us-ascii?Q?ckYTGHZ2GpapG4ninYV55xoOoj/cidByDsubKsuBnG2MJ+uqYJZe6XF/4ACQ?=
 =?us-ascii?Q?oG96Bmga32KSgW4d9sE9mcjBi8Tz9fbhlwxmtCfCF+FuGavJbYPjiD3WEPnf?=
 =?us-ascii?Q?qgi6uIrrtqqsGFQuwYL444jp0BNn1S3dhHFdO2fITRmXMJRQ1EhouXy7GW94?=
 =?us-ascii?Q?S67l9IrXwqHT2uMsrJDzMrP3j3xbNphxGz+j0aUATLyUv1oUgtd+asHGih8c?=
 =?us-ascii?Q?Wedb/rc5yOSywvecqYAp7aJLve59HVGB9TSxlmNlF+/92dYmJ2wYIFoO7TFp?=
 =?us-ascii?Q?wdDsIpG0Ztrq36EeFVKBnYXL8fS+tzQOSHduOhu39bD/0TUToms8eQpS+eX5?=
 =?us-ascii?Q?/MblKHrzXgPlh6/TrAPtkMwGJZgDuoJqgagFwTKo6AonYmjMSYs0f7REWQcw?=
 =?us-ascii?Q?wY0e7Bnu5MSrOTzfV0UQmjXkl24GcNfd92UEeMWIYLd/36DOdlCsA0yI4inY?=
 =?us-ascii?Q?kXSR7/Wp1nIoOs05GMtN6ABMmSiHZrYKuexWfIqG5ZaQ0GrOdltr4OFKfctJ?=
 =?us-ascii?Q?Csp3mSCjW5mzjSwz7ZKPNVB8Dn+uZelAuP02ywewTs+61w7GNa05mxYJISw8?=
 =?us-ascii?Q?GEaHa0n78UhXJf1OjoS+/kRiPT/S9VqgvXAWg2ws+4Qj2rOsxJVhhS2ZjCt3?=
 =?us-ascii?Q?rGxbRweS0f57QsHb3ZA0ApvOzSHxPOBpG8l97sVB3kMtIY1smpaJWR+i0qBt?=
 =?us-ascii?Q?5Tcjo/h3dfVxbsXctepoduK7E2joUlie3YO+Ta9rAEdUhg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UmQQd7bYUUNdqJ3RV+IL2T0zsgFQtYs7I048sL+2HNfaxPAImyMEJAt7onJ4?=
 =?us-ascii?Q?9CBZ5Hzrr4TOYNf8vcy9P/Bf8wrTavpD9E/aKBy2XshPJPMIEerHSu3jTumU?=
 =?us-ascii?Q?EwKBPM2ZGqUAdchAeheptXl1c97HAsZc6l35jP8Q81QhXCkDz6nFjhP/YVra?=
 =?us-ascii?Q?dHoMP4TkRQy6yy0Ni/1Vkc0bZQBz/Aexab98c7ZdxrLDRvGKGJv35cqiWZqT?=
 =?us-ascii?Q?OeokZuNKVGBE370GzU8U0FuBWAYk4MELfXziIppE5n7RsOuyFqvmS4H6uw/L?=
 =?us-ascii?Q?mamJwZR5hhO+W/yvu7xxUNfpbJxfEc83FFIP/Wznmkpg6n1uqa3yt9m3ol/d?=
 =?us-ascii?Q?/56OzgtW/LDxeybJ+qlTm59OJXWPM89+Iyawj+CY3F4MfmjR6xRtEKlUlA96?=
 =?us-ascii?Q?jOcnJAkHKCvK2jdh1VTG6Uenkz2YZFB/KLqWcCb4s7thkO4No4W+PpIdAL4f?=
 =?us-ascii?Q?V2me7StYRNxZX7fF75oeqsnTeTATp0J8dkdd+XaAuOGV5hECpuVdcd64zJMI?=
 =?us-ascii?Q?8NgDI+lR66wXyI5Fw0MnSEJkWk2Fpn+cejEooryNxXBdixQnXDgdDLN08Ree?=
 =?us-ascii?Q?BYi15cvvNceJ0PjliLKMCus5AktauF8uOEmkim8DH/iPlNO/fNtG3n5EzQJT?=
 =?us-ascii?Q?e+wpMpj14O46xBgLtnYbtkBdVqovsCS7drmHPUGfjvxTszLwUlslRFnr0eze?=
 =?us-ascii?Q?S7LKJsNjNGGtHF4ODkeExh+ASzx+YF7dj3JH3UkBpIz66Wi/bQu6mOEtHyZC?=
 =?us-ascii?Q?8NrSexWUr1bC+Olc71EkFoGGKf2hj99Uf4Uosh7djuWweq1Fx128x6p62ySl?=
 =?us-ascii?Q?Yx0JWI2S691Wbv5Gx8gD5TMYNWIfCL3wAaG/PPTQmo06UMBbbWcBEycRZQ7/?=
 =?us-ascii?Q?9tGaZ3uqK9rueFO6/XkZ0OnxuGsWP0vM2WttHhgTu5yfHCJLR/KEroL8R0xR?=
 =?us-ascii?Q?9Fnsv5d9xg1gtGiW8T7+3aPBcezNICsxaCLw1jLioJ4hjzoKJCBc3LNo5G9f?=
 =?us-ascii?Q?9RwoPmm6yJ+8z8sRAuiw6tTXCTe4Ml0zMdphui+sWPbiEKPeq2BxzEFdYpMP?=
 =?us-ascii?Q?A+d0beCr8/L60OA5JYhpUr94NwyTt9IsAmdEEb7/pqZ94HDl3RvYKbZJFkJ0?=
 =?us-ascii?Q?WugausS6tUCDtlucQLsNXgBlIgRhuUKHt0Ow3+evLYYN6uWOC1XdDJUkaQRo?=
 =?us-ascii?Q?aHm9AYcWMHfyESJlDYa4my/SQfWJGcQ1y6TBjtIquQNk9wHS+wgMu6mqFzxu?=
 =?us-ascii?Q?oSi78Ncs7tOjrcjyAETd4gxUAWMhrRbLRIckh39W0M+sGNKSXcyQbNkRAlOi?=
 =?us-ascii?Q?a4zKS0j9bfzq4Ln1g4CAL5R2XJJlU06mhHJVZQd9w4ZHTiH45bPwT/K73kbU?=
 =?us-ascii?Q?P1zur+X5Sq6F4NXgnJ+x7Y3TvccXeeJURpZylqFZoWiQM+RVMTfGh0qdxgF2?=
 =?us-ascii?Q?IhFcPq/y+ijTukDCATxNRSVMh/DeZ192WS1DD7V83VNYKugYN1UMsm3IF1vu?=
 =?us-ascii?Q?/tqQJ+G6vR33wl4f3g+zGUIg0L1pGic2nz566q35Xt0nikwSbG4vcwFIo8pY?=
 =?us-ascii?Q?fkYCEKcMJKVZvH7NrJw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3ae8da-ec0d-46e3-4720-08dcde4bd6c9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 16:54:08.9597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fqIWyQvjK3Ux5kaVXsjrgCuEsI1hXxGMtFv5aPVOCdD6lt5o/W71X/IuXC+h96sIfY3MyhzXdmP2xE8udC7BBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_095419_683732_DD1E0166 
X-CRM114-Status: GOOD (  17.57  )
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

On Mon, Sep 23, 2024 at 11:41:22AM +0800, Jinjie Ruan wrote:
> It is not valid to call pm_runtime_set_suspended() for devices
> with runtime PM enabled because it returns -EAGAIN if it is enabled
> already and working. So, call pm_runtime_disable() before to fix it.
>
> Fixes: 05be23ef78f7 ("i3c: master: svc: add runtime pm support")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i3c/master/svc-i3c-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index 0a68fd1b81d4..575b337a5052 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -1762,8 +1762,8 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
>  rpm_disable:
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_put_noidle(&pdev->dev);
> -	pm_runtime_set_suspended(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_set_suspended(&pdev->dev);
>
>  err_disable_clks:
>  	svc_i3c_master_unprepare_clks(master);
> --
> 2.34.1
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
