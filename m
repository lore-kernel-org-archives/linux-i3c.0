Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0AED3B7EA
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Dec 2025 15:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZkO0YmKoczSdwamPJtH8Tn+GoFhmScIoXdiljStcjqQ=; b=0W81QU4mK6XVj0
	RxYqGlevAuff4P+DG85efqI/iyRv+vxoKpjcQ3AAWStq1Q66wcvPftbRK/eo6YH+LikGzZIO4VCOb
	+NlacQwGoF2jSx91wyfy09bUkzirIwhaeSXAX2QsMH3BTeJa7sgBp3swMBhwHndZjMbcjOxwhbEpB
	7KgFy97rQEtZRhglmrOCpWgxGYEWlTuKOWqHMv/0h8DWnl8q8lsMNqGhH4WsTddCYUQzPVH80sA3e
	vJ67D5qjdi8AURMHn/jnA/pxQA8qhKBSyYTa45yIP5Rt8w31Uafzz3Joq3p5uUfno7mZytdhxWy6F
	OBaL6105GPdROLx5h9DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSdVw-0000000DGk4-0F6L;
	Mon, 08 Dec 2025 15:51:04 +0000
Received: from mail-westeuropeazon11011036.outbound.protection.outlook.com ([52.101.70.36] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSdVt-0000000DGjH-2AMd
	for linux-i3c@lists.infradead.org;
	Mon, 08 Dec 2025 15:51:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXXLiI6CuSPGnO2Ko6qqNJRPHRrsbqEgjlNoLTj14NsA9SPru0n4HTxzzoK3fUZUFLP4odSuv7cLRwUTy0QfR8/qOAt4YcNT/1kjGcfkdCQdFGRJ3wTOG4WdopVdQmHTQuEimX3NU19+n0R3coOvvaEL+mojvuRyNqdKuen93rKXickvSyiJa8Gqh1nvNP+J41M8SH2KY5gPC7R5juDRNORW5JtNQf1slcdQshB1CVt6HLENtGMGhgRMHA4u1DJXvUDr+GMdMVGToexjiuBmJxdg6AS8zVB5HmSsPcxPnwQGws8lvzAU/O+bYLXdsxH9NHX6kCXZ1gGXP8w6+znKvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivs/bR3yM8bxC7JkFxBytjCnJHSE1XDJJkbE8Duqkw0=;
 b=weg9Zj6Hq2pXTes6lBwPGcrkCcrf+K4le9jJ17g0gBmPfZfXJ1268IKEJbbN73p7gHJ8gViVxTdo+LDM4NAEEFbMIKDapgVNkJEgMNpVQt7irZhN3xwXsANH5PVpetRBbs/J0zEzX/Wg/bx8FHynFdu00jX8MU0CZUoqbutwJkww+Mjsj9o+3HphoGpRsyV7tPOVEIZ4F5sD7nrnJSXCrxmgVo1lzYdjWao1k98K4Ov1s1Za8a1KW/Gf1btfB/CBl84rv2EAh/PrsglTgBNHANiMhHDqIPOpNoRlkPHIu0AfiVlfLXJ/kjrpMOTsQ64XNsI6A+q/6euercdEDtB41g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivs/bR3yM8bxC7JkFxBytjCnJHSE1XDJJkbE8Duqkw0=;
 b=NwJBw1fNVNomQMTsBnTpN5AjABhy5zE10EBI8nIo/A7MRJuAFfa4X7Rji1BftjfqfQlzJOFzX7w1v+3vOnkarfRo9UGgQAMXmNOx9JlGe67Q9T1yXUHwsGkllzMS7u+kEPU+xyZ9ltrQJQSUJP6dxwCP/3AXfDO4paGzvackHqhSbyyvGzU/Ypo9t80bY8SpTYV1FqrDqXkHY/6tcGFjxJuXuUkY8AUrWDb3HQuFSNWH6j4sy8fijOiqqDj8YK/PQ+jburmb277ceT6mH0oBX2lSrW3konPRu8CIaESyAEsc1dX/8exqcnxrLbjvLr22HPpx5ahFkdBLslVf8uSpYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB9010.eurprd04.prod.outlook.com (2603:10a6:20b:341::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 15:50:56 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 15:50:56 +0000
Date: Mon, 8 Dec 2025 10:50:50 -0500
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jorge Marques <jorge.marques@analog.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i3c: master: Fix confusing cleanup.h syntax
Message-ID: <aTbz2gkfQm9jcHbQ@lizhi-Precision-Tower-5810>
References: <20251208020750.4727-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Disposition: inline
In-Reply-To: <20251208020750.4727-3-krzysztof.kozlowski@oss.qualcomm.com>
X-ClientProxiedBy: PH8PR20CA0017.namprd20.prod.outlook.com
 (2603:10b6:510:23c::17) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: 994cdf06-abac-4f33-c71e-08de36719333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|376014|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oXFyLcG/XqRj+qc88MeaahSf9SnVLLa+KtQ+zBc6e/yL7Wvpp5pp4GByJDEj?=
 =?us-ascii?Q?SveGF+EZJdQaf4e1fgeyaIBursDSYpQEM3Kkwp1mehS7RDDSmsaH/quqN7Jo?=
 =?us-ascii?Q?32Fzq/dOpUfz6N7iVaMqCOdq0l4yEjW0JtGh3iuF9peU1XIW3MX7yryI8hpQ?=
 =?us-ascii?Q?KnoBqPnMt0NG6SZSHVwtJ0euCFJZfUWyn5iSOgX7dvgMO0PyGowgMF8ldvTf?=
 =?us-ascii?Q?shDl/8KT63S09TQFLca88zRdArBvx0qCLUTW8awusJfIjcc1obAVuAXQkRNN?=
 =?us-ascii?Q?RufSGGV8PYopHYwwuD1m0b2uEeyNC0kypi5jxsIi1z3pWeg3jnP5Ejbcqo+z?=
 =?us-ascii?Q?Voht9F0GgnUVzeJBiyahPTfGed7NMxtVQIrh3Ynp4iaeQwS2YnVyLA7YH/Ue?=
 =?us-ascii?Q?XBeU9cgBcOC0wREgugy0df5kRmQ+9WZACD6KBsDP8Cx2yAQvaXEa84nPoFy7?=
 =?us-ascii?Q?nZkNM5Bw/fHQE0GuIqj0ddyEWGJhOjYgG6W/4dkoYK0NNCDfzdEKdk/h7T61?=
 =?us-ascii?Q?cg0Sb0WqMY38Vm+Oqv/BJUizT+CziUA13eXw5gZEUM7kicNhxkDuE6eFYGmq?=
 =?us-ascii?Q?xrRvR43T0s/nc7Tc6c8k2qSxmshqVLQP0SC/QHG5jddI5MMd/ZwmNEnXAq4z?=
 =?us-ascii?Q?jfhaacnCXfIacqu5MgH92Z3/ulYVE8nLICBMtCKRGSdmozoJtQc03x1DKH78?=
 =?us-ascii?Q?7Lti7Tn1GtKX9yJ1Wx/YlkgVYpzy8cZOrD/e73AZs0U7m6xsjepXRVaG46sh?=
 =?us-ascii?Q?vjIUCobAV58uw2MMZRCjqIr6SSbvAf8mFkMIQzROvbhV32LtqGZmwqkqS1eY?=
 =?us-ascii?Q?9WVTPY2ihhPA44cl+l5pngfVmK2zKOrxWyetCsVdlwdme8Ecpu4J34sbUOqh?=
 =?us-ascii?Q?m00w4S2knRhHGw8U4MTfWH8DwIZc0nMZ89Qm64EAjmtkbpZLZDhoYjpIRMgm?=
 =?us-ascii?Q?1iOSV16DZ39KhTC1f0oXb0v4KM4Bxi7CeeucBfvheq1fzlYyN2BKLVfMhzN5?=
 =?us-ascii?Q?ZWYfWe59tSZwkPt0abwHxYMvvyYjh4734q2msjG7Cl3Tw2Aij5mOheo+9Cjr?=
 =?us-ascii?Q?tlsk5HlAu1To99BCsi2E9SYenG87Bmh6mFmmZGbHGDNL26vTnggOkte9/YEM?=
 =?us-ascii?Q?m9kKbu1F0b/nra/jCvvSop3DwAdYBxdlzG1+mY7cv262uT4Tt4uFYJZEZTZT?=
 =?us-ascii?Q?uSzx5E3ut7p1E/UnRscLfptUqlOTgxLJUadx0Ru7oJ1/MR7dARWqv0yWcbJ1?=
 =?us-ascii?Q?yFnXvyLZjQcLcTQE5IcBQmNRQ+Lo8pnsPp98nBMEBbV4bAP5LlnyEpT7U4xg?=
 =?us-ascii?Q?eBB49noEhPLfxT1IUpl9z4asBnSLVlv9IkYiGUm6jwnQQQA+nygp0b7hp+xv?=
 =?us-ascii?Q?mqcIQ9tXOHYrPji6aoG73sK/4FYu6g4UNfX17MHnq9+36rbtwpS/8q5niJQY?=
 =?us-ascii?Q?Zz95ri5uuCMojCsvhwheiE4kDb283/rq4f74QMOOCdIFeVhJ25uTzawPEU9E?=
 =?us-ascii?Q?gV/wzZWam/8Cy8lT6VUgB6EWIN3JFZvWqOqpzPp/NQL2AB4Ucdym0GXLTw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gn2gt8xcZR/JsRWm9ahetDN55Tb9L/YBU7JfoygEzXKq3WBADZLswOoAnThp?=
 =?us-ascii?Q?IrTeh/zK50DsAaROV9PWaTmt2lFqKYsoz+EpF5P59oEvZi1q4oQzsSLrndUV?=
 =?us-ascii?Q?crQSlLgxc8JhfLewHGtBkTlrNw+FC0Vq7WXA4lnm7wvj+sbSo4i2ZmPygkuj?=
 =?us-ascii?Q?6oUjUrvBucSSqUYXib6h9ZxA3Vtly/oN1HUBGw3U1pTWYtUSIkD8dwkLm9QK?=
 =?us-ascii?Q?6lH8Z7X6wdHVOABaZLbuNlr9ZDucK+jKr/lysTXrEx+ptmsuoaTXeaytusZ9?=
 =?us-ascii?Q?C5YHD191DOM/fMYmkG1G/f3qHz9/ybwdN/E1+5vfxhQZU7gxRyaM67y0RWcY?=
 =?us-ascii?Q?d74qw5KD3si63feUPKqAh0ypLKl1PDhc5UsIWZabARAAGmOZT9JKhr87zYTc?=
 =?us-ascii?Q?/GsM92unvgoJfIMB+uq9Qk0iJnLXlLgogcORCgDpx9rL6jSDcUF6jEf/ywCa?=
 =?us-ascii?Q?+upZNM4cdE1ZJXHHhJQYchHAelshehPlYKzM1Q7cNRCtrmShxbEDQtreTFNc?=
 =?us-ascii?Q?HMK6BDoV0k8891zqRK24znbGk7uW9sezjRTCYhujpL1DRbyJ2OBHOfO4EqHe?=
 =?us-ascii?Q?O6fRrwsMUpfLKhSbCv87I0Q24Zddr+nPa4rAGSRn7cCo1kizJG6vbvK700YU?=
 =?us-ascii?Q?8IWtQzO6ajEkI2khecoeqGQjnmZPk7O7CXshPWYOxXysNNkm1RzOs+soxrJz?=
 =?us-ascii?Q?bljKdeDfxEy59mc9RqcRcuOwdWhteDGpvvWtMMifnClApxh3BMnBuPO19TTX?=
 =?us-ascii?Q?oc/0GWZVX6qIdkmlwbHPeep9oUGZKHf/s1v3ojEldXfTYrgl8yXD00LgCslx?=
 =?us-ascii?Q?+BHlr7ru1IEZnBv0dQCYD7ZFw1wQfZB05qd8TRE1IGsWwy7Fxzot1np4JCtM?=
 =?us-ascii?Q?w/wPrAOMKmqZTGsCJm/GNpVp5MBmguOUPE5QCt1XMkrU+iw3mLyOZKXoi4Aq?=
 =?us-ascii?Q?2lnottIgy+vVYy74OYZRa/ZmRE3CjIUDRUij+FV68DWh3TezZl3l80iq1xwL?=
 =?us-ascii?Q?ract4ozuxpdStqfQgIkCnX34Nb601Gf3xlMet3GZdlGY2HOcTylzNbT4AfNX?=
 =?us-ascii?Q?m3s+/knRDH0mqUQSRo8PWPpcw9iJAlHIkad4JMQHCgbZYUM22JonPazRJyXR?=
 =?us-ascii?Q?+yE3s6xCKh2iZTOjQAkawfmyJqO4XwAN/gGf3MtON3FBuyj4v/j6BJULuhck?=
 =?us-ascii?Q?qrGXcdBwSzZ4ckUUyaS+idOojYUTMdsXIoaVqYxIEaqOOrDDl/EXk/Guyne3?=
 =?us-ascii?Q?BSqgRx2ZgamZrDnRWu+Fxu0F7QgcoYAdqe2nbnxpr6Ie5F0vqArRBHUjzg9B?=
 =?us-ascii?Q?7In2JUr3UXeSF+ZOoF+FADnLj6TX7c9Ly3jYCyWlsSrPe7PBS6lIrRa7oCQv?=
 =?us-ascii?Q?tRmgNQf9pFlDA5O0i+hyVjOsKS4zEf8XJjSEs79bXo73ZXOzWkCfQf0U1t/d?=
 =?us-ascii?Q?8vcvymmgepQsv+7VXPpRbAqKJdbj01f6rAX/x4o1QwaQ0vsSot2NTFUmwccp?=
 =?us-ascii?Q?FxKfSClxH60Tpbf5UyFGjwN2t7UDPc7Mnz2f1zrSMRBSZ/5r92OLKVaG9Ag9?=
 =?us-ascii?Q?r6Mozd6DLDlnZQXSZ/8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 994cdf06-abac-4f33-c71e-08de36719333
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 15:50:56.4736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQwZL+qd6/AfpD9OjfoQzXcauEjDC6VOfa+xrHCnms/zzwsO+IyFHb9d0kSfuwTION4+BvjhSAbBFUuIVINNmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_075101_556472_7CD11515 
X-CRM114-Status: GOOD (  21.33  )
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

On Mon, Dec 08, 2025 at 03:07:51AM +0100, Krzysztof Kozlowski wrote:
> Initializing automatic __free variables to NULL without need (e.g.
> branches with different allocations), followed by actual allocation is
> in contrary to explicit coding rules guiding cleanup.h:
>
> "Given that the "__free(...) = NULL" pattern for variables defined at
> the top of the function poses this potential interdependency problem the
> recommendation is to always define and assign variables in one statement
> and not group variable definitions at the top of the function when
> __free() is used."
>
> Code does not have a bug, but is less readable and uses discouraged
> coding practice, so fix that by moving declaration to the place of
> assignment.
>
> Not that other existing usage of __free() in this context is a corret
> exception initialized to NULL, because the actual allocation is branched
> in if().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/i3c/master.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 823661a81f5e..62437a899cdc 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1742,11 +1742,10 @@ EXPORT_SYMBOL_GPL(i3c_master_do_daa);
>  struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *buf,
>  	size_t len, bool force_bounce, enum dma_data_direction dir)
>  {
> -	struct i3c_dma *dma_xfer __free(kfree) = NULL;
>  	void *bounce __free(kfree) = NULL;
>  	void *dma_buf = buf;
>
> -	dma_xfer = kzalloc(sizeof(*dma_xfer), GFP_KERNEL);
> +	struct i3c_dma *dma_xfer __free(kfree) = kzalloc(sizeof(*dma_xfer), GFP_KERNEL);
>  	if (!dma_xfer)
>  		return NULL;

According to thread
https://lore.kernel.org/all/CAHk-=whPZoi03ZwphxiW6cuWPtC3nyKYS8_BThgztCdgPWP1WA@mail.gmail.com/
"But again: I don't want to make this some kind of hard rule, and I
think it should be done judiciously and with taste, not some kind of
crazy conversion thing."

And there are not logic code between declear and kzalloc.
https://lore.kernel.org/all/CAHk-=wjMMSAaqTjBSfYenfuzE1bMjLj+2DLtLWJuGt07UGCH_Q@mail.gmail.com/
	struct ring_buffer_per_cpu *cpu_buffer __free(kfree);

        cpu_buffer = kzalloc_node(...);

as separate things (but probably next to each other, so that the
"__free(kfree)" part makes sense because the allocation is right
there)."

void *bounce __free(kfree) = NULL, still be there. Only cleanup one is
not enough valuable.

https://lore.kernel.org/all/CAHk-=wjMMSAaqTjBSfYenfuzE1bMjLj+2DLtLWJuGt07UGCH_Q@mail.gmail.com/#t
"   would then make that otherwise nasty allocation then become just

    auto cpu_buffer __free(kfree) = cpu_buffer_alloc();
"

Maybe we can defer this cleanup after kernel using "auto" keywords widely.

Frank




>
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
