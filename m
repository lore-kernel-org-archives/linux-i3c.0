Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC08F36B9A
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Apr 2026 02:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKfYaFDqpIm6XXgHQidZZrXhKXx8Kkpgug5WN7C+J70=; b=p9fewifHpeH3aR
	v6wFi2rZS/PRFLgjMfTqJPwlUPWzxetlNf1rYEsE+zrLd2ERbwE+w9HGMfUds7FaBRnOJT7en1Wjv
	fPUaJiqsuSUpM8oT7TLQsJScEjmeMVoNePib3ELUJb9RmPe9FJkUE5c9+v7haeYDx/iGsdaJdzH3R
	ETN40kga+V4x14EfIScWxBNRp03Qgi0Pw5yUq0NYTc2mTeaFrjTYT2h9EC5/xnTie7cXRgBtQcMSJ
	RL6PIGQphA8vvj/KwctyfbJRi9Ddp6hggoKleWYsoEMDQrytU4pWDIH6z5KIJA5wG40SU0Csx5eC/
	px6GpBevA46dZRu5b6vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB1s8-0000000BUMC-0wGR;
	Fri, 10 Apr 2026 02:45:28 +0000
Received: from mail-francecentralazon11013048.outbound.protection.outlook.com ([40.107.162.48] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB1s5-0000000BULl-3v7p
	for linux-i3c@lists.infradead.org;
	Fri, 10 Apr 2026 02:45:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ByMqt4affx37Ivb1BG5362WR7Kvn3U45FMGMsCvzh+B/dZUTkesvjjdKRfNmT67XlBMkO4jShr/sYvCG2Z1Hr7B18/qJMNTWLHGbxox9OnDb0NDem1ekDSz46h/kmtuKtCK6dhBth+HrIzwoiQnPFm0Hu/rtYixnQIpqRA9NzhUy5KEaTZb3nY/6SsFTgE/prLJ3W97wAqhMjnO/+2aQWWsO560hL6tPqxTbwKpea/0ze/FALyaNaEYiiHcJAh2ptFAezpXJvEDoboPwAqauFVH7JWPheHKGo+WQpGpzgT3wEpHP0o5YfvzW4pVH1UzbAN4tMesU99H6B+nsOER7DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3Ytb0zM0Lhmnx46b9HbB4vylqv/7U+YkcVHlh8brDc=;
 b=kyUa15edvmIX4smftz57cjPq5UO/VlVsl8wUhPxilfcdEfpC6Tto4V2Z6GSPhZUD0l8fUx9KF8IGPSOZzkP1thqSFV+r0MaGnfF5OSciAYASHjogAMYqyPCX1Yt+rGojrcnrP2aejGwladysrsTh2yIYPqH7bGzkM+RSyBAO54wwWdFX75KZBP4d3bV+th3l6HPNxLxbq8eIFqz6MJhgIOkyX01W0bYRBTKZoRq/qGcMogdDeQvl2+JsWYUK49f5N2u+KlVyVPAmSTjmtQW6AhC+8vP3ON0S6r8rZm2q5ZZG8H9z+VDhWqk6ScgSDZpC7wmJnezqrUdAr7PgHIJ9BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3Ytb0zM0Lhmnx46b9HbB4vylqv/7U+YkcVHlh8brDc=;
 b=Twbw3OdJ6Td/H3GhzgIbKo0JUgQeye8ThhMk/ctUq4FiQpPr5BTMZCcz3pc4eKyOalc8shppolu68dLwr27uTngHKCVKuFELknyMo4S70ep5j3SRSArQQNNsaMQUDG1fD7ttvKT1GLqVa363LOfQ+uCEk5FOpDymqAc/J0Dg3CDnVhZQB7BRQ0do7YQuOGms7lDO9mQvkPTB0QB2tyBuW0fbOpboEaVkHkXFiOHtyoFh4imBTm21LhPo1FCo57KRcha5ohkbM5f6jxnNGxk+JAfc0GIOuaF0P085ef8KclbbJhQ7oS38YP7gStxickS7Ugqx1pCWmAooELNSO0XHoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB6952.eurprd04.prod.outlook.com (2603:10a6:20b:107::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 02:45:19 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 02:45:19 +0000
Date: Thu, 9 Apr 2026 22:45:09 -0400
From: Frank Li <Frank.li@nxp.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 09/13] i3c: dw-i3c-master: Add a quirk to skip clock
 and reset
Message-ID: <adhkNYQW73yQ728h@lizhi-Precision-Tower-5810>
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
 <20260409105747.48158-10-akhilrajeev@nvidia.com>
Content-Disposition: inline
In-Reply-To: <20260409105747.48158-10-akhilrajeev@nvidia.com>
X-ClientProxiedBy: BY5PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fba2a9f-f7a7-4898-c3ab-08de96ab3461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: KnGhGMVwv86MhXAGPZOrJeFf1ZAc9sld39J4Sj0IWwbu0vaZO7AQh6yLu5eXGDsv170GRrH1VkgF4tz1FQ36FuxkXhKQJER+H991k4r20iev5/UVUKZm/50ibRDQ3jqJbv1fG5CdyZRlT9tFv5KNaLcqzjkWwer5Z71gIlWhH1lDq3gE/iAqJMqqusoSlAqe9MvbXvwCUVlkdvU0hnZ1Rw0yEuqUw996S2VkleF0x5SqmQ9SdKjkE4fmy7XmCcbxtVztqTEXL2j9Ig3XggoyP1c4Ar4DwUsc8CWRiQTUPoyROt9H1bDnWZ5KR0lkJueJdKm3qIQJ49Uhmsve9h2UAfsXo/+LTnqFAY9w7hn8UOc3TrV2Ra//+mZfYWvtJvRBbvL1lic4r3g2W0vjLmz/vtPFrR1nYwxYqLJvEDAip+VYo0QWXb9NLVOrtjmFISoY2SyVtEn7gx65r9w0H1BlVcGGiAtlOJdgP/oDI7X524cJHvgadVJgyLtD8L8VQg2HT1C3RaDiMyWXNLfLTu0mwLZO4BK6dTIA6+k7bPymo2LFZyvip7DNkx3YBPDtDQRCCZpT0igpX7qVj1HY//80ZZmmhwyO1zwUGe9+4/FC5f/RGVcUCdgcGy6p1xGQTVLe0yJGPUN1UBqye6dDwyCncA7CeR26hogd3Vo0aj+0OBgDlPGZgsMa/JITCht3ZUxzlTKQTM8Eh9kG80bDlhzM4WLFHOodLhuT8B/m8WUjEXZieVYTbjG8xsxNLeArl1aKDnpRMNbAf7DfQjVY4CZ6IesMqW7cUt/cuEdmTuNciD0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5oBg7IksiezJ1hbcYYGIOJaImDOaJLRrANxOwn01uy0yVjPXcjg25gCNl67i?=
 =?us-ascii?Q?6uAJ+IVpHeRLY1VUMfXV95gWXYN55IQl9uoDfevsrNHq1L6+LktMlcbaXYGG?=
 =?us-ascii?Q?nRKP+swL79uRmZDGQBvMyXKuxrInM7NtPgdfqdsBziP/3EeuUP9LvzGpLJBW?=
 =?us-ascii?Q?rLV20JFQU7rWQKAQ3pl8ysga6rLX8+HkGs+qIKPAluWv0hqmXyarqjsT08GP?=
 =?us-ascii?Q?T3TxX+HoWqFVzohf5vBx0j7Nb9cEJvL62SKNKHAPMh+cVpr10sHgkDFhMtmj?=
 =?us-ascii?Q?wp/DjKitfAEdba0vGZa2iPVO2zGdJke+JPtc9hY1H0k1c2Y0Ba8yxLwCqk6v?=
 =?us-ascii?Q?6cE1GTI5PJImmklD55ggGP2mfrH3uWbCGXR+FfQjhr4IjcnVL4ssKgKHBDeX?=
 =?us-ascii?Q?avn2zDaJndagTtPQdFcopTzf6V1l445spiQV8ciVxn3jz7cPllaH4LFtf336?=
 =?us-ascii?Q?YEe5NiGJCN7SP5OmphmYxT7F4INq7ym2yjTPIWlTQcYWVoF0KEUYYipGdMYZ?=
 =?us-ascii?Q?ynT1ixIGgn28pJpHQg3dBlox4HhzzXXN9jn/af0Pn6HMiaxrTZfpxlYV2hgK?=
 =?us-ascii?Q?4eZhwposQwsL5UNRAHj7NuyWS6yp8CJmlaq3Dtpn9n++DneBfGzl9YYe4kf+?=
 =?us-ascii?Q?cBfGB1opwE96eHaCNFEjhbdn7I2R5IfYD9/IG24jtXtuyQ05xvcCIrVDNgaT?=
 =?us-ascii?Q?KnB43Sgf7EhB1Xf2h8BYJooWm3i1UEmhVEWvJepfi+EfNjHp2KUUWbyhJUmU?=
 =?us-ascii?Q?syRWFxjIxECv2LblzYppm8u8Rsz8cjarkTdZIyyD4zzCPXCIq8ykZthBTDUd?=
 =?us-ascii?Q?Ia/MenOXqEIXr0fvOX41ttGP8m7A4866N6uS+sWF6pmycqiOB+5RXCPGrMrH?=
 =?us-ascii?Q?/B6crWnf4AtYattaVpLSXmo0b5zgw9bW8Pk6EMcMDBM5KzFNW5HNVgL5Ahu1?=
 =?us-ascii?Q?+jAQymeDzMB2v5O0GdCQVOja9XhUu2g7e4YQDngfxdBm/my3SeFXGvX6RqtF?=
 =?us-ascii?Q?2imuh4txWCBsfTe/c2hdgN8euLOueXAl0+3g5j1X7MufA7Hodw2ddKu12ZOl?=
 =?us-ascii?Q?1Mt2cQxVM3HbJf9ZW4cjHLiS8lfiyfwPcIH+5M9DLOx7DBQTUdLzqWf6UpfR?=
 =?us-ascii?Q?rIeP1TWKvzxLYhSX/nUeTMT71bpm4Kq73KSucU5usCWxQgBe4nCjwZOJYxG0?=
 =?us-ascii?Q?BlciZoCbcVj7dfut0vOOYL3gFtDGVYTAp9rqcmOC8E5q7FdgzR7WN4+5DPbd?=
 =?us-ascii?Q?k5ftZotpkMYDsWXTdH9ZAcPp7QOgYNf+XXk5/JUNYbr7SMqW5W7QNdLvtFdZ?=
 =?us-ascii?Q?8UiB8erag9nh75bdhCJNB55fqJC2u5SiXK49QjJ4lvhvu6RuEu1hJsJGd1qA?=
 =?us-ascii?Q?dwWUYen/SbmEuZy/y2qUtWmRf7Ug1OALw4BJxhPLS59yU1iwh3tZozQzZ/S7?=
 =?us-ascii?Q?NluFP4KoELcRePrO7gpzlqSJfYxUSEkLGUEAcyDazI4rVapoOyG2acKDslp2?=
 =?us-ascii?Q?MMr/xftIjJKjY3Ew6uazdBWDhj4PmEwbC7u7ijR7pPkAmSnSE9FyBmy7xsbU?=
 =?us-ascii?Q?PSmRb9MBjVKMsY1vLjeQpxrjOHBnWPFeDsSe29wmnMU6aleZ1Zjbb09ELPii?=
 =?us-ascii?Q?IGUeSAj1IY/nGMwGiiG5FDXLtze0u1wO7n97zG1vUMtDsJRuc92ngifeAwiI?=
 =?us-ascii?Q?xbp9X2TdoCFyd8XZy8SMx7GFprPCAINU1oEWkstL+OQni/uduQqIgo2tQ5qD?=
 =?us-ascii?Q?Qk/dRRVe5A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fba2a9f-f7a7-4898-c3ab-08de96ab3461
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 02:45:19.7694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWfVVYVHeiUoSxQAp6uHqOZ8cqGtxuhefFqG/kje1xx88CnF5q1HBmX8s71b7oaxoBEvs2egfWzuxFHUQGVg4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6952
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_194526_000526_73BB154E 
X-CRM114-Status: GOOD (  24.75  )
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

On Thu, Apr 09, 2026 at 04:27:39PM +0530, Akhil R wrote:
> Some ACPI-enumerated devices like Tegra410 do not have clock and reset
> resources exposed via the clk/reset frameworks. Add a match data for

why not export fix clock at ACPI?

> such devices to skip acquiring clock and reset controls during probe.
>
> Move match data parsing before clock/reset acquisition so the quirk is
> available early enough.  When the quirk is set, fall back to reading
> the clock rate from the "clock-frequency" device property instead.

"clock-frequency" is legacy proptery.

Frank

>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 60 +++++++++++++++++++-----------
>  1 file changed, 39 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 05ccdf177b6d..a62eec6d2ac0 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -241,6 +241,7 @@
>  /* List of quirks */
>  #define AMD_I3C_OD_PP_TIMING		BIT(1)
>  #define DW_I3C_DISABLE_RUNTIME_PM_QUIRK	BIT(2)
> +#define DW_I3C_ACPI_SKIP_CLK_RST		BIT(3)
>
>  struct dw_i3c_cmd {
>  	u32 cmd_lo;
> @@ -560,13 +561,26 @@ static void dw_i3c_master_set_intr_regs(struct dw_i3c_master *master)
>  	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
>  }
>
> +static unsigned long dw_i3c_master_get_core_rate(struct dw_i3c_master *master)
> +{
> +	unsigned int core_rate_prop;
> +
> +	if (!(master->quirks & DW_I3C_ACPI_SKIP_CLK_RST))
> +		return clk_get_rate(master->core_clk);
> +
> +	if (device_property_read_u32(master->dev, "clock-frequency", &core_rate_prop))
> +		return 0;
> +
> +	return core_rate_prop;
> +}
> +
>  static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
>  {
>  	unsigned long core_rate, core_period;
>  	u32 scl_timing;
>  	u8 hcnt, lcnt;
>
> -	core_rate = clk_get_rate(master->core_clk);
> +	core_rate = dw_i3c_master_get_core_rate(master);
>  	if (!core_rate)
>  		return -EINVAL;
>
> @@ -619,7 +633,7 @@ static int dw_i2c_clk_cfg(struct dw_i3c_master *master)
>  	u16 hcnt, lcnt;
>  	u32 scl_timing;
>
> -	core_rate = clk_get_rate(master->core_clk);
> +	core_rate = dw_i3c_master_get_core_rate(master);
>  	if (!core_rate)
>  		return -EINVAL;
>
> @@ -1600,21 +1614,34 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  	if (IS_ERR(master->regs))
>  		return PTR_ERR(master->regs);
>
> -	master->core_clk = devm_clk_get_enabled(&pdev->dev, NULL);
> -	if (IS_ERR(master->core_clk))
> -		return PTR_ERR(master->core_clk);
> +	if (has_acpi_companion(&pdev->dev)) {
> +		quirks = (unsigned long)device_get_match_data(&pdev->dev);
> +	} else if (pdev->dev.of_node) {
> +		drvdata = device_get_match_data(&pdev->dev);
> +		if (drvdata)
> +			quirks = drvdata->flags;
> +	}
> +	master->quirks = quirks;
> +
> +	if (master->quirks & DW_I3C_ACPI_SKIP_CLK_RST) {
> +		master->core_clk = NULL;
> +		master->core_rst = NULL;
> +	} else {
> +		master->core_clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +		if (IS_ERR(master->core_clk))
> +			return PTR_ERR(master->core_clk);
> +
> +		master->core_rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
> +									     "core_rst");
> +		if (IS_ERR(master->core_rst))
> +			return PTR_ERR(master->core_rst);
> +		reset_control_deassert(master->core_rst);
> +	}
>
>  	master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
>  	if (IS_ERR(master->pclk))
>  		return PTR_ERR(master->pclk);
>
> -	master->core_rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
> -								    "core_rst");
> -	if (IS_ERR(master->core_rst))
> -		return PTR_ERR(master->core_rst);
> -
> -	reset_control_deassert(master->core_rst);
> -
>  	spin_lock_init(&master->xferqueue.lock);
>  	INIT_LIST_HEAD(&master->xferqueue.list);
>
> @@ -1647,15 +1674,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  	master->maxdevs = ret >> 16;
>  	master->free_pos = GENMASK(master->maxdevs - 1, 0);
>
> -	if (has_acpi_companion(&pdev->dev)) {
> -		quirks = (unsigned long)device_get_match_data(&pdev->dev);
> -	} else if (pdev->dev.of_node) {
> -		drvdata = device_get_match_data(&pdev->dev);
> -		if (drvdata)
> -			quirks = drvdata->flags;
> -	}
> -	master->quirks = quirks;
> -
>  	/* Keep controller enabled by preventing runtime suspend */
>  	if (master->quirks & DW_I3C_DISABLE_RUNTIME_PM_QUIRK)
>  		pm_runtime_get_noresume(&pdev->dev);
> --
> 2.50.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
