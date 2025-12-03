Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD64D12D6A
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Dec 2025 20:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1qbiJf/bIidn5svl8WpyfTnAKXMug5cEigB0ColaplA=; b=LYlHSPh2ugffx4
	fLCTmGjoWvA6Xa7zYWgQ0zlves3PZHI6V4D6S+9kuvIbZlTFONwxdSzGktfFqlx+NYrOic/A63+2s
	UmG/T/3fD+LnaMNEea5NcAQlkeXxSHbaezEc1LY8MNTBoVkpSqpqE2fKOy1By1JCHImjBdJJC3ijY
	AQfFGdsDbr926CqpvaoqMIZaAcsQLbzN1KglY6mEWZ+h92KW+JEZxDAqAb5G/KrhN/TN9Hx1TOFhE
	WT6Q2QF3R5SsYg32PBEd8ARLrBJdCY7GsqDuJ2rRAwjgo63P7pJCwWO2X8FN1F6iDuRABRveuryeH
	nDflFsBGGc/lr7uHTfOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQtbs-0000000737a-34d0;
	Wed, 03 Dec 2025 20:38:00 +0000
Received: from mail-westeuropeazon11011051.outbound.protection.outlook.com ([52.101.70.51] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQtbq-0000000737D-2OJI
	for linux-i3c@lists.infradead.org;
	Wed, 03 Dec 2025 20:37:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePyi89BIaT8nti5ZJ4rWF4fyw5pPC0dkybDAE9WQ6Jsa+ZbICtV48chQjIEhg/PUcU7uz6dyCJJ/DOR4iCj1dK76/jkr/IhlxJUaVT2JdqfgPMPgM1ZluEUgtAxsiMlAGA5hykRsjYfNB0gJ4ufxxMDzR6T1JzT5k5iPnlkudsbY/esgcuRYbK/peRe329ctAjQYtd5xkPXd3XadEzmuPG6YPVewPx3by2dH+x8B/IKubMqVSK7VYiKP9gfh4oukU+WUI6iibtw2FFpTKW3H4SpDWkUEu/LU7kGzzvcQ4em8BwOtxx1IP0tgHLvjm/p49yNSaGPwiRvClWGwGvESWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FDWzFSdvrgxQv4498AbXC4oN4DtOV1PFCB44fIRQ3U=;
 b=prKU70x3vlVekJBtiXX4w1yL76+RIipzj5/OHMT+ZUnaoyxacUkG3I/PrG/JUsErm3i5lsWpBgbscXfG//PpoD4N15Fa2IHZqruoXy3Q1ITPUXZeM6ayuYGqXFzltsPgWvoMlAxQ5QGdl7F7H9sSgq6/6nO52VV+d6PQdfrcXBsmIHUwxB/p/FS0p/k/9DPDSR+vhUuFfcxf5lnB+wwH7OFxtib6S1MIUgeUuGFQzMwVIWoQC5ryqJT5zbsCoSQyiB7qLr6BVp+WzI+g/cdxUjJfCvNQAdaTQsYP305N5+UXzleaAaYhDWnwaizIvv5PIQnC2apeKM02uNRPCCNI2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FDWzFSdvrgxQv4498AbXC4oN4DtOV1PFCB44fIRQ3U=;
 b=AHfYFRqm9O7FiOwioKWDYmYvN+WhXm8gmrXaGdh2YmabsAoHqfhaZLFt8q8kukatovfUtC5lvdLAVxcmneJSr1llhTEu8tGS7TbBn2GwMVCSwChv8HIAcv/xRDRcPa1G6ynnYs5tM32cvG9OpTmMsUT+AM6BMqKCJw0AWrHouGhaMXf/oH6/nnUxcK8wp+QO2kxjHXbIoGKQ0U9W/Ed5RD5vPIhDGXhnnnqIb2uR0u2AH2TOM7ZnipoYyUpQHhISCESmzTBMMAUHm6L/cNAif1NwGo95/D9jLjSzgb2/Uq3ZI23OSUqaNWGyIxP6NCj/d6OLrXVatVY/HWhxI9bTtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU2PR04MB8949.eurprd04.prod.outlook.com (2603:10a6:10:2e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 20:37:54 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 20:37:54 +0000
Date: Wed, 3 Dec 2025 15:37:48 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/5] i3c: dw: Add support for Device NACK Retry
 configuration
Message-ID: <aTCfnCikUUuSF3uL@lizhi-Precision-Tower-5810>
References: <cover.1764746266.git.adrianhoyin.ng@altera.com>
 <c66b447dbf6cfbc0f306ae78f0d886c3ad65a3e7.1764746266.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <c66b447dbf6cfbc0f306ae78f0d886c3ad65a3e7.1764746266.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: PH5P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::12) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU2PR04MB8949:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a87fbc-9fc1-4d81-068b-08de32abd5c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?frfhjdINqBz+D5dzoEzOnfnMxkhTAEGs1JtJQI9kntkUIBylHFIA3ITVIeB3?=
 =?us-ascii?Q?TE5MZckVslpjLD4PDWVeKq9vSgy18YhGdTlSr2+aOEZtYJUNXOh4whX2qU0u?=
 =?us-ascii?Q?t+WBq0/k70uOl4Ezy/WFTRxfzyGwEY3HIaYBwbsX9MGJopJZnw0ZyvdepMf9?=
 =?us-ascii?Q?WpGHvXgfXcGTxsrv3sfTF8Iu+0gMol1K8qsnPIPbrWvL+XCghoG9pr8BhOMJ?=
 =?us-ascii?Q?1VW7UsIp/bCCvL50Hu/80t1LtiZTsl/11wJcpz93ChjV3tlLTmdGXnTO7LpG?=
 =?us-ascii?Q?h0G+obAzkznSqET6VsIPlutNDbJChA7YXgv+E/TcTdQXTUWvsTSY59xqEW6B?=
 =?us-ascii?Q?4tmW1qOpuclnDA+OFdvogdiAlQhP9xUnd0l4sg3PZcY+vVBSnQAujX2p1ytH?=
 =?us-ascii?Q?e0iok12Al4bgZ/+dvGPABO8CBmmR879WvW6I1B5w4/v6zKjXM3suZLKMWGeQ?=
 =?us-ascii?Q?3vVcFS1NRyt+pwmx4XpRn2I0YuSZBnDkZhpyFicuJAQMSOQKQjBUCoA1srXV?=
 =?us-ascii?Q?6eLzdriogyiF8aeuIpr+YeaLfAx4ugCp58OhprWMQWQgLB21HZUU0F4SxYrM?=
 =?us-ascii?Q?SWjuyYvwu2y4P7XE+RjyU3T7YUgqPHb7owuFb2Z6ElVDEl2K1BgcOHzthtVM?=
 =?us-ascii?Q?4owVIIkIqVyi8oYIqUClEMiKo+e+tLfB6oVl5o2JNs8tcip1nLHTA7dRLpVO?=
 =?us-ascii?Q?Z0+qD3tQMYJ0lf+hon66MRTbrCbHrnSflSeDWodaRa2h9OpqicZj/2vzQvOb?=
 =?us-ascii?Q?F6VFBSX5ciMeIzET4ZrXhytK3hY0My52zjPfzl8qOBLGfiOzh+BH/N9mbso9?=
 =?us-ascii?Q?9XBfgDGkb06lD9bsG/GHh00AyCANw62g5vHi/Y5d1PcPJBeKepeqJVtH4xBh?=
 =?us-ascii?Q?0L/+OBv3D1D40wGBpj63JWECq18bi3WY87Na9IGXO5c+rSzrJB4oumRauujD?=
 =?us-ascii?Q?J2fAUew81ET4NR4q+d4T0PdQGC+nWK+AZ5Hbec/j7TD6m/TKvd78kd8hlx0P?=
 =?us-ascii?Q?U08G6nnrVXHlbT/20cLYLJGGP1iWNW/NroU2WrskWpUNCd73GsQY1sqlQKpN?=
 =?us-ascii?Q?cBrOed926ORpkdf5WKop0tdMvf6lIyFm5Rj+0DPOQXW6Es1AIM6ABShYDVwX?=
 =?us-ascii?Q?w0B4/owwhGADSmQkK4LbWvP08dvtpxntF96qyBVEcepcHWg/0xNyliwtY8kR?=
 =?us-ascii?Q?NFoYQqsjA0sH5OmudCqU9aE9elmBHYCNe/vsdi/V0o4W7O1Azi6r8nWUfkeb?=
 =?us-ascii?Q?OwMqv5orTyj17kTU3JQ+uCcSjl8gDRsWiS6l1uhVS0XtbF8qegHjTBv9r7DF?=
 =?us-ascii?Q?PfwZbEicmzP/Tk472obCXVKCV0vdmpO74Ba2Wzli/mD7Bhxlq5zo3cGFSNk+?=
 =?us-ascii?Q?UflnttyrzAq4VjLSGZe6QCm2X/c25e3pSEkChpB9i5GqiXXIKJ76JnAWYfe+?=
 =?us-ascii?Q?7hot/GFe7Liea7gLrEmckBm306wanspkf7Qh7qu/syhzo18cmHYyTmsX1Yb0?=
 =?us-ascii?Q?uyYtwsK1+d2zZkGyNgWKptUEWBuN8W2yFd58?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xkwNcE2eok3KiVqtscV1nHReadMPelnfpfaWy5oxU7Dbhs8ETrzqcixu40Px?=
 =?us-ascii?Q?GUMCKTFFpIlCj3KpStS4CAddmOX/p+Hnr96zKtSRpBs5XBrrJpjCBWuxdfQe?=
 =?us-ascii?Q?Uk6D5sVCMzAIH+w+9NDfu91dGttk5/3SOcVXW5gKoFrcfwXjQ3S4kOT6jAJn?=
 =?us-ascii?Q?hWQoQFgwFs7YYLu64KePwdSNqkfO96Ja2LTWfiN5qzxwesoHkhvAtGvnLNvn?=
 =?us-ascii?Q?EEHQDsIWgrUbOTWdPb765KV67hB22T7GUm26B6Z0PH39+wgfddP0apWORfCb?=
 =?us-ascii?Q?/7KoNXsjSM1yi8Lmnqg0uGrlyMdYXgHCSzaQ0+mQA+oRS6Y5vG8k9eK4fPb3?=
 =?us-ascii?Q?O78AmSNqrhltFCZF5Ypj9/5HeHU5hzTRYiQ/gfNJY0fFep0vHilZk6vGkej1?=
 =?us-ascii?Q?9s7gE0120jE5nS70ZsafNpxxBSDHF4yTzq88IAj2xQEy1sD0TrdWpUsjZHmF?=
 =?us-ascii?Q?F4zHZrw+ys02HckkoIZegaD3XVKf4PRKiJ2cq1c1QlgRkMqQzbHeG1fRxFPA?=
 =?us-ascii?Q?IBeLXOW7hMXeymAYbnTBBUPqgmIdYFRejP5J/qobDEJtY7GK0SedcWrkEXQh?=
 =?us-ascii?Q?9WIdUm0Re7WDO5m9FXx0bBEU/QiPWbssgbcA1Tb1ZIyw/ZJ/OZYs95jiLOq7?=
 =?us-ascii?Q?0B59AoExpeO1ZBvqSVccOS8emacq/sKzvLCAU5mOlYd2Rxs2GtK8lJVJqzPq?=
 =?us-ascii?Q?6cTQdl2bROIsseJ57MwCHlNHglF0Rl/rpxLTFC8QXRLDkLqAoUT2NGhzF+Jg?=
 =?us-ascii?Q?GTVUsUdP1DeRngJmRsWiSw6GFxC+mGlvj6bGxu02EzIf5694ftRZ+A9QWbkz?=
 =?us-ascii?Q?l0fGD48sVzZKdkPRFayUARDXbyViPvxVrEKzZ6r/MLzjMVVpiZAfWJY8cRrT?=
 =?us-ascii?Q?+Wz6mWzTUEBJNpi5Qg5WrmLzSrEtMDfqUcaDbopdnu2xJXa0S1T2Xs8oSgfp?=
 =?us-ascii?Q?d2Qf5zK3QKeV0NgfnDsqR+FjpsRyvjJSJlG6LjrtxSzylumHucWLzDOrLyrT?=
 =?us-ascii?Q?xjlfGD8t/8Aq+IHy/avBFdPbFQ51zkZtEwTcDhMqGwHm2evOfXMR2dZM8CxQ?=
 =?us-ascii?Q?BDEPJUUxn6Qn/hbHZ6w461l8M49wRgxVn761G17FjqHRtNKZOpbFsKdz9VOQ?=
 =?us-ascii?Q?yyzzUuOpDYTm9GXIKY3lnSZ8vDkAZVDDDh15ogvsTV2rCi7KdA0B3vXr50Jj?=
 =?us-ascii?Q?tbDVINjTw9nZ5ElA1w5LbgcDAKizKwES3eAsFhydMzCU72FnI1/99PV8mepg?=
 =?us-ascii?Q?rYieFdOQDdNo/sWo9UTDYMIv69PT1JBGdwJ/X+TT1SjRwf7tncSDz/1toxEm?=
 =?us-ascii?Q?Wu56DW3sqHpMLzzbkgRNl5zgEz0kzMwmJ6X8FyhmvZ0py72C8DEoJg8wJe/u?=
 =?us-ascii?Q?ZTAbhEUl8bZLKtOwGz38p8TOksqo33zQevaV3Hf0HAxxFP8vIViQf/3HyKnq?=
 =?us-ascii?Q?gQdynlb2vd27ZOaBz/f9SUHOIgl//KetBQRGQzvNpnCoCbtFm0MUfvXFUXno?=
 =?us-ascii?Q?Y5THDosSzkyO6s2v5IpDHwyZPPQv2Fs5BrmZMyxdbWRDRhj3lOD1RCXYyiK8?=
 =?us-ascii?Q?srSTs+TW1LIqim5BWcyG9HRuJq9bT2lXEi468G3Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a87fbc-9fc1-4d81-068b-08de32abd5c4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 20:37:54.1859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DV0+hd1uiJfdUfPGzIzJnUUU00MeiaqqZ1FLV7aYKOMKPZ5m+U4B4AWKUBRZ0mLkVv36UuZbWLWfk93ATgaiVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8949
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_123758_633249_07532088 
X-CRM114-Status: GOOD (  23.92  )
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

On Wed, Dec 03, 2025 at 03:21:04PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> The DesignWare I3C controller supports automatically retrying transactions
> when a device NACKs. This is useful for slave devices that may be
> temporarily busy and not ready to respond immediately.
>
> Add new ops to configure all active DAT entry with dev_nack_retry during
> runtime. Returns error when value exceeds hw specified limit.
>
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/dw-i3c-master.c | 39 ++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 9ceedf09c3b6..252559ee2afa 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -5,6 +5,7 @@
>   * Author: Vitor Soares <vitor.soares@synopsys.com>
>   */
>
> +#include <linux/bitfield.h>
>  #include <linux/bitops.h>
>  #include <linux/clk.h>
>  #include <linux/completion.h>
> @@ -204,8 +205,12 @@
>  #define EXTENDED_CAPABILITY		0xe8
>  #define SLAVE_CONFIG			0xec
>
> +#define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
> +#define DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK   GENMASK(30, 29)
>  #define DEV_ADDR_TABLE_IBI_MDB		BIT(12)
>  #define DEV_ADDR_TABLE_SIR_REJECT	BIT(13)
> +#define DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(x) \
> +	FIELD_PREP(DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK, (x))
>  #define DEV_ADDR_TABLE_LEGACY_I2C_DEV	BIT(31)
>  #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x)	(((x) << 16) & GENMASK(23, 16))
>  #define DEV_ADDR_TABLE_STATIC_ADDR(x)	((x) & GENMASK(6, 0))
> @@ -1484,6 +1489,39 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>
> +static int dw_i3c_master_set_dev_nack_retry(struct i3c_master_controller *m)
> +{
> +	struct dw_i3c_master *master = to_dw_i3c_master(m);
> +	u32 reg;
> +	int i;
> +
> +	if (m->dev_nack_retry > DW_I3C_DEV_NACK_RETRY_CNT_MAX) {
> +		dev_err(&master->base.dev,
> +			"Value %x exceeds maximum %d\n",
> +			m->dev_nack_retry, DW_I3C_DEV_NACK_RETRY_CNT_MAX);
> +		return -ERANGE;
> +	}
> +
> +	/*
> +	 * Update DAT entries for all currently attached devices.
> +	 * We directly iterate through the master's device array.
> +	 */
> +	for (i = 0; i < master->maxdevs; i++) {
> +		/* Skip free/empty slots */
> +		if (master->free_pos & BIT(i))
> +			continue;
> +
> +		reg = readl(master->regs +
> +				DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
> +		reg &= ~DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK;
> +		reg |= DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(m->dev_nack_retry);
> +		writel(reg, master->regs +
> +			DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
>  	.bus_init = dw_i3c_master_bus_init,
>  	.bus_cleanup = dw_i3c_master_bus_cleanup,
> @@ -1504,6 +1542,7 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
>  	.recycle_ibi_slot = dw_i3c_master_recycle_ibi_slot,
>  	.enable_hotjoin = dw_i3c_master_enable_hotjoin,
>  	.disable_hotjoin = dw_i3c_master_disable_hotjoin,
> +	.set_dev_nack_retry = dw_i3c_master_set_dev_nack_retry,
>  };
>
>  /* default platform ops implementations */
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
