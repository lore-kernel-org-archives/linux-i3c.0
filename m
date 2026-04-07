Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F73DEDB7CC
	for <linux-i3c@archiver.kernel.org>; Tue,  7 Apr 2026 08:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JUiFR4dqFZsgu8Ht+gpWFcPuOvxsVKycvzvPrYrRueY=; b=ojM22bLI0Dq3qH
	u6D23fCGw/Lc5pdsUUzyyO3MvJWl6gLLUisTplQIEbs7y1WczyIjTt51vt56QAbgdKRk2C+tuC92F
	nziJWRnqyNxqVr/h4YZj/lPL0l43bLmoy5MdpUscA3Py7ed+fXU1dKl7q/hUNOlTJjUYefmcFKFgv
	c5aUQC7c/MDWSWEdPLUGCnX/u2EQB8fs5fa3pQxF5RYkHpG9WMpGDwbKqfM8UieImTrKY0lCO9iPU
	NVbEwEI8/HffyJLman5q9wsIgmQPYP2Q8jy9Tfa5JgQiCIqtozBEGbJ68OkfzR6QRprVKwhs5qsLA
	7jbCrXcrsqoVRbNG7Yag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1Y3-000000067a1-40ox;
	Tue, 07 Apr 2026 08:12:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1Y1-000000067Zs-42fG
	for linux-i3c@bombadil.infradead.org;
	Tue, 07 Apr 2026 08:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ARGDu9nVrx+UddrRn+oAjOVUZVxQNlyvoGohCRIvDWI=; b=pG31E2JfCCO/es3fGDMwOwbXnD
	wiqyh++lUKs4S8QhBrbL/iH4TuUT0caujXvIgrDQI4nPtnLUY+WxWzURZhJdDiUZ0d5truoDHRkme
	oJMl0RbO8jOUnLHCnLWGFE2ODcJj7TMQ/25vzASsZdO/59l+OZtm4/8OuTCIgSSuy0V2CwUQejgkA
	nPULvo1y07h0IusabdQaAbLnM8yv18wyZ1BhglJrz09yXOkBd7hQTl6CQynKf+dKZqnlDH9SJjQY+
	GWIUz67ppjd4LqIn0kMYlTI9jMUFMIW+okY6rhoXtWEMota1ydqSXE7404tttUkF8T0X53kbyggho
	0MXDkMIw==;
Received: from mail-japaneastazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c405::] helo=TY3P286CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1Xu-00000007oCa-0Z4F
	for linux-i3c@lists.infradead.org;
	Tue, 07 Apr 2026 08:12:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzUfo14UT/ooW/Y+b+7gQ+Nxd9y47Eit33VyF5myYPI3yMvvll5fUbKcyQ9sXxB7LWhs24qhBt7llZ8TUcP9zNbP7noQDjs88Htya3XYZlRprgLKBMIlXo/Rr8cP6C43pfVVes/WkBhzRaKX0+7JbJtfM5EIMw66IIgYk2mHSOTy+fZpz7QR5K+FmwqgaX6hi6bwEirXyZEaTsQCC/aFjhgbprsx4+v/iw3SsfssAWLdEZTcY5daN7m5kqj+kpp0mOUZvv95npzFkk+bW/BHvESL9HmH7s7AwX5s62LHzNWkz6MaEVjyLIB1c/Cvvv1MfHXVBI+7UHBWz5g0LJEIiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARGDu9nVrx+UddrRn+oAjOVUZVxQNlyvoGohCRIvDWI=;
 b=ys5Ok7QfbMirEmo33SqKEVQFkmNwZ5ofIuZAiy3K24TJmEd1sT1WW3H7a6aaKa6OcYHK50cDC4gJ52NtNcgJBCS62GQB0yC0ZnN4lNYfhYB3hZxI5v7MEIUCh4u82gpzZmS9fipPzBn5xc1nyd2WecCqEQak2AIz27UhVcdIhQaMr9RHMio253XYpfIsXNeeezTsqyM07u5HsjraZpbnu8WBK3oJIYAK2E9/OZcIPjiQf5EYMiipVN3CqJquHpFRcVuFsPaJAo1AG4T42BxMcNIJd5U+L04ygl/WdCSudDQz5fvHlhmmk6j6ewfSNr0MmuFumV4JZBdKXuHoONX3fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARGDu9nVrx+UddrRn+oAjOVUZVxQNlyvoGohCRIvDWI=;
 b=d0c6m7FIneZCqX9uMHurJE2bUO1fGU14oOhJcGl1Ws8NiAqk2EBW5ufyoFZeOtMDJGfr3zDkJfvqoUYxQGK2H60ybuL1QqMqLPyuoFyn2Og/28W4wvrT64S85+gC1c3q7lqGrilv3tlYy64zR5cuSd6NFlLX1nCJTeGgMtZuxBU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYTPR01MB10920.jpnprd01.prod.outlook.com (2603:1096:400:39f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 08:11:55 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Tue, 7 Apr 2026
 08:11:53 +0000
Date: Tue, 7 Apr 2026 10:11:39 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i3c: master: renesas: Use __free(kfree) for xfer
 cleanup in renesas_i3c_send_ccc_cmd()
Message-ID: <adS8O_ymEIefZkva@tom-desktop>
References: <20260406-renesas-v3-0-4b724d7708f4@gmail.com>
 <20260406-renesas-v3-2-4b724d7708f4@gmail.com>
Content-Disposition: inline
In-Reply-To: <20260406-renesas-v3-2-4b724d7708f4@gmail.com>
X-ClientProxiedBy: FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::23) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYTPR01MB10920:EE_
X-MS-Office365-Filtering-Correlation-Id: 653dd37a-d8eb-43ca-c9c4-08de947d53df
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: /lniqp8q7Ruy2YeFq80A+mec4TP/FxlUKIcD44bzT+AX3K79wMt0N8EVBZiAuPtoW6o1QaQ6fwWFqb/bLJAOlOqjkyE/POigveBewsJuTcJnt3V9L0fwUliyVP3EYheSPbSydBbdlqaSsr8pT+bhUBTOb8z23zcU34Jl78ecsfPVZc1E1IkxBBe/aKf8pp1y3EV+IW8n7ukHWLH4JNMkg0ozuqAXnsSmNZa8gt2ZXB2jxS5tAakUie1G1gJzecqK2LawWEscLckEVtkouM1vfPtz6q/2n6sJbfYFrEpRmPC1kJ73WpgANPeE8OzNH86ud3h8sBXRekRgcOFoeEgNDAqL9pT6h5thdhEuCMGVSU/IesFCHWm+y79Ax9PoGXI0sokaTJuS1eQxaT8x/xpS/g6cea2DXedOADV05+gElJhDiQgWZIxUwNsG1Bl6jEr7fEzSxKHqhdgbRMnqqggHzhBbXvFkXUGXtcspF2YJuOtZZwjd49fkpEqCSkd4Fa7JZ4w4Ih7SGgnnSJ+kY/+KFmURJOYg+YVJaJ3+PGrrxw6XYRB3yKY8oGMw/O5pytaPHnBCsrsDvHc9K3HMhiNYp8Og41TWu3GL26V2KZTdem6b3g4RMZ5QhVEPAK4O6GI2S4K1X3i4Iu6g9WZYSXJMZqG0uGn/GSudT7cDm2llJc8xQJwikreuSkh8IK++iBVBWK0q2dE0fLc0svI3UixOgT7h/fV7jLRWigmYIFDwv7oSroKbqI0SsZPjc5sCiZfY2FReIEa5SI4/IxsoOnOIGkbG/nAtLCNOsal+wviyLOo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WfyLhKa2qeLM+4qkU0HFf1zkFhU34bQZboNZBMmFO67L/sJJ0+sc49YViwQc?=
 =?us-ascii?Q?On5pOb84DkLsw0rMwHNBaISRVzsffu0igOOgqnKEoYvKNUrntnX9uuRJI5pG?=
 =?us-ascii?Q?nHwFWSnpW+6Maa/Dy37MJYiUa/DvGhCVmz1UKrwVJRb1h1/T+dFWKEVa7aOq?=
 =?us-ascii?Q?ZeyEgr21dziNDroiieIM4TfYmRHMQ6Vi0LRYIondn8EcKDWi1ZWPgWKYBQ1f?=
 =?us-ascii?Q?RZPbJ8AKZkPQkuDU9z6KDScWaSvkDWwT6YVejK4wxN10NW62AUkC4QJWZ4HX?=
 =?us-ascii?Q?WGS146sxFga2kYKPDw/7yWlbpRDW3tHTuE+xpQpX21g+7y7RZvptjOU9YPMc?=
 =?us-ascii?Q?K2pPVLaMgfHIdDdrgeP/JSHU0hP8FE/nwUKasB020/1/EnA8sPVAbMb8W1PU?=
 =?us-ascii?Q?/qLkMRIwdPJOtSKmb2MpvP7r2bbDGdVXKdWg6Z/fyZBfZ3Cefjs9h/5L9D2O?=
 =?us-ascii?Q?fmA+nv66dEkIMlqL3u4eWM7M6VIGpFAFI6qlfwMNhfGQLIL30Kezewjt4rxm?=
 =?us-ascii?Q?Lg/3kNm5WxaWPBt55k6Pj0G4mefM03pjtgMimPuDIIJLE8aLXcTx1Qj7x7Tv?=
 =?us-ascii?Q?ol9nWeeiKn5j5lxTyTfADL5aXr961orEz+1oVLTX3dP7mchaoBC1wiF0dy3s?=
 =?us-ascii?Q?w/FZzyVs9j9kF9XNKZtB5HJZadCEsGLvNKKczKM1I/2oWSnBm8l8C63pk5Qr?=
 =?us-ascii?Q?FBA8ipOCI4LHb4GEMwC/5StEiYuOhtmD/Dws44awAMqOPt2Y7jg8aGOuZMBd?=
 =?us-ascii?Q?wTCgYe7GjT/4Anh4NpRJUH9RgvE6c6SjDADG9keRFQhFMrskvZrnSeD+T/rY?=
 =?us-ascii?Q?lrNHv2+72e6l+lB3+6jA1dpsus8u4a8veEpfbLg0oYaWSDEwtoY93XVYjwl7?=
 =?us-ascii?Q?mcFMsOmmamcGZvnzJIGjANgnbBvDv383MgakJJdnnjQypVGUe1WROuUyLE7H?=
 =?us-ascii?Q?ZTtKOGVqx/xa4JnxwzKyALU2kfhCn10DnPZY+SJQUEQTzB4vzUvd+y0JOncw?=
 =?us-ascii?Q?WiU0p58YmxlqpoMQyBfW1SP9e3QtdFbD3CPyT2MhSRSuwQj6t6M45patsRvh?=
 =?us-ascii?Q?zhCcC9eQjdlYJiPrRje3gbyJBT3TCdVQ2XNc9UxuN+uCZm84CykFTvx1Mib4?=
 =?us-ascii?Q?thZQ3JzM0IecCkSk38BG5SuGCTcskaowXVs46UR8uotfwIeYUiuFhGYVaicc?=
 =?us-ascii?Q?JycoNrDGA02Djhx5yqIUfEHucPxmYnH9lQh4vOTTpl5Yn9++Fhb1jsjD2nSd?=
 =?us-ascii?Q?FqMk+KhT+MR84IWfuAIl9BJiPZr9H72glFI/OxgJKSqI9vm3Dz7R9VLjYIDa?=
 =?us-ascii?Q?QnNAbYSy8CvpyKq0/XCMlJxxgv37hHpPy9kJKJsYdR6iXZBeF8eD6rKXnjuY?=
 =?us-ascii?Q?GNtVMdnkW5jg1EajWAWLzC7KaJj3uClP4ECOTSTkLncYi5uLbio6j+wok+Mg?=
 =?us-ascii?Q?DULwpjzzTT93CZwdEXV7zPAv43qZxbEPsLb0kwJ25uHErJYqvQsR7UC+sEw5?=
 =?us-ascii?Q?JycaSiqeJPOJdL8b4A1S9bRwZkaN8TLeQrQaZMCKBE3CebZ5GuNPHRhiVojj?=
 =?us-ascii?Q?HolaBSHTLZbq+/x0vSdVCTYE7INgOUKgbT/ItoybOrbM6onhnnliADb7MZb8?=
 =?us-ascii?Q?mjq1QB7SwPPh04Dhqh/sPGIljtPYr9NA/bmDi45VIUlnyA8YKEii6fOqZeh6?=
 =?us-ascii?Q?o3H7Bge61IPy27Bx3PdpwoeNVcDvK1+O2pOWU0FDa+fHram9AiHf54bjA/gs?=
 =?us-ascii?Q?7IAKvcuzXFI0Jek0AZmtHFuzEFZXSQGNIUrFdUYoNk8zvOFcQmGs?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 653dd37a-d8eb-43ca-c9c4-08de947d53df
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 08:11:53.6246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJbI2/mik0vnHIwnjyhd5dEgI/Tnhfb7oNKi8HTKaIG6HORkTts1g6AvfFfrWLB5jiiwGAL6YCXr4UoQVrSOfw9AiHTe9JCeiMbZcjEUxIC+h5yQyAhjgxKvGTLUSrUT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB10920
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_091228_197099_1886B93F 
X-CRM114-Status: GOOD (  15.29  )
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
Thanks for your patch.

On Mon, Apr 06, 2026 at 08:43:17PM +0800, Felix Gu wrote:
> Use __free(kfree) for automatic cleanup, matching the pattern already
> used in other functions in this driver.
> 

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso

> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/i3c/master/renesas-i3c.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index a8a9e89a9710..f39c449922ca 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -748,7 +748,6 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
>  					   struct i3c_ccc_cmd *ccc)
>  {
>  	struct renesas_i3c *i3c = to_renesas_i3c(m);
> -	struct renesas_i3c_xfer *xfer;
>  	struct renesas_i3c_cmd *cmd;
>  	int ret, pos = 0;
>  
> @@ -758,7 +757,7 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
>  			return pos;
>  	}
>  
> -	xfer = renesas_i3c_alloc_xfer(i3c, 1);
> +	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
>  	if (!xfer)
>  		return -ENOMEM;
>  
> @@ -807,8 +806,6 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
>  	if (ret)
>  		ccc->err = I3C_ERROR_M2;
>  
> -	kfree(xfer);
> -
>  	return ret;
>  }
>  
> 
> -- 
> 2.43.0
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
