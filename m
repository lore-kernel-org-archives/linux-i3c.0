Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD610D730BD
	for <linux-i3c@archiver.kernel.org>; Fri,  3 Apr 2026 08:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M4dz1Ari/c3fBu8S9m2TYA84eelQ0UEXEr9w5y0pJ0I=; b=IC2b2sFDEz/BTb
	/uaLsJXKZ1QRYzreHVwKO9Rvss/vyEHmEoobtgoKWWkAH5lF/tz0ZaET6rrVyvi0No5g0iGXFeLrb
	gY4U4eOBrz2SGdBjzQ1qILFNO6ShPlfqFJTJBinj2PNBvsBVxiWoVpJY0RIrcuMp/02xkTgSXrL3K
	7qpDrpmsZjHWor7L0+5+moBUFg7IaybHru2jEMhkJe2Mdh88cwgYstMvu6Z56ixxKkZ23JOjwQ6Te
	gHvgf0H1iTD+YyOCrXwd/t2DXxG/++0q7mkSdMQS9a/SeoojN9+J/sRHgy+ubbaczqv+Gf71op3/X
	YBK1u2MSKtL3456dSPXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Zfz-00000001h92-1udo;
	Fri, 03 Apr 2026 08:14:47 +0000
Received: from mail-japaneastazon11010052.outbound.protection.outlook.com ([52.101.229.52] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Zfw-00000001h8e-1sNI
	for linux-i3c@lists.infradead.org;
	Fri, 03 Apr 2026 08:14:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWtbPObedi01yB6WeHe3fPLCaRUG6wofeTzrtM4a/HsEMnlqlrAyFEOoE/xralX0jyd4icBUgWekY5AXQqm16iNwz4ysh/XVK/+EjEZXJbQbXlafgAino7Vt85sVFD57VTkA6GyxDE1BKnz2iOaj+sq4gdz1OnqgjoTHsXBfYGCp54xx8OD9r6Zq/sOHMKA3f3O/wIl+O51qMzFyPT2mlbtX1IwsjfQd/Q9ebwNNEXKZncxoSBgbymS8h1qF4IfwgJC0tL6/tnhUzPjemAaM8VqrdvFt/Fg+yKPBEag0Cvk5AkiC0iVBcPQ3cpgFJUlXzCBRdv8793kDRNJJHLMO6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rddydE1jEPyO7n0CzT7O9VPyWQdB5JV9GocRMTIzTbo=;
 b=G29617PnvHKXKCzMFkhJLKZMc05IjyI7kQveiIEbZ16pNMrhUai9cP8OvAjgkFPplB6FFK6hRc0+t4LrPylLNPtf+1U1Y3yXACZPDCUrQe2LVuwCGmkY3Hu/xTsJYBrs+a9FrgTBN5539kclJyesnnZTMkU5SKcIRE2JeCYjkpxZoQLbnzZFx9aHwG1G6Ll5P/m3Nrb+kKkRiLWbNFZpwDMTshFVd7VubO2lBFEPLd9Sht6p4bXMMTbjbWCgNUJpqCMmk2ppCDYenoQoX5fUqddcYq9zMKuUOSXSfiYojfqEA14xchp986Q6Jjc+imVR4oUFNJWCqD8oNyEU8YMTag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rddydE1jEPyO7n0CzT7O9VPyWQdB5JV9GocRMTIzTbo=;
 b=wx1b0DqlCGHNOeonDMwe5nxC+ggBQdY2T4NAMcLF5CimxVPlEuyeOm8xF0tQJyrxI87dOwNdIT7UYYH+Gnczw/mDJsunsUgHoW7V5Ivq58j7H7Uj91O3dpcVybAvOvaMPGM+CFGoN8ZxAdqxakEf/rSvMduOm6UGNu/Z67oLfVU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSAPR01MB7448.jpnprd01.prod.outlook.com (2603:1096:604:146::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 08:14:32 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Fri, 3 Apr 2026
 08:14:32 +0000
Date: Fri, 3 Apr 2026 10:14:17 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i3c: master: renesas: Fix memory leak in
 renesas_i3c_i3c_xfers()
Message-ID: <ac922Ua3UjbZXdPV@tom-desktop>
References: <20260402-renesas-v2-1-f7e8cf73c7df@gmail.com>
Content-Disposition: inline
In-Reply-To: <20260402-renesas-v2-1-f7e8cf73c7df@gmail.com>
X-ClientProxiedBy: ZR2P278CA0057.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSAPR01MB7448:EE_
X-MS-Office365-Filtering-Correlation-Id: 31384001-9d00-4a67-ff16-08de91590897
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|1800799024|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: HKoCru/bEgIFEiOq6Hngia9/P4LWHbCe6hhXLrDiXainJcMCUax1ONtqpqhi7NAsW02cGhg6xJOfBJeS/IguT95KuJti8x6glW7I4wnznaM9SQIXcHfsjOKXMdywoFZ2F8tmlBuHc/2+KhHzmrWmNvRLCqQ9jXAwr3eXroxkHRoJIf7D03M9DMeq6B9e7Te1WomVjr5k7rBqbzCkgKQmI301kGjHWAxqZKwX80qKCB1v69McwS2SrGMwLrq5oRfqOe/LEMc+CdcFFV5AAyYPPc7V3nurHVkPLeNVorwDnUAMYg0ruOeyiXQUU7e9fbF+qK7JiekjpTzi19ogrwi/8XUFTPAIP68svMSDjU0Z+sKQxbS+3DkWLdO7+VCrHfCb0NVzhmLO0hpFXkzVpyZy1O92tiYY9UKVoQ9Gr9H90/OOzU5IrYnidm/ljBck6Fc3o6Y039Q9sTEiml+P4c2MPOCjgJF9bdxJtTfQ3G3YkW7y67j0LjzB5ljz/+yVhQMmDDMF+R5Z6K89HMB2SbbaGuShpOee6/3VTs5k11MWsdiy9mM5tDX7nSIABMsqlIEYjTmG/Nxqyb36XShSrHC2iq5Vd7VWqRrF+q9nhkobVcZtYmKWfxwY0Fsv0Lza+4Wr/1u8dGb5vj0BDF831rOuW9onz3lNpAUWJdMB3wV64d+vb5UDm6qvvyqmNH7Hcp5ZqjDeyJSC6Vlk2fB+NKGRBfz2TdnM6pagsHxkszZz9AJyAH9ulJUvOoWJ+1q8Wr3FYaIL/Q97/h2iY2v3OrQvhQEb4C12Hm3uVpH3LrvEnps=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fckfEwLtVgs9uf8+CcWFHZywvb7ErRSGsCV8KMPhSQ/TGGjClkWyMwsVJtUZ?=
 =?us-ascii?Q?EIz+iASBwSSqEAgyWRaxuwNu47sJgpyzFDzPrRtv8zFsF5X8xlqsD34Yqvb7?=
 =?us-ascii?Q?WeQ7/llyaJ0E7uQFmohjzzN9Pv9DckAHDLE3fIjJ3o6FC3U+nGXp1wGkJdIC?=
 =?us-ascii?Q?+d8Zc8PKA54M0+F8bvRyWbndIJ22yWR8dAwJuxjBt6naSuxj+ykpe/kaeYEV?=
 =?us-ascii?Q?KnWBSgGXYhlWJM35+ch24gTxPdNbeClMn47Yt0uSZA1+J99eiRXr9qg4M8cK?=
 =?us-ascii?Q?ToaRaXHFul4da7LnfEsd4PTDSATGi0Ukeja/vMZ/sULD2fkIur/UZoMCn817?=
 =?us-ascii?Q?hc3ElSKVoiu7qAsPR9oNVQ7HJdnyx+rrCFFGisXvRD+aM2kuaIK8kN9L5YgV?=
 =?us-ascii?Q?Q5MNpZUKsBn7uNapQq8dmGOGaMK337451eoAUl/nj4ZH4Pl6NA/lPMmTCUVR?=
 =?us-ascii?Q?dsqyaMVEbiISqithyHNz0R4jbZ9gMXVBHc8NQF4hh0WLCvHNfXFBddQdxlGW?=
 =?us-ascii?Q?yA13lPtOfOJMYRlBRlWHDAxU81wwr4KC7I74IRNAQTfwpe1J0uJUz2uVbzRb?=
 =?us-ascii?Q?EYY+oFWydtRUN1/kqh5K8NOa6S486Ot/v0lKEsgSCEas4GfJX3YBHfUac/EY?=
 =?us-ascii?Q?krz8d6E0Fhb8bkDNurCHPVrWKfZlEhnXDfEX11zTw0GdLhQwWaEwUbwabjMa?=
 =?us-ascii?Q?RHR7MxGTgyWFHa08phgVLXG910axj2LH/ssP8DbwlzDWGe/+5ubrr3TrcIIg?=
 =?us-ascii?Q?1t25X8OpFdzaNRa1TVvFmywkDHD6N0CRO79noqcCR5eWpbpBY7r2yXSR5oVk?=
 =?us-ascii?Q?6lOzSe0FjwpNHowMhnH9NCnPKhwdNyaF9J+mBE23cFCyi6GAJPTVtz/trs2l?=
 =?us-ascii?Q?Vvd63cnFjVjho/2OdSzoUaTrAQ8aflzFyns8zUGaU57j75Y6t+NIfjBLtvxU?=
 =?us-ascii?Q?KL0yiGru7STDBzQ6dxSkbfL3+c42dEwA6UeTOr7XSlwcEfNDbxJfYVeDT3Qd?=
 =?us-ascii?Q?Ek+oCPzbOIsDy5ete4QxzaW78Mu2lyMcirVQx7roikzyjlwb3dM4++jjDefx?=
 =?us-ascii?Q?rkbrz84FTcNUf6HlYL/gqigZfjCJzWdc1QuqoECL11myCGsR80Rvn3j7pNpi?=
 =?us-ascii?Q?94SOhqdKWUU/r3/6Qi8V7KLTgX3+rKBeNEh3gxDSekxmfwD9HKGVJd81cLBh?=
 =?us-ascii?Q?dlDFkdyTs48zWBrSfHpK4oAQ3o0Lr/rlHxowBSw1viEvWtJMSjb+GZfIMwnE?=
 =?us-ascii?Q?zlm6MKbjrFTrlfpJ/rE59o/OOfBAOuHx8xsMO3bKBS4Y8+FWK4jx5jr0mvv0?=
 =?us-ascii?Q?NwJePu3GqFm83wt6l+6Ty/ZeqqHjg6/bWZcTN7f+p5hXHoeF1fwDvmBEPJB9?=
 =?us-ascii?Q?L90y7nzYLBPplJzBM4c12UUMODeEb0uiHxSpRfUp7qx93SYaUgzyzuDHZOYZ?=
 =?us-ascii?Q?HlmZ6J/zg3j2zX0J9mGVxl6hwxytBEd2WYdmM6a95Okj6/RDaRAI6IM0Ka4g?=
 =?us-ascii?Q?TY+tj0b5wvhWx2qTnBd6IQF3yF9I+pB6PSQW6nXR6Lt09rLdq+22ZRYgTIQF?=
 =?us-ascii?Q?nFjUBnwXeTF9DzykXI1mKZqTZa1QoYafIKidnfY3d8fOufAfVu7zBVvfN3Nh?=
 =?us-ascii?Q?DElbtmwE/zoaPVFL2BLTQVfd5kuN3bvE9n+MubXsJynXo8dLdE50fHMr3Yv5?=
 =?us-ascii?Q?TqxMwG7Ie6oNNSamOmS1MWhyApy/Xx2QijKQADiJdtH9dOtK4TyRdhLh92qO?=
 =?us-ascii?Q?q6eQdZ4GktilDPERirHavz7V77/9Gj0NjdFbBwl5GdNpg3oTkRAK?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31384001-9d00-4a67-ff16-08de91590897
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 08:14:31.9241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLphINkboGpufLNOt29ctx89Ddugu3YK6a7T/NfwAXtOBhoiBQGSekVfcKWmmjrHEItptIbdq2BW9p743iZGJ32WiJ81EAafzmzFWUsH6YrU+ihsUBCpqUnq+aiQ9soO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7448
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_011444_520830_4F280B7C 
X-CRM114-Status: GOOD (  19.43  )
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

Hi Felix,
Thanks for your patch!


On Thu, Apr 02, 2026 at 10:52:26PM +0800, Felix Gu wrote:
> The xfer structure allocated by renesas_i3c_alloc_xfer() was never freed
> in the renesas_i3c_i3c_xfers() function. Use the __free(kfree) cleanup
> attribute to automatically free the memory when the variable goes out of
> scope.
> 

Tested on RZ/G3E + NXP P3T1085UK board.

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>


Kind Regards,
Tommaso

> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
> Changes in v2:
> - Add cleanup header file to fix Frank's comment.
> - Link to v1: https://lore.kernel.org/r/20260402-renesas-v1-1-369a7d867502@gmail.com
> ---
>  drivers/i3c/master/renesas-i3c.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index d9f5b30a4b2f..a8a9e89a9710 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -8,6 +8,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/completion.h>
>  #include <linux/err.h>
> @@ -817,13 +818,12 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct renesas_i3c *i3c = to_renesas_i3c(m);
>  	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> -	struct renesas_i3c_xfer *xfer;
>  	int i;
>  
>  	/* Enable I3C bus. */
>  	renesas_i3c_bus_enable(m, true);
>  
> -	xfer = renesas_i3c_alloc_xfer(i3c, 1);
> +	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
>  	if (!xfer)
>  		return -ENOMEM;
>  
> 
> ---
> base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
> change-id: 20260402-renesas-c6afdaf9bc2e
> 
> Best regards,
> -- 
> Felix Gu <ustc.gu@gmail.com>
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
