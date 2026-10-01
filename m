Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BC5CA5FD2
	for <linux-i3c@archiver.kernel.org>; Thu,  1 Oct 2026 15:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L51KNoYFcIfv1m+m1XTrSJcniJhoyqbEHt1oO2J26i4=; b=qgSSPGD+FtKAys
	kS1MlUh2pH1v1vovvf6f62H2ELmTNE5lF9ZQffEQ9hVShni+mnENc7xsnutw2RgyvNB40YQUctd2A
	d4ETNiRRDQ2JYby7Fxc0Ooi/K5jMeI0lmO9N/uclqHAHUycqnQQoj5zMYvYyMzJS7HC6MHBP7Xwv2
	j0MDh81onAqvzvNifdpp2GqyFVcfB6DpNaM8unLcYEAbex+KCzN3maxflHhkm9qNOYUBeryhx5ydh
	lDP1bPa45tNOLg4lLisYgyq3q3nHKohZDUmUWwpKvdpEXnLgCw3JmLW49XHsdy6/1qQYU0siO4/oc
	uThlo4jjfLl53bO+RCHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCIXV-00000009UkU-478w;
	Thu, 01 Oct 2026 15:17:42 +0000
Received: from mail-northeuropeazon11011014.outbound.protection.outlook.com ([52.101.65.14] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCIXT-00000009Ujn-2Jrr
	for linux-i3c@lists.infradead.org;
	Thu, 01 Oct 2026 15:17:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c055mV7VGti0oGICLaTHglwdMIEY/bXkE/AvoURKV70hCd30qJzVyXW9cZVVooXwPmlp5bxb25Uk0Vi6y2ev2g41R01IrluzEeuagxmvSIRMMUulfjLfpIA9eEWP7uBkuRdsWJ3fUqloPa/Nx5ee/UOHGVX8BaaO/KlTAlVmEiGVEKKRXtuz5zdd7XkuEyIbCnMnLwuns8IjS9+xr5tmFWR/4kT4Cgu8+L6lNlgHh7h7dll6RY8BVCr1mA/KcQ4/XR1lJkXItHrY2xF8aMC8cLVMAD7z+DW9FZUWQCcRMbl14Tox99eyCzXDzA9bletDzgxR8Q5/ibx9hoZRj67GbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3oXNarGnnDpU6pIBAy7NeZb7nrIwvsbLNf+6l+Y87FE=;
 b=hDKPnzUHENIGdhWOwjAmTnM1R4mbk2nNwMy5LUvEYPMjgLyGTmzhagLGrl8mZ0iD3Bz6A4nLNQw4ezmfG2JlxAMwWAVPX2srbE7831q6J7bC3aeTd2SrGauXGYX7uphviSVfQJCaKM2JW8TbfvrmLDgkCW+UTjUj/EOEpPhYSSn+l38YVyRI9IGPd9js+AvJ6ypSVEdOzTcvnq8a+f/Ev6rUZabZc9fv646LW78MFsKBG9EZGPmjjyqzb+Jznb1Rb+T6yuazeEjhYYiM6mb5VDv+utQhKyXilCsXWAHAXNpX3MRGFTtaHnlU22y+YEVsMh1q543Hu4DMavHetSWTKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oXNarGnnDpU6pIBAy7NeZb7nrIwvsbLNf+6l+Y87FE=;
 b=KySuql7tmYkveu6bp6sN4WfbtjZNvbeb5qCij3ZYmUqNYmEQRF9gqHtjUjVkRa22IUgUpN0nPyVgHpUisDmaUpZmXy43h2HZ1HynKTi1gQ3KS0/KdMPLOmpIzYrnufrwLVq6udM9Tjc8LbOD97eLbkOnV15weWbJdomAYpjucOLIqNq9Cke3qn+uXyrdJ1VYJa7Rb7EasH3FSPxGwAJ8r4X+KX31WzwTI6TcSaf3v4B4Ovo0rjkL3Pya6N/cTYMUPyQAvvUiTkvwFwBWm0ISTBjzlvEIw5mGVBizSYmZlSgUXo22KWGitkeHOUDDAZ3FztIpuDDejz/juPWe6NCH1w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB10647.eurprd04.prod.outlook.com (2603:10a6:10:589::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 15:17:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 15:17:32 +0000
Date: Thu, 1 Oct 2026 11:17:23 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] i3c: renesas: Fix MDYAD(x) field length
Message-ID: <ar55g42Qqz1BN3n9@lizhi-Precision-Tower-5810>
References: <20261001-divo-ssgrlpcsrc-2966-i3c_mdyad-v1-1-2250225e6d20@renesas.com>
Content-Disposition: inline
In-Reply-To: <20261001-divo-ssgrlpcsrc-2966-i3c_mdyad-v1-1-2250225e6d20@renesas.com>
X-ClientProxiedBy: PH8P221CA0039.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB10647:EE_
X-MS-Office365-Filtering-Correlation-Id: 466e6d82-5fed-4721-fe04-08df1fcf1d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|366016|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: rZnNv4Cap6qbWP8ILLBJpZN4egx4syjjyW/L3RY3RIziZXm/Ush2QQGvHA9/PZYi1UEzvxR0FfHkuiiIP/0AIUTbqTOBfvGFTXQC8DouLC/vkul17oDX+oRawYfTNk4ASu0zEZ/ONna20BxOZKdJTfj8i01cul+rklaut9zPgL87AZuhMiXB6x6InRBENprp7iJ2oCKrVkrP8Y23HyLqN37SSOWHSp160ml7hBktcs07QEjmgqdxzHYRu/7+KUXAXngmXjj+CRFeR/KFJ7h0uD/N5/IJaJY7tSJ8QM90gUj0Ak9ee0dipO9IdX/hoyVus7jtA5KFrUx+uuwp3odR97hs3AV6KFFX7nSsxlSeiFBCbiUu4GSsTWDPi0uFv4KnSfOFJVAm2fXcSeT+9GNpXunbcq9lwKhvAWEhrz75FTHPJtoAuAcObI73IziV1DrEVDY5HuaJThFw3S2vH5HbsKvFc/sO0aHCz3zuAfpnRm+Ww8iysPxcGXN1P8ofbejfCgTIwwQM5aW5KqBsCOOuFBB+3X/xomS/TjVrWTuPbxKJ+kdKJlKQ5lWBdSh7m32Yjvlr76y5khj4T+psbN3Zh31706XrHsS20WsFEmTnEMz5Ggztis3LGciEiCM4kXsoq+SLUkXQbz6ilNOluOBDrUCLLgQpkfRI4gEMhILSnfs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1DaKlrHcSB5wHmtcekFWpE12jOYL2RjfW+8D20uTwOmq5OoGXtVAreIlddT/?=
 =?us-ascii?Q?rKWu3EwvMhYPiFZL9Mx5K9rXg2OaYIfYdJR2oHoCLL8hLo7My3ym2Q+vU0sZ?=
 =?us-ascii?Q?jK5+EsKDN0Iaxq9P1sfbVxQpxpRA2fMUQRoxdaVq9GgTBafCaEv6exIeOEuw?=
 =?us-ascii?Q?R1u9k/kdycg14blEwd7dwzr09wDsvFMfuFQvXC0IUh4Tj6Zf3J+a75Rx+jDQ?=
 =?us-ascii?Q?tr9rSkzU1vcHwsc9IirkSrpcgfuRQ2x404Pm+0qek/4DGrPHNc2/kdCbOzfx?=
 =?us-ascii?Q?QG0NNS0qEGmVj2LyAHoL3x0ZH2aw4u55+2QAKqo/s8zJB3pV4QuSc794vwi/?=
 =?us-ascii?Q?dNllFJTWCzK65A5gJnFHmx8rMPKWymSgoSDl/Eq3EP1d0lO67bNV9toouiFC?=
 =?us-ascii?Q?dG/SiUDHf6CYidbfKXz/5XmhXUnv5n6GszaO9j9/Ntr+Jq0QAj79zGpEvXGl?=
 =?us-ascii?Q?tumIxkCk45uKVt+0RZh0ge3Be1ru5LiUt6o9157GNhTiOuvzCaueXyfgzgnA?=
 =?us-ascii?Q?ApQ1jWkkGeVeylOSLLMvDmMfyqJRwLOJmRNn4oGorQwHY8Rp/4SGsglaJcVq?=
 =?us-ascii?Q?OYVVSxB1NStJHEB2medSngacXJxtxgRe29FvyT5EmOx31yt4mwPZHxHHOmEN?=
 =?us-ascii?Q?voEscwvMmF38h3FWrUvGcnpCjtqaanGMtdfdHxpH98mQAE1iecU3tUuf4euo?=
 =?us-ascii?Q?ZYvi0/TV2gB+FgV8aKZ2pZtWAFqSjl4IBh0gntSdUvp9TAbbulnATTM2AC3J?=
 =?us-ascii?Q?2vXCStmtGOUPIoeXyMghykrEs1FGJGgkdPndHEoL2idTvrMwTkYPit0R7kF7?=
 =?us-ascii?Q?skDuenrmrEtL+QoAdA9KoOO6LEjgnXKP8bhMhw1j+jI286n9OfleezQwJ9Tt?=
 =?us-ascii?Q?ltEA6+R6eOzS/e0/rLCpVlFF1q2Kxst6q+tRYLTIKdXVt3eF7Ps0SfGTxjSV?=
 =?us-ascii?Q?k6Pg782gaRzX9qC5uVC5b696wkZb6rrqe/tgnI61oVxC5R5tJsHpkvyj4mVu?=
 =?us-ascii?Q?QspCB1tAJXWQENsls+eVc5UJBo9jrfOs6jJdginjfKzCgF4McrSyVx2RKOZj?=
 =?us-ascii?Q?E3hqR+3ekxlvB+BZzYDBaI0l4bx5Btm40K6YgWrnBRffo1i921J4/mkRE/WP?=
 =?us-ascii?Q?Q75FQ5+D5Eaq9wzRR5ItCoTiA3sC1ncKG22Pbuk58nzMfUv0voxXtg/u4u18?=
 =?us-ascii?Q?OMziRkjErchotWlkFuOXIKYzRCLLAZJ0vxkjCIsfSMrQyBpDxqfyhSub0rvq?=
 =?us-ascii?Q?yxaux9hu4DkYJocMsmVitLmk3reizs69BkhSUv5VtNJ07qfiuo37eGbhK5ok?=
 =?us-ascii?Q?/NYt9a+RaUvT0BHExxNVW79cF7/9WQ5NLgYKengkmj7GmeqfE7K9mftUtIgo?=
 =?us-ascii?Q?gqYip5tWPvtGZuBUbHrAaQXm2L1/GbpdAykpsieIaSl9V01k2whyUIwBppnf?=
 =?us-ascii?Q?96RhWpNcpdl5izMXnIC6c3eALssAt7oOaR3fCblHWkAsCMIy894Z4Ev/s8qr?=
 =?us-ascii?Q?4ruikJwtUwGxr7tkno9UuF84pRMnm6w7C2GvOLuRHX5vosAxlw0xBj3FgZUv?=
 =?us-ascii?Q?/nmbUUDlTaH5wrJ2al60Q+TQuqfctcGM/zNA0TfMStQGDxQQDJG/gQ1w7xad?=
 =?us-ascii?Q?7/Mk7+um3cYgVlUQMqT1qlqY2gwPYVq19QO5E2k5iRRdoJmPEvPWTotoNdKn?=
 =?us-ascii?Q?bZsp22hLJGzfkLecp4sMrmouHtD5DMT8HKqPdh3Bap8cX9wPnBVzFtVpdOa1?=
 =?us-ascii?Q?EdMcjnLN/sVdgZUAj9tY0Ivkwy6AVBePkovKy1L+/kQHZOtrIMaI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 466e6d82-5fed-4721-fe04-08df1fcf1d2b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 15:17:32.3074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0FFELbewtHuFcVj39AeIBgwOiLa1lk6T3MfBsbOyghDnW8CDCr09e3ld38r+dE9fFqOXwEQJZfMm5gY5zFEmTUB3nGFNjjTCcwIN3+r20QJ0ewXUNIXBwTpJeBeTGw/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10647
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_081739_624750_0DB9F596 
X-CRM114-Status: GOOD (  12.76  )
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

On Thu, Oct 01, 2026 at 04:10:09PM +0100, Diogo Ivo wrote:
> Fix the length of the MDYAD(x) macro to be 7 bits as it represents an
> I3C address, which is 7 bits. The length of this field was confirmed on
> the documentation of the RZ/G3{E,L,S} SoCs.
>
> Fixes: d028219a9f148 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/renesas-i3c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 28c0927a0179..8b264f72e55c 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -37,7 +37,7 @@
>  #define  BCTL_BUSE             BIT(31)
>
>  #define MSDVAD                 0x18
> -#define  MSDVAD_MDYAD(x)       FIELD_PREP(GENMASK(21, 16), x)
> +#define  MSDVAD_MDYAD(x)       FIELD_PREP(GENMASK(22, 16), x)
>  #define  MSDVAD_MDYADV         BIT(31)
>
>  #define RSTCTL                 0x20
>
> ---
> base-commit: 66b734f67a4a0a4c2313afb89033d5ab8b8f7523
> change-id: 20261001-divo-ssgrlpcsrc-2966-i3c_mdyad-0ba701c9add9
>
> Best regards,
> --
> Diogo Ivo <diogo.ivo.sx@renesas.com>
>
> ________________________________
>
> Renesas Electronics Europe GmbH
> Registered Office: Arcadiastrasse 10
> DE-40472 Duesseldorf
> Commercial Registry: Duesseldorf, HRB 3708
> Managing Director: Carsten Jauch
> VAT-No.: DE 14978647
> Tax-ID-No: 105/5839/1793
>
> Legal Disclaimer: This e-mail communication (and any attachment/s) is confidential and contains proprietary information, some or all of which may be legally privileged. It is intended solely for the use of the individual or entity to which it is addressed. Access to this email by anyone else is unauthorized. If you are not the intended recipient, any disclosure, copying, distribution or any action taken or omitted to be taken in reliance on it, is prohibited and may be unlawful.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
