Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B10106ACE5
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Mar 2026 19:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZWudcAXTZgTDJ22S2RjMEVRgl1BYUb/L6D7jUud+UA=; b=okmHONQj7QvSi9
	eXTxUSsn31G83BCQXtIeRlXlrv1dmPuxMqlAW6QOQ1PU4/Byie68RiX0Z6uzBhfZkSHwVCUOrwIyq
	/Imc9zJBNAz+s+on1bc539CSTRQfbyP2yD3KH9gsJc+JsqNHIyomyqSo9umzSlus1ghEjQPoZTzdp
	kk1cSYRHmlsvGx3hV+TkW88bIxtKhvrf9DcXhp0ofMXDtpJWWIkfmK81SVmIYoI3xTwk0y4bxgOwA
	Y/YFpuGJ6CN4Ib5o7P8NbkyO08MbbIJW4+IXdLWghM9WI6ebbq+FfqSUcHbABz+ILcSEhidN2+6k2
	oBouKsJpN1tuF++7etZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mBe-0000000FC8C-04xT;
	Thu, 12 Mar 2026 19:59:14 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mBa-0000000FC7N-2Kaw
	for linux-i3c@lists.infradead.org;
	Thu, 12 Mar 2026 19:59:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5/EWib3FJxqKKSqNDvJI4M//zOm+7ARxHmUg65lzcZAnhMAFIOxeY6K4gVNYTjsmQu0mXtD4tjDM2xtCO75THc3t8Z3GWKGjrmJDDw58OZCOSNGonR8AcDKsMQdDk0h6NNf8i6kwSexYtWDGqsbnmpy/71DFdJHXlbEJTICWKZETwEaTwQNSvNrtqwaYC9xNHnWtP2pJzIUIUaqjLxwii/FZ7kOruBRUdmZrC66f8TWibr0vttmPTBUChQEOHuGxJa7lEiEB1VPPlWPmCYiTVs5DJKfAzNBMIdIGJqT9MvdIu6iJn7H/NkmkP9/eDfYeHRwrbWgOtNzA/fdUsbk2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWxbAyqsoE+vbsLZNwSyt+BIEDBzdSuqqPMTq0ABS+s=;
 b=i9PPKEkq0FWm5K4iHhoE728u+wV28f7COZ4c5gtdR89UDqPSyNmWSR2FHMPcrGNw6ZwvyEaSHEAW6nKTPHpSd3gd6mEVriKZPtGfqQG/Rpt4epP6Ni33AIIBhMOcfQsPdCJc+LqEfzv5vZL1yeHaTMpI06za6es+haV99iDA2d6N4QFHFOe+KoU2Y8x34QysmQlwKy4mbMNi29hfXajWRMn+Q28d0g1UZQQHvZbGVal/yS0eghg3m5fvO7AvLcf8n+WVmfmImF6Wg93VAs2pJMdTZi3K0LGZOIlSbfj8sjnj+NfiGSIfxceF8h5oSVe2YaZjSHpwMmJtd6WWRAl4+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWxbAyqsoE+vbsLZNwSyt+BIEDBzdSuqqPMTq0ABS+s=;
 b=lysICWfUSgXdj0cwAuVJzCrIg6DJNiiuFhA2XXPK7XFfy6zZaHl+lSoJxkgV+c8Dcckdo1lvPDeqIVYgJ454s1g2e7zHKKKOiFTpcSkILpzVvSGfMViBUd87UlvgzyuQSrftDz1uc6V1tHa3K94MCB/6sSolA5I0+xAY4jtpPjInfpu/eFrOdcrpWepQYXkna/u0+d5NjJj+x4vrrNHQA0sNgmKzrAgN31yzDfjC8xmKl4TI1NtAMmPRHqiM4U1HXIQs6l6uuKr/saDZzkNyccgEyWySLbeH3GHo9bO6FDXJYADF95+cL/P0Dr7eIr3FfEpObuYIQNO+FDzklFLjXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS5PR04MB11372.eurprd04.prod.outlook.com (2603:10a6:20b:6c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 19:59:01 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 19:59:05 +0000
Date: Thu, 12 Mar 2026 15:58:59 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 5/5] i3c: master: adi: Fix error propagation for CCCs
Message-ID: <abMbA0wSxwZgyV9p@lizhi-Precision-Tower-5810>
References: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
 <20260312-ad4062-positive-error-fix-v2-5-1c933b5c7ed8@analog.com>
Content-Disposition: inline
In-Reply-To: <20260312-ad4062-positive-error-fix-v2-5-1c933b5c7ed8@analog.com>
X-ClientProxiedBy: SJ0PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS5PR04MB11372:EE_
X-MS-Office365-Filtering-Correlation-Id: 34b2bc7c-1ef0-4938-1653-08de8071d071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|19092799006|38350700014|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: np6hZtx5it+nwXCdAuz5Y0xU8m3hvMQw78XzkZQ/fNyJdn9FNsfb57MABgCnX5krvxWLbeu085XUrzqByBqmgZBUmA22DCRJIj97E1TbTp7y/4rQAB6PXVdbCoAQ7MqzTBa9g0yOnyA2x+qOLltqQwqM2qCwTmDEROAwtJgUOSCxktpSJRTD4wk494pnt9Ew+cYvciuglJo6eVNg6DNH0Mb7kNdHZGPvhnnFUFfDAe6vytkZ+qYqyaI3WFxQblTvpY0dp9Z+QGjh2MVC49Z7JANKBCahst79Aa97OOz7deDDNDyYR151qTYM1RfL4p47/vsbYkT0QsWGZgmEK682TXHKJRb5f8uSpUKZg2BWic5fDNIvHR7tl4BPnPmoMAELi9qL9kg3pIGMV+Qz/j89zsF7cBtH274o8fb5pOEArJEGiAAwJ9as8Ya1uuiSTYyPfjRo0VkqK8o/Rt5MQJsDIT8ASB63P/GhtDj/oLkrFguPndyxA9RirnaSiwj/6tXNBxcmydax7zw1gFGYfZb+BvIdms1FZVqUt9KMVL/s85Gyow5Z7Dgdt7fQ8AdyexBIa7Bg6kF7sm5TvqRDEw9ivBPhHBU7ZyP6kL0T7nzpU6QaiO25aVWS9B3VHLnSgqDeWUtqoNEpx24CGuIw1ij9RVhFRCOKi19pLy37hziKD/NCYffUv0jhB0gAR/eYCgxJdgkxisE8vfDDUJxqGemxizW36fySuWLEgn+AWmfpMpeBHYdCZkMQp7QrsQbIWuuvl1moAZUj1kwKlNhymWSU82sr7bHSlKLLmfhhNgffhxU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(19092799006)(38350700014)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nsumuH7U+2sP0T1hX5IpshCaYFSGXiHsOa5j0TWtWc44fWrw3oxOWIDb03GQ?=
 =?us-ascii?Q?aRnwVFXci87szH1xJI/07X/tWXrcdQ2j7oGBkCBQFDyi0+tBFlnjkEKLmDuc?=
 =?us-ascii?Q?o9M+DFY+ULEpX402RM410lo4m71kdQfc6hwHOQuF01n7E1o3YvyXxbAwkX+S?=
 =?us-ascii?Q?uSWq1oypcyl/TOy7JaBnBOHwvvR3yVwWP58ELNR/TCUcpFcOvcV4oW+zrawb?=
 =?us-ascii?Q?60nFhsOWWQWZqJwnINSd1+3SkyaSENcxo/Xglr8ju6+syOIIDtlzWJz27hbL?=
 =?us-ascii?Q?LF+ykjQ14G+aY2GIZtiTq2NX0WNgJs+z/PcziKt69oJLyccazyOedUCA/PJv?=
 =?us-ascii?Q?wvrj9XtuDTUeND27lnQddhvs2m60NfxlZylxpqyHToetN1TcY3oLq/vRG8Xq?=
 =?us-ascii?Q?Em5KO/RmjNvg2sQPJ2Ea+dZQSTw4rxhW2YmJm+Oqs4egLlPLlMWTM3XG+ZHj?=
 =?us-ascii?Q?K8nAWkERiN395PF9pnpTXcf7s2UKR0SUew7OUIZtrSzKKtk0fnyl6q7jVFxy?=
 =?us-ascii?Q?5/msyXtrrII6hG4AoYf/ZSAPrV57mgkRsU8OVrp0s3hZd7VyLwypw4KSKjhe?=
 =?us-ascii?Q?rBJ4Dy2sEFN1Zudwv6nvJP2O711aDQtZudjnxcH7zmkzwU8B+LNAJAwIw8OI?=
 =?us-ascii?Q?Q4iXEh1KGCFktCrhe7F0bEyZNK0g7C/S/87Jkd1b2TzCr4SqBF1UU82BE1Ou?=
 =?us-ascii?Q?vbb2yu3WTGUB+lyp+VgYeDqRBN6db7uu0dq5XiuBQi0k0/9chHxwCkf+/Sxw?=
 =?us-ascii?Q?TIzJhLB5aO6fMi7bz7MBSuMuoWylqe0XNt7wafwgZ5TByK2ZuGcIUD91DPvn?=
 =?us-ascii?Q?/clCzomrFc/txNPIIrQe4XF6Cx9E8fNZKZU9S0JVUJGrvcfhY8wYG+z60H7P?=
 =?us-ascii?Q?DCqUgeSn6Y5GwBuKhQl1uyFl16Bt/0meOpiBsKI60dT/SRrqAJ7UNPRM6p4b?=
 =?us-ascii?Q?WvS9Dw9VHV9Mfvnl3vgdDcZkiAN9ugLYlDbH3rq+G6xuGRB4a3QovggXz5Fb?=
 =?us-ascii?Q?oYo1PK2cNBWUVZUedcgZRpQOqZ/P5AESIm2k8VkBd3TsBradaDw/qTixJwio?=
 =?us-ascii?Q?Skwu7AAD52ldNRIJmOARx3+I2AGGBYx4shZNoF6+CiXedTGK4PMIW+hG+n7q?=
 =?us-ascii?Q?UjIfrvvoqF9Qfgn1T/JX2gAGKgUoyVzmdOWUHFg4zCJfj49p4KkNsF/qkLwp?=
 =?us-ascii?Q?CwOYtwEoBTi2tTAcImzEczVWaXDo+KAW5M/JnewqbdoG4CeSciClrQv9jsD0?=
 =?us-ascii?Q?e8KjUUFGszQMCOA+T4UCTIKTW2qzrBVa2L7PR4wSWU6AnRkJ7oUKlPaV0VwV?=
 =?us-ascii?Q?WHHD4r+xcb7jxKU2yWikV5NtonPq3rV1B8GfFSep9ro6arwlIfn8mZHx/RWQ?=
 =?us-ascii?Q?UoGbTfdMg2gsWEoiYXTxh7e/1z4XcVnE5oVFcQCbZMYOFFFa1lAo08wu7qzK?=
 =?us-ascii?Q?YKmSSbNhigv548cm5zGIKZDDYCqW8xwfHWHbj1VUp/21plrhDQ9ZeigV41zu?=
 =?us-ascii?Q?dfv1jygxzW56yd4BexQ/v1X95GVHTeJ4XOAWBcb2WGb/pLTF1kyf4VSB3Jwu?=
 =?us-ascii?Q?YkeGHaEqZGiHCql9wvFjucXA/9jDTyUXveNjBmje7vJ4rfjZtn0XS7+31zRJ?=
 =?us-ascii?Q?ENkLb4W1h824jLJ/RivEcVeQfWRbauJM3C1MJbkpu0TIW7Q7qQEdThjJjOsY?=
 =?us-ascii?Q?1HdfG6T1y6V6g3COjf7f0f55nm3lgsI7v7b/CMM50jwnhgaQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b2bc7c-1ef0-4938-1653-08de8071d071
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 19:59:05.1971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jhok7gK8/n+raiu/vyRW9LrQG299V46nWnRkF2AbkczhJfNtU9OP9iOfK7LPblXjvO/HbWLbWeIKHaAPgfmzWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11372
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_125911_374454_E002C263 
X-CRM114-Status: GOOD (  16.06  )
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

On Thu, Mar 12, 2026 at 05:38:08PM +0100, Jorge Marques wrote:
> adi_i3c_master_send_ccc_cmd() always returned 0, ignoring the transfer
> result populated in the completion path. As a consequence, CCC command
> errors were silently dropped, including the default -ETIMEDOUT and
> later overwritten by adi_i3c_master_end_xfer_locked().
>
> Fix this by returning xfer->ret so that callers correctly receive any
> transfer error codes.
>
> Fixes: a79ac2cdc91d ("i3c: master: Add driver for Analog Devices I3C Controller IP")
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/adi-i3c-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> index fb9a488304469..047081c9f0643 100644
> --- a/drivers/i3c/master/adi-i3c-master.c
> +++ b/drivers/i3c/master/adi-i3c-master.c
> @@ -361,7 +361,7 @@ static int adi_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>
>  	cmd->err = adi_i3c_cmd_get_err(&xfer->cmds[0]);
>
> -	return 0;
> +	return xfer->ret;
>  }
>
>  static int adi_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>
> --
> 2.51.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
