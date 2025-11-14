Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B61CEACC4
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 19:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNZOqvcvbuPhm4fl+soA0hS0CmY+8x+hJ05wnT/LTL0=; b=ucUUEnAV3BuJUT
	hD6ScJkskyFsA1Qu3W9NuE359CyzA3Eke1y630WANnSvwWN4xeHtJnacygXzLO+DN5YQjzEdbu0Sz
	32AaXu76Xa9vfpaDF9Mo4m+0GrjyBQ9AWPkYFElwVpRYTLSBYjY635vL5MgXZ1KWMOzHUkqpnTQZ1
	TygDaOn7Ly5+FlTzny4Un4pxIocEpgAvhKT5h6uZOu8zjPMmlZZ/D6Jw6Dv1nrTLhLTXfeODL1L0h
	33cx8gYzX1WQmcGv7BVfIWFzyvczDwyq1ME4L+cSgfrl6mm18LfZXg5EKKsqHD2ERUfFzf79NXxAa
	7q9qKHlpoP+oErb4em1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzii-0000000D253-2h3Y;
	Fri, 14 Nov 2025 19:44:32 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzig-0000000D24G-49ee
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 19:44:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idAbc9JcuhuVoGt8+QCgL1piPZezTJCnp63p493jvj0cWR3yNhK7ObUKNAKR+/rM2DTP3LNdRxtCk1N+UcaqPV0cS3bKrtnI6NylZ44XtcI5xBj2ktXF3L6Ccmsch3zdIUddSFqOUwvQ2Qb0HJpz2sJ0jlXdAxc/n/EFm+sle8B5Vf12rblidE7tmvrqqkwrJESxC+SdZmpkZmoOXDFmN8zgy925BfjqjQEz10juwgmjFISwv+iCjOvlWBUrh3cerCm60dC54edTblyUGlQYrmODuHk27sW3giTwgbes/t+/aomver7CfINM/mB/SqWp+BwHrhQnHFrjjZbCGhRO3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxvpH4nP8tgrvyFvGPtwVmLGqzQQCZVxtdL51muDjPY=;
 b=paSi5M8+W5G4IfjXLGdNzo3ZSeOf2+/lykfIKf4ZnK8Ot+5cJ/Dy6YNI+70LuFQf67xznPZVHeRJjzifNRNxQd+Vwf9de6bAmaLWgkF920x1nAJUWc3M0bND0uuCN3XiNsShQkQJ7AZ9/KSe3vmlIreb1ov3UR2w2oBj3AlaTavE+bIWX8kk5UQ/+59CK7IfyM6gAId7NqxaHLCwQdZ7/zGqe1qgQVp1Sk9OtM90OQ45YEmvtwLM06vOtJrYfOQbZY7bXeJKB2T9lGYapyO3KxowINu1GDyX+nJjb5eT6p+5AmCQ/ZHCDu/uJIxGk0fNoIbqvuKCnAUiH+/wy5YSEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxvpH4nP8tgrvyFvGPtwVmLGqzQQCZVxtdL51muDjPY=;
 b=Sb6fUidSbuKrHQze96MAPJRof3Aifpx6qnyzPwTlA3LVkjq8U+MS+axYiSkadrHuPThhuDTPfscWOje6zL67cgDHtw7lrL6oZdAn32yOul2FtgPDXK8si5vxA9bLfCz9MCpHXRISDDCXJKfxcer1APhsDRfKR1nGZfjJu/KNDNlA9GGBElGn32mWPUHKvcItm++YSHwPIbs4advt8BMY92+BMGs65CxZTkjMeAxEJGQv/eE6pwAhr5txglxhnkgh867cG9CoytNehR+cSxvZm8jHbbDF9TbqtiTmvqYaNEhQNKFQ756S7IB9dGic94XS8iQbSDo2DTy1CiHJAzO1Kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB8475.eurprd04.prod.outlook.com (2603:10a6:102:1de::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Fri, 14 Nov
 2025 19:44:27 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:44:27 +0000
Date: Fri, 14 Nov 2025 14:44:21 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 03/13] i3c: mipi-i3c-hci-pci: Rename some
 Intel-related identifiers
Message-ID: <aReGla3EQGq+YAHI@lizhi-Precision-Tower-5810>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
 <20251114181356.66515-4-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251114181356.66515-4-adrian.hunter@intel.com>
X-ClientProxiedBy: BYAPR08CA0051.namprd08.prod.outlook.com
 (2603:10b6:a03:117::28) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb86bd8-2418-4cec-af00-08de23b6389b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cVLe72VeHPCJZpeJmphRm350yv/Du2N/3NTQFdJhlpzRMNt00FNWEIStykpa?=
 =?us-ascii?Q?XvhzS8R/KA4o2P/QFrb/dFd1xgYTC8RdbgwTRjZcYDlc+vSZQox2Shg3tqsR?=
 =?us-ascii?Q?Q+wv5OAgGaY7iPbgSBDwWHcamneA8xuVXJ30csczW2T4oBFlZnN4SqJxfXfo?=
 =?us-ascii?Q?8zfxroC6tMzrkkKeU8tkZPgJZX3b2rhtIu1U+jtuE7BXV/cGB8C1E3XjvLaC?=
 =?us-ascii?Q?M9mdpbToyEg/MffQXC2tqAHxemb+B3WfCM7MfoWgc5Qmt5+Rccxi9QD/FMlt?=
 =?us-ascii?Q?Kzh1H1VNDI5vVtuXE5ruYtkUGLMsdmk3MDEeMWJx0H29HIRt45Oqyvg7u1wQ?=
 =?us-ascii?Q?k9lILTEKyEysmLmKZUzZj1DhbH+htpdp7NlJhNhGi5InPZ3zKmCXocKFzOwF?=
 =?us-ascii?Q?x2kqFgRerYHaqTqLfBmf1RZEkKzKmSVX40+3X2S53vrNTyiFV/XxD4n//BCA?=
 =?us-ascii?Q?UAnmiIj/tde/LVyzkY8VIlYnv7RtMGctjK3UZg+1CK3JNu4xuKaCE/nqI3u2?=
 =?us-ascii?Q?N7AYgcrdPWVUfyJ/l9nAyiYDExMU7Jv2zPAER+SDx9QrsJF+n2nT+ujtPvr3?=
 =?us-ascii?Q?BSsJIXUUoIBp23AlucHGJJS/o+KF4giR1AKkf2SlFrBt7kczzWqHLz2l3izO?=
 =?us-ascii?Q?oXBRb9MiMjcJEJ5fjb9aIxJHh+fEiTJL3OxFVNMxQBZqsBsfhcilVHublsE4?=
 =?us-ascii?Q?U75LCej91D+hgE36PxF8AExTChRXgHBNzKoMm8QtIa4ApQEjocPvdPttSW4I?=
 =?us-ascii?Q?v83SD7LN0sA3Jvh6Kej6LUww1GWlzVeIx8RWdN5f/xyPYkEXf9y0uqWP82jp?=
 =?us-ascii?Q?K9Y0yKeRZgsxwszWy1LMnLgZHqTkxCndNfi6w55Kg+s5PLGBHqvAhCzQjYed?=
 =?us-ascii?Q?FpzrVEJB42J8bePW2qaun2HVvC5Y9PAlArG1kDxr/sob4ANA3jkAKVF8xm9C?=
 =?us-ascii?Q?i6RmJs9f336JIHsAdGWWQeA5g/z17cHykAwafQZJlNJsQPj8F1YZ3csjG/QA?=
 =?us-ascii?Q?4qVZzTmqKg4/Q02VO6PNdrrgi5AVHAIMCGv8VHf0pt5q/CKCgWYs5Ox+kOa7?=
 =?us-ascii?Q?ZBc2mMX/dyrLuiBKILF1cT41aDN+GuSW1+/hgxME87JiWiJL4HX+0SHo3xeR?=
 =?us-ascii?Q?3vYrBmvYxj1PZvhPJv2IjL4FGqTM7sQIdu9Btlp+mB7/VxEL7zfGk6jYfI1I?=
 =?us-ascii?Q?UmPFbKwITiLZ1AZMz1qY5f5HPSBTCwaZVbWP1zYDW8fSnQZNKx4KfaQrtsd7?=
 =?us-ascii?Q?U1m/ebm3P6OTbaMAlRCLaSnJ2qUj07vGumGkk4x5+zzoyaJQEFx+SsDA+3uE?=
 =?us-ascii?Q?dfJvj3tVAyR9ZTXzWSTy42JR+Fsnmg/2++JHNUxWv2Wm8Mx495rsZglm5kJ8?=
 =?us-ascii?Q?NYW1cqiedQKaqsfiO85mdZUgVYdmjb/SBENMatRoUuebSqwhVj1y0OUQIeEI?=
 =?us-ascii?Q?9vIJ5IkywnQoJUw0wUl38JcmLJJqY1+LzNoK0gu6mZxpVYh0WMDL8CVShuA/?=
 =?us-ascii?Q?E8FD7jQYw4yxG3kFVmH2lFkmlG11NU7ucvCr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wJkPBjcB0+yTIWrYzO7qh2vjYLBQBF7Ey3VVYe9ebyMV/PnL4myjZ1AU06ac?=
 =?us-ascii?Q?+vlhJL1qNXxFJvfYehMXiG0wKepgIPVyKk5EGIpXl1MSWzfDL/mBHzJrQtIQ?=
 =?us-ascii?Q?A7FX0HX0+pSBDOMGQDpF/bdTHmg4Q5FFj2eWLfUIVfcauyeV2n98EOOTdNUK?=
 =?us-ascii?Q?ozGe5LiDB+XMZuLDKEUzHUGr3DXvPnIQjhzDANWCsy6s5E2VY1c4Hawu0arx?=
 =?us-ascii?Q?GkWNixMr1i4SEnImeQ71FzNOC/6k483HcKO5CztyiYAhV5rxvhKZ46sx/Zw5?=
 =?us-ascii?Q?bwW3urwTqYrv+syeOQ8HY9anJlpjz2W61TNh3gS+1xlQMB2tQSKNBXB+iuOj?=
 =?us-ascii?Q?NjgpbB1WgcdQBie94zt2EN3auuHrdr9vQ7VYAQMV6a6LpgH9b3lWdwcnkfwr?=
 =?us-ascii?Q?hQFtNiIWp/QKxepIeHJuXtkdhKtM7UwyZBEwhtb4Wsg6a8u3BPioAB2gkaPn?=
 =?us-ascii?Q?OdxR6j9UIoauQVeAC4YByRidZM9RXODmc3MGXBOubvNpbVDfhzwWGfOrLKhT?=
 =?us-ascii?Q?ELY3CIG67r5CBxj7e6fBB5y8oIN1lf6U9XJBm5VZ6fi0LX08g+deGvP0Ca7/?=
 =?us-ascii?Q?2lW0FPXmQmhRnczMRVH5OK/K5k97rYqm9/lHpF5YCi1g03E8QHA6yqmQTu9e?=
 =?us-ascii?Q?xUIDj/1Pes4OkUGawIwQfqGr4CILhM3Xtr9BdYrO68wU31JTxhJjzo/nW+lw?=
 =?us-ascii?Q?6DzuQXmfuuORbu5H3O+Zd/i8Ib+0umocadK1q/+qmRH9bLCbud/WTt7jtWL2?=
 =?us-ascii?Q?qOBCeFqp9je69GJcMY1GX8xrO9Q6tUX2sijgMq7w8LTbvCf2nacSzRO5hqp7?=
 =?us-ascii?Q?qdamVop4qPUbAs9MI2HrchZzj4o7F0GKWUrSp1Zqx3OBx0NERRutlioGh3DX?=
 =?us-ascii?Q?oP3BPMDpJ7GMIGPV07EFOEbzC9txCr9ZKpF+9BennV7oLgJ+uXljLk3B8KSF?=
 =?us-ascii?Q?JBsnLSIOookoRHNQFIxq9vLun6o8kqSWkLPnQs9bOdliufo8ky20uOxLPnq7?=
 =?us-ascii?Q?msPpa6ZwG2fDakqP1AvQVZAVY6YpUs/guf4qyryhIPL/+ElCE5buQ1BSmzVL?=
 =?us-ascii?Q?ew8fbhmPR9hVNkWTG6BOKlb9jzGB5C9CaFUDyUehI3nNWwzKWUX20/LSiZjD?=
 =?us-ascii?Q?31NOIuzPAjA8pZadNGM4dg/fC3XPySyXs2coR27yIvI+pzYGSTV/6BWpKwON?=
 =?us-ascii?Q?LS1t1Wvutr1x7wsksDDq4liH3lYXfyN4R4yBFqlU981jrNXsUuPCB9dlruh7?=
 =?us-ascii?Q?1Lvb7e7Qm0JKAbCiYU0RKgcNrt9NIi2aYp4kCszMYJyPErs5kDaH5tEXZfpQ?=
 =?us-ascii?Q?5h8l9Ff6ghr53wYd7vQkeXRJo8ErUdGs+TyoYvnfSrlyT6x2UG9OFlLYObgD?=
 =?us-ascii?Q?uQJneobeWwuC2IG+Vg9kQreSEvh2ra8czFyPFyBTFlf7muaWHyyFvp5VYGMp?=
 =?us-ascii?Q?xyvv4C2ptJM60wq2/NqW5GV/Wd+b5InmezCUfkiakfBfu/Pfk0APibP08rKO?=
 =?us-ascii?Q?w274ai8w+L26LermWWAiQJkGq50TVrPOP92GnhS2Pz1w30jJB8TMXPpIuibn?=
 =?us-ascii?Q?o0SJphjk3+j5d5IBF6barJgRzn7HAny/QPUM9C6k?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb86bd8-2418-4cec-af00-08de23b6389b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:44:27.6235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2N1SCchTOnPkZcevZGOZvWGvYsl/9lQyUh5NjbH6GENjVOzSgl0DLAewI67imp+k57KqIlgucbiH7qbcxlL9Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8475
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_114431_031877_AF3E95B5 
X-CRM114-Status: GOOD (  19.42  )
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

On Fri, Nov 14, 2025 at 08:13:46PM +0200, Adrian Hunter wrote:
> Rename some Intel-related identifiers to ensure Intel-related identifiers
> begin "intel_" or INTEL_, and for brevity removing purposeless "PRIV" in
> preparation to add more register definitions.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	Rename 'intel_init' to 'intel_i3c_init'
> 	More explanation in commit message
>
>
>  .../i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 3d854cee05df..d434e2962740 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -21,11 +21,11 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>
>  #define INTEL_PRIV_OFFSET		0x2b0
>  #define INTEL_PRIV_SIZE			0x28
> -#define INTEL_PRIV_RESETS		0x04
> -#define INTEL_PRIV_RESETS_RESET		BIT(0)
> -#define INTEL_PRIV_RESETS_RESET_DONE	BIT(1)
> +#define INTEL_RESETS			0x04
> +#define INTEL_RESETS_RESET		BIT(0)
> +#define INTEL_RESETS_RESET_DONE		BIT(1)
>
> -static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
> +static int intel_i3c_init(struct pci_dev *pci)
>  {
>  	unsigned long timeout;
>  	void __iomem *priv;
> @@ -39,21 +39,21 @@ static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
>  	dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64));
>
>  	/* Assert reset, wait for completion and release reset */
> -	writel(0, priv + INTEL_PRIV_RESETS);
> +	writel(0, priv + INTEL_RESETS);
>  	timeout = jiffies + msecs_to_jiffies(10);
> -	while (!(readl(priv + INTEL_PRIV_RESETS) &
> -		 INTEL_PRIV_RESETS_RESET_DONE)) {
> +	while (!(readl(priv + INTEL_RESETS) &
> +		 INTEL_RESETS_RESET_DONE)) {
>  		if (time_after(jiffies, timeout))
>  			break;
>  		cpu_relax();
>  	}
> -	writel(INTEL_PRIV_RESETS_RESET, priv + INTEL_PRIV_RESETS);
> +	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
>
>  	return 0;
>  }
>
>  static struct mipi_i3c_hci_pci_info intel_info = {
> -	.init = mipi_i3c_hci_pci_intel_init,
> +	.init = intel_i3c_init,
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
