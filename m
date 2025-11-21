Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D71CFC28C
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Nov 2025 17:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Zx/l7+KasIr1imSDfVTYy5zha/XIP5jj3BSU/ygXhY=; b=DTHmQLg2t5JsVa
	G86HF6UaKQBzlXvYPLfefsa1DSPxVHKtZoOhklQ21UOetFP1xxOFOcmLQ4oHC00PJjpYE+J7JAgbC
	b2MF8pZg+BWRPcq/MqeATd2R0B/iwwJk9u62DMFYPj/pGiqZT2efH4YoiXT4pLNnYTbP0Zis+W4C8
	ESAbtXIzh77fPUv4BaPexl8OnvwXojQ64Ey+jacnfRMT0IEzrSENnAhn4ytkVvHx14APOuVHsP9YJ
	P+rWfoZJuIdatxgFaKKUfq6FLKyHMaeRsAQrGoQX+bajBNYBNVR+ffWzoHLmHWt/oGd1ntLSAKaem
	q3HuJM7MzjGOO06NSRlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUa2-00000008m3c-37f2;
	Fri, 21 Nov 2025 17:05:54 +0000
Received: from mail-norwayeastazon11013030.outbound.protection.outlook.com ([40.107.159.30] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUa0-00000008m2t-0so0
	for linux-i3c@lists.infradead.org;
	Fri, 21 Nov 2025 17:05:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lO4KfJWAKU4YBDXpulJifsJVITjRQjWsLMTsfN5U+6QQ4IA85u6eZqdUlBtNUeDoO3YRQ/KPB5aZE7aIBc+byw4GGppzAANias1uNCeHsWwR1HQXUl/53BADTwAAts7ZnIzAApWrkGuwLdj6LA8/inm5wGMfbL7a6f/iX2bt3RpTushsUqwi+FrwBlb8pEXH1nuLaAs3q9FXreyeLocjgOMgzNuPo8pDcQi7agYR4+Pj0G5LWB26rKGsXbxokmmSw1mvJ6LVEkjM19FGfFiCRdXM8YK5xPrQYfQil01XFeIbcEVVIqigvSxp6HYi4lM/iQes4iWo+DUunlKb8T+Gsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJoXWXdNaIcpNrBDqiNYCdItFJTfkX52p3m5xGw3PP4=;
 b=bNf5nA2B0xlt63/QYnDXbCFdYWuDEVBjHftDGrsplSqLOMFcws9u0MWh0pTRx+NCre1oi7z/EVmjU68rEcr0VQ0eRvgQjKrI1Nn1U7jxBchpxRvAUg/eQkUNIsU6NsZp+30Rgvx5+wHAjT4puiCAbM8pAffmDkU+XVO2hMYgnVKkz5oG5KfeJ2v9WUwidp/HVxg5s6auBLDl7mWOqfexw5DPhqgvrtqk4E/p6wG6kv9zxuxSMFmg0A+CAouBP93Wyi+SKm9lBI9ebvvNdXlsjYvWZ+uZdOSBKUpPS/0Ndz6yPigVifLgut+PblZKO9xOlf7bV9k0cjrM+zjdg6kOWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJoXWXdNaIcpNrBDqiNYCdItFJTfkX52p3m5xGw3PP4=;
 b=Yp63FLPbtKBUovJy7uyUqBm4xBVTx76Eq4rZ0fg8KmPgY69JHI+QVooyPD2ODYYWfSEnDiBJj0fzjI9AAXnNlWxcj83rrdN4O1nUvs3wVzXxDM99x6sudYapZXWH2xv3De1+FJuU9uJTXueiw6l7xzewvn/CiPbc3b7o2lL8jYOm7JBRGe+4vLY4UFuSFjKdRDgjJEuTMyZn6M9G3ZpeuIPePiJlUF0UglC+mW6YmtiMghb/w4rxTMKKDDf6tFmZL4862b/uW/FpqKyvinO5/iJKc1/8mAsFZ6oeNA7BPAdJdD4f5gx7lqVlyMQHjxGVin1jj/PjHbBneTvvjr3yvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU2PR04MB8887.eurprd04.prod.outlook.com (2603:10a6:10:2e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 17:05:46 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 17:05:46 +0000
Date: Fri, 21 Nov 2025 12:05:41 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i3c: dw: Add sysfs support for Device NACK Retry
 count
Message-ID: <aSCb5Y4ypnEuWUYA@lizhi-Precision-Tower-5810>
References: <cover.1763703573.git.adrianhoyin.ng@altera.com>
 <12309bfeaa271d0b008989b323ddbd7587849066.1763703573.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <12309bfeaa271d0b008989b323ddbd7587849066.1763703573.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: PH7P221CA0030.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::35) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU2PR04MB8887:EE_
X-MS-Office365-Filtering-Correlation-Id: c322cbeb-1314-42a4-3863-08de292036ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|19092799006|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8vhuxj4HK6PwBiaRBfrCnuZVHbPRlH8DFacCzv54IwJYTNzV3a70qzAs0Wb4?=
 =?us-ascii?Q?xA7EmmdMn5oGAzqkijFGls8m+X2uNBFcOq/KodZbC0LZ2Sa7xQbIFUrfR8mN?=
 =?us-ascii?Q?nDrQGqiK3vUvilmJqWlNsBCXxBhnY9Jolr14tKuiPU2oCgjrXBQXgn5GDKBw?=
 =?us-ascii?Q?2tV1n7hsZ5JN1LKY+MqiIBbJL0yM9OpBvN8S6ugodJDWzXLLX1d5tbWhvdfm?=
 =?us-ascii?Q?iaK4xq47kxlMUzOkuFMzeianYwM9esTTnV6HWQwmMai0UJk6IrT8n0osFS1c?=
 =?us-ascii?Q?wy6wBLcDIR+85TrpBOI+UDfcufZiIQJaxu9SYaUKZ76H+/LgdAwZYFoHwcBP?=
 =?us-ascii?Q?YA//59K5fVxC8Ci7kg8Vatof3AMRkWosdltv5Ss8WJVNxfKI9YaHozrmSf+H?=
 =?us-ascii?Q?JCLnP6wBfCnIG23ZivJ07QIbRHygaZ6CQrCxy4x+ZdjdbjnVstsNHs6sZ00Q?=
 =?us-ascii?Q?dgCQ+yerZT0fMm+WEZAMGTLcUdrXRp7I7EXJhGRnv6jMzu/2h5Tt1HVYoqXH?=
 =?us-ascii?Q?J9TvFtc9NiYwgOtGkQ21VDBkCgIdPU1lq2DDMnLU67EuMZNXDQqvqhU7CwXy?=
 =?us-ascii?Q?5pdHGzwGL6plHG3APyTccbtDhy3T+4GRnBJywurb1TdtXS3M1tZc5ZVPmxQI?=
 =?us-ascii?Q?AHS6adbbTjuLObD4avwuB+DvY1IOsoiOZeEC8ibImjsuz5QrlVHkJT7sv7uA?=
 =?us-ascii?Q?O0qXitIQXhuLwqk4VOVhbOtMNwxn+J2jSzoqbaKle9iGBbsuV1ByXRSQgRtH?=
 =?us-ascii?Q?ISMnI6Ygk57bZZye/d4sQG57Hh3R4pWXazdakCwJp9d+Pvz9GLXhzuVuHQAO?=
 =?us-ascii?Q?rS0o3yJ2+SWlgdQDGjK7BBqHnDUpYRbTPYNz4bvRQ+87Y0ayl2d4R7hP1Wac?=
 =?us-ascii?Q?MP8JtLPsXLSz/FDBC/LODKiZjZQ4hSiI72G0MUDPerGGyqrwIj7H4Z7eh/7Q?=
 =?us-ascii?Q?Bnx/YKDfesaUKm+BtyvAwWKN14NXV2k9RPv0Py8sKcwRkXb/cAUnousCeAEK?=
 =?us-ascii?Q?lHte61IZ2NnFAEvEQi3rxZl/u/z3czHJ4B918BZbJkXv83k5GCpYJtwZMCAJ?=
 =?us-ascii?Q?CLCIwQRTQgw7jrPB0QarNBg9aSFL9jrM07sXDOWrAjhxDekN9mye1HFQwxE3?=
 =?us-ascii?Q?1z+ndKWhYsN4dcdmRjue1tdyQxSZM1EizAGiwNAYaBblXuiyHO3mZDfEnsTo?=
 =?us-ascii?Q?Xi5Eqz2sOsquV19GDK8VX6kAZ6v5FFrLVrasFwI3R6qfTaWDKauVJiBwuNvo?=
 =?us-ascii?Q?gcuIQzI5JNYSTyADwioAuGmvpWM/N674A/MvY6KhfXZiV4dFJQkzT8ax1Y4h?=
 =?us-ascii?Q?TjzWxvjN62Bymd+oP/tVXh61okUkN5sL8F2RRGet/I6aQfWD8d3fCKF09Fqb?=
 =?us-ascii?Q?OneEFmJjlqoa5f4d8KDsyFIxp8iA9QLJuXdUjpjkeh15MaU+6w9e1aw1DCly?=
 =?us-ascii?Q?0oPsgVPPQ3Gne3H7hZf/2n5/Pe8jLVL3Ib4sLoGlSxLf7PFb1TthMxx1OkdW?=
 =?us-ascii?Q?7tzso/Ns0e3YIG4mBJz2o30+DSjTFCPu6LVV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(19092799006)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OzCpTHHRUnv8JQfl0gTmtvIPqSjdqHgaT9NX2cYh0eZcbay3Pz+lOl/pcnwM?=
 =?us-ascii?Q?wAoy1CvIDErusjYbb+4oFzYkRtfR/f+3BQOmV5woxePa3AxLWOX6OjyJ7jPm?=
 =?us-ascii?Q?QP9QMUZsMfA62YcGRkNJVzG8enhWnnNnvlb2UoLo0o4r/QcC/jTAoal8u/NJ?=
 =?us-ascii?Q?UYQa5pIfWn3HG79rPozgLuc5TOqnwTEPDwnTS+MLDd67a0O9N8r3z+9a6iKN?=
 =?us-ascii?Q?1TY1ziDL84+gqhjxOhrro+PwR2GeagyDqF6vYG/cADuxbOw2Rs/1xUf9xFXT?=
 =?us-ascii?Q?wdoafE5m/Ejvc3dSr2UhmJdrf3OpBxJckczlVPZCASwzHa6XH8qOo0zzfxsn?=
 =?us-ascii?Q?zMmM2gog7xI+E0zYa6U4DKkvCE0X3nA9YFVavc6dl4vmPNHMD04ME41XKDJ0?=
 =?us-ascii?Q?OC+ibYjwqN7OaZOwT6yD2VwP96c50LXTuDNGJ1Mp47K5QwOBwReYFHAlSvEg?=
 =?us-ascii?Q?ZCJPSFrJjjWbeBmPHR7PYvAqfPWkXxX00rCH4YJHJ3vK/IRL8AjcmhVgXxRM?=
 =?us-ascii?Q?Qp9/Db0zfnT9P4ljxwZ0F46CbakGAGq4xqCkd7pkvSxh2USTJlWyB2DD6xqP?=
 =?us-ascii?Q?r2G/oETdShlu/kXn9yPi2aztTldN+x/6kPBuZQKM19r5TiLdFsFMgkl9wIis?=
 =?us-ascii?Q?PZuxZiXe7Ht+C2966CKb4kTSk5R+JI36wkWxzYssPc/otJBrfhTzmgAWbjWH?=
 =?us-ascii?Q?l8fTqrZfmaVhFjVlcBCHQsgleFUTdI4R44lFcsQSuZX/e8DpSAXLlr6mBMqQ?=
 =?us-ascii?Q?DHfDol+TtDX9Q2j2/J1Vf6uFw8ObqpCi1iFd5VbG4gOTRBzU9Q8l7FZJJ59j?=
 =?us-ascii?Q?oIOWSHZxLIwNRq+v6bnjBFkJwxU8+spdtYofq2T/OnN5yEt9dUtNfwOXmXV7?=
 =?us-ascii?Q?WReGLCWsYxVcOIuS1qzNIusLu7c+0y1Smy8j/FkACzl1D6pZY5zDAYLwd1wy?=
 =?us-ascii?Q?+H/P6PgInYchmUuHuFC4mMB3J7wKUK5zIJWSpUOkYf84uhKD7tv/GCmixIbY?=
 =?us-ascii?Q?ows5fIkSFGgbh7fbrgqIJlMgcSZfRkCwkscTqecBRjrYC2QLkTnsaTWreXTz?=
 =?us-ascii?Q?D9+lOP4Kc6ULeSINZ3EcYx2uSoo9x1+G+XwkXxoCBmHeJJP46bcj6JNSbIr6?=
 =?us-ascii?Q?IUM567uVxzlReY3YUJQAw37ks//oFhIf6M4iMRES+DdkukXBM3hzLhOEN4+i?=
 =?us-ascii?Q?p7Bn3nEYOeLpvs0v3E7uGHe7ri4RskuMi1MjbvDl4TLcxqftuy59rSL/QVEu?=
 =?us-ascii?Q?8hC6cDRYa3ULAuY2MDw5vQCzxdylT11i/7UnD437NrdyNBoYdmhrCMOMypwl?=
 =?us-ascii?Q?+GJ6L5mEweWBhDSALjVN7cRH2LgzPRdi0kZQGpKB/aZfHnn1RMm9Os3qS/W9?=
 =?us-ascii?Q?VSD9d5Fa4NAH6drifzCNnpcCDil0l9sngxmNsGWGCIsePg+sG+Zlho/79FE8?=
 =?us-ascii?Q?+TVwrctMylJfuzo76iXepZCiFqGhq51aeukk8ffHu9tKviHUzsDTdQm2vROZ?=
 =?us-ascii?Q?9FIGzW1zceclSw3GiXGev6g0nQl1NEQX/rHf6k2d8JzvghUW1xp+nhPqCP/g?=
 =?us-ascii?Q?oUyJF2fDbO7TL3AYgDWKNQnaSu51ZPc1T6UYxiUk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c322cbeb-1314-42a4-3863-08de292036ae
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 17:05:46.7507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ab5P0S7DEV0WDDqJPDabuI89vBHMhzQ6/f7qwUUEbR7EXkhTe6ERUeIUwNvQyzbvg2fYCgxKRX7DQJgwiJEfRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8887
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_090552_256263_F2E12CD6 
X-CRM114-Status: GOOD (  28.26  )
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

On Fri, Nov 21, 2025 at 02:21:49PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> The DesignWare I3C controller supports automatically retrying transactions
> when a device NACKs. This is useful for slave devices that may be
> temporarily busy and not ready to respond immediately.
>
> Adds a controller-wide sysfs attribute, dev_nack_retry_count, to read or
> adjust the retry count at runtime. Writes are clamped to the hardware
> maximum of 3, and the updated value is programmed into all active DAT
> entries.
>
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 64 ++++++++++++++++++++++++++++++
>  drivers/i3c/master/dw-i3c-master.h |  1 +
>  2 files changed, 65 insertions(+)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 9ceedf09c3b6..c43eba615d8a 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -204,8 +204,10 @@
>  #define EXTENDED_CAPABILITY		0xe8
>  #define SLAVE_CONFIG			0xec
>
> +#define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
>  #define DEV_ADDR_TABLE_IBI_MDB		BIT(12)
>  #define DEV_ADDR_TABLE_SIR_REJECT	BIT(13)
> +#define DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(x)	(((x) << 29) & GENMASK(30, 29))
>  #define DEV_ADDR_TABLE_LEGACY_I2C_DEV	BIT(31)
>  #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x)	(((x) << 16) & GENMASK(23, 16))
>  #define DEV_ADDR_TABLE_STATIC_ADDR(x)	((x) & GENMASK(6, 0))
> @@ -295,6 +297,58 @@ to_dw_i3c_master(struct i3c_master_controller *master)
>  	return container_of(master, struct dw_i3c_master, base);
>  }
>
> +static ssize_t dev_nack_retry_count_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *buf)

keep consistent with other function's naming. Maybe "dw_i3c_master" too
long, add "dw_" prefix should be fine.

> +{
> +	struct dw_i3c_master *master = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%u\n", master->dev_nack_retry_cnt);
> +}
> +
> +static ssize_t dev_nack_retry_count_store(struct device *dev,
> +					  struct device_attribute *attr,
> +					  const char *buf, size_t count)
> +{
> +	struct dw_i3c_master *master = dev_get_drvdata(dev);
> +	unsigned long val;
> +	int ret, i;
> +	u32 reg;
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val > DW_I3C_DEV_NACK_RETRY_CNT_MAX) {
> +		dev_warn(dev, "Value %lu exceeds maximum %d, clamping to max\n",
> +			 val, DW_I3C_DEV_NACK_RETRY_CNT_MAX);
> +		val = DW_I3C_DEV_NACK_RETRY_CNT_MAX;

return err.

> +	}
> +
> +	master->dev_nack_retry_cnt = val;
> +
> +	/*
> +	 * Update DAT entries for all currently attached devices.
> +	 * We directly iterate through the master's device array.
> +	 */
> +	for (i = 0; i < master->maxdevs; i++) {
> +		/* Skip free/empty slots */
> +		if (master->free_pos & BIT(i))
> +			continue;
> +
> +		reg = readl(master->regs +
> +				DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
> +		reg &= ~GENMASK(30, 29);
> +		reg |= DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(val);
> +		writel(reg, master->regs +
> +			DEV_ADDR_TABLE_LOC(master->datstartaddr, i));

do you need lock here? In case data is transferring.

> +	}
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(dev_nack_retry_count);
> +
>  static void dw_i3c_master_disable(struct dw_i3c_master *master)
>  {
>  	writel(readl(master->regs + DEVICE_CTRL) & ~DEV_CTRL_ENABLE,
> @@ -1032,6 +1086,7 @@ static int dw_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
>  	data->index = pos;
>  	master->devs[pos].addr = dev->info.dyn_addr ? : dev->info.static_addr;
>  	master->free_pos &= ~BIT(pos);
> +	master->dev_nack_retry_cnt = 0;

suppose needn't init to 0 here again, it is already 0 when alloc master.

>  	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr),
> @@ -1598,6 +1653,12 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  	if (ret)
>  		goto err_disable_pm;
>
> +	dev_set_drvdata(&master->base.dev, master);
> +	ret = device_create_file(&master->base.dev, &dev_attr_dev_nack_retry_count);
> +	if (ret)
> +		dev_warn(&master->base.dev,
> +			 "Failed to create dev_nack_retry_count sysfs: %d\n", ret);
> +
>  	return 0;
>
>  err_disable_pm:
> @@ -1617,6 +1678,9 @@ void dw_i3c_common_remove(struct dw_i3c_master *master)
>  	cancel_work_sync(&master->hj_work);
>  	i3c_master_unregister(&master->base);
>
> +	device_remove_file(&master->base.dev, &dev_attr_dev_nack_retry_count);
> +	dev_set_drvdata(&master->base.dev, NULL);
> +
>  	pm_runtime_disable(master->dev);
>  	pm_runtime_set_suspended(master->dev);
>  	pm_runtime_dont_use_autosuspend(master->dev);
> diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
> index c5cb695c16ab..c87a0e87bfd9 100644
> --- a/drivers/i3c/master/dw-i3c-master.h
> +++ b/drivers/i3c/master/dw-i3c-master.h
> @@ -51,6 +51,7 @@ struct dw_i3c_master {
>  	u32 i2c_fm_timing;
>  	u32 i2c_fmp_timing;
>  	u32 quirks;
> +	u32	dev_nack_retry_cnt;

just one space between u32 and dev_nack_retry_cnt

Frank

>  	/*
>  	 * Per-device hardware data, used to manage the device address table
>  	 * (DAT)
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
