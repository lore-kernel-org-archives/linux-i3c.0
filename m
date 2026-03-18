Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB44103E18B
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Mar 2026 14:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0UghHV8eMYbp3xcTAKOyR/ByVOi1eePI017JDEaXUs=; b=oSFWNtU+/3aflk
	Nz47h9voyhT7MKhvtpAeECemH0qTTEFLBhXEpqS3F8xHXgTRaY1GTU5X7W+qYAwY77a+83xA1rdDV
	P7IvP0J0ZOOxZCgb6TlCKKDDpFYnBDld0DRsVLo2mdcIEM3b558nFrdNPn0LNUpzOoNugIV0tFYus
	Mx7DAsW4TBJ044oBhNFANpOZ1NmgjJXelKxU2rGgIxhvZOcXFEWkXbMdDPSTgS5tFT66zsHX6fGJJ
	e6x0axBYbsdLxl0m8ja1VKQ1837wB1+Ff+YNSEx1ySVdCg9dxLvI+q4te47UtZ/3uREREkvV1C5ei
	jwO34V2gG3SrSlZieuGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rh6-00000008ZVX-1SMh;
	Wed, 18 Mar 2026 14:16:20 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rh3-00000008ZU8-2EL6
	for linux-i3c@lists.infradead.org;
	Wed, 18 Mar 2026 14:16:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o74BqzQnqiYPI1jm0uvSCzCrpqep21+IAl+EpIChpK3E7WotGG/Dnj7+oB0YNfpp92Nl7+RCGNqfVo/xaEnQzsDTs8dAaidWwQO4W/yC0Pt3Fn7w1aevrDUR9id5mkqQ14tuBy0o+uGVRie1PjkoDJs7ILMMC+zpqVVlKz0pxKHCN2OFBaguB3sbJyRexcGnWqAvI0yHZEC5ppC9Gzt9mo2GdTsjjCah3BWKwFod3D3hZ5oaCRbXAme86macu/8TH0M3I2sXW0Epf90/qxhTWrFbAO9krgLRn/kY98XbfBKoWuWwF0chQSZoduTE//IFeUpmupAaWrZVpTkSTTSJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iR5OXMOeQYsQfGhg9sSJw0gdPJQAU9uSclHgm7lzwSY=;
 b=QKc5jB3U60ejGhgB9uE5PLbBna9+yRX/MZJ1/UJ1qFngSzligl4zK9Egv7bzKxcQGO2PZWDv3udJgLuTmJhHqDc26IfTvqvnu/tKEycX1+MDlwHRoKTEpm1A5ELHNG2K4ZvGN2hYxCVik/JyHPniidj34WqJb/ekiQlEZQ5hNJuJP6eFFTwBcR7PoRb8GWbVPl5rmytjwUFZU6QEJNdwVvRgo179Wf5qmvjaH87WYQjvrNs12yEZ7RA0bEufQh5iG9J5cfbMHuzuWTYQNX55/sAcDA5mQy/hg3emp57XouH7afukSSB0Cz5RunhSnpVBKzmB2XXmRjv1ipFDfPYzoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iR5OXMOeQYsQfGhg9sSJw0gdPJQAU9uSclHgm7lzwSY=;
 b=jAUXJrAsdDmGur9w6dVlYEOtiLKN8qj5LmcBpvXES39D3Xewe48dUBRESmBACNv5RULfDP3Zg7tg5NbtwGVwErcBhaqrA8r6tbyPicDDrwLP+6UmvxqxkhRvnltrWVs85AiVJPnyQnrWKB7ZhJGKh7Ul0H3+w+Xe8qZl5kUkDIllVh1fcnhxd4wkoXUTVPmB8dePYj3jBc2IAY2suuhglBmPZAMtEGVP8kVHcsoOgaC1W9bOzc2U7Dd5WgiFo0FFRKLZHVy0PYPjnjJoXfCGngM+S9/ov4sFI1YW5K7Xk2MXxmvvMI2j2EIHPe9ZxVfsTJqXTD6GpL98LpQr946Aog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10178.eurprd04.prod.outlook.com (2603:10a6:102:463::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Wed, 18 Mar
 2026 14:16:11 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.021; Wed, 18 Mar 2026
 14:16:11 +0000
Date: Wed, 18 Mar 2026 10:16:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 1/5] i3c: master: Move rstdaa error suppression
Message-ID: <abqzpbF3NSmKbE7b@lizhi-Precision-Tower-5810>
References: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
 <20260312-ad4062-positive-error-fix-v2-1-1c933b5c7ed8@analog.com>
Content-Disposition: inline
In-Reply-To: <20260312-ad4062-positive-error-fix-v2-1-1c933b5c7ed8@analog.com>
X-ClientProxiedBy: SA1PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10178:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d53d9d-402d-470d-9588-08de84f8e837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|19092799006|1800799024|38350700014|56012099003|18002099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info: oAc3GMftM+De6j2Q3m9kE+Mfa40Mv+Fq1LHu90bBDPyXk88K4dyZvLcaD2QUm9bNbSa69GX4T6+hlmqfPdVXcuuJuSktav1b/Gjw4qG2XSw8J8P5PvZj9fY8gJD0UZkBM0m+HnBHEv2i8qpMt+OOqUxgi+Qh2ZwU6BXAqe55gh4ZeN34v0yr9Ma4w89gMKDBLFqB3pLHlN6BTqL3AyQvlz1QdTeAXoZLITqFVIZTO7MXGVPgDKkveJyyZiQUsfUyd2MCofRHCmN5Vo34kLhJSNnvZl3LhcPo0IB551Qj6XmJT7ll/eic8Per1eWGl3xiF6U+u47u9QXzwBVlbyXFLHCx993BmDV7DX9Onp307wyDI09VOE21XsrVKcxOW4HnqiQC4XEaTuF1eTBTfDLRhOXwguNKWXXzORirxCvMbUKgX97CUHAhZaRo7xWIRnHnHtcgJ2ZcWewZ0zLV2yfeDygyKfozpJwCSolsx2nuwt2bAt7f75hXBghtTHWWLMy+C/o+atYqjAZCwyk+52aV9S6A2bCfQ7SWlo9OFkGOyhcfPz2/M3f8yC3ZBaE6woIVYxkeaTCtFExFNNyZYrrn/lih266b/eK+TWu521W2Pn0ilhE+dKTI1dg10z361dq6ZT1nYeu+2Wv3izxGvffW/TVrmDmUlN5S4uxbinOkF12GEYINOMkw3pqKDJcJMTs1QlYsa+7HLjh/lw7mEjX20AQysb8NuHSCxqO2ydpsDBrfiWmemVY0DViGWLnZQHt7bPI3AT6TOBEiqID4PvZwYecPRCvVsOVse8N3KkJq1Rw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(19092799006)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+X7JXupR3M8gWkvc0AHG81DCimHQJ/mPGz7vuOpQqMw6fI3GulVdQk2WpIwG?=
 =?us-ascii?Q?6Y2NpeSakYc+xRoOCn7DENfdmXZcz61NfSrmpxhZY0Koe4ZibN4ItqSL3Xwy?=
 =?us-ascii?Q?3mUO3FiqQGAQhc9tVbXnIa70mHhaqbUO/GdWcVuVinndtDCypMsY2A7uFkPc?=
 =?us-ascii?Q?/Co46yad5p7GVlwF/U/JalwAF/tucT2VxyILa2BInWq7UIr2rd68XiLVehb9?=
 =?us-ascii?Q?LCqb2mspyCAPdW0ARD9WQSu/TK7SfhAWrbr5Aq5UM5Acx4s+CW8vlmAm/La1?=
 =?us-ascii?Q?GYN5Nxvj350+lF4QrXP4Ig/Lu3aq00o5O7nb0QIq5cIl2iPFoejDwnJfOIJb?=
 =?us-ascii?Q?BYzsw1flfsZVRqiD0WsLLEZq94d+bLj2vddwCzDwmzS/ja3t4DRGIRLC4Q9P?=
 =?us-ascii?Q?JeQkIkCGDSksC0L/CwjuqsH9sk55qgvbeWNTsA8Lm7yIxh+vBNZHaI7faHw5?=
 =?us-ascii?Q?F2bbJVkaTxzYJZlf3TSrgdl95gvhkcgVDg2b8aoFyFX3MN7GsSC4KDcVuH/a?=
 =?us-ascii?Q?gHRjxyWs6Re5evKjqbHps3LeeQQz0YEgO1JX5g8IMDVWTZpUJ3e4jSs1xGKC?=
 =?us-ascii?Q?AqvfNxMBTml5V3HL60UUTxPtESAo7b/SzkZPPL+jMDxTOP9hNV0Q4eYXximm?=
 =?us-ascii?Q?s6FhzdEUcxuwQ/yepw9Pc0XV3nT+AiNjmn+5l7Lv0e8HpUWBNRB4VvhbAfyO?=
 =?us-ascii?Q?6BaiV5Q0rW7q2lHVeMUyOe5WMhgjoPFVuczzLhlZoafrOMvens+ZcrMc94P6?=
 =?us-ascii?Q?OU1I+tg/K4cGh8ymg4kU1CCxkCBLzpXun9TiGX4a0QKDRcJwexN+tjckxWkK?=
 =?us-ascii?Q?dMgm1r1nsurrTmPWI92yG9lzZIqZh2lW4UaBGtoWBi8ZfwOh8Pve8HIY1uLW?=
 =?us-ascii?Q?1K/RW86U+cY6QjlMaBHPpDpa/H3Oxuce2siApLzovbKPgQvCA8xKqndo9Orz?=
 =?us-ascii?Q?Lysn4KHiuwQK4+5ZafZqQYlP2k9X1tXKcimFttVGy9YIL6qcCrZS0XcmuKda?=
 =?us-ascii?Q?LKFoXIy9DJh6BxcAhvbSeazT8WX8n91umgH+7pXgIMHpbrywu4gEfYmGkpHC?=
 =?us-ascii?Q?kgWOKFIRQqIpzzvQI+iNpQqd+GaoTRu08a8MNAWzdRZY5YSVIeSb8eU+YVhZ?=
 =?us-ascii?Q?auppjY/YWCN02AKsq1hQoBwHySxiBBh1pJ9i16HCUi2eyf+kJcKPxUotTbxO?=
 =?us-ascii?Q?0dnHxmOiF/B7bnUQKX0az+y7HGYMlGXm6R+PkpoExkZGoZ82NLgD8dOMaQgp?=
 =?us-ascii?Q?F1RqkcCTUW84x7KpeKqZWKDMn/2UqgsyWxZ8ys6Wcd9tW1u6RF7CpV2KC94o?=
 =?us-ascii?Q?fc4AqGFUh7T2pVTrhnzi2D0mJAUrwt15eFXBGFe/Njk+A7KBlDB+7M02euXb?=
 =?us-ascii?Q?jlUNdFNsXRxDfkmsx37Y8/dmGq8ZwcS8TcbQQ0Nn81N2yxtdhx04Dtbg41bC?=
 =?us-ascii?Q?z3R2ONrVl63Skt4bCb4A0DKbJjPejKs6zuDznHytI0mV12Tv7vPv27fiZP+w?=
 =?us-ascii?Q?8YIRbCZqnSgX4q5kLO/85EgcHj3MJFmOQVh1et7ejwMzQWBF5CtwiUGp0MAn?=
 =?us-ascii?Q?XuPmJgKmdvcJH4hDnk5oheSvhyMKRsGxpju1aPRDpumEQ1MvoEj1eZ0AYzeo?=
 =?us-ascii?Q?DqSblz0fYDxLDZ8KDR1KOTQlZ5ZkHWrVTsA8Gaui7twrePWBLzre8z8q34M6?=
 =?us-ascii?Q?iWwqW40YQxa0ocEInNqLnwOnLE/grL3aCnJc0dsOBIY7Y5WWeTDPY7V85Vag?=
 =?us-ascii?Q?E4Qrkuq90A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d53d9d-402d-470d-9588-08de84f8e837
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 14:16:11.7217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: czS5zlF5++XJapw0BVRAiWt6xu49EQQ/kBgxZl0RThV8nNgalEI7zn5SUZfG+14e1KJdjQSkN4/DI3dH36jarA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_071617_619949_38B6EE22 
X-CRM114-Status: GOOD (  17.94  )
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

On Thu, Mar 12, 2026 at 05:38:04PM +0100, Jorge Marques wrote:
> Prepares to fix improper Mx positive error propagation in later
> commits by handling Mx error codes where the i3c_ccc_cmd command
> is allocated. Two of the four i3c_master_rstdaa_locked() are error
> paths that already suppressed the return value, the remaining two
> are changed to handle the I3C_ERROR_M2 Mx error code inside
> i3c_master_rstdaa_locked(), checking cmd->err directly.
>
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/i3c/master.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 9e6be49bebb2c..c66f2655eb404 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1016,6 +1016,10 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
>  	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
>  	i3c_ccc_cmd_dest_cleanup(&dest);
>
> +	/* No active devices on the bus. */
> +	if (ret && cmd.err == I3C_ERROR_M2)
> +		ret = 0;
> +
>  	return ret;
>  }
>
> @@ -1796,8 +1800,6 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
>
>  	if (rstdaa) {
>  		rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> -		if (rstret == I3C_ERROR_M2)
> -			rstret = 0;
>  	}
>
>  	ret = master->ops->do_daa(master);
> @@ -2093,7 +2095,7 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	 * (assigned by the bootloader for example).
>  	 */
>  	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> -	if (ret && ret != I3C_ERROR_M2)
> +	if (ret)
>  		goto err_bus_cleanup;
>
>  	if (master->ops->set_speed) {
>
> --
> 2.51.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
