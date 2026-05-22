Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7D4CD5BAC
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 19:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pb1WW7/BUpwKensrMQGDCBqkw8KD+ZDljMiLYL1yj1s=; b=x/JJUZfqbltAZi
	xCRpAKamFNWJ1maZHwcqb1GRDTXudHehO3a8rjs/B54gDdctKsGkmsdUKxsuFA7sK+xqHfsGRoskR
	7R7+3Qm1oJW03fHVjeIC4uANDyFwR3NOsL4fHSTNFDiz9UD7VdRReU+jkGhiAh93PzC8zIuJ20U0G
	6c/FyU1KKWstnURLCrjxpsVZllaEwvgVq66RyAYJpuWihe0fB/Q4+xps3xqL2W2WDewAj6Ds8kkgA
	UtziRcXvzHZ3Pit3JIUyznpdbNUUzZEq5zjKfOnJSZ+hbjgL08cxUg1VNPhiq12UYZqtK2UqdDGag
	rq5odArU/a34aXL05Lsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVGT-0000000BkCJ-1fmf;
	Fri, 22 May 2026 19:10:33 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVGQ-0000000BkBh-2CNJ
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 19:10:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUqoA0klUStYlU5ENHetxCJLy8/mkwUHiInrPpLYL5I1OBKYQnclmu1HK+0tj3m31e9YaBQKeBI8O6JseThJNSHCHlMWczv1Y5tGD8zuZy2Ect9g+MPmEhFiyJvnRyL6aSuf6p1GQwmk5vhQmWKtlhSKZDbizHwGZjPMPP4VqI54Vj1cwr7N7Flw/ofPyU4xQ8JnJnIMv0gK0dWKXH5ElcApCZtD4AoUgFCTMRVtIRej7pI/+JCMZU1RgMKk5uN1f338174t5SdAsznUSP6pcwdCWLSnJp1xiQjk7NDMWosk96Da13EOOqKVAwjB2T1g58LAbazkWfUL9McAPtdJTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oaBJAbcu9VsyullvoxU5arQgp5v+ZdIItJOnIfFaGLg=;
 b=YY/l2ekBW22sjjixMLpKFvQYdE+LEY1tWcLXUx0VfninRyezwHv1+HVYIm3iMUPbNNJM5WtIPBOQMiZ2Q65N7KVWdLsBWLHCQPJgi77wOUiIVnsjdgm4f9YFtFUnl4H83FDhk67jqyRQHP3ROQuas0jwjP8obZW4VwQ2f0uwT/Lmn7lNyiYlLKRY9eVDazeEPkRX7kT9uFcjpko+QoYIUsZJNQ97QMn4H0czI3CcxrLhbQWhrR78Fa7iMlK8Ud6VXIlzGJu7DWtb5N5ZFrnuNiAW5pMGAuu+tcztkzv9v2mvHAED+6SsY0tqJmUMcXCAvaSC38Mk1qE23dIBrNPzuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaBJAbcu9VsyullvoxU5arQgp5v+ZdIItJOnIfFaGLg=;
 b=CMaO/lxxfsyoP7fa0eNUIBiCKKEtjLSqWokhbZMnip6BxgDbv+w04/t/KvUjNpXdhvscn0sffZCm94UCOTRXgJVm4e2mLDgyX9mcLc4fjleelIbq+PzsG4a5Zq2HDokC7fW0rXtZ+Uwej3pajbqPr8POmqTC1IEGcaRvIC3ceiRV7zCCzzqFmlHB2em2fO8Q3m9YLEzU/WS6LvOem7UU4Bh3dXTP1ZS0cuNnlkYeiGkmuNmi1Wlvywj3aCh28bSbxNbcA4RDFzADLM6O2BkLiD7/xNhZEhA54KH227fXUUrZNIcnCfWousgnZ6DZ6hN6BwXTSFjHCQzgJGUVp/0Beg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10300.eurprd04.prod.outlook.com (2603:10a6:800:218::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:10:23 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:10:23 +0000
Date: Fri, 22 May 2026 15:10:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 03/17] i3c: renesas: Restore STDBR and EXTBR registers on
 resume
Message-ID: <ahCqF-OHFbV9b5ul@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-4-claudiu.beznea@kernel.org>
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-4-claudiu.beznea@kernel.org>
X-ClientProxiedBy: PH7PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:510:339::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10300:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d3e2899-7c3f-453c-90f2-08deb835c620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|22082099003|56012099003|18002099003|38350700014|4143699003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: xB3pMAM275+XrsUC7WEFERV03GZFnHDDpeGa0S4Rwu3h/0UJec15oB91oAPEhxIVCUTgkh6lmuiC+LPwaWERDdty3mNXJXU+xcF4G8750YuEKpPE4BCiOn4nk77FlEtqh438G49kywIk+DjQa+TMTDcLEaGKixsKHs0D/g+LhIvuaz5BTdNblI6feyjDbc73yE3PbEhPDIBljivm+KwyULMlhL2NIf/pXFpkpwiDuQCM8lm37z3f/ASxXECJ8tg7rqZChmyz8+OCr0qNqYSOP+ajPak7p+YWTVRqWKgiBbRWOvWvssXxUEGM0WUrAWXuaY3IRQGydYBVZgkNzAzgLVWQgwvh1V8pJVxuH3guxVIowDKdt1Qt/s88u/UuQHPgCaUg89mG+9XVUZDOPi2jdOTmw8lYkFtvBZpy+Vo0nVHSBAGaFsObiwmc5g3jmo1kubX0SGTBieLocPFPvF+SoDSDhmNRSQl7WNd+nflcbjvM+HP2i2khqWq30FSoiy7Rpe3OxEXffnlaXLs3o8pXeenkvk0Q6OpKG/d3Tpe4VAz7hisBmVD5b3syDKM8Q9xg7xHXsaqId0apv4LicfLNXDx0syZhv0RMI9R4JGV4D+DsNrPacQFGxQKni3rt5QSOu62gBBeCiXBsur6hPNNwIeBFf4kVAZlLW0wYS9kfrns6yI87hGgmcvmucscTGmBQoRiJ2ieceJwaSbwcJTlR8UjZVgueHyGMdSRmTq3O+0YM3pIXoW8zDJar9wLL7aeY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(22082099003)(56012099003)(18002099003)(38350700014)(4143699003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qivioheKxHcd+JomhJURlE8gd8Q0P+8m0fnXDcgQHRIocQYfubNnjFs3ikSz?=
 =?us-ascii?Q?+yHrLjKhzgSZSO2ELM1dUcvxX+YtFlqMebUdNKWsULtU1bjTeOYWbiPx4+zg?=
 =?us-ascii?Q?oazq8CAqXE/SbmN8AKdjXcx2bUONZmFJce2FiAzWienmkOX8JsiOaJUO4+BH?=
 =?us-ascii?Q?MlJYFVUwluRIAFLgqlw/jv9y9e3zUROVbOeAd/r8Bi2tCxnaSHw3tBbLwEBI?=
 =?us-ascii?Q?a1UNRnPP4HvAHZPGPOaBdeVzsvXLCyt9SRIy620oXP8IJuJo9q9JvKjdHU5V?=
 =?us-ascii?Q?N/HJbDQCWth6TGF1H4VH1NdbMRYVEeMWUBza9wSNhg/zMS7JWNss7h6oB9yx?=
 =?us-ascii?Q?RojNagluee+yU2IzGMvEXUZ75SpHkZ7wPqj5SAhClZRh0jbx9uXqg8cn4aVH?=
 =?us-ascii?Q?pqkuK/81DQpWZ41yV6eIyhFpdHFuPrJlAu6x0Z9ji9WnbGe7x3nxw3FrslN+?=
 =?us-ascii?Q?fb7pcDiDqdR06GJ2IvSgdAprLevkV1jDgycuXJKwxAkvJ+9cB2eRluUuDLFk?=
 =?us-ascii?Q?FkzFcfFhQ5R4rpFFUloPelX910PbwXK+EtRSKmgxTKW2FrWWMR3ErkZXK3/G?=
 =?us-ascii?Q?lENXn8+0cWtfFux9PWvAuTVfi0ETwa7fMGYtgCARsRYbE5NLNDCUmWyJK/AH?=
 =?us-ascii?Q?jmbrk13yLLTvCwPd6yFk24xXociV96MqFlsGK/YegC8bvsNPMQT6bcvPzbrd?=
 =?us-ascii?Q?9AW/eWUO2VnF9SNr6JNGafKCQ7gTiLPAUc1UynYWgoG+vdQNLaaiNLAhPw1X?=
 =?us-ascii?Q?7G+JntJjkNFIT8wdjl+v+PA6hmTvHgg6b5OetXEnoVIYWh7QdMbLgMJNZUWj?=
 =?us-ascii?Q?aQdntNfwqLCUetHjun6NX5i1igO3YkNL7NY/FSCC99IZYEUWhO/yv5Dt3K4H?=
 =?us-ascii?Q?7qa+m/rZhiQ08sRuQaOzUdfooMcl9jVVBZSCYonNbr5xHpPb8cczdeSNXXxt?=
 =?us-ascii?Q?guJ6v7B6yw0Fxd27QXROBKWOI6eFilN0WQf+K8kX5Sb7Rgrfo4lL25Ho7w0x?=
 =?us-ascii?Q?+Fg/GJ7FPUNj/yP4F422pLQkRXhZgkHowgP0F9LRFrDqwyRIE7XeEJ9m6S7N?=
 =?us-ascii?Q?oPdEyQ6mAS2YMymcgWslny7iRGbUuTbiiB4zsk5YxAKVMPL1hhBdCajS0XK+?=
 =?us-ascii?Q?4T2GY+2uD6EJr5oaxAlgQDq2QG5IgIB66tvoVbndlIbbZI6O79GA1COOKqQR?=
 =?us-ascii?Q?y4jCAaR+G1EqrEpQWoNMTUb6tYMw2eSJDB32aZwv89Xc8DJnzYT7sQhMFPNY?=
 =?us-ascii?Q?Ux9bk7ulGPxw6nQF/58OQihvSCeQ4NGpOxkOFeHsigjlalWvMsmSaWO4bSNY?=
 =?us-ascii?Q?yzwqaQJyx/8NXyP8GBYzm+4Nc6KiJnIDmKfGgMRSz+6KVaFjrddDMDUdyAqD?=
 =?us-ascii?Q?3L+AISM6IJ/fHMKinMDeXo71QrL/0PjmgeKJUCwWGS/Y4RQrx3cYPD98hesO?=
 =?us-ascii?Q?/267nCtpsorokfB2AnbiQpnmM9mIV50Y9JfNTz/g/cZCDrfJWzG59FpJxqDX?=
 =?us-ascii?Q?PvftGAHYoiip6M3tGhFvwH0avBHyor/i7wjWYlcevuDjz1P3PTOJbRP09nGx?=
 =?us-ascii?Q?ojKet0JeebySa1MX5ct+QAZvxgAEHMB+N9oZ5hH7bBNtsjw9wGvmi+Zl6FrK?=
 =?us-ascii?Q?kFK6cRPBILQU3Bo1FiaPSnpXFFySpPhWn1aJdUD00NpcUXrSxerMfmTFP1vn?=
 =?us-ascii?Q?WrvxU0RfHg3x2SRa2UzXF7Vg0zODADw0Aw6J0V3rJfqrhfyy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3e2899-7c3f-453c-90f2-08deb835c620
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:10:23.1371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwQyPipr6vge5TmJLeMdaGIRgACwYiBxjA2uFOCwf6rC6htbf6vx1uN6sa7Px9VnRNDwZgvSf9864a/M9vH5fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_121030_570564_D6475432 
X-CRM114-Status: GOOD (  19.09  )
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

On Fri, May 22, 2026 at 01:18:01PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S supports a power saving state where power to the most
> SoC componentes (including I3C) is lost.
>
> The STDBR and EXTBR are configured in initialization phase though the
> struct i3c_master_controller_ops::bus_init. Set them on resume function
> as well to keep the same state of the controller after a suspend with
> power loss and a similar initialization sequence as in bus_init.
>
> Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/i3c/master/renesas-i3c.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 1917549cf6d5..6c23f956ad2a 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -260,6 +260,7 @@ struct renesas_i3c {
>  	u32 dyn_addr;
>  	u32 i2c_STDBR;
>  	u32 i3c_STDBR;
> +	u32 extbr;

can you keep consisent with above 2 register, use upcase EXTBR,

Frank
>  	unsigned long rate;
>  	u8 addrs[RENESAS_I3C_MAX_DEVS];
>  	struct renesas_i3c_xferqueue xferqueue;
> @@ -607,10 +608,9 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
>
>  	/* Extended Bit Rate setting */
> -	renesas_writel(i3c->regs, EXTBR, EXTBR_EBRLO(od_low_ticks) |
> -					   EXTBR_EBRHO(od_high_ticks) |
> -					   EXTBR_EBRLP(pp_low_ticks) |
> -					   EXTBR_EBRHP(pp_high_ticks));
> +	i3c->extbr = EXTBR_EBRLO(od_low_ticks) | EXTBR_EBRHO(od_high_ticks) |
> +		     EXTBR_EBRLP(pp_low_ticks) | EXTBR_EBRHP(pp_high_ticks);
> +	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
>
>  	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
>  	i3c->refclk_div = cks;
> @@ -1447,6 +1447,8 @@ static int renesas_i3c_resume_noirq(struct device *dev)
>  		goto err_tresetn;
>
>  	/* Re-store I3C registers value. */
> +	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
> +	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
>  	renesas_writel(i3c->regs, REFCKCTL,
>  		       REFCKCTL_IREFCKS(i3c->refclk_div));
>  	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
> --
> 2.43.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
