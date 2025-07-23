Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD2BC83F17
	for <linux-i3c@archiver.kernel.org>; Wed, 23 Jul 2025 15:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18ilTDFIVXiJyTqL1Jepk+BhrY19ZSG2r295LoLzxX8=; b=N4NtSx+DXuzlmI
	9PgxyHbdB669+QtlLSjDpUquDSxKLEdPRy1qu/WBaS8bAktDkXipQBvtmkm33qiphOLDDyDMpet0J
	axlZId8Cjb9Gfb+pY0d0yxEzsPs3h65K94f89lRiBzjzX3NFlrNSxeChQ3T7urH2xckOKb4vY0GkG
	o1PdxzzBlKjAjOnb5oWTwXvJzms80zXkaK6EfQQsSDrflrbuQIDkqsqhAK5IOqyJ+VbKDSY1zgUEL
	o/ojDHDgs+YJAf9rk4bmtMu6t+LKcVdxUL8cVrYl/sQaFl73AHMv9T8LCcvt4zgaT+fXHU4Z66l5C
	VzN0CMVF99fi7rSeTywA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebj0-00000005QTz-2cJR;
	Wed, 23 Jul 2025 15:49:46 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebSY-00000005OIG-0c2l
	for linux-i3c@lists.infradead.org;
	Wed, 23 Jul 2025 15:32:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/aKnklbYObhmtrEm6kD0bwIeskr5GjqiGiuWtcNiMtKuN/atIgxKveTIhZ2WRpUfg3RAnsbCjCEsJnl1j6HYK/0F2xhzHRKGrDIaYLz8hu8OLxrnB9Maphev+RzrPE/gNsP0sX2meqX5/4C/KhPJw5Z+Y9AKcKEt1cWFso85y6MxdGO1ohSLw4qPO/Qg6DYeLGGxKUYysIZLoew5kwrqgr8eSjHyEGLN4EiksgaOUw0CNMsh4bZ8ZCyARtCGkRrArq1mvis9ZI+Mm774r/fmXhDaaIdDGIHyEdu1UHeMUVbQXCrGFgoOisN5Isv9jmBmTPsYvDGwwrDTsvmSQYoeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zY5S8g2XklxySR0LjHRxmEXqqPO93tw0NMJ6Wyh0Jfk=;
 b=XLLJWDJgw15Dt6oOjj5ryWnz87zrjshVOwUdd85BtMH6NNvyO3l99Kmr/Kb4veWoiGkODeZ8hxSM2tnYx2j/Pdqv7pznKdrex2pNi/Jg0yuyq338g6+Qq5kWUxKu5ZROHzgUm+lax8m/PEbgFSKdEbPCRF0aw3DLqeaKcddsRO+h+9QBtqMMNbdfdjVwpUuaM7QF/S+Rj/Oz/KED0fhm1SLLarnCpPolmbhd0vruAvfsfGIaKB0pxvx2rrBJi80GeFtdzoVhdpzi05qVmRAoiHl/5SmkGG91u3JyAOnGky3ONh8eGahzmDZ79zTvk3WolaIOKAWpzNnc0Kkb9ROXrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zY5S8g2XklxySR0LjHRxmEXqqPO93tw0NMJ6Wyh0Jfk=;
 b=m+ougEJClQ1EqonTg/S+V5qJcJkbdv1TSS6nyDbsHw1tjmTw7rowTRxWI4gDy8fYgIB4sRNYNCQnLHU0W7UBTy9E3LKMZBQfBUtyW5kniD5CqiSMi6coiVvNA9l4mJaFcYccxfX/YtatmCc9f8YeK3ev3RKW3KWGdPSlK2mfR/jakAl2Thq7ur2x3mGwPB5sO6yI+WEvWFtFTiAQ7JyWAMrZG9nwvIeHUstPUrze/1GWQEPqTiUWd3fGYz/qw42iIBbS/ovefXm3C9wRaGET63YWFPukrH/a+iQLwblnEShdmXk/vhTb6iPSzS37sFva7UoGzcbEWR1rsBXxN4bGyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7798.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 23 Jul
 2025 15:32:39 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 15:32:39 +0000
Date: Wed, 23 Jul 2025 11:32:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v4 2/4] i3c: Add more parameters for controllers to the
 header
Message-ID: <aIEAk3DF7Ez7NFwK@lizhi-Precision-Tower-5810>
References: <20250722190749.6264-1-wsa+renesas@sang-engineering.com>
 <20250722190749.6264-3-wsa+renesas@sang-engineering.com>
Content-Disposition: inline
In-Reply-To: <20250722190749.6264-3-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: AS4PR10CA0005.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: 394978af-3a7a-4f63-aa67-08ddc9fe283e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|1800799024|376014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UzzzJAlCI1Xn65RdqW4aE9lGb1EKEJioOihKBt1IdS7lW6WEevYKPIy1zkpp?=
 =?us-ascii?Q?KjpNbjzhlFbM6l3diGKzeJomVfh0o8mtJRrDNdt/jDCp4m/OpoDZ7Yhb3HCh?=
 =?us-ascii?Q?r0+K3eDxcH+srdAv07+NrwL1jLsgqEdre1Paf73rxJmctgtsbQ527XUwxf41?=
 =?us-ascii?Q?StJ37y+MGi0IxSeN67JoIaajvV3DuXsfe+g3gSsV7+Nt76g3SIEXjUZW1zbU?=
 =?us-ascii?Q?5AJCdE/vDJN4BrcDzDNgvvPXMgOpy9Mqw71VXYdYvmaOSBQ3ct1IfV1UOX3l?=
 =?us-ascii?Q?MvWJowrkcqp4IFHDiOzpgLj+2LLMoC9Mn2LOA2DMbgm89lXlCpFaBDYhSWfq?=
 =?us-ascii?Q?c3MALIsTjVIcn1ggcRbl9eTck1MmYztCfRe/Yf6sCso0F/C9wEWfvo29YLiQ?=
 =?us-ascii?Q?PR2zne7kBDEeNkXdnEq91GFwA6D3/qtJkdjDtwH6swQf9a9Pp1n7HbNz0/+4?=
 =?us-ascii?Q?RhMZs9mvtPAAJ5aezPdqUQYUbOJW0/Yx7bhelogel39S29kpFe+1gOLs5Hwe?=
 =?us-ascii?Q?DZwFDJS3weF4lr8bZOXIvbVS/hMYPzwCznfaeSR090lPNRFY2EFHyzNC+mA3?=
 =?us-ascii?Q?WFOLP+s+YYTCOUe4QP8CHzGwXfUOAMej9HVSLcdJ7o7WQFa5jVRfn2dK5zK+?=
 =?us-ascii?Q?ZRsJeeI+SYrBpWgnAL8bcWsr6u9M88Q3PCKrDx8HjEQAi/cnE2BTCWQTOCtj?=
 =?us-ascii?Q?UWWaGzwtg03N7L2yBwF7s4i3Fvx5MUeB5q4NRrQ/sElRxN7d3HdlPC5YYxyh?=
 =?us-ascii?Q?nnTDglUjejtDKi2LdhYtBk4Qo0cMPzSO5PCdc9dy0KrWP6/qWo+4xBeNBw0e?=
 =?us-ascii?Q?YiqCNCuu02XGfHUYPL8dwJQ0ErMHshvHWsE3cWm+xlfKKJ3E4OlT1odskZR+?=
 =?us-ascii?Q?FJChCrky8aIIcqw7q51qCOfBBL1rJWCLF/fC9+vAaLooNlDDIsqevjScVYHb?=
 =?us-ascii?Q?+EEFeJrpGk0CZwelhzojfQjeRu6wn43nzzIx9SkawIxEPw7WiD+7yXW/Zy9B?=
 =?us-ascii?Q?9UfO7jXoy5N0q14xDuqSwW9Of9zsCRjOIbhahdfaMaBjlLwjhL1vblp15TRb?=
 =?us-ascii?Q?yngWxIbsmUSYdTkaZSipCwTe7mg/79Z7xspG/OHNBOuYseVaI4MKZ9qc1cWW?=
 =?us-ascii?Q?pH6Ht8ezngbEHWIgV20qsD0YcEW9hZpeUgmpTDX7GJw0lJ3G2ipmZ8YdtuBg?=
 =?us-ascii?Q?FhFwgkAO3t+/tCOMs3qwBllSLn/dbr2KT0Td+fAEq7p+UVwouJi6++ymN7ES?=
 =?us-ascii?Q?jOC0FHtYZZ8oDp5Ly2Rlbbqq23vXXiFeScZUSfeb82SPmvkAqL8Q0runl0Y/?=
 =?us-ascii?Q?e6b2LbYTBZeGezLOCm58pIQzWyE8dzqDMb1wwfjzPPMx30xzR2235Q3fMnab?=
 =?us-ascii?Q?9e50bq4OmoSB+To7/2amGVJ09P2lOsl0fl6IZ6n4z0VTvxDnokm6HBU2AHaV?=
 =?us-ascii?Q?InJI1y2+FKkKFtnKWHN11h6keZ4Ot54MeDu249eRh+0M2o/yI5/04Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gYag+hRWALkk7IAVEr1B6PXSLQAEaPP1uqhdIOp9LKpQ6Var7VIVInLPwbLI?=
 =?us-ascii?Q?kGde2c5/TAEvIMuAIx1LMHs0F+I5j0ZPBK60WT4RVQkkFA5nXXMl10xuluJu?=
 =?us-ascii?Q?x7Rf2iN2doptmImP3j8RUvpLM2NFp4ADz7w5gi2kZ/Q6jvxvl9JF6DfumHQE?=
 =?us-ascii?Q?NKxJndn0tOGZn5Id8oW8Ke1aDvf5gU/O8J1FzAjc1OInuswGcLK0LGIzT/+c?=
 =?us-ascii?Q?dtCUfBkcV+H9LAa+wQCopzzKc5usOMSNyy6a81kGzdRr0kRagBxkt5aqQ79t?=
 =?us-ascii?Q?cVDEftZTgu/Ny4Miwh3o03HZC20ah45py5X9LsDtMpHB5bXdXQEjImjDQaVI?=
 =?us-ascii?Q?3BsNu3KHGK0dO/LWj0s9fgbQ6ChBxNIu7oOvriPbR7JWQDz2M5g9P8tjuJpx?=
 =?us-ascii?Q?O6otOeFbbKv18NygukZkvR2I7dwvgY2oa4BL2uO901gIt+ok3RK6D6Tq5WhB?=
 =?us-ascii?Q?e1xFP6igLQSent8DYdaXZIElJ3qoaibesvX7L1zaptAtLO3YZxfiYtszu7eE?=
 =?us-ascii?Q?PMhmo7QpFejKrEzF99ErU5MPd6Lg/M6a1CwWlkJytHYXucuifkcs4kTSNE6S?=
 =?us-ascii?Q?w5jau5vZuNgSvANTet6ORX/S+g//oSJpZLMkRqI7M9FfqUuc0A47W4qwr8cg?=
 =?us-ascii?Q?RplNBs1+BG9EB1Kv16kQ3AvszW6Ltn73HU0ygPSCnY5DoUIXTHBoMsZnD8Zz?=
 =?us-ascii?Q?AiHkbUTwtlmIvVsV6iwwSAB8g8xOqU7O3GOfQztkbM3dSnnySm/Nm5wr8/yc?=
 =?us-ascii?Q?0eMJwZrGEP+JZ4RWzIvHWfVH6qjvXBLwTuFfGRvPK7655mfv4AW734jbfqNr?=
 =?us-ascii?Q?/lew7MUs2WPzH2dYTpwnM2bhycjN42/j/B2dk6MUVyMKhmIBuWYHFRh5Wl8+?=
 =?us-ascii?Q?4obBviWVjnA2ovntwwwQCdLOiiGGgwivVhZIec2M294SmSKhiLQdno2BOMrZ?=
 =?us-ascii?Q?Q9uJSomfgKukCUP3JlMYdUUWLE1899mpFbVABIQ7hSkcNQBXL4Q2y/JjqkWv?=
 =?us-ascii?Q?uEdVkTRgHunJLnLhIsHwqBGQ+9S8SsMHWSSonY3f4gccEjSz9i769NXMEcFV?=
 =?us-ascii?Q?/ss+51sD/uNghsuhhAPzgsYv8NicxdpEU3uGciHpApW3DQw2EJU33o71HOpy?=
 =?us-ascii?Q?Td3hyBiCbZQ3uoXbOS57+rHvL0MrexGVfrpfRvWtZ4wnmO0IA1ngcNRHljhf?=
 =?us-ascii?Q?hkPXSHDS8l/F1rxUUGJeuRRlBDv3FMfO5O01Uif0nWjTwnFJkaDpyFrvrQN/?=
 =?us-ascii?Q?kXY4j+9K2HUMloWTkU+ssAHmhW9mQRXgQUnms9TRpR+j1g94gvkjDd+Q6tT2?=
 =?us-ascii?Q?Xv2aymY+RFhL7NLY+P/rcZbqJscTIRpT+K+5oNwxXF/ztxK+zuXrET1QjINm?=
 =?us-ascii?Q?6eLNQuVW/5nb0XkUOU6tx5qH98FjV+HcpUb0W4f8d3aHEEMMpSCmXEg9isGx?=
 =?us-ascii?Q?qQ4pVSbvTAI8rYybwgaammLLDt22tN8Etfx3gfZgf5siu8b7GyxnngiHhkSV?=
 =?us-ascii?Q?0k0+KwRer+HsByIMI5CWR5Km/d1jZJOuChujEBIJSNV1wzqDGWP3MuB/lNWz?=
 =?us-ascii?Q?ephCpRNTzx5IHebrCv2YtuHPY2/neicma1i+Hq/f?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 394978af-3a7a-4f63-aa67-08ddc9fe283e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 15:32:39.2091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXQkjxF3sa5V5fTWGxZS9C00oE+3qaLTinzcS91ZwWP9sEc+Dk7gXOljNUi4cTb8+KyZycNSU8z4MDXAOHR9yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7798
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_083246_204063_78CBBCF5 
X-CRM114-Status: GOOD (  14.30  )
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

On Tue, Jul 22, 2025 at 09:07:44PM +0200, Wolfram Sang wrote:
> Add standard timing value defination from specification.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since v3:
> * Reworded commit message
>
>  include/linux/i3c/master.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 7dfcbe530515..8375bee69817 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -254,8 +254,15 @@ struct i3c_device {
>  #define I3C_BUS_I2C_FM_SCL_MAX_RATE		400000
>  #define I3C_BUS_I3C_SCL_MAX_RATE	12900000
>  #define I3C_BUS_I3C_SCL_TYP_RATE	12500000
> +#define I3C_BUS_TAVAL_MIN_NS		1000
> +#define I3C_BUS_TBUF_MIXED_FM_MIN_NS	1300
> +#define I3C_BUS_THIGH_MIXED_MAX_NS	41
> +#define I3C_BUS_TIDLE_MIN_NS		200000
>  #define I3C_BUS_TLOW_OD_MIN_NS		200
>
> +/* TODO: Document a reason for this value */

Todo? Can you finish it?

Frank
> +#define I3C_BUS_XFER_TIMEOUT_TYP_JIF	(msecs_to_jiffies(1000))
> +
>  /**
>   * enum i3c_bus_mode - I3C bus mode
>   * @I3C_BUS_MODE_PURE: only I3C devices are connected to the bus. No limitation
> --
> 2.47.2
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
