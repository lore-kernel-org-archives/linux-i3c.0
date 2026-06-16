Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6202ACD98E4
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 16:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vU6XQGuz86EDrQN3Su9P2v0wilx2/YO5CRVzLXwuSY4=; b=mcBNg/mz0gRWSO
	76QbfhhhrRj1lAjExr+mkBfJi75VkpLuDPZTiouvaaQWyhmSCa/gpZccY5sM5v3uKomDg9QGK3zpT
	s0yg0x1FBtzXFyyXpuP5dRKoi869AWqLO45s4BvmM1vXaqjliyEJUff/VQ6Sg4tzCjqyaBEIqik6U
	iB7DOJ0EXbAja7YBhvmwjZ/GKfQ//zw09ZNf7W/6kITrA5GMHI2j4gj9914sw2/dtP3r3QczKj/nt
	F/ZBOm3dcYZdgDbsTIZdnDux2xzfPP23SoHYL3wSQIZbaqlu850txHKl3KU5FKjyxlrzGjpF9Eixm
	CZP6f60UvxjkMBv4/UYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZX2a-0000000G7rr-09UY;
	Tue, 16 Jun 2026 16:53:32 +0000
Received: from mail-swedencentralazon11013036.outbound.protection.outlook.com ([52.101.83.36] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZX2X-0000000G7rF-09LY
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 16:53:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvPMbcpTSZPglXeX5lAFhGVEdyEmmJIHDjLp55jBHPG/HjZ/qUf/Xc0VmQ3O8VGQN8TtCyOdQYPtTm/gzZyEQee+jbQpp9gIbS+tx3dzuXK057TzEtbCpolfsM3ijD/2O0l1DFja17IOmuyb0UjFUlfp7emxRyG8uQXnBu223M8tGw5afkqewR4CvCEQ6qF1Lb4yw5QpljT732+9IpwijJuPiuy6qaRiYBH9AMdcwjT5LDN2mWL50TklrhyfV5POgN5mLb9Tfk//kWsg4E40eW+CDfn0qjqJxsTJvRB4vQjcI5BZ9xl3PBa5SXvHuFbc9pVMHxFJ0TRpoOxYXqvPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/q+iGq20QfrkePTqh/4znW2dzdhcWgaqUHOUFtgGl40=;
 b=OTfVobhCL+RcY8ILI82zQYKqrgiLulug30uUwcbIpZIXkjSEeuc4C32ruKH0sGgOrolZSGR45OaZZdMNt1SOV/OoYHDhudBA6fDQ3pREohncdgjV2spp8bDFaOAzzFPRH0SO6m9DH0tQKhBHicpmY69kyhPCSEWW1V+uXg1XNqvmjTEqDkzfcGTDG7vKa+cLu+KiYG9Knb5lhzjX93p6RU1GIZQn4AvuRdKvPKzDQLnnjOJSXGnO1naxegUt0z+FgbD8S69jZm0BiVXq4hTSqWWJURUh7rYntlAZYXz7dSAaynh9A11x6r9EufHKV1nQDcgJuEXPTrpffpdOh2SBSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q+iGq20QfrkePTqh/4znW2dzdhcWgaqUHOUFtgGl40=;
 b=S14lXN50e5XBnsa3LYMvmWq3Y3HDISaw6TtTgBUWbg9etne7Ak13zFqabh/zWYt8khm31uBK2ARlxc3ti4dfiwEoJ17G/GelfXBRtUEOMlZxP8FkTZmtSQTXNqQdrIuuzPyT24U9owCjgk2/koSRh8++hJggEbdx9q/MklWbQdPJny17cbG9bYXzFEB4btMyYBL6GSdtjs4LU+JGF9KNK0VKdP9TxhUASMVTHKhuwBvUmz1mT80Y1GKD8Y/w2IHi8I71GM55l1hJnmr1/hK6dJzZ9uCbOeEtcLWSzPuCsXTaE44eSYA4TrzzFBz4dHCXebmStv5g+LkeVJcBo10osg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10666.eurprd04.prod.outlook.com (2603:10a6:800:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 16:53:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 16:53:24 +0000
Date: Tue, 16 Jun 2026 12:53:17 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i3c: mipi-i3c-hci: Use named initializers for
 platform_device_id's .driver_data
Message-ID: <ajF_fZX11FBQm-wG@lizhi-Precision-Tower-5810>
References: <7c006616f72748fb4deccd197ca2b6427c006f79.1781620397.git.ukleinek@kernel.org>
Content-Disposition: inline
In-Reply-To: <7c006616f72748fb4deccd197ca2b6427c006f79.1781620397.git.ukleinek@kernel.org>
X-ClientProxiedBy: SN7PR04CA0160.namprd04.prod.outlook.com
 (2603:10b6:806:125::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10666:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d75f24-5642-4322-440f-08decbc7c7ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|1800799024|56012099006|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: R/xCr9O3V2jzmTtb6aQZXAK/KhL3EqqL9U9T8DyO3v5TA4uZZKz4ylyBfm9Qo4MEAQ5OD15vtqySSzSm//PBI8FAt2Qw41JieAaHKx4tJzGX8CRejrlUykptI6y9phOxSILfp30BDZWwyCK9bto4UmHYwSD1M/yyXX0wFoZ5cA0x10fDB11raOT9eAI82A5918lgG6Vu3AbIsFNf3CmlU9ww/HtSRIfXBwTG5PGRpujWRsGnW7FWAmHcKgA8BO5BOOyG+ruj87Cycega/CS8DiRLqBC5lxeA9u3ZTyBl99bqNGmdFvxP5giKJF2aZP7v8bmO9TLbJwWKXTWOxQ/vA3OdmvJJoPkdyln2kuxC4r8VGHUWiLvKSdJ9jUKCPXi8XjZQMp6fiO+WSiO4kPuejZSDr8cCjoF5VZz6s+1lqTePcfpuZm8DI57IpgSjV4JKqwaDbT8tIvspDiekvNqDgoc8HgNrlo2Z6zN64BcpcTBTcZMAh3VDP4v3qk8X1DsQrbRE9I1BQeUYxXyNENK78CJqDNiz3AanqVv6Tatg+p/D3GvoL0MtyMP9cg3ycB5YJGmR5HazOMRI2EJHLK7ExK+sOJ7/qKSX7LOPbaSXVeJpW+W/CkvMn8YEoE/ysG0z/qrVdFJQTfH2MlurfSW4O1149UNEPHcpJW41BnsccInOKoyNunygBt6hBn1Egj6b
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(1800799024)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HW82dvx+kCTYhA6khXdE1vKAu0P41JBGT0IpctRevlSPDGt/zmU+2H/Yvm?=
 =?iso-8859-1?Q?BD7laYPx2wMZhVf2nopmkfeqm0f0hd4A4hS9M9X2ovUzKIHWkAwDb7hOZ7?=
 =?iso-8859-1?Q?2l/ICibMXL3amFaM6ErCyWaGKq20mf/1whFL0NkoWoxD5ZEuxyEPsWBX5K?=
 =?iso-8859-1?Q?xuQxxvTcjP6hj1nHXTpLVeGyUGSN+tpVSt1lIjkSj0b4nGK/eZdykvN6Ml?=
 =?iso-8859-1?Q?NvfoWYpKsgLaVJrwVB/iD9P9619qttoZZA7SM0dRlwu54k1H9c8pxgpxjk?=
 =?iso-8859-1?Q?zg7jlzPYNheFM5gewy5DDXGQBij5WyjGFwTd8r0YQLSx8ufK9s4D3cW2a0?=
 =?iso-8859-1?Q?wNnExPKQ5xgkK6RSuh3KKSXKgL/XR/rqq2GZdtUR3ZurUphDLzfetOQSId?=
 =?iso-8859-1?Q?bUQ199wjlQ35OWY77CSR+JHDEy972VVrBMnGN/4MuH1wnlU+N04IGnQ6eP?=
 =?iso-8859-1?Q?F+KQuF4z3/7rEjfoGrj18bUA2qaE64ydsZ7SB6XjkSoS4Fqpd4RMGS822R?=
 =?iso-8859-1?Q?flQfA3dcJdJJkjl0x1sAS9IqHiSTGcKHRBRmZTmODYTsiHysjx/FoeRGZf?=
 =?iso-8859-1?Q?BoqG5webImrcCfzqesdFtKLrBRfjsFPWfwrNC2nY9pxZ6kyHjgycjjTHiD?=
 =?iso-8859-1?Q?hzqrtcANidEmoJrRHKom7NtiMD3CxB3/cZrkRLJad4qJibILjUdKfewIcD?=
 =?iso-8859-1?Q?GLklkYKvtyR/hHGOxMnwM0d032t1B/0+SD8DFUjR2xlDB/c+XTj1Ui9LMn?=
 =?iso-8859-1?Q?U5nctTYPCjn6yxzeS9NHr2s2Yw+m5cRo8l69YQFnw+HznwNG2l+2JErqyB?=
 =?iso-8859-1?Q?cI3UIU7pPsMXJmrd0e6FtuiqLX0fjeXOqLNFWMwK1hTXMMb6IW9DsHpgvC?=
 =?iso-8859-1?Q?cXnwkSdWNdBGH0xgg6NFqqZZKgSp6cowJVttSIB0s3VkFNlA0OuV7oL1F8?=
 =?iso-8859-1?Q?nqoO3ovhNxO4z2u41akjBZyOgUXVrgP800KDNK0X9LdKjJAWZSCxnMChEp?=
 =?iso-8859-1?Q?t7fKHgp9iEYfcPfKqYJbvhrJMm2hnpoE7J7aFQZHUgQTamH2Z+iIgqfCq3?=
 =?iso-8859-1?Q?hTr0xVw2A7XtRuF/oz3McKwibipSvYr3yBYOyUX0Wlk7nnLrj9kCk373bw?=
 =?iso-8859-1?Q?TD8VFjIBTUWCEmZJMcnS17dJ0YtCKj8SQrJP9yS27e0OuE3Vha2XHe6OMc?=
 =?iso-8859-1?Q?9xLNq7xeXg3Ndt5x4135NbZxpgqw2nriea6WfdrWZHJmF16PdoUCkVn/Ai?=
 =?iso-8859-1?Q?KvVAM6ZkzV07IOpyHNCEpS/Ujzysnx9qnMMJeKhmjPDwFoNh6HYbcHwmvM?=
 =?iso-8859-1?Q?fidIsvvobJXq+l+utdTEyyrmLmEaFerIO7POFpp36Wdq4nrHBB2RwHsy3J?=
 =?iso-8859-1?Q?IOG1vwYEP73HpV4cgwDKFKefaCS870xfBVQAaD7Xet18UaHz4p9Iq073nx?=
 =?iso-8859-1?Q?6nTnfpfuwryAmiF6jUMdvD9QJdM5wjX118dZZ3/oO5nouJvlkHcHguSrbG?=
 =?iso-8859-1?Q?JTBaQ2cdasNmIZUqAOeKZpcNFzBykaOr5el5RQ2bD7GFjJz5oFZU+SB71y?=
 =?iso-8859-1?Q?JfUyYH4sOUbqzYFHmGK2WGJJ1wnarWeAnftvrOvmR0EzeFu6+lJ1m96yxO?=
 =?iso-8859-1?Q?svKUzAaE8Gr19uKk2iViVqDTpuMYvU9+2ga93SMqOGZ5uxvK7SFiUazyWT?=
 =?iso-8859-1?Q?uri32uGFgLxoTIyCdGmdhJrfv10vLWddcOkvywrwZK9xG5LbazyuBHdynp?=
 =?iso-8859-1?Q?HKo2zqSWEyUxRyId+Zf9X8hMoFeAAErCQK1QodWePlhR+jyIlEa7DHYemd?=
 =?iso-8859-1?Q?h0JS0he8ROMTosDZtNZ0X+TldFKRvjnmaproOGz8phexQ/3i9uk5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d75f24-5642-4322-440f-08decbc7c7ca
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 16:53:24.6152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3IuI5RWbw90LrhM1l4mKSsQkz7BiXiYOrRagDJUB43AQVLgIEXd7JzYhQxO4IwgL46tnBEuYBTi32dPQcQLgjJmAvEl4MtqBJYwLdXmPZsim3AlTwYo50YQTw96mKG2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10666
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_095329_151755_CC87879B 
X-CRM114-Status: GOOD (  17.55  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, Jun 16, 2026 at 04:34:20PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> The assignment in this driver uses a mixed way to initialize the
> platform_device_id array. .name is assigned by name and .driver_data by
> position. Unify that to use named assignment for both struct members.
> This is needed for a planned change to struct platform_device_id
> replacing .driver_data by an anonymous union.
>
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/core.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/=
mipi-i3c-hci/core.c
> index 3a3a9a3d4dec..e80aa1f5722e 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -1189,11 +1189,14 @@ static const struct acpi_device_id i3c_hci_acpi_m=
atch[] =3D {
>  MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
>
>  static const struct platform_device_id i3c_hci_driver_ids[] =3D {
> -	{ .name =3D "intel-lpss-i3c", HCI_QUIRK_RPM_ALLOWED |
> -				    HCI_QUIRK_RPM_IBI_ALLOWED |
> -				    HCI_QUIRK_RPM_PARENT_MANAGED |
> -				    HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET |
> -				    HCI_QUIRK_DMA_REQUIRES_HC_ABORT },
> +	{
> +		.name =3D "intel-lpss-i3c",
> +		.driver_data =3D HCI_QUIRK_RPM_ALLOWED |
> +			HCI_QUIRK_RPM_IBI_ALLOWED |
> +			HCI_QUIRK_RPM_PARENT_MANAGED |
> +			HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET |
> +			HCI_QUIRK_DMA_REQUIRES_HC_ABORT,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
>
> base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
> --
> 2.47.3
>

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
