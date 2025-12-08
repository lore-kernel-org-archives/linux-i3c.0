Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E81D3B7F3
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Dec 2025 15:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N9/Lggzr1/Gzl1ddwzQNDqoKp0NUaO0Z5doXT4q9dQA=; b=Nw1ail7rByGXxU
	BxB9XnDQ5nAUFzv5mM8/clXBNNi/ytD96iEJvCBLRDYUIrio4ueZCjtKSc+BoERBjjKDcf40gQg6W
	RFLGmgS41U8/ftmVDWFLp98jHgx8GHsgeQkEi3UUcoyt+GoOJkcPyXA+y/zy61KJ7QQav2nwQ9g3u
	6wPGXZZ2T7dQB6Vwx9Xjz6wyg9Jb5j4n+JR0SfkFEeLClqjmlMrT9ffWYfRcBxCuOjU28ePlOaJ8p
	7td7XpDtx8jlztJhf3ZTHzPhFFOwFba+VIjaqYfd5k1GtX+fMX7QX4dVu2FI9s/DG/KhFlJkPlk2Y
	TTbxQmTbUFsGZBWXI/ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSd9X-0000000DEjd-1OQS;
	Mon, 08 Dec 2025 15:27:55 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSd9V-0000000DEjD-2oc4
	for linux-i3c@lists.infradead.org;
	Mon, 08 Dec 2025 15:27:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fa059/S84TybjRl6rgLXxCxoQ+f3zVbo8qagK4SUffi++zM/1zZXEL0O1v6OM4ZqO54b0HPSJMEmSQEtwVXw53vpjIuqqnjQdxdwa3jP323SIpaUXs0zGF8KKwH4h0pgZDsb7fjyXCqyddMroxcOirr8naT5u1Fgo6Rv+uEfXTLbal+5f711EcVkm7ZCV1vIBe78GU+snL8mEy+Jyzx73EeuBaJEvCB9+teUwmk1CONsaATR4Q0uIkJ7Qp7zmDyysbEMGYijvXTW3KQTsCnJa1r7dFmKKSC709QQeI8MGXdxZreXvHSCoFxuSWYGrBQKpFrlR72ueo317TpPvNjVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEyBE14M1GcIPdHavkL1SF+cmj+PfvQPeGMWLgsW4ec=;
 b=RZsAJbxI66m9Yo5Ld7RODIR7q8w76bxcrlIMzW4rPJBWSlDa6U1zI2y0ccTYwsjhYsb+u7KMLSZWqUGoBHNUKEAiW2MyuF9rSMESOLjULNG8KenGcbIxm4S5ZLbH5ziwqKraMdw24H2Se9wwWeFr5oUcawN6ARcfauBOmhAezxOKxQ3NrXMbRNXVKcVXjsNzsngSUt9XmBBpdc794oNJ35lyKE6/lORiCvqIrRv+ZEfANYTiwAiVqMHEYCj7kBdYQ8BnHsKK63XlSN+BgHGgbgZay7vBy62xg92bkGd2cjrydVjDwKwv9mnEdIFLnECEy1OHFEYBZzhmPyUL/VlOMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEyBE14M1GcIPdHavkL1SF+cmj+PfvQPeGMWLgsW4ec=;
 b=ONHAXGb3YVlCaytUq5hBLghR2qvIw5a8NXLNY9vtRzf4nXiRf5U4It65f9sy6eZQaP0lTxybkYrAJ0BFojtRvQYSmN3BDombHWuqmXRHgu9ZYxeDNWtOdZRc1E5yrS5SHwub69UeleKVfhwyb1jB6x1gLtuAiMphK8P75J872lzqdAkzuJ+XUf1EfQff+4ANCID1CgeW9fHH3scuQbROLq1+ZbV8bS0UC7KNCgjVb5K1U2a8x4V/bKc1AyinJACDdb0Wpob+OmVSVzShzxwbzy4t1ZGAufnXogse5milHgC/kr2c733WkfcoJ5BvpAdMx7oHDbnlfXHpdCxq/L2UaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU2PR04MB8741.eurprd04.prod.outlook.com (2603:10a6:10:2df::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 15:27:47 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 15:27:47 +0000
Date: Mon, 8 Dec 2025 10:27:40 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.comy
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/5] i3c: dw: Add support for Device NACK Retry
 configuration
Message-ID: <aTbubAre7vyUEhqw@lizhi-Precision-Tower-5810>
References: <cover.1765177110.git.adrianhoyin.ng@altera.com>
 <5a1e1a6b3f2f055c5ce1e111c798e10a4662f8cf.1765177110.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <5a1e1a6b3f2f055c5ce1e111c798e10a4662f8cf.1765177110.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: BY3PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::12) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU2PR04MB8741:EE_
X-MS-Office365-Filtering-Correlation-Id: 21610911-9b44-4c92-4e7b-08de366e573d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xeDcjuydK1tVbJ8JFoT3kJ+oWglmOA1eQoHSJm1blnx7tceXLjz/VL9k8FXw?=
 =?us-ascii?Q?BvHxSVURogpO5porgTKt5GfFENm1rwbQ0AkNTFrJH9C8Jzyk09uIa2CnkfJt?=
 =?us-ascii?Q?uFs9phik/Qc/a2LDTxARXUAGx5vsuDjI3DU0XeWSYU1p6Xw7dNO6q8pgNdu9?=
 =?us-ascii?Q?rgf4kBiGLGunQySbQZosv/BR+L90dJpSWZXoPX2bYw7pOrpG4k/jKAlyMech?=
 =?us-ascii?Q?3Y7Sx5lfobqkNd8+Nnf7J+kI2TMQIJ+R9hSg4E+UVSFzIaoSybZnc9HKZlgJ?=
 =?us-ascii?Q?fYQ95AOga6hSxcGFiBScvF35FdKDMJrDlRFFpELf4lWhd01GeujYPy+3rPgw?=
 =?us-ascii?Q?jPB9kbH3E2FX+rFIIUyCs83ho9fSFCcp+/5l8oJYSn6U5F1f8Zi0G5I6Bf+y?=
 =?us-ascii?Q?BEHX8FaWLY5XWMtHsM7AhgIUCGeY35HeiSPFpxUKkRqxExU/GJ1yih8nA2vf?=
 =?us-ascii?Q?wrpJpDeKffoOxk2t5eeowpXCBmpo+lMAr8izyAs1sOXV7TFc0TFc6jTA3aKQ?=
 =?us-ascii?Q?7Z7igHDEu0q3LNKDz9oOopQbiGpvB0aoKcdYUzVrIkq4yq8G2ToVlE+yTQMR?=
 =?us-ascii?Q?9/vEBW0yMI0p8P40lf492UVCr2V9uf6ToLI3xJ0TLo7I+eqfNQUD0CgisGi/?=
 =?us-ascii?Q?/7Rbx5VO/mSa+bzV38V2jCjys+9TfBVZx0eFeP9gpnluSsJfmpD2A4L6rUok?=
 =?us-ascii?Q?LknKxq/1uz63gYB4b5v+AwbjtIqzEL5HC+GS43PbOpvMzxw7PLO3+J/b4Lxy?=
 =?us-ascii?Q?oHYonVBkgVG/rXZdGs/XUP9kBxfZLbjoqsDxBxzCBbNIZ6CvQ8X+YJY8iUiz?=
 =?us-ascii?Q?97zvlDkFCUk+OmBWVurZLyF2x7gfAuvg6kyyr213kZL3Shm4nPPNvBtTw5x3?=
 =?us-ascii?Q?ogB9mKsOVmD7jXyiPmgaoRetuWuCmlh2Yb3eAH9CTToMqJ1JEb9475S7kymf?=
 =?us-ascii?Q?crvWB4fMzaZfwQVJuDgfmK7Wa6xC6qB7ZKQsZpB/nle+1rJpK3e3MUKc+O9m?=
 =?us-ascii?Q?1K2rkTcZu7kt41rzkDPRkMrV0WQ1N1qAkzgaSIYsSanmBPT9y78H0Wp/fSEX?=
 =?us-ascii?Q?MILaZj3p7B58spQ0pwR8fBgG2CBcL1hCTGpHJPUiqyK7ijguXUqBij4axQbW?=
 =?us-ascii?Q?REpXGc+XhBewzF3zzlM4I4V1Pfm86Tqad14YVduN90UPGVFdw7ef8f4Z1zIH?=
 =?us-ascii?Q?xs3CEN9wM+Lkc4a2WoZnMLDF1dJCx1sJ4arIg5h+9IKbAMGC/RYcxNqxV2Be?=
 =?us-ascii?Q?jXAAW1qeGBYc4/zPmFiKzEzPmKY6nWX1fSFRyOxdWnzdoUwCb632Tv33uJmA?=
 =?us-ascii?Q?9IMnWAwF+qEi1hiQOdXoTxrp4IcYXvN0+xJI5VvbPbyGlA4kz0x7AWFuwRKO?=
 =?us-ascii?Q?CPXyief+ht9O9L510rg10fFb1rcOJm/15qGccSw8xfdYweQLd8BjzCDG9100?=
 =?us-ascii?Q?WRcv1WUvOMwbCW7MFS5hUib024uqZpmdhJgDA3Em1Wug8M14sQXxik89jxh1?=
 =?us-ascii?Q?G4CTLDZmR9Vtyb3vK346GZyDS/6C1x1xkVTG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gm6TnmcD2y/qsSWg9ZPDK10i7hnt2e89YuelnnNRKxC/GSyLeHWYfaIGVuKG?=
 =?us-ascii?Q?9i1nWouIclX42FruJ1qb5Kzpd2OO58B/vUoU4jUQs9gAQ91BIrVDIO7VJMbR?=
 =?us-ascii?Q?Bg71aj4lyLtNrDJL7D/nET+++xaL30E3+5Prun/lqiBHEO9YK7LoiM/mWbUU?=
 =?us-ascii?Q?y0B2ZpPWFYAEv0a7OrrmIXnPW8gYAzWwBH5j0avAR1PUkResoYng1oKqJ5bH?=
 =?us-ascii?Q?h8q8mKNigrnXJWexvys6+6rNKVCXBwEiCSZyYptVRvu2e4d1B5flcAPNvUFV?=
 =?us-ascii?Q?PdDsnLMxUOs4ACQCZOy3+0Jh1R7y6cic5W011RjLD/AM6clF653iJ+BQ6bEF?=
 =?us-ascii?Q?azfqj6i14g25RnZt04i3TzcWObjKVBvxTnKYNP46nNwDgphPWCHzzeWLEhbu?=
 =?us-ascii?Q?WIMpZ3K0tSX6l1g/1p/PUsTFtpHpAwFkNZfue03Kq718oGxOAnunTVjzfcsp?=
 =?us-ascii?Q?zL2cLRfHOFigqLXB6S+yt+B5+vZ5PqEiYFoAv10DAG+hSilROYz39Yd+FO2h?=
 =?us-ascii?Q?eNc1bGyyoVo0AM90ypmu0y4Jny2+nKB+jXcjNDWtjETyAnrvUYfydtB1Jtq+?=
 =?us-ascii?Q?wRmR3dQ+wSUFKTQzv56+gY5eeJXVm+baOLQMkDEh1K/MF2i4+whGh938A1nS?=
 =?us-ascii?Q?U2dR7btAF0wHwciSZnGOSaMitG2MwHfzIHqj/F3GL6yKxniGIqcORhuzJVj6?=
 =?us-ascii?Q?YnfP6OEt66h6DhAAZp5j6wsNSC9b6VpfgSsbU0tpV2dK6Xg+LPgYIgU7tHBR?=
 =?us-ascii?Q?Ft1HlU9P7BbqSEjvkbO5361Xi3dP5JfR9X7Zbn4sACBpReEwSRJMF1cMk9cI?=
 =?us-ascii?Q?gXLAwsnnfu6QDyAfTdpOezmvw7+C6V8VH/HymnuF2f6A2/KX2rAclarYnBOv?=
 =?us-ascii?Q?E9F6f2Vd5NduMunt1oZ6dL+ikifzqKK1NGaryW9Voh44UYsoNFjxLwto/r9y?=
 =?us-ascii?Q?NhuQhJnCD9d0IQ2ThHVmNF+U/BMJtmTJ+REVUjLB116n4eriBREcG4J2FhTd?=
 =?us-ascii?Q?lRLvvziBVRhCVcwZibeuRqsSiDFwd0Zagtm1qPHfh8t3NS/7cpuzM5sT/7vy?=
 =?us-ascii?Q?m1By365kVojNJMPBJIPXcAcZfLFl34CBfQpN31wJ76KJZR6jREIHTZ0+7oZ0?=
 =?us-ascii?Q?oLWhxYtfnGAsE/2WbGIRYBo1Vs/oI011Lqamg9IEe0FxMyNATd0PvLo+3uyo?=
 =?us-ascii?Q?Kzd2dTEQMfxLIw5n7T7XZ+4itZ9mQo1yxJ7KA6Ly7BGgEx0qDr+LkEQO0nRH?=
 =?us-ascii?Q?KkNWPAfOWaNOfEctA6ad0/9doNnerJJsjpi2z83jFNUp9fJhcWC5cyJDUuAc?=
 =?us-ascii?Q?ksAfzvDWMd1Rjql00wphBHjI1MLJUzublyrksP0mo+RqyKzLqhm+pJizX46D?=
 =?us-ascii?Q?6KJ2ZZXWriqAfiO6Xqhsu/3LdP5Du07OGLtITu9IADLsZi4omJQzcR8VrYJ2?=
 =?us-ascii?Q?q3WJnikXAYM0ShBC/BITm+QrHXwy516WfjhzqvnFEhofr1HgRk4lB/9NmWyG?=
 =?us-ascii?Q?hVfGPnqbCHEg8GR0F3sSK2+fIBQp7cslfNHQ5vbDi1P603LO3CPq+LhyQr7R?=
 =?us-ascii?Q?uyrlLPtx7gE999f+hsImRWfFs+QA0Muvz6m35EH9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21610911-9b44-4c92-4e7b-08de366e573d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 15:27:47.2892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpKx5HxsPtJYqnVFd9FrJN7oP9SbA6vTaMJjeUAKpppvt+1cErXrltRI6jy9zc2Ql628ihLO53SAPfiDO/aMcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8741
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_072753_737038_2073C390 
X-CRM114-Status: GOOD (  23.34  )
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

On Mon, Dec 08, 2025 at 03:11:18PM +0800, adrianhoyin.ng@altera.com wrote:
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
>  drivers/i3c/master/dw-i3c-master.c | 40 ++++++++++++++++++++++++++++++

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  1 file changed, 40 insertions(+)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 9ceedf09c3b6..ce33600d4c5e 100644
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
> @@ -1484,6 +1489,40 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>
> +static int dw_i3c_master_set_dev_nack_retry(struct i3c_master_controller *m,
> +					    unsigned long dev_nack_retry_cnt)
> +{
> +	struct dw_i3c_master *master = to_dw_i3c_master(m);
> +	u32 reg;
> +	int i;
> +
> +	if (dev_nack_retry_cnt > DW_I3C_DEV_NACK_RETRY_CNT_MAX) {
> +		dev_err(&master->base.dev,
> +			"Value %ld exceeds maximum %d\n",
> +			dev_nack_retry_cnt, DW_I3C_DEV_NACK_RETRY_CNT_MAX);
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
> +		reg |= DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(dev_nack_retry_cnt);
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
> @@ -1504,6 +1543,7 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
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
