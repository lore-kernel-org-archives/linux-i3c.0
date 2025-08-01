Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F39C87FCA
	for <linux-i3c@archiver.kernel.org>; Fri,  1 Aug 2025 15:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n4lhyAC+toKRUbW/FAvYAV9mnwX2TCSEcjZrLtFWgIA=; b=C8Ye/7gOqu/cUe
	vG2YxfkAPggh8cRtdpc1G1GXexLcA16iQ7WB3FepWa6lmQYOG6MT8jr9xefXZbw+ljXOBUBTgRL3r
	Mi04H1t6E/QZVLvaLeiXb0RxZNlpA4abdvOWs3pXW3mhrqLTALEHCPGt8e2XIJ0HmV2QavjqW7zjG
	FyCj9gbueUFNFLDGQg/tb48Zx5VLgbXbhZVI+v8zX/EBSxj2+Bim7GSX7N19LzteQF5eEIgc7GShE
	JkqWxJ9qGo6I+gBN/UaZDDeCOZR5ditFci7bznPe9cweZueGR8eVuVw/eiS1sNjrb7Jwj/mDwovFz
	NGvnWpm5RkukgBkYWl5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhrJl-00000006Iwo-39x7;
	Fri, 01 Aug 2025 15:05:09 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhrEK-00000006IG9-3q5s
	for linux-i3c@lists.infradead.org;
	Fri, 01 Aug 2025 14:59:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOj6BVbaM0S5Pqlfn9ZLMtTOCcBAz34nchSPq4UAt7WlwhEMZEgYPFLS1BMJ9mWPon/QYQuTBUiYhey2BHTQrTr8Trd9m1g+dkvsF7G0GoBdiKLWrds3FNXnKlaGRObNAnaxBU+6Sj7AHZTQ/RCTWIES54IKoZXL9uJ0CbQ9awdhAIiv+5PqP+7ZNMGUcP+It16Wl0VUEEkk4TzvG1VW0xNMrTn0a3bFlQur2wuQmNolj+pdFbxb06zB2T4xZxuhdvbowoI9MLqjM87kQkBAAZKqXnB+iYI1wLiQodanXAS58Wpc+kBcOQuAssPGAarqoJK32+ZHyZ6bVb0WDix0Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvJdLO5cc/SbvSe8ucJS7O0J/zUAj9JbmWUesrGeXog=;
 b=VqffcihtvhhH8DzXJyye1rluKUjSTsupucD0jDaQwvg3iMZ3+exIPyPWnxvbXHL8y8O//akyC9AW96ug2WP1dQRukATELjrmevFxzSOlZ3ZQh7fIi5WrHNqaSri/fHkjCQLZRIjZYP+8c9ZxjWZ5A2G35tXlEKB0rPwJy4cjp1ZBmHdRwnwVf4N7vJfnQGYXNefjn1wiDfj4UdqU7JKxVCI8sZ6ZWFKCOfoJ8Ap/ZGx+5McyftSZc554mgQYuikmVG/LfG5LyASqGjfZVxFdwAm2jDX3Nl0BsGqJqnNrbWYcfdlhE3+mBJoeQOStHAEt+dovT7uf4ti13i8/U0uJxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvJdLO5cc/SbvSe8ucJS7O0J/zUAj9JbmWUesrGeXog=;
 b=NcIT4gE4G0tODVbrM4HoK+Q3HByVzo3CQNiqdIgIXLx5WlCxVM/4vy1Jb37NW0BaiepJnPHbhnuFeDUFXWELul2Ybol3waMcDft8XCGGqph8Tlg1NuWCqppBSlE9KxPv3Qc0w8ZpSoC9EKCWdeJAolhMxiX9N0nfHpLT9q3B7CfVKsE0G77QJdmLmcGNuUVuih6cgTniUj21foQyg/8/3i1gH8HhGksswI6Vhwv/YgqKu3AzQil1mL08nM0FHRy8QbdX6maJCQlkxHwosur8zD5kQc4IIa92e4CAjnUWMUJGPn8TTWP8etOi8PIY1l2hZBdgbIlsacNNJXPDHP7Y9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7309.eurprd04.prod.outlook.com (2603:10a6:800:1a8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 14:59:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 14:59:26 +0000
Date: Fri, 1 Aug 2025 10:59:19 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH 4/4] i3c: mipi-i3c-hci: Use own DMA bounce buffer
 management for I2C transfers
Message-ID: <aIzWR8D9KyLQo9Cx@lizhi-Precision-Tower-5810>
References: <20250731141420.422525-1-jarkko.nikula@linux.intel.com>
 <20250731141420.422525-4-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250731141420.422525-4-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:254::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c451a5-5972-402f-ba92-08ddd10c0240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9eHX/Bxa5+f546UG6CNxX9wmKFJzbrBUKyZTHBNEzy1zyqNqO8+nZ4FLNC6u?=
 =?us-ascii?Q?wO+ADi7cR5UbJ7IKvrchb7WjWmTinh12PEKQM1DAb8suiTkRnjOpsO7C1te7?=
 =?us-ascii?Q?basG/TNGS8EeXg7m6Gn1lnAlVXV+WfBdNzLa5HwHXQQ57hfByE9BaBdE6NSx?=
 =?us-ascii?Q?PxO6aEd/c0SEcEPDBZqecpRTSoOqIYMongD1OfXqOnKo1HXofarURkpHbZsY?=
 =?us-ascii?Q?K0KhZ0utd1iaRLTbyjBdtn66mFJSvzGdI+VkD7gwbVUaTrYcVwASFsQHnlkB?=
 =?us-ascii?Q?CpwgseGrbWqksRJ16udBrdHZ2LzHRcB4QTueQJO7pEfC4HLouqcz3zuUcTiB?=
 =?us-ascii?Q?WkJY5hrcGeY+mBg1/+qGTCOsNldHmUlG7j3TVFcA/2MmViIZclDtRbcs2xOp?=
 =?us-ascii?Q?g7ORnz0s0995b5eia9yVUSavryGQeaU5/oZXswKzN4LyiO9g6qMZc7lLRH+A?=
 =?us-ascii?Q?9oLnz2QwWClALzD4qMoqstrNDX1Uo6Qmypk/TstpEdVwjZEAxS8XvbYqaoOq?=
 =?us-ascii?Q?8ViIRqWwsn4QjTVbytpiDriF3sgBt3Zh6/izLto+vP/ONGMhHT/x4MhMrv+4?=
 =?us-ascii?Q?5ocZOADlWNQn2qEEEvLsxk5RYW2iJ3nNpyMqkPPByLoCRbescIueaasjkBe7?=
 =?us-ascii?Q?5LqJpHbCPXidr13jY+nqOYm4EybNpeAzpiwEYYXfa0I3w/ACfDh5bkbt7vOZ?=
 =?us-ascii?Q?TvYTnEYtf7G7gTl3FMYTGwcsHa+RcTAOrZdWHUn6ULcR4wK6mPlVZgjEI1Q8?=
 =?us-ascii?Q?b8kKL/7bGvuT+qzzgFBrdAcVUYy1zEi9ZkrK9wdc2B3uLdxNf3lenewrHJ/f?=
 =?us-ascii?Q?D5dEhLJkp+oTwUUyx7U2iWx/5Lsm1qVynHsP0ESKRHWG71TSjRoUrEbf4MZD?=
 =?us-ascii?Q?6bVIboNvejKHS4QmRZQ11GytfV/aVQR3+wsEEOYynuYXXR/ue4TEsaAc7F9Q?=
 =?us-ascii?Q?Y8CG0W0UWLTvJfYia401DsyC02GPM5ne3DF0gnWuPI5WWiK8Ri1YuA4hgXd5?=
 =?us-ascii?Q?kelAHDZ+wKoec7Ka4VR883VhJjAcm6yH+wHnDepuytceYBTsr7Wth3ZFFC+t?=
 =?us-ascii?Q?g3pAP3ArbHhKG9gJBSSLMuNNu4kXDCZRIuQVLC2wDE3opvGeaL4cJLzpJbEq?=
 =?us-ascii?Q?+kq608iw/OAkAShxUIRwFU/1JIIgXQYVmORmRH9rPYLx8/5s85n2AjHSTuPk?=
 =?us-ascii?Q?Jo/kdKYd/SRyqObByDAC8s9Dn0XJcZwHs27N1PwwDNpdxKd/7oB+WOPZW7dX?=
 =?us-ascii?Q?46CiEONnmMtr2+eGzqxXCWdxTYrZgid4U5wxCFCt+nswULjYvQxWeqrj5AUH?=
 =?us-ascii?Q?JOE11vjxsn0H6iLpzW0QtTGUrvGX46F+7qqQHOw0VptRHaBfLM+FGSugl7VQ?=
 =?us-ascii?Q?Nda31Y8m0tuYYuVriR9Sd/8VlGM5vlFtMMovfSHSyViXMWMEfUspOI/PI1NK?=
 =?us-ascii?Q?2wqSdUQFJkF0V6/A4lIk892teCe7Rl2/rBEEg51v9sHnR5todT9Ir1U5C9u6?=
 =?us-ascii?Q?+hsJ5XU47ObnxFY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n5jg57Yjsks4kSt1QFKaMsFRTyn+V+4kjsOcg1tO5PBFG+CwVY/gmtOF8jxE?=
 =?us-ascii?Q?kYLFz6aEYd9p9IjotYWNttTbk9+stKEYCjMXNizMoK/G5V7ca3w0CrinuR6X?=
 =?us-ascii?Q?qWMUlD2KM3Mh5liUhHj0oX8AN/ZTgujBZBGaq81RPskwKydmDrKq4bBTd7mU?=
 =?us-ascii?Q?NdHBMCX4ziNZvquDeX+ZMMEeJ7iHNW1I2yob7SpOO5jWzjGndUlkAtqCvu8A?=
 =?us-ascii?Q?cBGID4iGji7DeOb1cVluOIzbrnRCqnCR3HFZBslbEPJHoARIp2DE920PUBzF?=
 =?us-ascii?Q?G3XaDFouXiTtoLj5SCg3jPA0kAH/zpG9agbu6NKxZAG3BRA8qRS1KxCWdPKz?=
 =?us-ascii?Q?ZUBi5NFEomYHRrQ7vG3bE1sxzyDOAN0qy3KD058Cgs9M5WHbeE5dhDZE+Nmw?=
 =?us-ascii?Q?+r5FvSiawuqfqIdMyGrk3qlKsZXMcz0oIm+jnrGFqYj8ql5Gsj+LvtK/DoG4?=
 =?us-ascii?Q?ovBh/jnl66BE3UPVcu8StrSKswPMOdoIzFkIGcvGqTpyCGWIfedShfCjfwLs?=
 =?us-ascii?Q?4/YYSQwkXxMDH4QN872OHQoeFAFfiNqTCsrK+HZJFt+eHeluQQdAWPQgnyKX?=
 =?us-ascii?Q?gonpPXH1VPvCx05LCc7bn8Kymyj47NyhTPRWE/JDQI6DxwTH0vUFGk31OJ9P?=
 =?us-ascii?Q?9uKmOBlP3t1H5C+L3WNhlO52wZJDDKRzWb73kgO0iTsZKnIJhk7BLzAfUfjL?=
 =?us-ascii?Q?M+m7FEgPbqo0oARH09vfmFWoObw9tYE8HH6N+obxoLGnyoNcvtoHkZYLbevK?=
 =?us-ascii?Q?x7HJmZ4oQh/Nsj7vjZAiOjke/ltBHwpnCX0UCOvfFNHAoeHLewTFIYWA3UuK?=
 =?us-ascii?Q?Z/lSQPQpvl9sH+dd+HKgJB3kjintE6yzD9hx44eWPxgTdRZ8YMbeCTgNjpJV?=
 =?us-ascii?Q?9ZbyvJVvLvAAAT08+fBHSsFaxJTs5kihZ9CeTrfi6dAUk8K5/W2KUuu5zIri?=
 =?us-ascii?Q?8cg0fbl81X8kkhozftXWnkQA/9r4daiCL1XExD/wOXIJ7+k7LbJHDhh4fDJe?=
 =?us-ascii?Q?+s7yNHJG3m3L3NqUcUJ47BOq0TK/ojlZlBJ4UOWuAjHMyRlB4RJTLUsRWXVV?=
 =?us-ascii?Q?waqrz+8ih8WbkWOy4pYjcc4I1vbG+AlfQ+qnoXSf+wBexX2rzuyBgh7wGIEZ?=
 =?us-ascii?Q?jcnrWQVXXMi1vdD6Iis/9imEmZkf3oGFvHWq8YZkkq+pDGzGs1OFW52fTEXF?=
 =?us-ascii?Q?pCgPm0bvvH1bVQ47QMy3x4x2Zv9ptbgrIuN784XswrV5LpT4uI0rO84Y7JeY?=
 =?us-ascii?Q?iutADZ+SYp/BUnk8O1aj902dwnbaKk7MtgQJuRh2HEkYu9VfKOjWQavys3eD?=
 =?us-ascii?Q?/yYXCCNJ/Y2LyzawhCRjFMXW8PH27R7jOQkC3nAzfdrEOV3jwAN+W1TYGNSQ?=
 =?us-ascii?Q?PwX3QADz8R8ccBrSuOzTERkh325xm1c45kS2cXMNd1KPbCI+A3sgxM1LgYiZ?=
 =?us-ascii?Q?g6RGEqRHuX1u2z76qLxHgbF9NqEjyBI7cZiGi//5IY6C37wCL1VPaAssqcix?=
 =?us-ascii?Q?oSmW0aslQG34+7ZbwG6R8lPY4t55IXQ7WxHqWEKEsqeOjzE9e4Z8OgLMWe+j?=
 =?us-ascii?Q?kRrS0UazO/dKtBZFOfUJFQTEtq4Q9Lragr6KVdPo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c451a5-5972-402f-ba92-08ddd10c0240
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 14:59:26.5996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVQRMM6cHB59NFIvTHBQUQjSDrUKwERwceR3pfsevu4AoICKMkeBiJuHcfXn+LKmQhEMaOSrPRo3pL7Vb4nSsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7309
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_075932_960051_1D7216FB 
X-CRM114-Status: GOOD (  18.40  )
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

On Thu, Jul 31, 2025 at 05:14:20PM +0300, Jarkko Nikula wrote:
> Stop using I2C DMA-safe API for two reasons:
> - Not needed if driver is using PIO mode.
> - DMA transfers needs a properly sized receive bounce buffer when the

s/a properly sized/word align sized/

>   device DMA is IOMMU mapped causing needless double bounce buffering in

when use IOMMU, which causing ...

Frank
>   that case.
>
> Cc: Billy Tsai <billy_tsai@aspeedtech.com>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index b2977b6ac9f7..7a467ef65787 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -348,7 +348,7 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
>  		return -ENOMEM;
>
>  	for (i = 0; i < nxfers; i++) {
> -		xfer[i].data = i2c_get_dma_safe_msg_buf(&i2c_xfers[i], 1);
> +		xfer[i].data = i2c_xfers[i].buf;
>  		xfer[i].data_len = i2c_xfers[i].len;
>  		xfer[i].rnw = i2c_xfers[i].flags & I2C_M_RD;
>  		hci->cmd->prep_i2c_xfer(hci, dev, &xfer[i]);
> @@ -374,10 +374,6 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
>  	}
>
>  out:
> -	for (i = 0; i < nxfers; i++)
> -		i2c_put_dma_safe_msg_buf(xfer[i].data, &i2c_xfers[i],
> -					 ret ? false : true);
> -
>  	hci_free_xfer(xfer, nxfers);
>  	return ret;
>  }
> --
> 2.47.2
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
