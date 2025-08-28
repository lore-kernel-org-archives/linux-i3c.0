Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4473CA0EED
	for <linux-i3c@archiver.kernel.org>; Fri, 29 Aug 2025 01:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xjM8lfzcZ5IdFqdnQ/08i6AHbBETWoiSgLvf9LzoR4E=; b=FPraHOOdF6APum
	3fDQhVBLva1F3Dhh4i5rwzmMmPVM5zfphbGvsPwjEIORyS3yWsXNsWvXhGVP8HOsOFFTdrDLIfon0
	zFoQB6nNJDnksqzR6j1Xnj3s/qNo+YFR4qCZ5goP8RG6zYSf+m+gGU9AHntlhCL6lG+YurbsyAOtP
	K+a5Q8Qwl5bUq1S6hCUYBrN39YtwaeZVa8Szn++9uRtoyxp/K10jo9oycAusPqS6SgoBjCPe8bEUX
	30kps2+SexhdxwbSx4O1hi11gZgvr2xXd4wbot3zKDx5YY+veLi8VeagFvpIymOUq8EM5LzBB159/
	QRv9d2if3w7i0Vz3c2gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uro4x-0000000424o-2rBF;
	Fri, 29 Aug 2025 01:38:59 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhMH-00000002mTh-0uLl
	for linux-i3c@lists.infradead.org;
	Thu, 28 Aug 2025 18:28:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lBugr+EwE7sZ72hLO6Z7UwiS6LvxL2shajoTOH+u/05SNjtjmzisFBrS87HHTAJnxcYlbya7s5ZyDEju/T/NvBMRwMpcfg9F2aDUfqc9GVHEWxeBr6vrfdNRrZbGGMH1WMxGsR7t6KlYEAHoJfXqsg6oY6r9qWpH/5lqV25oRAmzDTLFX+SEZuDLY2zqx73DhSuxbIHcpPi7Ed/rT8N4jKmt/Ei4cAPeMvHIQYI3E3ZCxkiTVXFKUttMydcuVSMzlVPa/Tgkslees2Y4hPodxgaP3rotw39990gZXLqOXIH8fqOVENkk8mC6SOdQIebJfbxDHAqhVyPTrUCOoHCNjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lC2YB0k5ddMg4u8hMRBUsrn+rVXAYbMpxZ5OcBYYxk=;
 b=BvKy2kT2coO7ceXYdATbtKkV5PkKUx7pc/jeQI5cNjoT+YKVgDxHMNqk3C2fKPI+UNIsomAgrGpPb+fOdIRRmPwgBLbjMwxvDVa1ALGQkWHSev+0/7Qd1qP2dkp91Uf4dUPMvo2VQeaG+1CbUew3Lm6UWKR7bLDqE91qtxX6V1RjW2LmjsrKZU971HtMB8MzEcOhZxB1vhoTPef5OmXWN/z6I2ecl/ECwjC0sw5zlFVA3BBGw/aqJzsRHnxoJPkZs3uNxeUOwVyp9m8kbNCgejfWKfVS6VwKtKDtNbwkIc8oBUX1Uk7/8gB9BxsTZCwAbBDiQlPOEzRQzC6C6eb+1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lC2YB0k5ddMg4u8hMRBUsrn+rVXAYbMpxZ5OcBYYxk=;
 b=oDKBdeHTO5KKD49yDSYcAnP5LWQbdHncoMSXrcT2CMojumaQSE0fuShsbRK2isZPTgNxJHFeXag3HYl6d8AWkh25T5KX38CCINeP22bPyccL28sPhqUXZP8MRpBPyeMPzw/2bxYUCSrJavHvOy15H3WmnihgQykasMHxHnNbBYCjlp2WbHcy8DVVEQ+Wy/53pp8/oj3DxAaApeQO5PUVZPhfa9GCZ3jhoU0wDsiW47KqvnxwxKHJEf0mcxIeZxRnd6zEErrqHRjOUM8+LcLOPcqANv4So4/1odIiHIHIvrCAqwFbKmiFymMCmzn5mDeC1/vdga5Tq6c1WfgEFM9OSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB8PR04MB6907.eurprd04.prod.outlook.com (2603:10a6:10:119::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.9; Thu, 28 Aug
 2025 18:28:17 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Thu, 28 Aug 2025
 18:28:16 +0000
Date: Thu, 28 Aug 2025 14:28:09 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1 2/2] i3c: master: svc: Recycle unused ibi slot
Message-ID: <aLCfuczvKBeFFzwG@lizhi-Precision-Tower-5810>
References: <20250828083225.3558100-1-yschu@nuvoton.com>
 <20250828083225.3558100-3-yschu@nuvoton.com>
Content-Disposition: inline
In-Reply-To: <20250828083225.3558100-3-yschu@nuvoton.com>
X-ClientProxiedBy: SJ0PR13CA0211.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::6) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB8PR04MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4fb23f-a4bc-4f96-76ae-08dde660a80a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fKOItZr9nAh0I8ginEK0q1i2DKls22AETz0eScg0iMuLfCjO8EkL/5d1aQ22?=
 =?us-ascii?Q?rX76hP1KqpuR8DOFFUOrF0cE/e+GyBaPtBiwO39/3BJ22r6C0sj/dcPGeHKi?=
 =?us-ascii?Q?Q4J6a1l9F5xJ5IG2wjW0x52bYL2V2hNR1jpFclT6Zo1tOoFLf9EfnxWFEYZ8?=
 =?us-ascii?Q?1hPHMDbqJo7lt8RZRtj96IlT/GuZF8GPR9sXBysfk/pNBnZ/kun/mAF9p7Uw?=
 =?us-ascii?Q?XH3m9JdCW46bMR0pRyMpMve6CEQhuARb9M+JtAvwNtSlSS1jajiMnGRmiwna?=
 =?us-ascii?Q?rtE5aDfDpa81QQoktd2juKC6xAzAxq+Pm5rgu8wjdsJ/twAO2zEKzj+JTYBR?=
 =?us-ascii?Q?J5qmBQt5mUi6hEs/GskW66tUzfe8fiJSIuCmrGBoRWYS4gE+rX0YW8GiXVaP?=
 =?us-ascii?Q?x5i/Bz46k84L4HWRtvj82DwF6BeFrr+pprqNqjHnPxIZqryZKCOKUTPhjqyV?=
 =?us-ascii?Q?AXd2o4zCeE7CEI/jCFCQEDTUO8uju7Q1DJlPcYyNC3w5ZpGj3hYd9DfctKMS?=
 =?us-ascii?Q?0GSCoJhMJzqMskFfCAgmJ26dMuTGUgOsRooEOdKy+zbKQJio0uB+WZPhraAY?=
 =?us-ascii?Q?PI2gWA6loivtxlNRd5gJjqMn3zFtkxKGbCa6sMI640avIhrho87bb8LYvxRc?=
 =?us-ascii?Q?wbS/jy1RFMjWqMoS5KY6Iy/5Ic5FRVefwvc0HmEsfVLpV9ftK1W8G1Sk9Na3?=
 =?us-ascii?Q?rxaFS1bdXrF/PVAzGeOYRa+T5apz3Opp/g6Ms8+QJItsCGDurUTQOntAyrMl?=
 =?us-ascii?Q?P7slsNZK/frGFFic/7lkWvTq+3bVkTlgFCUX1HrWWKEUaaIIDqgW+VxlTbqM?=
 =?us-ascii?Q?KcmdrNmQJBKKd08U6HtJlKJ2EgeiIKi+xSN5HJJAi2sidI2oG/3a17w29Oab?=
 =?us-ascii?Q?1KiXpAiG4OShZI1znb3LtyOdFMhGVBbfgvPwmd55E1+p7rm7hRlmsHMxFD6o?=
 =?us-ascii?Q?/2ZT3nscd60miGqCaRHLf1aIzYlEPrP7TvSxBAPY1cf7WBgm0MpLSOC6uU+X?=
 =?us-ascii?Q?kAzAtHItN15iFA1dcMD313rLinRVWfE2y3gAhxy2YRnZUVqzOIoXTBlPPZIb?=
 =?us-ascii?Q?DccCTlHkUYnFjFk6G9CkrTCy15lrkce6W9esDukpqGNy3a/5BDOaDX8TKKkE?=
 =?us-ascii?Q?vvThzaVLMmm1C/+IEwoaUh5j1jNZ4nQfNGP7fSzjBwFGFHPbEPImmNG02ZZw?=
 =?us-ascii?Q?nJINn/cSnspXrI6RsPeUcrv3kWbYxeMyh3WvikWYy+Bvx51CBUUSHFYW7pRI?=
 =?us-ascii?Q?eAxJjsaOzS8ZSKXTjXaojlFY3MJR0iZvs4gPx5FI3lD7FizTymGDbVTly318?=
 =?us-ascii?Q?477DZNwjQMbbU9vbn3ByEkPydWayKGeob2B/fvq+1oGPajVzXUzh0KOB3s+m?=
 =?us-ascii?Q?UH9l3vpWP2ItBedBXsVeHB1PwjaDGhAduJ6P32MIG43AhxsOpZDr8mZESHmS?=
 =?us-ascii?Q?6f0sY59exL1+LqdMMnAFANv1VnzsCEOuXlEmDOMxlkpRILH5+5hxUA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+YrYfbvRBKNS0mWag6QMqQiT0+KIIwZqnpNuH9gwlPCiKZryzaaJX7QUqiFi?=
 =?us-ascii?Q?xSg6GmqYsrLPS2XX/wURq4IM6EqGRDijaYQrvLsLz4H9FGTjzNqDPdrx58TT?=
 =?us-ascii?Q?St3+waEV3mds/NI4Y+vg6q+lCnlCX5AB0qVzV7nNuVUj5acuTY7TB1YAUAwM?=
 =?us-ascii?Q?wUKpfkp9ren9fvME5U0LJYXsFjqXjQjZLxgUfQML6stl64E21TEeCWPfLBY+?=
 =?us-ascii?Q?ykTmB+uCgwyygIENS3XfBdG5cR+pkN7gQktfMfdnxBkX0LsOjAI0MZ/kq7UA?=
 =?us-ascii?Q?deuvrkCzDYPwngyJOBc05u3DJ8IEWQB9uDXlOv6m5QwUDfib2XEXpD68OORd?=
 =?us-ascii?Q?hPorIGrGCYxDxl4qYDZwJxpa6THlcXCBCWEKyQixY47QfSLE/zIvCWnNRL1/?=
 =?us-ascii?Q?ROZK/oXxDrEHlaHRHoBLsCYWQCvDjM7sffknHyLri3jANGyKpAbY8yJqvBwN?=
 =?us-ascii?Q?l7hlLz6wwZAXhPAmJZgUewnhTZdlTVwClgLT0+Ab9WCIiCzDH69cpZyyX6WD?=
 =?us-ascii?Q?0824VHEc/THoYl5QmPrknsBVo0VN/MiApHCP1QGaXL3losiLtQmlqOYpx7lh?=
 =?us-ascii?Q?OxB5WHLdXNpiJOYLDMiAvKHLh/6epi2+9HI9dKizzr80sQjOeS3lyrL1S9Ly?=
 =?us-ascii?Q?pHjeLvCYWcoBhtGcsTQyPF5NTJu9yyct1gJwJmVSd4Uuif9uycHtqFJFXYAD?=
 =?us-ascii?Q?U4jFFRFZcrW44pKWbgyaN+bUAihm5g6tiQh/Il9pYCJ4TMmJw100eSjpftgP?=
 =?us-ascii?Q?lbkWuPnZ+86aNe9XRgEN8jjlz7rsjE8Xm87ZNhhxciLZ1unHDpP8bQhFMolw?=
 =?us-ascii?Q?P3LY4ZFkKEAua98Uw83fsGvcnKOOzBETWSGyNaWIZnbwpY3/eeRzZY1P33II?=
 =?us-ascii?Q?FLYo2TosDcNIvua5bKSrFRMguGkBxYNAbHY+E1adbJWv/v7qpCzGEJ6KbHW2?=
 =?us-ascii?Q?tjFzrg7rNjpJSkoG8WSb3f7dI8m4+a4/nARs+mEqJBlvVoxldsqrtWqeplNd?=
 =?us-ascii?Q?ogupiFs0Y2C4gJ8z2+vH0X+2J92QdUz8wUhPURsoglywAjPugsdMMliJ2G9Y?=
 =?us-ascii?Q?Sabp3rYGg8mS5aDEgilxMGkcFy+hH/mW4vXcj0A4Dj098BmFj04qyQPSFwT2?=
 =?us-ascii?Q?2aAHLJKp+yf55x8JfwA/Iz3wFS4rLDMC+8C0CT7jA/TkhBvMHnbwyzKiUzFC?=
 =?us-ascii?Q?H+SP1NmWNqeAModxz1ABS32Sv4VC3UloadQ8RU3KcbYO+PZwJES/xuCCoV/q?=
 =?us-ascii?Q?Nw5b2v1h+ZSfxVteEblqor2n/uBeYsM/i0P+YAlmRZUIjwLWmR/cTDCk9mXY?=
 =?us-ascii?Q?gLrAVFtk/SuDSkYuHewCcHM2M0qq39xuigtsNu+BXofk03mS0OGQCqOZmhHX?=
 =?us-ascii?Q?aHN8TT7doZZ7/4RSdVp4bn6ug1hhcp3BjF4HIPyD0zE4GdDJWqe6unmqq5DY?=
 =?us-ascii?Q?8j+irIlQs/WetLdxkxsvRV5RWy5z7aSkdKjSPJXYxP/3LuUwHWXZ3atyDQqt?=
 =?us-ascii?Q?mWshz/8cOHY3zfPmLc6JezFTuhFkkZEBoxE+r0ENx35zY0/3E6xKWFSOUP1C?=
 =?us-ascii?Q?XDmwCnpxfkbbmrtdmALpII3XC5Oj343MMkenSgjx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4fb23f-a4bc-4f96-76ae-08dde660a80a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 18:28:16.9075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xF96n8j/hrl4PVM6Mp34pCFgynF7lUqGBaNFdFPkCj2hS+qoB3vgHZ0jlvXyAHp2rO3xVdfdXnvoPowpirZvOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6907
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_112825_256975_2774F511 
X-CRM114-Status: GOOD (  15.11  )
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

On Thu, Aug 28, 2025 at 04:32:25PM +0800, Stanley Chu wrote:
> From: Stanley Chu <yschu@nuvoton.com>
>
> In svc_i3c_master_handle_ibi(), an IBI slot is fetched from the pool
> to store the IBI payload. However, when an error condition is encountered,
> the function returns without recycling the IBI slot, resulting in an IBI
> slot leak.
>

fix tags here.

Frank

> Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> ---
>  drivers/i3c/master/svc-i3c-master.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index baf3059fd668..8863c89775af 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -417,6 +417,7 @@ static int svc_i3c_master_handle_ibi(struct svc_i3c_master *master,
>  						SVC_I3C_MSTATUS_COMPLETE(val), 0, 1000);
>  	if (ret) {
>  		dev_err(master->dev, "Timeout when polling for COMPLETE\n");
> +		i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
>  		return ret;
>  	}
>
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
