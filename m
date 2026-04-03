Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A73D7308A
	for <linux-i3c@archiver.kernel.org>; Fri,  3 Apr 2026 02:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+s9XtZ4skGYQsM4l7ZcA9NGow4svmcpqZiElcR0NPGw=; b=PMbvh9ltCr2i3u
	AqFkNV9hFGWc0+J5T+6FRyhkrtbWiHwkuMuyPw96tOdBOcvGU2TJOwMqSlfP5HOraL9IcWo2yNZnK
	jboY4VWbmPfGHZita2/DQcoFcK+2vuZW6P5NdwUQVyzZWBxz1arPCg8LTTDpsy+UB6vxdYr7odsLe
	djJLJdjvpsFJfP/Eo7rTBF+rBjZXdntbkU00pM++21Oy10lJwwnH2QsMaWrFnNMvCMhL5b4TGR17X
	2dmpgkbAiduNU8Og4KA3f3mlVPJJibOoZ70VfoUWGrLNcGxY8ePApP+NgjlXgyMPlq7k7N+lLHI6C
	gkF1UUsUNTnJrrjHPKUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8UfW-000000017Qh-0sHt;
	Fri, 03 Apr 2026 02:53:58 +0000
Received: from mail-northeuropeazon11011047.outbound.protection.outlook.com ([52.101.65.47] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8UfT-000000017QL-10o3
	for linux-i3c@lists.infradead.org;
	Fri, 03 Apr 2026 02:53:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5BH1PN9G/XNrVkvMDMcqoNQrxCkT12RLb6Bu9yv+IhkyaDTiEq+ZBTjqz1FLqtuxJjXAEIDOcAg9ftymBGFYY6t/ktGPiMyIMAo/QjV4yq3DOopb336xdktNG+/eF2qMEnQ5UT3la7V+yzXWjDGL9GGluNFACu3s5C7CPHAgRoVgzvEUsuy0B08gk297suqq/1rSfnHa1Hw4cc/1RvnJsKCfpSyLJa0m1l8ZNHxpH7AS4BPik+lSAVS1S/4USN+ZAK4CgMaLh12WHCJezRawLydYUt7sshDupw45mpLWblH1Fl3OZNitNN4B/LNKzyxNQcUu4ub6MHd/9aDEw2T2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wo8KX6FCA0VYPbttdMmoD89X3+o5rR59bbrvJv3bLG4=;
 b=tyHqPD6CxENfYsGh7WnDnXglZPRwzgKqoB82PCJXNHX25OW3edaPdYz+xEQ+iO30lezaGMcQ0H8sCTdy7xBP6uiDL6qPhgBKIVZqJnQfXPz49jzGACG3lN2j2PYdhf/RoMPnZZWvpGJCXhKKIxEAVQk9+uVSsokINx0At3/8bhpRBNWwDAPUPcN++8NCr64epkeGixEEFBNzYd2MPmGsCxxgvoMTk3T0/KO+Qb9GIfs0wGbTZy5XtvKaPrBPgckq9Gwbl5A3of+I2tP+4pNQ+3Pi06xBi7211SMwHx/R6Jqd9fdQmdigCYLzGjazNG/v3PSSIFwCDvRaj0zsn8qDzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wo8KX6FCA0VYPbttdMmoD89X3+o5rR59bbrvJv3bLG4=;
 b=btNj20ZPB0NYU7FJVE6tcSgeBn8vqkitALlhfLPtsUl21JPEFz6OEZ+E1qFj84G22vtibwW+VLWYBLX5nlWDSc+vQyAmYtNaoeZmy1MxQa8cVzSAlywPr1pJXkM61IYMBo2beaVFZbu9w3XQofoxIUrt9yF5W+2cbydzLJ572Usa9f1m7YClkxWvVc8t/zzNGnNM+o+PXvFQa4lS3TKi+BU+iOmsx0GyklDH5V3jCNfm4+6Nq4RvRErba8wY60r0QzHzgZ8lJWcnUfR5kTO48I+nnVRfHzri/2w2y0uJBY54EfTBaNttNuuM3BfuuImna7ZFZBmEmJhp/nLhPvchjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB12142.eurprd04.prod.outlook.com (2603:10a6:20b:744::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 02:53:51 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Fri, 3 Apr 2026
 02:53:51 +0000
Date: Thu, 2 Apr 2026 22:53:43 -0400
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i3c: master: renesas: Fix memory leak in
 renesas_i3c_i3c_xfers()
Message-ID: <ac8rt5YpWkflaBC3@lizhi-Precision-Tower-5810>
References: <20260402-renesas-v2-1-f7e8cf73c7df@gmail.com>
Content-Disposition: inline
In-Reply-To: <20260402-renesas-v2-1-f7e8cf73c7df@gmail.com>
X-ClientProxiedBy: BYAPR08CA0030.namprd08.prod.outlook.com
 (2603:10b6:a03:100::43) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB12142:EE_
X-MS-Office365-Filtering-Correlation-Id: f26ba35b-d98b-410a-843c-08de912c3c66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|52116014|376014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: vabdjHgyLmt/MQ+twtjZAV2tVXRRxHodpOMusGfo9eu2PCc1vp3TdXsWRTGwzJhfwugwzG39vu13B7r3+gPwEa46rzdqp9Ws9eB/k5LFhh/gJN4RJqqU6msUqJ5a/ymUvUtvYAI9ahFxJsIZiPkHYX4BP1qcAbzABtZReXMq5rYj3VZP38wGjNwWKVxM5Djn7H8dU8YQmWIbS8NEJmxu3qCWgZ3gsyWSywvMyxNATpJCmUdWN2jwGdKDh+1ScI10LJaexT1086j028p6wmxOeNpbNkE2Bf+ij/gLZOOkVTkieEQUQ3Yx9Mbk9ebc0DqVNovMM1qaRuKgXBcRQAjmyXF95z7O/SKl6VNR5/kOnDotsskuNE/CTPYkTfWc9AoW8S18DniOSfPXp0AINEqrd1oDAtp4IYu6ZXk9TuVowGqEYjvWDor+iPVndJ5oKRPnpu8U6YMlRhTeM0L56og/k8rhNT4SvSbRZeMtCSGPr2jj3NbDSGfqp7I84A0AKvu91dl7yrCC960jA02ve6AycZ08EXo6U2/AgU7EyqCS9o/jI4tMuqypDLAt62HiztYekZY+arOhLJ5dRPLueGCsX2DpfP5LbE8MbG1ZUmOX4TuAOVCsYrereUVD3y7fYAihWqDVA41FTXZ4IBUoql/IGDHuD4DNRnoqf9z9mW9we5DWwt9RnmbVKQS98OIDpTruT/npjHt/lCJE0D9HRxPINqUF7L3P4ov6SZSiqHSXJa4h82vUapkNTfqPHt7lLmymmJyqGZZSdq0q0CKkKJbP9c+xjVLNwzuwDmwhlD8whP4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(376014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LtKTBZEzPLQTb/tLDZOO3aiNNwe0HrT0394FugpFX0yMHbRwQpuxPMrSLETP?=
 =?us-ascii?Q?x1gXGLONxxMlAUtw5qIF85828zp7z0uhF/NV4gHBEv9YezV+wVP7bpHPSshc?=
 =?us-ascii?Q?Ya91K4Y5OrdXb6BjDL7WPqDeLz3IFAilNfYT2eMVMea4u6scNG5HVDM9BKZa?=
 =?us-ascii?Q?EPRMbjniggDSwgwvZmIO9eqvqUA7JavfzbYZaS0DoyiJ8QeIfgCHnmWZvdUx?=
 =?us-ascii?Q?2nxd776y/XrJID4ZCvupf/V2VYeVM5DmrS2zuRIcFMgUUgTdYFGGPABJ1ZmR?=
 =?us-ascii?Q?6TRgMx8c4+WiMqKLUMiXdGawfxuFhSO0Wgi+ZvxHW1UG/R8ctkUnspyCfsAN?=
 =?us-ascii?Q?uELkWIUU/3IVsxGTOR6ScBem6zDpAHd7ZLt80WdZsyvVCY6daPg2Mg96G7gQ?=
 =?us-ascii?Q?4Qk85EaNMvbQZ1TVrBUVGr06tWvHlyIWzak3iNp93JraRBC8U/u5l1AMtd0g?=
 =?us-ascii?Q?US3yGEMTs4Sde4j+AThINZ+CX2LSkpFgM/OsalaxGGc5uOZfXu5QzHiO4ZSk?=
 =?us-ascii?Q?v4Y3hYBHjfXGhmlmF3tV8kyHtbGYRXcBBBjxlgPcUynX+TJ7NUBQKBP8Maiv?=
 =?us-ascii?Q?eeEyUVk4TU4IV7cXZRH8e7/KgscErSzFtKBynDaWUx0chgJm0p3kKMIXbhva?=
 =?us-ascii?Q?hx/C6hCN73+rjmgmIG0WgaNdlpDAUDSmRZF57hw6k1Eo5LW6L1pOCf2x6X0k?=
 =?us-ascii?Q?/nJAi8aoTeLdL7rNmBeUuvn7BfOKKakbbwXjSB8EEefpvbqYZa0cbSYExNbZ?=
 =?us-ascii?Q?o7jwdWfpzp9kizOVNBnkupkOEyhzoY6p3JQrb81G7AmkMKae+VK5d/D5ZnyG?=
 =?us-ascii?Q?3UAMuRgcd1x1zFULS9CO5KjlfXRXV3YM+h7OjYOcAke4+61Cx1fTcB0jEbQu?=
 =?us-ascii?Q?jeAorg3Q7fGsGCD+EQv4ZG5tYSlrWgERs5deXXOUQRJCJBsrnAdIMceGHgCi?=
 =?us-ascii?Q?ph7qiQXvOKQwsmrgKyQuQBRZMygIlyet1mOIVAyOdEwbsIoS0/DH6XX8wlSE?=
 =?us-ascii?Q?f+M8C1B2PneI0ro/DZdJGtJ37LDFupkeZVYf/jWLL/6IBXPmxEiIb1hxhhYA?=
 =?us-ascii?Q?3CGnCzSDhiprwGtNRB1eXHCjMy3tj9vI1TcX7FVfn/cb5Wkb7hcIW5eul4Ls?=
 =?us-ascii?Q?7XiI6ZLwPMMhJPJlOedJBLb5O6C1S+Q7UF5zL8OiSOiisFfc92Lh9ovfgBJP?=
 =?us-ascii?Q?RHc4BUhCSKtx0HwYZ3JMccHRJQSBSfUOqZ2uIpZfFQ3fxJ8T9rLmY3xKpQRl?=
 =?us-ascii?Q?hCPMd9Q5gGdIXt5gmmignn0PGtOugLLZc4ioqnKUTg9wWJEDcRex7PcMHkge?=
 =?us-ascii?Q?1sm35EdgGFuN1L34awPcuKa2O+8c3kFWCwXmEUpGy3PAVZ7MA0QYR8Bc6Tx5?=
 =?us-ascii?Q?QHfcPdXuk1jBqbZRJ/pPHPJ4i1/NRzAqHxtlwhA5eups2N61ffbSgzNc2vWv?=
 =?us-ascii?Q?lJ2YJMzWzeGY7hRYPRjUDv96RXptACW0XqFm5DFngZs1oTLiGs2LJeEWhMjL?=
 =?us-ascii?Q?XFgoFVzVM3fbuSv96zLcoFfd81rVgE6x5zsUkOuS5esbUgoc4Utod6a4USFe?=
 =?us-ascii?Q?YZOJBHf3wPWlLFCR4GIuu1L7SSlLqrN8hyPwI1fKLAyY2qjSdifUJ9hRoKY9?=
 =?us-ascii?Q?PTes7i4GkyTWg6FLNQdzc7su1MKIhrTFXUKtbFKLcuX23aupQb39aEeqbJPf?=
 =?us-ascii?Q?Thodqrv13MAEA4xee55/UYKmMki00sCLeUNnqCST5neHfAYL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f26ba35b-d98b-410a-843c-08de912c3c66
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 02:53:51.2510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sk3iKx543n6XwJogh58qn6yWzE5VWLYOjCpAgEvcbNeGQTf/zq7rvH3YDijjX5g5lKhR6LDm9wq1/F+ySowq8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_195355_308022_DF1178A6 
X-CRM114-Status: GOOD (  19.86  )
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

On Thu, Apr 02, 2026 at 10:52:26PM +0800, Felix Gu wrote:
> The xfer structure allocated by renesas_i3c_alloc_xfer() was never freed
> in the renesas_i3c_i3c_xfers() function. Use the __free(kfree) cleanup
> attribute to automatically free the memory when the variable goes out of
> scope.
>
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
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
