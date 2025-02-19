Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA32C021B0
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2025 21:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZFKpiTGBumRUfvAvWjnCC22U4JgKhHNwCy7gg8PNJI=; b=YKgNuwXkjv0CFR
	V1U1yK1Npp3b66SRmiymzhRvmE+mr4UZz6x3YqfMauyQdLk9ralYCU+/BXcnZCTXBm7LG/GFfX82Z
	VkhE7D78FaRsrfC0UT12n61/kLyfSNpae+dl1WAfmiTtlUKdJ07xp9xWqm7T9iAnKaVjkbbICAMOs
	VybaTThyut7Wy2lExi/zpK51VnVYW+CQYNxmRXhZPUX266jAgr6hLv5LW7IIZ4Td0tmO1rEliezEu
	O6EVW6TxMrBJVYscWQC8SG4iHq8x1QCNIydJQ5Y8GhTQfn64VlcQksjPxDvqJrwu73cLvFNvPwH/L
	6ZgjwXLcLp0x2aBGd6aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrSp-0000000F9Tg-2CQg;
	Wed, 19 Feb 2025 21:18:39 +0000
Received: from mail-db8eur05on20604.outbound.protection.outlook.com ([2a01:111:f403:2614::604] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrLx-0000000F6q1-3Egg
	for linux-i3c@lists.infradead.org;
	Wed, 19 Feb 2025 21:11:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJduvrEepY+1Z5V0Ffi1ZXUHPmpfQPeE6hnGWroB0vWOYz5WLiRujDk7wh7pMiq8rU9YHicIztMWq/fW9xSG7Uqz/8vDKX52ieKMf4z5Wfzc8NO2CxNtMk4cWDMgihUSSiQBMEICUZVqLEUkw58ulVNlFxdreva+CGsjEGllKorEM/+vEvmiQEUAbboLYRlFmU0qU0z2HuQ6deByX8mBdcGHLmneS/rnnXhH/094HZ2Dxzx5J0jPSPTuL+G7ajeg6RDTH4OTu4P/qlSLZnh7VWAkaBU3Ubb3LsrO5Xqz6w3AJ3WN/v/42a/RS+8LsJAPjkx4Ca3OfuwziCNqN7HBTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEkmgB1NdqYsLMRD5sy+7HVjXyURgPXAeP8zl0+32zs=;
 b=k88cmEPW4sZostvwkdRItzGEFZ+RhVsfDgOsTTN/E7xYtqjF/unOLsXCxfV4GNoRTpO86l2e/7/c1pi2LjbkJgrtbIh9m9P2uCiW7E2x5zz+bOH+D0Tu4RlyKf4YOxVagnC9NChvhIds6Lg15oifkqlTP+FOuleiPs3pSDAlp58W7idCLQ6obQAw5YzaATTnCRVzU15tIp4ZZGsIE8A6dmnzJr6FCVuOQbVdn+LzOJc2YMVA6A8FMwWFyo14/LODXJadf8uRl72fq7h7YbXbfjYADfgFjFwq+Fyynq2/oMwVnIKWWPqyYyUNbZdLlQzQK0BKxFNjXMhjPlaUPIN5hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEkmgB1NdqYsLMRD5sy+7HVjXyURgPXAeP8zl0+32zs=;
 b=l0sd2B2z8Qkf2/u/B9PsH/uZ0gP8Jx61Hhev8goX7DbfmnHsAuBoJUV0YOkX+GUXW9koZ1GrgGVXxglyOwpyIiGgo2Mn33n58EPIA6Ppl6TRCudgaHZGEEHKEP4W/o/3Tyi52sXFuZInlYk2gfSP4CYH3gcMmpqw02ETMHbKM7OVAaz7ORc29IKT5jRpHn0KcZvYcVSV5xXh3eSvWkqTPnLrsKsT7cledZsIciPaMwPr0dtK0sPKLXnxHAIdrzlk5tUOl1dbiOjVI4gAsyU3tKZe544x7cXGMMoOS6YRigBcjI/U0Yz/+qFZqlBpuOL0ReaPzOSqe5UqGt/Arx82vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB7634.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 21:11:30 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 21:11:30 +0000
Date: Wed, 19 Feb 2025 16:11:23 -0500
From: Frank Li <Frank.li@nxp.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1 3/3] i3c: master: svc: fix npcm845 invalid slvstart
 event
Message-ID: <Z7ZI+9//uliW58+j@lizhi-Precision-Tower-5810>
References: <20250219011019.1600058-1-yschu@nuvoton.com>
 <20250219011019.1600058-4-yschu@nuvoton.com>
Content-Disposition: inline
In-Reply-To: <20250219011019.1600058-4-yschu@nuvoton.com>
X-ClientProxiedBy: BYAPR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:40::36) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dad231d-40d0-4a2a-176e-08dd5129fb19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?esSRgZUclyov/2w2O6sG8fQjYFgwUP0E+cDonWu3HQzJPkEgyks4hFnYim7/?=
 =?us-ascii?Q?61K5nAtds50Cwdex59tnA0ZLu9zCTIqq5sWA9RO/PXDDd0qmFfNufN+Zfnu2?=
 =?us-ascii?Q?TQJY9Une1rqRmIk/E+nPnaadLjEftMvAcoXGwHzc0+W6T5KssAUMzJoylog8?=
 =?us-ascii?Q?kh0kejc0PGw0c6XrVRxD4OfC3yqNH4F+5Tx3tZe6ZmslU6nv/DPCNQBR9b+z?=
 =?us-ascii?Q?1i4QHrgu6TXriLF8ToGVEx/KTcv3WyDnBRc8zYWk4VH8Mc2iftqBkPEee5ve?=
 =?us-ascii?Q?cQ4+INNaUNwWEFiSBf+Tlm2orLsrbOrrs1mdji5rsXpakkxRsG5Zw3CcWDvO?=
 =?us-ascii?Q?LbaN6sCVD23wVQZfbvxS9DeEA+AyeUlXrTQmphUwQrPAXMNTFR0TfBL0qMSg?=
 =?us-ascii?Q?UjWxKFHwLMP7Sh0/yq9Fys/I49MxXaKsEOD3tk9s2VbG5pgUo1/FaoPHatDr?=
 =?us-ascii?Q?WWShhXvJk2BXGJoH4Z20n4eZsAX3tTTQnFF5BqihkuYpKH2jViD4y+/GJJFu?=
 =?us-ascii?Q?A8Fb3cxGU3T/F7DQMtc3kB9saooS2l69pfx7g9tGp+GE/jvyWkyaND+WleKw?=
 =?us-ascii?Q?KbAqjU5GSCeEuTrCzWg7eFKLFhZqP+9Pm5XHTIDvwIYmynqS2fXStfAhOuVi?=
 =?us-ascii?Q?ly926nqbzx5u1vArxoI43+/YsKZ5tDK6HLIMU2pr5Nzgzqhz8n79gro8o8nY?=
 =?us-ascii?Q?2CZ3+ZdPOTVQTilZnUNNErzBKbyF1eAzsDo+2eL24USk1Mu5n6Pr880TWmo/?=
 =?us-ascii?Q?X7/pKfwzKMMu/VEevRRsKr/A+zD0MUk9xO9tj+G1jHXgIio1lDK3WtBY0qnH?=
 =?us-ascii?Q?N9WNSC7BWWRZUnih4FL5tJ6/y4w2Lwu4ice2oj9A06fF/za1JFk3KHWh3/Xk?=
 =?us-ascii?Q?o2Q0zn5fgHJ6vcUpxvg/t+NLjvUI/qk5FuexQNXjplfRZ35uE+LqW7SYs/lD?=
 =?us-ascii?Q?LDxbDZu1thKVWcewwQlGZdb7pGca9kdDAx/BrKCaMbG1VzFSa9DKtz6OhmEs?=
 =?us-ascii?Q?HMxulLmYNovcGp0b1djQ5h+Nc/iM6EjwSprxrRa+5a+qPyD8yycGJf/35SBl?=
 =?us-ascii?Q?qAkh83l/Z3XLnfiYe9+8MNiA7ffIqV1heNTjGu9h8Nt5YMjAGl2tTrwUH2+Z?=
 =?us-ascii?Q?5ZEeeAVk3IkKt4z8eilqd2SkDg51Xd4l9MaLAXG8IQqjPq5n4WUjjwpqJG4i?=
 =?us-ascii?Q?kRymaARAMwW2WqK1JK8R2vpdPOA2/fSLGIaZf+e5ey8qHwwhWJ3Np4dYoudU?=
 =?us-ascii?Q?1fW688oQm6Q4AkLpkIpDBlkuqTaYn+EtUckLw8OobpWx/UTh/HdiYSm1xCs2?=
 =?us-ascii?Q?VscmZxqwjRbVVNylBLYFKmX8qlW4EJNLlRw+d6gh7XmoKQ2bbzRH9b43Qh4a?=
 =?us-ascii?Q?VC25eCQm2k9L0V1cnto5DpICLbTQ7/PaksYh8F5ldwA5kf4SzUdrdhBFLsDr?=
 =?us-ascii?Q?E2EC7Ae09l5wDpwbmYP0rfBPZDRe3Jy6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+M93ZiXf+x/Y9LPKJeqxpy4BvGV2DCxmAEVlVFfhCx8GlAdUueCbpozyPsp9?=
 =?us-ascii?Q?Bu5LRwFdGWC2wDvwr7fwzxI9POHD5CMrlu2t8WreTsCHtk9RLg93brvSB0WK?=
 =?us-ascii?Q?xXwsRlRJEwoYsb/dstmiR1iMbcgoRqkQXYJ1zI8FslvWEPo3Qpj3jspPnQwY?=
 =?us-ascii?Q?WmDtzrD9J/FaC4xgW+hW/lVuoUORpUtXdUYrslDxB1wpcTz02POau/0MznvG?=
 =?us-ascii?Q?At8xEbs4oyE0LvdN6OAuEayr/vxBkHKXcLs/wvdRs3YDvJs6jBiT5Sal1AUV?=
 =?us-ascii?Q?OWKWN+siLD5osCCKONeHETi9hPJQqwf5lHbTOYvCuBctq5oegJ2dZAwS/Xyq?=
 =?us-ascii?Q?A2+Fs4WVYQGgbkL+LZFzqGAYWrHnu5lUNKYCBK2RrpuCa84gEkP69/3PaFjx?=
 =?us-ascii?Q?CiA8xpudHSs2VEVNw+cBr2AFZ+wgsC8j0yMs2JIOc1Lrxb7xRicmcObTxDy7?=
 =?us-ascii?Q?QACqSAQHr7DeTkm5o0oft7N1lO9Eym0rUO+ml1070046kDoNGzPi0XytBaH1?=
 =?us-ascii?Q?heTbrlk7HMswj6gJc14+jxIS90tzN6rqimSEnSXfSo+ksNhx+0MF4sAO4vAc?=
 =?us-ascii?Q?q97Tb8qKQsS4ajrFQrwY+fZ/v9hKZYWQnUQWtybZ8IZWpLZwM57iVTcMqiuL?=
 =?us-ascii?Q?domNX/x6O8Cpwh7b7XnDqW/YF7m6GjznhkK+ckfLekOcR/a7iycODkyyYvTK?=
 =?us-ascii?Q?D00rUlO4EMMB7P4UJ1lAuwyOt5hYYk38VhhDwePeDfHPl7WNAQH2+1gYC9m3?=
 =?us-ascii?Q?ATAhBWOntwFgm89l6xPB4nGH5uyvmBCqXES9fBtROzVwY+IYZNJNhFQEBGAH?=
 =?us-ascii?Q?7PEg+SYHFLiMgjk9w8rHkT9F2LvHWEh/u7deuJ4iJk70SAPzYBam4Sf26bIf?=
 =?us-ascii?Q?qS0v6lGz7+Gm8R2UfDXc0z6l+ebbzaZLLmflz4NItVwfCX3CL7d9lofIaHcV?=
 =?us-ascii?Q?5JruEwINOpzZeYlxrpHyO2nKL/BNa3TdfVnSoT6qiim8iAxZf41v+OfDcFzD?=
 =?us-ascii?Q?dCsK8f8RhMo328FqVIV/XiJzPRX+EXUvdUXaJ8ySj+t3FlRLiFaBspk7s5zU?=
 =?us-ascii?Q?DPzRw9R+9v7WVGMg9ziF/PsB7fDNph2NeSBZbefgI6dJQo+9mneGiaysjJ3l?=
 =?us-ascii?Q?Rhr84ClH2TD8kIkxY/cFR4aufxXkLVq5biGl4/VHGl3cgqosiNZzMMpUyF5O?=
 =?us-ascii?Q?ghcj3rBTE6jyRB+jJLDs1rMaSds+rPhHteUhwZygxneEU4fYrgD9Aapo2YBK?=
 =?us-ascii?Q?6iR5dHazjtNrs/gEPoo21KEst+X+SrUMGc4N44UG9Egt8CVoDjftKy9x1YWL?=
 =?us-ascii?Q?BjDQ+jTDBzyegzSHkr0Arypxu7rU4XMWaPjIADpzRyP2u9e/xtp6k8DfSqA+?=
 =?us-ascii?Q?QgrCrjqxHjqygL1GAoSTTrBFT1ShhpQk38Xcgf/SCX0h2LhcSbm0Q3Md1hWF?=
 =?us-ascii?Q?iUoIKSx5Wba5YMjMCDXL+uaxsNEFk3/oARWH/mYDy9zkrQdTbw/atll6icb0?=
 =?us-ascii?Q?4QIXNkj1EtxJN8HWZQp49lS7dRJSKP2YPiW1yesaZWoR8faWAuvZM6iEoRV4?=
 =?us-ascii?Q?79B7C3qHXWW1nQLW7w2E5trW26SERgTcdvhah0SW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dad231d-40d0-4a2a-176e-08dd5129fb19
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 21:11:30.5662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dr9Rp/zqsLq6smXW5gD5SEuN+1w/x9t1zYxyAEOUalR+0edD0e0WJgDBO+10jeW/SRrPUFbo4wCT5/kIIKwwOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7634
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_131133_809402_C8D0735C 
X-CRM114-Status: GOOD (  22.00  )
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

On Wed, Feb 19, 2025 at 09:10:19AM +0800, Stanley Chu wrote:
> I3C HW may generate an invalid SlvStart event when emitting a STOP.
> If it is a true SlvStart, the MSTATUS state should be SLVREQ.
> Check the MSTATUS state to ignore the false event.
>
> Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> ---
>  drivers/i3c/master/svc-i3c-master.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index 22cb1f1c1fdc..14cedcb81c52 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -59,6 +59,7 @@
>  #define   SVC_I3C_MSTATUS_STATE(x) FIELD_GET(GENMASK(2, 0), (x))
>  #define   SVC_I3C_MSTATUS_STATE_DAA(x) (SVC_I3C_MSTATUS_STATE(x) == 5)
>  #define   SVC_I3C_MSTATUS_STATE_IDLE(x) (SVC_I3C_MSTATUS_STATE(x) == 0)
> +#define   SVC_I3C_MSTATUS_STATE_SLVREQ(x) (SVC_I3C_MSTATUS_STATE(x) == 1)
>  #define   SVC_I3C_MSTATUS_BETWEEN(x) FIELD_GET(BIT(4), (x))
>  #define   SVC_I3C_MSTATUS_NACKED(x) FIELD_GET(BIT(5), (x))
>  #define   SVC_I3C_MSTATUS_IBITYPE(x) FIELD_GET(GENMASK(7, 6), (x))
> @@ -143,6 +144,12 @@
>   * Fill the FIFO in advance to prevent FIFO from becoming empty.
>   */
>  #define SVC_I3C_QUIRK_FIFO_EMPTY	BIT(0)
> +/*
> + * SVC_I3C_QUIRK_FLASE_SLVSTART:
> + * I3C HW may generate an invalid SlvStart event when emitting a STOP.
> + * If it is a true SlvStart, the MSTATUS state should be SLVREQ.
> + */
> +#define SVC_I3C_QUIRK_FALSE_SLVSTART	BIT(1)
>
>  struct svc_i3c_cmd {
>  	u8 addr;
> @@ -576,6 +583,11 @@ static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
>  	/* Clear the interrupt status */
>  	writel(SVC_I3C_MINT_SLVSTART, master->regs + SVC_I3C_MSTATUS);
>
> +	/* Ignore the false event */
> +	if ((master->quirks & SVC_I3C_QUIRK_FIFO_EMPTY) &&

You should check SVC_I3C_QUIRK_FALSE_SLVSTART, not SVC_I3C_QUIRK_FIFO_EMPTY

Frank
> +	    !SVC_I3C_MSTATUS_STATE_SLVREQ(active))
> +		return IRQ_HANDLED;
> +
>  	svc_i3c_master_disable_interrupts(master);
>
>  	/* Handle the interrupt in a non atomic context */
> @@ -1915,7 +1927,8 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
>  	svc_i3c_master_reset(master);
>
>  	if (device_is_compatible(master->dev, "nuvoton,npcm845-i3c"))
> -		master->quirks = SVC_I3C_QUIRK_FIFO_EMPTY;
> +		master->quirks = SVC_I3C_QUIRK_FIFO_EMPTY |
> +				 SVC_I3C_QUIRK_FALSE_SLVSTART;
>
>  	/* Register the master */
>  	ret = i3c_master_register(&master->base, &pdev->dev,
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
