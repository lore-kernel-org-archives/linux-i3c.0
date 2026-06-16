Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C13CD98E4
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 16:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OotrzixRC9Lmj5IIA5heJrZRPMJcAnA8pgAtcbP6poo=; b=aETQ7yyX5boPAU
	5aoERG+Ak9afbwuAMG1e5mUH/7ezesbbM9UD4txZ7GIg7gA4j1H4Z48hCH7lxG7/5+RKAF3wwGcWx
	4ThXQfQRLo6fX2ljofFv0hEZR59uuqTdBpXxI4eTAIwAF21NSO58zm/XR81z/kVTIUVjGMZRiTCXZ
	4djjwAvJpFdPPNBzzYy9+/v4zVrHFnuPFMR9OsKqnwo3dqKjPfC0VmRWbbTxrUlM7ARUHI/lyIxYD
	oC8BKFCZjdePoAVafQNvBUp7Pl1Ktv6GUm2ld7jRTTQ6tsPbvwXBsQR4BfC7EbaU9y5drVi2/JtDN
	dZMJshPDVNFqEoT60kDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZX7b-0000000G8JT-1OBC;
	Tue, 16 Jun 2026 16:58:43 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZX7Y-0000000G8Ip-0kVN
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 16:58:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVIMzM0mOiRQwANXuUBECjkxPHkDm3Hj+WSM0AyJSafPuUKB4mDt7Pxma3ClTVes+1yRarPpWuKVojGfC47ZyxLkWG9XLHRKJmh4xlmmzvW57sHaNZJFmRG7DSxk1v5Hl/g9W9fXLxFhVck1Gb02Saqlfl2eY4gCCr0o9joaG19/JDbEfT1D+hCRrd0cGi8aFLxyLXrCh+BgmKSBJ/jI9xf6pSZyWv8StjJ7o5J67urVDgdlK9yMIAMVzWRqvXhx1B/Paz2nTWnxcCFSQrBdFg4nFdmlgB3s68C/ggQG35dadJgadOeUcmsHbtbLidcpEHkBItAzCxyAhd/VxvB9Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhvaSlNlwWj5FFK3WjqmJpyeOBeoihgYXGuJJB8ys/E=;
 b=PmTIY803JzqcqYCp/yUgiKVFqaA0gDl3/s5+00s3g2Q2oD966qq9tLmATMtKCYqMucnvWW7no8T178NEU7c/IUQMeM9dC7dZmX9VoBErI7rgmZBp3prvs5TmNGTydoLpxA38R38S3K/HfQ4JulTymn6iUlSccDIAbj/BuX4/KBd8eX2/AZNgAZkhKKLR4Mm3G7QbTu4lFkiryJ3esFa6/YNHNBfox+tTr8NzAfBiDROBy3O+xeOvV45pcebk4AFJZ6LdembUskZjc2sO2eFHXm87G+pFSXQt5ekuCNU1O5/cZ+ux/LI05ypBY9HnTlWe5XAum3OiUL9Zw9rMGN1vog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhvaSlNlwWj5FFK3WjqmJpyeOBeoihgYXGuJJB8ys/E=;
 b=qbePD6fDHAMjBQk9L26mhmNh98pyrtrr6Cj7BHh/P/HrSM0Wh0qKwfKtLX/Vr6ernuW1aPfA0m4mfyO5eBvIwIPEY7EWju7YYep/rYDjIeil5FgFzz82ohJT3z9pvoJuETUC9RDph2vVwQulL+3HJNK2p9OJjtgMeU/sZgXoTXSd72GU3IaCNntGeroWlgskVyzZleXZfpoAVD7HJoUOdul46egcxUHpPKamJoDpWGOvOhwHsePUlyYeWpWeubafsiNU+vxODb9ztSkL9PRh0MHIdLYXs9+p/XbVr0sBZAV4s2PFmeU3OWHdTK3r5b0b0kIKwdGqMj7WkjQa4olUgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB10789.eurprd04.prod.outlook.com (2603:10a6:10:588::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 16:58:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 16:58:35 +0000
Date: Tue, 16 Jun 2026 12:58:27 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i3c: master: Use unsigned int for
 dev_nack_retry_count consistently
Message-ID: <ajGAs98Vw5ibSnJW@lizhi-Precision-Tower-5810>
References: <20260616113752.196140-1-adrian.hunter@intel.com>
 <20260616113752.196140-4-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260616113752.196140-4-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:510:174::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB10789:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca9e7e7-408c-444c-c85b-08decbc880fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|23010399003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: jNf6E7HsgfuTxNI8yIousn0sWBJv9LC/HE+NdspSJiCmep4M1BVMN7jIS2fcLfvhgLX3Ug62FO7pNoOpyV6nfIVYNu5c1NPZtvwDD/3YpOsh/3SoTWGovnltnT79EL7cxLEcGAVkxOjngfqf8+xmysldkA9nClC8cI+ve/w5vZB6jHxcoGXNxet8PpNTiDG8dHYLhR0mf5nf3Hwe/24pU4UaL0xzuIIFo+dOrJbNAJ6pXIPplYPbKKirMvrA1burl9xaJ76kU5+GoKC+UAQ2gQ7GAldDLhBxJrVN9mi5qf68XpnWoN1TupDPHa3crLC9XhvBO590etfLINMVi+X9sV11WYdZrgVD6Gq8RkM1PayW/rn7QqtlRoLhFbCxD93UFhMgmUoc6z/T7EJtuTc4kYpsSGPiWeVt4g/j+BRcrLJCC3PKPhBXEsWLsPnsjt2QGi4BOXLYxRHp4iXfb75l0Obt4IsKx+9qxdvraH8lxFSNbvRdrMRcUNvFAfIhFBp4hvyYaB6qH9Yua42kHsjJ6BViEZ2TyiC1OpfBOTKYUQpNde1YLtw3ACqFqVm2uUVbbQPN9q0MIHvla3llWOp3dYuopohohVPKkeZY3LdB3/EHXLMJBAlhZLTIlO2kvXhYwv4Yki+ZnCqQ1DqIXuOhxJOOrNa3MbyWCPKLsLPz1vFg0pPOmdlPQBOKyblm/yJn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HR/n0qo7ULwV1/QwNS+HV5Mf7h8FPLwroBhAhe7qhtMgtsuWtAkCx9HhigbB?=
 =?us-ascii?Q?he86uv7NOAm67zHrtaKVuyE1zpbVoN1xmOCnr3PDFm6zSY7lqx9veQ88eidv?=
 =?us-ascii?Q?xsGvmqlk4uDeIcNWc+oo0npAnyGiD6zHZsQO5VMqxUWUqA4qCEln36LuhdkI?=
 =?us-ascii?Q?uauGSCYl/9pAFJY0YMRvSQ4t17kOvXH1RQJ3mWMg5KL/rghpa4vZW8GolqIq?=
 =?us-ascii?Q?xBCpXfa/LtZN3yZYFLPu7uPeviv8Zxa1w3tRhaMIqNSdXhU7fUEEPZ9p/bQA?=
 =?us-ascii?Q?GDKD8QdHUwJAjSzLkdvZlQG+VBdjDB+0VfjDhl+5pV4CEPl1nr0zrfPLA/21?=
 =?us-ascii?Q?ktGgg3X6NVnVEHEE1I65LnjJDFpaTeejZIhzNViNV2lAjSALDyA6TA38OsO0?=
 =?us-ascii?Q?9Ix8la1NZ/OtzK4rKRLPgz5+bIVbXM0pChnm7fubcXQgyGIXsyao7FE6/M6+?=
 =?us-ascii?Q?nTZQfRqgqN92Ef3S3yGIMOzk/2iFQZjb1YUJTePScJMlw15V9S35VUG4kBUB?=
 =?us-ascii?Q?rUYZLRzqO085xDRh5x/2Hv7EWXJUsHPV9RPh8qEY+8lE2yD1cIfS7NJXCuEj?=
 =?us-ascii?Q?faBIWxJCCdD61H/wkIYW9rbU2o8QpFrkoO880FlBnouMKKNwwDBIdU6PSK8X?=
 =?us-ascii?Q?BQwnuaEB1dUrhCZWIy1hrXoiJWT6tkugY6GrJRlG0oOObXHaZuuq5yhIcaeF?=
 =?us-ascii?Q?aqyH/lUlkTAAn3Shw6L2aig9vG6vx5IyzVGB8/FoI9JUsVIadWDnjswEQdbh?=
 =?us-ascii?Q?O/3v/cf/L8rg82PVu/HYOY2SQbN8DrIPH3wgskn2IFkEo0BWnnv5wRgj9jwm?=
 =?us-ascii?Q?D6oCIwM7WziUUWvfxn9U6qOmsbx0+ybpdp0g4lotegrtp4Vfcvc6CCJ+sfov?=
 =?us-ascii?Q?xpCT5OK5Q2G0WjmsA6ExhyPs8NOJdYAILVX7Gg0KwE0s44Lugkv62QVoLOVY?=
 =?us-ascii?Q?eAMe7ImTJ2vRjr0xiboauL/jHjyOBsGFPvQe42qpUcGmunDPQenK38FkZ1XJ?=
 =?us-ascii?Q?ed5Pw/3hmFshqmnfqqW1/NbXiHaNJyjBBWjlExuEEwwDE9tCy6BPDTbYU6Hi?=
 =?us-ascii?Q?xYCs8A64IwCnadagrp86ppZUkPONDBhDZQLZqx3ZCWip3IKjO0C2ZdUzANkY?=
 =?us-ascii?Q?aOvkgQYS4GcQk3Gv87OotrXsbTm+p4SByEwZIS76mKkgCVCgcDa3W5Ir1Wsg?=
 =?us-ascii?Q?bz1fZpLSPzdhrkp4famJSHfESLeoJRde3srn6vo4kC3TjnwTfatLs+gCmCj9?=
 =?us-ascii?Q?b0KAQprZD0OMVYwUPDABVLwCz9zA+JnwzWAWiOzGeQBEQSx4jUcGoBAhWGDO?=
 =?us-ascii?Q?gfeiKe6Xa0CbhyoVet2zR6oXUY6WNvhtTG1D8sO11L8dInDa0UCEykw8fz+N?=
 =?us-ascii?Q?jC7T6TtmATPmjB4US1UHgyCE+ouFHq3vPC70RVhqYdPqWWf2u8uYFIxvCoSe?=
 =?us-ascii?Q?MUYaeNb1DZap0Vl/bfmeTBKkNgB+0jWc1Wa+jMNj66c/zNT5ziiLpgZbmL+2?=
 =?us-ascii?Q?6QMdDrzI6i+f8HD9FXFScN5wm+q8BsmX7tm+uRIPhU7Uf3xhQqZCaVcb1y+m?=
 =?us-ascii?Q?nHNtsfzW9DMECY3yR1MP0+1+YYc+DxbkQH5es11at+03PTotiOuyGeEFyhr3?=
 =?us-ascii?Q?Btmy7kiKu89XdlgWu6rQ0/qSMLbjEEqvp/60aIxw3AlJ7lI5t/p+FebCB7s0?=
 =?us-ascii?Q?GvGirLfTWOs7MtkMUBQPgU+lRcgIorg6RxOoLTmd3xdOHKpHKs2cwEnvMJWs?=
 =?us-ascii?Q?sRHpMsSdG0MLhfkM1NfDPKPOa31cC+uWB2mQT9XRnZzuIMlODZ5O?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca9e7e7-408c-444c-c85b-08decbc880fd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 16:58:35.2975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEMm3BEaQ/Oa1Pqvdl0xY0W6RSAl/CJNJv1mdAwhRSzu2ocyJd95oqwOhBB9D0rlBHqsOUN4Hj+/kZSihIzXIVAaJ5G/2Yr1NXDgGj+aNR+dyOG0PPdvVL77+2Yy78Cg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10789
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_095840_345992_9DFD138A 
X-CRM114-Status: GOOD (  18.75  )
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

On Tue, Jun 16, 2026 at 02:37:52PM +0300, Adrian Hunter wrote:
> Use unsigned int for dev_nack_retry_count across the core and
> controller drivers to match the type of master->dev_nack_retry_count.
>
> Update the sysfs store path to use kstrtouint() and adjust the
>  ->set_dev_nack_retry() callback prototype and callers accordingly.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/i3c/master.c               | 4 ++--
>  drivers/i3c/master/dw-i3c-master.c | 4 ++--
>  include/linux/i3c/master.h         | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 903ac01ab413..58d20624ed05 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -760,10 +760,10 @@ static ssize_t dev_nack_retry_count_store(struct device *dev,
>  {
>  	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
>  	struct i3c_master_controller *master = dev_to_i3cmaster(dev);
> -	unsigned long val;
> +	unsigned int val;
>  	int ret;
>
> -	ret = kstrtoul(buf, 0, &val);
> +	ret = kstrtouint(buf, 0, &val);
>  	if (ret)
>  		return ret;
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index c7030d0cd8a6..e4f6d6f29ed5 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1481,7 +1481,7 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
>  }
>
>  static int dw_i3c_master_set_dev_nack_retry(struct i3c_master_controller *m,
> -					    unsigned long dev_nack_retry_cnt)
> +					    unsigned int dev_nack_retry_cnt)
>  {
>  	struct dw_i3c_master *master = to_dw_i3c_master(m);
>  	u32 reg;
> @@ -1489,7 +1489,7 @@ static int dw_i3c_master_set_dev_nack_retry(struct i3c_master_controller *m,
>
>  	if (dev_nack_retry_cnt > DW_I3C_DEV_NACK_RETRY_CNT_MAX) {
>  		dev_err(&master->base.dev,
> -			"Value %ld exceeds maximum %d\n",
> +			"Value %u exceeds maximum %d\n",
>  			dev_nack_retry_cnt, DW_I3C_DEV_NACK_RETRY_CNT_MAX);
>  		return -ERANGE;
>  	}
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index f73cede87d36..6f0379bdbb6d 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -494,7 +494,7 @@ struct i3c_master_controller_ops {
>  	int (*disable_hotjoin)(struct i3c_master_controller *master);
>  	int (*set_speed)(struct i3c_master_controller *master, enum i3c_open_drain_speed speed);
>  	int (*set_dev_nack_retry)(struct i3c_master_controller *master,
> -				  unsigned long dev_nack_retry_cnt);
> +				  unsigned int dev_nack_retry_cnt);
>  };
>
>  /**
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
